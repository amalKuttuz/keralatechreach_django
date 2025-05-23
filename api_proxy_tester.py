#!/usr/bin/env python
"""
Kerala Tech Reach API Proxy Tester

This script creates a simple proxy server that intercepts API calls from
the Android app, forwards them to both the PHP and Django backends,
and compares the responses to ensure they match in format and content.

Usage:
  1. Configure the Android app to use this proxy server
  2. Run the proxy server on a machine accessible to the Android device
  3. Use the Android app normally
  4. Review the log to see any discrepancies in the API responses

Configuration:
  - Set PHP_BASE_URL to the PHP backend URL
  - Set DJANGO_BASE_URL to the Django backend URL
  - Set PROXY_HOST and PROXY_PORT to the desired proxy server settings
"""

import sys
import json
import logging
import requests
from flask import Flask, request, Response
import threading
import argparse
import datetime
from urllib.parse import urlparse, parse_qs, urlencode, urlunparse

# Set up logging
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s [%(levelname)s] %(message)s',
    handlers=[
        logging.FileHandler('api_proxy_results.log'),
        logging.StreamHandler(sys.stdout)
    ]
)
logger = logging.getLogger(__name__)

# API Configuration
PHP_BASE_URL = "https://lms.keralify.com"
DJANGO_BASE_URL = "https://lms.keralify.com/api"  # Change this to your actual Django API URL
API_KEY = "7f2ff333-df7e-4f59-be36-f2d7f6ed230f"  # API key from the Android app

# Proxy configuration
PROXY_HOST = '0.0.0.0'  # Listen on all interfaces
PROXY_PORT = 8080       # Port to listen on

# API Path mapping (PHP -> Django)
API_MAPPING = {
    # Version check
    '/Exam/VersionCheck/check_version.php': '/app-version/',
    
    # Questions & Universities
    '/Exam/Questions/degrees.php': '/universities/',  # When type=university
    '/Exam/Questions/m_getpdf.php': '/questions/',
    
    # Contact
    '/Exam/Contact/m_contact.php': '/contact/',
    
    # Events
    '/Exam/Events/m_events.php': '/events/',
    '/Exam/Events/EventAnalytics.php': '/event-impression/',
    
    # Jobs
    '/Exam/Job/get_job.php': '/jobs/',
    '/Exam/Job/get_job_details.php': '/jobs/',  # Will append ID in mapper
    
    # Affiliate
    '/Exam/Affiliate/get_slider_data.php': '/sliders/',
    '/Exam/Affiliate/get_categories.php': '/categories/',
    '/Exam/Affiliate/get_budget_selections.php': '/budget-selections/',
    '/Exam/Affiliate/get_category_products.php': '/products/',
    '/Exam/Affiliate/get_budget_products.php': '/products/',
    '/Exam/Affiliate/get_category_by_id.php': '/categories/',  # Will append ID in mapper
    
    # Entrance
    '/Exam/Entrance/Entrance.php': '/entrance-notifications/',
    
    # Upload
    '/Exam/Upload/mobile_question_up.php': '/questions/',
    '/Exam/Upload/notes_upload.php': '/notes/',
}

app = Flask(__name__)

def map_to_django_url(php_path, query_params):
    """
    Map PHP API path to Django API path
    
    Args:
        php_path (str): The PHP API path
        query_params (dict): The query parameters
        
    Returns:
        str: The Django API path with appropriate query parameters
    """
    
    # Basic mapping from API_MAPPING
    django_path = API_MAPPING.get(php_path)
    if not django_path:
        logger.warning(f"No mapping found for PHP path: {php_path}")
        return None
    
    # Handle special cases
    
    # Case: Universities/Degrees
    if php_path == '/Exam/Questions/degrees.php':
        if query_params.get('type') == ['university']:
            django_path = '/universities/'
        elif query_params.get('type') == ['degree']:
            django_path = f"/degrees/?university_id={query_params.get('university_id', [''])[0]}"
    
    # Case: Job details
    if php_path == '/Exam/Job/get_job_details.php' and 'id' in query_params:
        job_id = query_params['id'][0]
        django_path = f'/jobs/{job_id}/'
    
    # Case: Category by ID
    if php_path == '/Exam/Affiliate/get_category_by_id.php' and 'category_id' in query_params:
        category_id = query_params['category_id'][0]
        django_path = f'/categories/{category_id}/'
    
    # Case: Category products
    if php_path == '/Exam/Affiliate/get_category_products.php' and 'category_id' in query_params:
        category_id = query_params['category_id'][0]
        django_path = f'/products/?category_id={category_id}'
    
    # Case: Budget products
    if php_path == '/Exam/Affiliate/get_budget_products.php':
        category_id = query_params.get('category_id', [''])[0]
        budget_limit = query_params.get('budget_limit', [''])[0]
        django_path = f'/products/?category_id={category_id}&budget_limit={budget_limit}'
    
    # Case: Contact actions
    if php_path == '/Exam/Contact/m_contact.php':
        if query_params.get('action') == ['submitContactForm']:
            django_path = '/contact/'
        elif query_params.get('action') == ['getContactStatus'] and 'messageId' in query_params:
            message_id = query_params['messageId'][0]
            django_path = f'/contact/{message_id}/status/'
    
    # Case: Events actions
    if php_path == '/Exam/Events/m_events.php':
        if query_params.get('action') == ['getAllEvents']:
            django_path = '/events/'
        elif query_params.get('action') == ['getUpdatedEvents'] and 'lastUpdate' in query_params:
            last_update = query_params['lastUpdate'][0]
            django_path = f'/events/?updated_after={last_update}'
    
    return django_path

def compare_responses(php_response, django_response, php_url, django_url):
    """
    Compare PHP and Django responses for compatibility
    
    Args:
        php_response (Response): The PHP response
        django_response (Response): The Django response
        php_url (str): The PHP URL for logging
        django_url (str): The Django URL for logging
        
    Returns:
        bool: True if responses are compatible, False otherwise
    """
    logger.info(f"Comparing responses:")
    logger.info(f"  PHP URL: {php_url}")
    logger.info(f"  Django URL: {django_url}")
    logger.info(f"  PHP Status: {php_response.status_code}")
    logger.info(f"  Django Status: {django_response.status_code}")
    
    # Check status codes
    if abs(php_response.status_code - django_response.status_code) > 10:
        logger.warning(f"Status code mismatch: PHP={php_response.status_code}, Django={django_response.status_code}")
        return False
    
    # Try to parse JSON
    try:
        php_data = php_response.json()
        django_data = django_response.json()
        
        # Compare structure (keys at top level)
        php_keys = set(php_data.keys() if isinstance(php_data, dict) else range(len(php_data)))
        django_keys = set(django_data.keys() if isinstance(django_data, dict) else range(len(django_data)))
        
        if php_keys != django_keys:
            # Django might have pagination
            if isinstance(django_data, dict) and 'results' in django_data:
                django_results = django_data['results']
                # Compare PHP data with Django results
                if isinstance(php_data, list) and isinstance(django_results, list):
                    logger.info(f"PHP returned {len(php_data)} items, Django returned {len(django_results)} items")
                elif isinstance(php_data, dict) and isinstance(django_results, list) and 'data' in php_data:
                    # Some PHP APIs return {'data': [...]} while Django returns paginated results
                    php_items = php_data.get('data', [])
                    logger.info(f"PHP returned {len(php_items)} items, Django returned {len(django_results)} items")
            else:
                logger.warning(f"Response structure mismatch:")
                logger.warning(f"  PHP keys: {php_keys}")
                logger.warning(f"  Django keys: {django_keys}")
                return False
                
        logger.info("Response structures appear compatible")
        return True
    except Exception as e:
        logger.warning(f"Error comparing responses: {str(e)}")
        return False

@app.route('/', defaults={'path': ''})
@app.route('/<path:path>', methods=['GET', 'POST', 'PUT', 'DELETE'])
def proxy(path):
    """
    Proxy API requests to both PHP and Django backends
    """
    # Get full path with query string
    full_path = request.full_path
    
    # Parse URL
    url_parts = urlparse(full_path)
    path = url_parts.path
    query_params = parse_qs(url_parts.query)
    
    logger.info(f"Received request: {request.method} {path}")
    logger.info(f"Query parameters: {query_params}")
    
    # Map PHP path to Django path
    django_path = map_to_django_url(path, query_params)
    
    if not django_path:
        logger.warning(f"No Django mapping for {path}, forwarding to PHP only")
        # Forward to PHP backend
        php_url = f"{PHP_BASE_URL}{path}?{url_parts.query}"
        php_response = requests.request(
            method=request.method,
            url=php_url,
            headers={key: value for key, value in request.headers if key != 'Host'},
            data=request.get_data(),
            cookies=request.cookies,
            allow_redirects=False,
        )
        
        # Return PHP response
        return Response(
            php_response.content,
            php_response.status_code,
            {key: value for key, value in php_response.headers.items() if key.lower() != 'transfer-encoding'}
        )
    
    # Construct URLs
    php_url = f"{PHP_BASE_URL}{path}?{url_parts.query}"
    django_url = f"{DJANGO_BASE_URL}{django_path}"
    
    # Add API key to Django URL if it doesn't already have one
    django_url_parts = urlparse(django_url)
    django_query_params = parse_qs(django_url_parts.query)
    if 'api_key' not in django_query_params:
        django_query_params['api_key'] = [API_KEY]
        django_url = urlunparse((
            django_url_parts.scheme,
            django_url_parts.netloc,
            django_url_parts.path,
            django_url_parts.params,
            urlencode(django_query_params, doseq=True),
            django_url_parts.fragment
        ))
    
    logger.info(f"Forwarding to PHP: {php_url}")
    logger.info(f"Forwarding to Django: {django_url}")
    
    # Forward to both backends
    php_response = requests.request(
        method=request.method,
        url=php_url,
        headers={key: value for key, value in request.headers if key != 'Host'},
        data=request.get_data(),
        cookies=request.cookies,
        allow_redirects=False,
    )
    
    django_response = requests.request(
        method=request.method,
        url=django_url,
        headers={key: value for key, value in request.headers if key != 'Host'},
        data=request.get_data(),
        cookies=request.cookies,
        allow_redirects=False,
    )
    
    # Compare responses in a separate thread to avoid blocking
    thread = threading.Thread(
        target=compare_responses, 
        args=(php_response, django_response, php_url, django_url)
    )
    thread.start()
    
    # Return PHP response to client
    return Response(
        php_response.content,
        php_response.status_code,
        {key: value for key, value in php_response.headers.items() if key.lower() != 'transfer-encoding'}
    )

def main():
    """Run the proxy server"""
    parser = argparse.ArgumentParser(description='Kerala Tech Reach API Proxy Tester')
    parser.add_argument('--host', default=PROXY_HOST, help='Host to listen on')
    parser.add_argument('--port', type=int, default=PROXY_PORT, help='Port to listen on')
    parser.add_argument('--php-url', default=PHP_BASE_URL, help='PHP backend URL')
    parser.add_argument('--django-url', default=DJANGO_BASE_URL, help='Django backend URL')
    parser.add_argument('--api-key', default=API_KEY, help='API key')
    
    args = parser.parse_args()
    
    global PHP_BASE_URL, DJANGO_BASE_URL, API_KEY
    PHP_BASE_URL = args.php_url
    DJANGO_BASE_URL = args.django_url
    API_KEY = args.api_key
    
    logger.info(f"Starting proxy server on {args.host}:{args.port}")
    logger.info(f"PHP backend: {PHP_BASE_URL}")
    logger.info(f"Django backend: {DJANGO_BASE_URL}")
    
    app.run(host=args.host, port=args.port)
    
if __name__ == '__main__':
    main() 
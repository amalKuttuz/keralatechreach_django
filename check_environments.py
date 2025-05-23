#!/usr/bin/env python
"""
Environment Check Script
Checks if both PHP and Django environments are accessible and identifies discrepancies
"""

import requests
import sys
import json
from urllib.parse import urljoin

# Configuration
PHP_BASE_URL = "https://lms.keralify.com"
DJANGO_BASE_URL = "http://127.0.0.1:8000/api"  # Local Django server
API_KEY = "7f2ff333-df7e-4f59-be36-f2d7f6ed230f"

# Endpoints to check
ENDPOINTS = [
    {
        "name": "Version Check",
        "php_path": "/Exam/VersionCheck/check_version.php",
        "django_path": "/app-version/",
        "method": "GET",
        "params": {"api_key": API_KEY}
    },
    {
        "name": "Universities",
        "php_path": "/Exam/Questions/degrees.php",
        "django_path": "/universities/",
        "method": "GET",
        "params": {"type": "university", "api_key": API_KEY}
    },
    {
        "name": "Events",
        "php_path": "/Exam/Events/m_events.php",
        "django_path": "/events/",
        "method": "GET",
        "params": {"action": "getAllEvents", "api_key": API_KEY}
    }
]

def check_environment(base_url):
    """
    Check if the environment is accessible by making a simple request
    """
    try:
        response = requests.get(base_url, timeout=5)
        if response.status_code < 400:
            print(f"✅ Environment at {base_url} is accessible")
            return True
        else:
            print(f"❌ Environment at {base_url} returned status code {response.status_code}")
            return False
    except requests.exceptions.RequestException as e:
        print(f"❌ Environment at {base_url} is not accessible: {e}")
        return False

def compare_responses(endpoint):
    """
    Compare responses from PHP and Django for a given endpoint
    """
    php_url = urljoin(PHP_BASE_URL, endpoint["php_path"])
    django_url = urljoin(DJANGO_BASE_URL, endpoint["django_path"])
    
    print(f"\nChecking endpoint: {endpoint['name']}")
    print(f"PHP URL: {php_url}")
    print(f"Django URL: {django_url}")
    
    try:
        # Make requests
        php_response = requests.request(
            endpoint["method"], 
            php_url, 
            params=endpoint["params"],
            timeout=10
        )
        django_response = requests.request(
            endpoint["method"], 
            django_url, 
            params=endpoint["params"],
            timeout=10
        )
        
        # Check status codes
        print(f"PHP Status: {php_response.status_code}")
        print(f"Django Status: {django_response.status_code}")
        
        if php_response.status_code >= 400:
            print(f"⚠️ PHP endpoint returned error: {php_response.status_code}")
            return
        
        if django_response.status_code >= 400:
            print(f"⚠️ Django endpoint returned error: {django_response.status_code}")
            return
        
        # Parse JSON responses
        try:
            php_data = php_response.json()
            django_data = django_response.json()
            
            # Compare basic structure
            if isinstance(php_data, dict) and isinstance(django_data, dict):
                php_keys = set(php_data.keys())
                
                # Handle Django REST Framework pagination
                if "results" in django_data:
                    django_paginated = True
                    django_results = django_data["results"]
                    print("📄 Django response is paginated")
                else:
                    django_paginated = False
                    django_keys = set(django_data.keys())
                
                if not django_paginated and php_keys != django_keys:
                    print("⚠️ Response structures differ:")
                    print(f"  PHP keys: {php_keys}")
                    print(f"  Django keys: {django_keys}")
                    
                    # Find missing keys
                    missing_in_django = php_keys - django_keys
                    missing_in_php = django_keys - php_keys
                    
                    if missing_in_django:
                        print(f"❌ Keys missing in Django: {missing_in_django}")
                    
                    if missing_in_php:
                        print(f"⚠️ Extra keys in Django: {missing_in_php}")
                else:
                    if not django_paginated:
                        print("✅ Response structures match")
                        
            elif isinstance(php_data, list) and isinstance(django_data, list):
                print(f"PHP returned {len(php_data)} items")
                print(f"Django returned {len(django_data)} items")
            elif isinstance(php_data, list) and isinstance(django_data, dict) and "results" in django_data:
                print(f"PHP returned {len(php_data)} items")
                print(f"Django returned {len(django_data['results'])} items (paginated)")
            else:
                print("⚠️ Response types differ:")
                print(f"  PHP type: {type(php_data)}")
                print(f"  Django type: {type(django_data)}")
                
        except json.JSONDecodeError as e:
            print(f"⚠️ Error parsing JSON: {e}")
            
    except requests.exceptions.RequestException as e:
        print(f"❌ Error making request: {e}")

def main():
    """Main function"""
    print("\n===== Environment Check =====\n")
    
    # Check environments
    php_available = check_environment(PHP_BASE_URL)
    django_available = check_environment(DJANGO_BASE_URL)
    
    if not php_available and not django_available:
        print("❌ Both environments are not accessible. Exiting.")
        sys.exit(1)
    
    if not php_available:
        print("⚠️ PHP environment is not accessible. Proceeding with Django only.")
    
    if not django_available:
        print("⚠️ Django environment is not accessible. Proceeding with PHP only.")
        
    print("\n===== Endpoint Checks =====\n")
    
    # Check endpoints
    for endpoint in ENDPOINTS:
        compare_responses(endpoint)
        print("-" * 50)
        
    print("\n===== Check Complete =====\n")

if __name__ == "__main__":
    main() 
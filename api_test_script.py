#!/usr/bin/env python
"""
Kerala Tech Reach API Testing Script
This script tests the Django API endpoints against the requirements
of the Android app, ensuring compatibility with the existing PHP backend.
"""

import os
import sys
import json
import requests
import datetime
import logging
from requests.auth import HTTPBasicAuth

# Set up logging
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s [%(levelname)s] %(message)s',
    handlers=[
        logging.FileHandler('api_test_results.log'),
        logging.StreamHandler(sys.stdout)
    ]
)
logger = logging.getLogger(__name__)

# API Configuration
PHP_BASE_URL = "https://lms.keralify.com"
DJANGO_BASE_URL = "https://lms.keralify.com/api"  # Change this to your actual Django API URL
API_KEY = "7f2ff333-df7e-4f59-be36-f2d7f6ed230f"  # API key from the Android app

# Authentication credentials for testing
TEST_USERNAME = "testuser"
TEST_PASSWORD = "testpassword"

# Global session for requests
session = requests.Session()

def get_auth_token():
    """Get authentication token from the Django API"""
    url = f"{DJANGO_BASE_URL}/auth/login/"
    payload = {
        "username": TEST_USERNAME,
        "password": TEST_PASSWORD
    }
    
    try:
        response = session.post(url, json=payload)
        response.raise_for_status()
        data = response.json()
        
        if "access" in data:
            token = data["access"]
            session.headers.update({"Authorization": f"Bearer {token}"})
            logger.info("Successfully authenticated with the API")
            return token
        else:
            logger.error("Authentication response did not contain access token")
            return None
    except requests.exceptions.RequestException as e:
        logger.error(f"Authentication failed: {str(e)}")
        return None

def test_version_check():
    """Test the version check API"""
    php_url = f"{PHP_BASE_URL}/Exam/VersionCheck/check_version.php"
    django_url = f"{DJANGO_BASE_URL}/app-version/"
    
    try:
        # Test PHP endpoint
        php_response = requests.get(php_url, params={"api_key": API_KEY})
        php_data = php_response.json() if php_response.status_code == 200 else None
        
        # Test Django endpoint
        django_response = requests.get(django_url, params={"api_key": API_KEY})
        django_data = django_response.json() if django_response.status_code == 200 else None
        
        logger.info("Version Check API Test:")
        logger.info(f"PHP Response: {php_response.status_code}")
        logger.info(f"Django Response: {django_response.status_code}")
        
        if php_data and django_data:
            # Compare response structures
            php_keys = set(php_data.keys())
            django_keys = set(django_data.keys())
            
            if php_keys == django_keys:
                logger.info("Response structure matches between PHP and Django")
            else:
                logger.warning(f"Response structure mismatch. PHP: {php_keys}, Django: {django_keys}")
                
            return True
        else:
            logger.error("Failed to get response from one or both endpoints")
            return False
    except Exception as e:
        logger.error(f"Error testing version check API: {str(e)}")
        return False

def test_universities():
    """Test the universities API"""
    php_url = f"{PHP_BASE_URL}/Exam/Questions/degrees.php"
    django_url = f"{DJANGO_BASE_URL}/universities/"
    
    try:
        # Test PHP endpoint
        php_response = requests.get(php_url, params={"type": "university", "api_key": API_KEY})
        php_data = php_response.json() if php_response.status_code == 200 else None
        
        # Test Django endpoint
        django_response = requests.get(django_url, params={"api_key": API_KEY})
        django_data = django_response.json() if django_response.status_code == 200 else None
        
        logger.info("Universities API Test:")
        logger.info(f"PHP Response: {php_response.status_code}")
        logger.info(f"Django Response: {django_response.status_code}")
        
        if php_data and django_data:
            # Basic validation of data format
            logger.info(f"PHP returned {len(php_data)} universities")
            
            # Django may return paginated results
            django_count = len(django_data.get("results", django_data))
            logger.info(f"Django returned {django_count} universities")
            
            return True
        else:
            logger.error("Failed to get response from one or both endpoints")
            return False
    except Exception as e:
        logger.error(f"Error testing universities API: {str(e)}")
        return False

def test_contact_api():
    """Test the contact API"""
    php_url = f"{PHP_BASE_URL}/Exam/Contact/m_contact.php"
    django_url = f"{DJANGO_BASE_URL}/contact/"
    
    # Get authentication token
    token = get_auth_token()
    if not token:
        logger.error("Skipping contact API test due to authentication failure")
        return False
    
    # Test data
    test_data = {
        "name": "Test User",
        "email": "test@example.com",
        "phone": "1234567890",
        "subject": "API Test",
        "message": "This is a test message from the API testing script."
    }
    
    try:
        # Test Django endpoint for message submission
        django_headers = {"Authorization": f"Bearer {token}"}
        django_response = requests.post(
            django_url, 
            json=test_data,
            headers=django_headers,
            params={"api_key": API_KEY}
        )
        
        logger.info("Contact API Test (POST):")
        logger.info(f"Django Response: {django_response.status_code}")
        
        if django_response.status_code == 201:
            django_data = django_response.json()
            if "messageId" in django_data:
                message_id = django_data["messageId"]
                logger.info(f"Successfully created contact message with ID: {message_id}")
                
                # Now test status check endpoint
                status_url = f"{DJANGO_BASE_URL}/contact/{message_id}/status/"
                status_response = requests.get(
                    status_url, 
                    headers=django_headers,
                    params={"api_key": API_KEY}
                )
                
                logger.info("Contact Status API Test (GET):")
                logger.info(f"Django Response: {status_response.status_code}")
                
                if status_response.status_code == 200:
                    status_data = status_response.json()
                    logger.info(f"Message status: {status_data.get('status')}")
                    return True
                else:
                    logger.error(f"Failed to get message status: {status_response.text}")
                    return False
            else:
                logger.error("Response did not include message ID")
                return False
        else:
            logger.error(f"Failed to create contact message: {django_response.text}")
            return False
    except Exception as e:
        logger.error(f"Error testing contact API: {str(e)}")
        return False

def test_events_api():
    """Test the events API"""
    php_url = f"{PHP_BASE_URL}/Exam/Events/m_events.php"
    django_url = f"{DJANGO_BASE_URL}/events/"
    
    try:
        # Test PHP endpoint
        php_response = requests.get(php_url, params={"action": "getAllEvents", "api_key": API_KEY})
        php_data = php_response.json() if php_response.status_code == 200 else None
        
        # Test Django endpoint
        django_response = requests.get(django_url, params={"api_key": API_KEY})
        django_data = django_response.json() if django_response.status_code == 200 else None
        
        logger.info("Events API Test:")
        logger.info(f"PHP Response: {php_response.status_code}")
        logger.info(f"Django Response: {django_response.status_code}")
        
        if php_data and django_data:
            # Basic validation of data format
            if "events" in php_data:
                logger.info(f"PHP returned {len(php_data['events'])} events")
            
            # Django may return paginated results
            django_count = len(django_data.get("results", django_data))
            logger.info(f"Django returned {django_count} events")
            
            return True
        else:
            logger.error("Failed to get response from one or both endpoints")
            return False
    except Exception as e:
        logger.error(f"Error testing events API: {str(e)}")
        return False

def test_file_upload():
    """Test the file upload functionality"""
    # This test requires a test file and authentication
    token = get_auth_token()
    if not token:
        logger.error("Skipping file upload test due to authentication failure")
        return False
    
    # Create a test PDF file
    test_file_path = "test_upload.pdf"
    with open(test_file_path, "wb") as f:
        f.write(b"%PDF-1.5\n%Test File for API Testing\n")
    
    django_url = f"{DJANGO_BASE_URL}/questions/"
    
    try:
        # Prepare form data
        form_data = {
            "file_id": "test123",
            "degree": "BCA",
            "subj": "Computer Science",
            "sem": "3",
            "qyear": "2023",
            "university": "1"  # Assuming university ID 1 exists
        }
        
        files = {
            "file": ("test_upload.pdf", open(test_file_path, "rb"), "application/pdf")
        }
        
        # Test Django endpoint
        django_headers = {"Authorization": f"Bearer {token}"}
        django_response = requests.post(
            django_url,
            data=form_data,
            files=files,
            headers=django_headers,
            params={"api_key": API_KEY}
        )
        
        logger.info("File Upload Test:")
        logger.info(f"Django Response: {django_response.status_code}")
        
        if django_response.status_code in [200, 201]:
            logger.info("File upload successful")
            return True
        else:
            logger.error(f"File upload failed: {django_response.text}")
            return False
    except Exception as e:
        logger.error(f"Error testing file upload: {str(e)}")
        return False
    finally:
        # Clean up the test file
        if os.path.exists(test_file_path):
            os.remove(test_file_path)

def run_all_tests():
    """Run all API tests"""
    logger.info("Starting API tests...")
    
    tests = {
        "Version Check": test_version_check,
        "Universities": test_universities,
        "Contact API": test_contact_api,
        "Events API": test_events_api,
        "File Upload": test_file_upload
    }
    
    results = {}
    
    for test_name, test_func in tests.items():
        logger.info(f"Running test: {test_name}")
        try:
            result = test_func()
            results[test_name] = result
        except Exception as e:
            logger.error(f"Test {test_name} failed with exception: {str(e)}")
            results[test_name] = False
    
    # Print summary
    logger.info("\n\n===== TEST RESULTS =====")
    success_count = sum(1 for result in results.values() if result)
    total_count = len(results)
    
    for test_name, result in results.items():
        status = "PASS" if result else "FAIL"
        logger.info(f"{test_name}: {status}")
    
    logger.info(f"\nSummary: {success_count}/{total_count} tests passed")
    
    return success_count == total_count

if __name__ == "__main__":
    success = run_all_tests()
    sys.exit(0 if success else 1) 
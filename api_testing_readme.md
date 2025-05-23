# Kerala Tech Reach - API Testing Guide

This guide provides instructions for testing the Django API endpoints against the Android app requirements, ensuring that the migration from PHP to Django is successful.

## Testing Tools

1. `api_test_script.py` - A script for direct API endpoint testing
2. `api_proxy_tester.py` - A proxy server for comparing PHP and Django response formats in real-time

## Prerequisites

1. Python 3.7+ with pip
2. Android app with network settings that can be modified (for proxy testing)
3. Access to both PHP and Django backends
4. API key (included in the scripts)

## Installation

1. Install required Python packages:

```bash
pip install requests flask
```

## Direct API Testing

1. Edit the `api_test_script.py` file if needed to update API URLs
2. Run the test script:

```bash
python api_test_script.py
```

3. Review the results in the console output and `api_test_results.log`

## Proxy Testing with Android App

The proxy testing method allows you to use the actual Android app while comparing the PHP and Django API responses in real-time.

### Setting up the Proxy Server

1. Run the proxy server:

```bash
python api_proxy_tester.py --host 0.0.0.0 --port 8080
```

2. Note the IP address of the computer running the proxy server

### Configuring Android App

1. Connect your Android device to the same network as the proxy server
2. Go to Wi-Fi settings on the Android device
3. Long-press your connected network
4. Select "Modify network"
5. Check "Show advanced options"
6. Change Proxy settings to "Manual"
7. Enter the IP address of your proxy server in "Proxy hostname"
8. Enter 8080 in "Proxy port"
9. Save the settings

### Testing

1. Open the Kerala Tech Reach Android app
2. Use the app normally
3. Check the console output and `api_proxy_results.log` to see comparisons between PHP and Django responses
4. Look for any warnings or errors that indicate incompatibilities

## Test Coverage

The testing scripts cover the following API endpoints:

1. **Authentication**
   - Login endpoint

2. **Version Check**
   - App version data

3. **Questions API**
   - Universities list
   - Degrees list
   - Question papers

4. **Contact API**
   - Submit contact form
   - Check message status

5. **Events API**
   - Get all events
   - Get updated events
   - Submit analytics

6. **Jobs API**
   - Get jobs list
   - Get job details

7. **Affiliate API**
   - Get slider data
   - Get categories
   - Get budget selections
   - Get category products
   - Get budget products
   - Get category by ID

8. **Entrance API**
   - Get entrance notifications

9. **Upload API**
   - Upload question papers
   - Upload notes

## Interpreting Results

When reviewing the log files, look for:

1. **Status code mismatches** - PHP and Django should return similar HTTP status codes
2. **Response structure differences** - The structure of JSON responses should match
3. **Data mismatches** - Data content should be equivalent
4. **Missing endpoints** - All PHP endpoints should have a Django equivalent

## Troubleshooting

### Common Issues

1. **Request Timeouts**
   - Check if both backends are accessible
   - Verify network connectivity

2. **Authentication Failures**
   - Ensure API key is correct
   - Verify JWT token is being sent correctly

3. **Response Format Differences**
   - Django REST Framework uses pagination by default
   - Field naming conventions might differ

## Completing the Test

After testing all API endpoints:

1. Document any compatibility issues found
2. Address any missing endpoints or format differences in the Django implementation
3. Update the todo.md file to mark the Mobile API Testing task as complete 
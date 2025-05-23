# Kerala Tech Reach - Mobile API Testing Plan

## Overview
This document outlines the testing plan for the Django API endpoints used by the Kerala Tech Reach Android application. The plan focuses on ensuring that all API endpoints in the Django backend match the PHP backend's functionality and data formats.

## API Base URL
- PHP Base URL: `https://lms.keralify.com/`
- Django Base URL: `https://lms.keralify.com/api/` (New)

## API Authentication
The app uses:
1. API key authentication (via query parameter `api_key`)
2. JWT token-based authentication for user-specific requests

## API Endpoints to Test

### 1. Authentication API
- **Login Endpoint**
  - PHP: N/A (Authentication was done locally or via Google Sign-In)
  - Django: `/api/auth/login/`
  - Request Method: `POST`
  - Request Parameters:
    - `username`
    - `password`
  - Expected Response: JWT token + user details

### 2. Version Check API
- **Check Version**
  - PHP: `/Exam/VersionCheck/check_version.php`
  - Django: `/api/app-version/`
  - Request Method: `GET`
  - Expected Response: 
    - `version_code`
    - `version_name`
    - `update_url`
    - `update_message`

### 3. Questions API
- **Get Universities**
  - PHP: `/Exam/Questions/degrees.php?type=university`
  - Django: `/api/universities/`
  - Request Method: `GET`
  - Expected Response: List of universities

- **Get Degrees**
  - PHP: `/Exam/Questions/degrees.php?type=degree&university_id={id}`
  - Django: `/api/degrees/?university_id={id}`
  - Request Method: `GET`
  - Expected Response: List of degrees

- **Get Question Papers**
  - PHP: `/Exam/Questions/m_getpdf.php?degree={degree}&semester={sem}&university_id={id}`
  - Django: `/api/questions/by-degree/{degree_id}/{semester}/`
  - Request Method: `GET`
  - Expected Response: List of question papers

### 4. Contact API
- **Submit Contact Form**
  - PHP: `/Exam/Contact/m_contact.php?action=submitContactForm`
  - Django: `/api/contact/`
  - Request Method: `POST`
  - Request Parameters:
    - `name`
    - `email`
    - `phone`
    - `subject`
    - `message`
  - Expected Response: Success message + message ID

- **Get Contact Status**
  - PHP: `/Exam/Contact/m_contact.php?action=getContactStatus&messageId={id}`
  - Django: `/api/contact/{message_id}/status/`
  - Request Method: `GET`
  - Expected Response: Message status

### 5. Events API
- **Get All Events**
  - PHP: `/Exam/Events/m_events.php?action=getAllEvents`
  - Django: `/api/events/`
  - Request Method: `GET`
  - Expected Response: List of events

- **Get Updated Events**
  - PHP: `/Exam/Events/m_events.php?action=getUpdatedEvents&lastUpdate={timestamp}`
  - Django: `/api/events/?updated_after={timestamp}`
  - Request Method: `GET`
  - Expected Response: List of updated events

- **Submit Analytics**
  - PHP: `/Exam/Events/EventAnalytics.php`
  - Django: `/api/event-impression/` and `/api/event-interaction/`
  - Request Method: `POST`
  - Expected Response: Success message

### 6. Jobs API
- **Get Jobs**
  - PHP: `/Exam/Job/get_job.php`
  - Django: `/api/jobs/`
  - Request Method: `GET`
  - Expected Response: List of jobs

- **Get Job Details**
  - PHP: `/Exam/Job/get_job_details.php?id={id}`
  - Django: `/api/jobs/{id}/`
  - Request Method: `GET`
  - Expected Response: Job details

### 7. Affiliate API
- **Get Slider Data**
  - PHP: `/Exam/Affiliate/get_slider_data.php`
  - Django: `/api/sliders/`
  - Request Method: `GET`
  - Expected Response: List of slider items

- **Get Categories**
  - PHP: `/Exam/Affiliate/get_categories.php`
  - Django: `/api/categories/`
  - Request Method: `GET`
  - Expected Response: List of categories

- **Get Budget Selections**
  - PHP: `/Exam/Affiliate/get_budget_selections.php`
  - Django: `/api/budget-selections/`
  - Request Method: `GET`
  - Expected Response: List of budget selections

- **Get Category Products**
  - PHP: `/Exam/Affiliate/get_category_products.php?category_id={id}`
  - Django: `/api/products/?category_id={id}`
  - Request Method: `GET`
  - Expected Response: List of products

- **Get Budget Products**
  - PHP: `/Exam/Affiliate/get_budget_products.php?category_id={id}&budget_limit={limit}`
  - Django: `/api/products/?category_id={id}&budget_limit={limit}`
  - Request Method: `GET`
  - Expected Response: List of products

- **Get Category By ID**
  - PHP: `/Exam/Affiliate/get_category_by_id.php?category_id={id}`
  - Django: `/api/categories/{id}/`
  - Request Method: `GET`
  - Expected Response: Category details

### 8. Entrance API
- **Get Entrance Notifications**
  - PHP: `/Exam/Entrance/Entrance.php`
  - Django: `/api/entrance-notifications/`
  - Request Method: `GET`
  - Expected Response: List of entrance notifications

### 9. Upload API
- **Upload Question Paper**
  - PHP: `/Exam/Upload/mobile_question_up.php`
  - Django: `/api/questions/`
  - Request Method: `POST` (multipart/form-data)
  - Request Parameters:
    - `file_id`
    - `degree`
    - `subj`
    - `sem`
    - `qyear`
    - `university`
    - `file`
  - Expected Response: Success message

- **Upload Notes**
  - PHP: `/Exam/Upload/notes_upload.php`
  - Django: `/api/notes/`
  - Request Method: `POST` (multipart/form-data)
  - Request Parameters:
    - `file_id`
    - `title`
    - `module`
    - `degree`
    - `semester`
    - `university`
    - `year`
    - `file`
  - Expected Response: Success message

## Testing Process

### 1. Authentication Testing
- Test logging in with correct credentials
- Test logging in with incorrect credentials
- Test token expiration and refresh
- Test login with legacy (PHP) credentials
- Test JWT token claim verification

### 2. Data Format Testing
- Compare JSON response structures between PHP and Django endpoints
- Ensure all fields match in format and content
- Verify date/time formats are consistent

### 3. File Upload Testing
- Test uploading question papers through the Django API
- Test uploading notes through the Django API
- Verify file storage structure and accessibility

### 4. Response Code Testing
- Verify correct HTTP status codes for successful requests
- Verify correct error codes and messages for failed requests

### 5. Performance Testing
- Compare response times between PHP and Django APIs
- Test under load to ensure scalability

### 6. Security Testing
- Verify all endpoints require proper authentication
- Test for common security vulnerabilities (CSRF, XSS, etc.)
- Verify file upload security (file type validation, size limits, etc.)

## Testing Tools
1. Postman for manual API testing
2. JMeter for load testing
3. Android test app for end-to-end testing

## Documentation Requirements
For each endpoint tested:
1. Document the request format (URL, parameters, headers)
2. Document the expected response format
3. Document any differences between PHP and Django implementations
4. Document any issues found and their resolution 
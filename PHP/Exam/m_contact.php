<?php
// Database connection
require_once '../conn.php';


$api_key = isset($_GET['api_key']) ? $_GET['api_key'] : '';
$valid_key = "7f2ff333-df7e-4f59-be36-f2d7f6ed230f"; // In production, store this securely

if ($api_key !== $valid_key) {
    http_response_code(401);
    echo json_encode(['error' => 'Unauthorized access']);
    exit;
}
// Get the action parameter
$action = isset($_GET['action']) ? $_GET['action'] : '';

// Handle different actions
switch ($action) {
    case 'submitContactForm':
        submitContactForm($conn);
        break;
    case 'getContactStatus':
        getContactStatus($conn);
        break;
    default:
        echo json_encode(['success' => false, 'message' => 'Invalid action']);
        break;
}

// Function to handle contact form submission
function submitContactForm($conn) {
    // Check if request method is POST
    if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
        echo json_encode(['success' => false, 'message' => 'Invalid request method']);
        return;
    }

    // Get form data
    $name = isset($_POST['name']) ? $conn->real_escape_string(trim($_POST['name'])) : '';
    $email = isset($_POST['email']) ? $conn->real_escape_string(trim($_POST['email'])) : '';
    $phone = isset($_POST['phone']) ? $conn->real_escape_string(trim($_POST['phone'])) : '';
    $subject = isset($_POST['subject']) ? $conn->real_escape_string(trim($_POST['subject'])) : '';
    $message = isset($_POST['message']) ? $conn->real_escape_string(trim($_POST['message'])) : '';

    // Validate required fields
    if (empty($name) || empty($email) || empty($subject) || empty($message)) {
        echo json_encode(['success' => false, 'message' => 'Please fill all required fields']);
        return;
    }

    // Validate email format
    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        echo json_encode(['success' => false, 'message' => 'Invalid email format']);
        return;
    }

    // Generate a unique message ID
    $messageId = uniqid('MSG_');
    
    // Get current timestamp
    $timestamp = date('Y-m-d H:i:s');
    
    // Initial status is 'pending'
    $status = 'pending';

    // Insert the contact message into the database
    $sql = "INSERT INTO contact_messages (message_id, name, email, phone, subject, message, status, created_at) 
            VALUES ('$messageId', '$name', '$email', '$phone', '$subject', '$message', '$status', '$timestamp')";

    if ($conn->query($sql) === TRUE) {
        // Send email notification to admin (optional)
        sendEmailNotification($name, $email, $subject, $message);
        
        echo json_encode([
            'success' => true, 
            'message' => 'Your message has been sent successfully. We will contact you soon.',
            'messageId' => $messageId
        ]);
    } else {
        echo json_encode([
            'success' => false, 
            'message' => 'Failed to send message. Please try again later.'
        ]);
    }
}

// Function to get status of a contact message
function getContactStatus($conn) {
    // Get message ID from query parameter
    $messageId = isset($_GET['messageId']) ? $conn->real_escape_string($_GET['messageId']) : '';
    
    if (empty($messageId)) {
        echo json_encode(['success' => false, 'message' => 'Message ID is required']);
        return;
    }
    
    // Query to get the status of the message
    $sql = "SELECT status FROM contact_messages WHERE message_id = '$messageId'";
    $result = $conn->query($sql);
    
    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        echo json_encode([
            'success' => true,
            'status' => $row['status'],
            'message' => getStatusMessage($row['status'])
        ]);
    } else {
        echo json_encode([
            'success' => false,
            'message' => 'Message not found'
        ]);
    }
}

// Helper function to send email notification to admin
function sendEmailNotification($name, $email, $subject, $message) {
    // Get admin email from configuration
    $adminEmail = getAdminEmail();
    
    // Email headers
    $headers = "From: $email" . "\r\n";
    $headers .= "Reply-To: $email" . "\r\n";
    $headers .= "MIME-Version: 1.0" . "\r\n";
    $headers .= "Content-Type: text/html; charset=UTF-8" . "\r\n";
    
    // Email body
    $emailBody = "<html><body>";
    $emailBody .= "<h3>New Contact Form Submission</h3>";
    $emailBody .= "<p><strong>Name:</strong> $name</p>";
    $emailBody .= "<p><strong>Email:</strong> $email</p>";
    $emailBody .= "<p><strong>Subject:</strong> $subject</p>";
    $emailBody .= "<p><strong>Message:</strong></p>";
    $emailBody .= "<p>$message</p>";
    $emailBody .= "</body></html>";
    
    // Send email (uncomment when ready to use)
    // mail($adminEmail, "New Contact Form Submission: $subject", $emailBody, $headers);
}

// Helper function to get admin email from configuration
function getAdminEmail() {
    // This could be read from a config file or database
    return "support@example.com";
}

// Helper function to get status message based on status code
function getStatusMessage($status) {
    switch ($status) {
        case 'pending':
            return 'Your message is pending review. We will get back to you soon.';
        case 'in_progress':
            return 'We are currently reviewing your message and will respond shortly.';
        case 'resolved':
            return 'Your inquiry has been resolved. Thank you for contacting us.';
        default:
            return 'Status unknown';
    }
}
?>
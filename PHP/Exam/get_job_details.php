<?php
// Include database connection
require_once '../conn.php';

// Set headers for JSON response
header('Content-Type: application/json');
$api_key = isset($_GET['api_key']) ? $_GET['api_key'] : '';
$valid_key = "7f2ff333-df7e-4f59-be36-f2d7f6ed230f"; // In production, store this securely

if ($api_key !== $valid_key) {
    http_response_code(401);
    echo json_encode(['error' => 'Unauthorized access']);
    exit;
}
// Check if job ID is provided
if (isset($_GET['id']) && !empty($_GET['id'])) {
    $job_id = $conn->real_escape_string($_GET['id']);
    
    // SQL query to get the specific job
    $sql = "SELECT * FROM jobs WHERE id = '$job_id'";
    $result = $conn->query($sql);
    
    if ($result->num_rows > 0) {
        $job = $result->fetch_assoc();
        echo json_encode(['success' => true, 'job' => $job]);
    } else {
        echo json_encode(['success' => false, 'message' => 'Job not found']);
    }
} else {
    echo json_encode(['success' => false, 'message' => 'Job ID is required']);
}

$conn->close();
?>
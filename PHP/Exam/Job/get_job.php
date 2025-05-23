<?php
// Include database connection
require_once '../../conn.php';

// Set headers for JSON response
header('Content-Type: application/json');
$api_key = isset($_GET['api_key']) ? $_GET['api_key'] : '';
$valid_key = "7f2ff333-df7e-4f59-be36-f2d7f6ed230f"; // In production, store this securely

if ($api_key !== $valid_key) {
    http_response_code(401);
    echo json_encode(['error' => 'Unauthorized access']);
    exit;
}

// SQL query to get all jobs ordered by newest first
$sql = "SELECT * 
FROM jobs 
WHERE deadline >= CURRENT_DATE
ORDER BY created_at DESC";
$result = $conn->query($sql);

$jobs = [];

if ($result->num_rows > 0) {
    // Fetch all rows as associative arrays
    while($row = $result->fetch_assoc()) {
        $jobs[] = $row;
    }
    echo json_encode(['success' => true, 'jobs' => $jobs]);
} else {
    echo json_encode(['success' => true, 'jobs' => [], 'message' => 'No jobs found']);
}

$conn->close();
?>
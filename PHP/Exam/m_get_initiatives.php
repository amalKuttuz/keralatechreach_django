<?php

header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST, OPTIONS');
header('Access-Control-Allow-Headers: Content-Type');
header('Content-Type: application/json; charset=UTF-8');

require_once '../conn.php';
header('Content-Type: application/json');

$api_key = isset($_GET['api_key']) ? $_GET['api_key'] : '';
$valid_key = "7f2ff333-df7e-4f59-be36-f2d7f6ed230f"; // In production, store this securely

if ($api_key !== $valid_key) {
    http_response_code(401);
    echo json_encode(['error' => 'Unauthorized access']);
    exit;
}

try {
    // Enable error reporting for debugging
    error_reporting(E_ALL);
    ini_set('display_errors', 1);
    
    // Prepare and execute the query
    $query = "SELECT * FROM initiatives";
    $result = mysqli_query($conn, $query);
    
    // Fetch all results
    $initiatives = [];
    while ($row = mysqli_fetch_assoc($result)) {
        $initiatives[] = $row;
    }
    
    // Check if any data was found
    if ($initiatives) {
        echo json_encode(['status' => 'success', 'data' => $initiatives]);
    } else {
        echo json_encode(['status' => 'success', 'data' => []]);
    }
    
} catch(Exception $e) {
    http_response_code(500);
    echo json_encode([
        'status' => 'error',
        'message' => 'Server error: ' . $e->getMessage()
    ]);
}
?>
<?php
// m_districts.php - API endpoint to fetch districts

// Set content type to JSON
header('Content-Type: application/json');

// Include database configuration
require_once '../conn.php';
$api_key = isset($_GET['api_key']) ? $_GET['api_key'] : '';
$valid_key = "7f2ff333-df7e-4f59-be36-f2d7f6ed230f"; // In production, store this securely

if ($api_key !== $valid_key) {
    http_response_code(401);
    echo json_encode(['error' => 'Unauthorized access']);
    exit;
}
// Connect to database
// $conn = connectToDatabase();

// Initialize response array
$response = [];

try {
    // Prepare SQL query to fetch districts
    $sql = "SELECT id, name FROM districts ORDER BY name ASC";
    
    $result = $conn->query($sql);
    
    if ($result) {
        // Check if any records found
        if ($result->num_rows > 0) {
            $districts = [];
            
            // Fetch records
            while ($row = $result->fetch_assoc()) {
                $districts[] = [
                    'id' => (int)$row['id'],
                    'name' => $row['name']
                ];
            }
            
            // Set response as the districts array
            $response = $districts;
        } else {
            // No records found, return empty array
            $response = [];
        }
    } else {
        // Query execution failed
        throw new Exception($conn->error);
    }
} catch (Exception $e) {
    // Set error response
    http_response_code(500);
    $response = [
        'error' => true,
        'message' => 'Error fetching districts: ' . $e->getMessage()
    ];
} finally {
    // Close database connection
    $conn->close();
    
    // Return response as JSON
    echo json_encode($response);
}
?>
<?php
// Include database connection
require_once '../conn.php';

// Set header as JSON
header('Content-Type: application/json');

// Initialize response array
$response = array();

try {
    // Query to get slider data
    $query = "SELECT id, image_url, redirect_url, 
              display_order, status FROM sliders 
              WHERE status = 1 
              ORDER BY display_order ASC";
    
    $result = $conn->query($query);
    
    if ($result) {
        $sliders = array();
        
        // Fetch all sliders
        while ($row = $result->fetch_assoc()) {
            // Make sure image URL is complete
            // if (!filter_var($row['image_url'], FILTER_VALIDATE_URL)) {
            //     $row['image_url'] = "https://yourdomain.com/images/sliders/" . $row['image_url'];
            // }
            
            // Add slider to array
            $sliders[] = array(
                'id' => (int)$row['id'],
                'image_url' => $row['image_url'],
                'redirect_url' => $row['redirect_url']
            );
        }
        
        // Add sliders to response
        $response['status'] = 'success';
        $response['slider_data'] = $sliders;
    } else {
        // Query failed
        $response['status'] = 'error';
        $response['message'] = 'Failed to fetch slider data';
    }
} catch (Exception $e) {
    // Exception occurred
    $response['status'] = 'error';
    $response['message'] = 'An error occurred: ' . $e->getMessage();
}

// Close connection
$conn->close();

// Return response
echo json_encode($response);
?>
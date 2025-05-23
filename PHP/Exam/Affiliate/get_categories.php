<?php
// Include database connection
require_once '../../conn.php';

// Set header as JSON
header('Content-Type: application/json');

// Initialize response array
$response = array();

try {
    // Query to get all active categories
    $query = "SELECT id, name, image_url, display_order, status 
              FROM categories 
              WHERE status = 1 
              ORDER BY display_order ASC";
    
    $result = $conn->query($query);
    
    if ($result) {
        $categories = array();
        
        // Fetch all categories
        while ($row = $result->fetch_assoc()) {
            // Make sure image URL is complete
            // if (!filter_var($row['image_url'], FILTER_VALIDATE_URL)) {
            //     $row['image_url'] = "https://yourdomain.com/images/categories/" . $row['image_url'];
            // }
            
            // Add category to array
            $categories[] = array(
                'id' => (int)$row['id'],
                'name' => $row['name'],
                'image_url' => $row['image_url']
            );
        }
        
        // Add categories to response
        $response['status'] = 'success';
        $response['categories'] = $categories;
    } else {
        // Query failed
        $response['status'] = 'error';
        $response['message'] = 'Failed to fetch categories';
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
<?php
// Include database connection
require_once '../../conn.php';

// Set header as JSON
header('Content-Type: application/json');

// Initialize response array
$response = array();

try {
    // Query to get budget selections
    $query = "SELECT bs.id, bs.title, bs.category_id, bs.budget_limit, bs.image_url,
              c.name as category_name, bs.display_order, bs.status
              FROM budget_selections bs
              JOIN categories c ON bs.category_id = c.id
              WHERE bs.status = 1
              ORDER BY bs.display_order ASC";
    
    $result = $conn->query($query);
    
    if ($result) {
        $budget_selections = array();
        
        // Fetch all budget selections
        while ($row = $result->fetch_assoc()) {
            // // Make sure image URL is complete
            // if (!filter_var($row['image_url'], FILTER_VALIDATE_URL)) {
            //     $row['image_url'] = "https://keralatechreach.in/Affiliated/budget/" . $row['image_url'];
            // }
            
            // Add budget selection to array
            $budget_selections[] = array(
                'id' => (int)$row['id'],
                'title' => $row['title'],
                'category_id' => (int)$row['category_id'],
                'category_name' => $row['category_name'],
                'budget_limit' => (int)$row['budget_limit'],
                'image_url' => $row['image_url']
            );
        }
        
        // Add budget selections to response
        $response['status'] = 'success';
        $response['budget_selections'] = $budget_selections;
    } else {
        // Query failed
        $response['status'] = 'error';
        $response['message'] = 'Failed to fetch budget selections';
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
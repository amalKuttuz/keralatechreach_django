<?php
// Database connection
require_once '../conn.php';

// Check if category_id is provided
if (!isset($_GET['category_id'])) {
    echo json_encode(['error' => 'Category ID is required']);
    exit;
}

$categoryId = intval($_GET['category_id']);

try {
    // Query to fetch category by ID
    $stmt = $conn->prepare("
        SELECT id, name, image_url, display_order
        FROM categories 
        WHERE id = ? AND status = 1
    ");
    
    $stmt->bind_param("i", $categoryId);
    $stmt->execute();
    $result = $stmt->get_result();
    
    if ($row = $result->fetch_assoc()) {
        // Make sure image URL is a complete URL
        if (!empty($row['image_url']) && strpos($row['image_url'], 'http') !== 0) {
            $row['image_url'] = 'https://keralatechreach.in/images/categories/' . $row['image_url'];
        }
        
        echo json_encode(['category' => $row]);
    } else {
        echo json_encode(['error' => 'Category not found']);
    }
    
} catch (Exception $e) {
    echo json_encode(['error' => 'Database error: ' . $e->getMessage()]);
}

$conn->close();
?>
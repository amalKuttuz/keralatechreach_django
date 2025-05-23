<?php
// Database connection
require_once '../conn.php';

// Check if required parameters are provided
if (!isset($_GET['category_id']) || !isset($_GET['budget_limit'])) {
    echo json_encode(['error' => 'Category ID and budget limit are required']);
    exit;
}

$categoryId = intval($_GET['category_id']);
$budgetLimit = intval($_GET['budget_limit']);

try {
    // Build query directly (sanitize properly!)
    $query = "
        SELECT id, title, description, category_id, price, image_url, affiliate_url, 
               affiliate_code, COALESCE(rating, 0) as rating
        FROM products 
        WHERE category_id = $categoryId AND price <= $budgetLimit AND status = 1
        ORDER BY price DESC
    ";
    
    $result = $conn->query($query);
    
    if (!$result) {
        throw new Exception($conn->error);
    }

    $products = [];

    while ($row = $result->fetch_assoc()) {
        // Make sure image URL is a complete URL
        if (!empty($row['image_url']) && strpos($row['image_url'], 'http') !== 0) {
            $row['image_url'] = 'https://keralatechreach.in/images/products/' . $row['image_url'];
        }

        $products[] = $row;
    }

    echo json_encode(['products' => $products]);

} catch (Exception $e) {
    echo json_encode(['error' => 'Database error: ' . $e->getMessage()]);
}

$conn->close();
?>

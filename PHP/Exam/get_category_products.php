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
    // Query to fetch products by category without bind_param
    $query = "
        SELECT id, title, description, category_id, price, image_url, affiliate_url, 
               affiliate_code, COALESCE(rating, 0) as rating
        FROM products 
        WHERE category_id = $categoryId AND status = 1
        ORDER BY featured DESC, id DESC
    ";
    
    $result = $conn->query($query);

    if (!$result) {
        throw new Exception($conn->error);
    }

    $products = [];

    while ($row = $result->fetch_assoc()) {
        // If you want to restore the image URL logic, uncomment the below block
        /*
        if (!empty($row['image_url']) && strpos($row['image_url'], 'http') !== 0) {
            $row['image_url'] = 'https://keralatechreach.in/images/products/' . $row['image_url'];
        }
        */
        $products[] = $row;
    }

    echo json_encode(['products' => $products]);

} catch (Exception $e) {
    echo json_encode(['error' => 'Database error: ' . $e->getMessage()]);
}

$conn->close();
?>

<?php
session_start();
if (!isset($_SESSION['username'])) {
    header('Location: login.php');
    exit();
}
require_once('../conn.php');
include('head.php');

// Get process type and filters
$process = isset($_GET['process']) ? $_GET['process'] : 'category';
$filter_status = filter_input(INPUT_GET, 'status', FILTER_SANITIZE_NUMBER_INT);
$filter_category = filter_input(INPUT_GET, 'category', FILTER_SANITIZE_NUMBER_INT);

// Function to get data based on process type
function getItems($process, $conn, $filter_status = '', $filter_category = '') {
    $items = [];
    
    switch($process) {
        case 'category':
            $query = "SELECT * FROM categories WHERE 1=1";
            if ($filter_status !== '') {
                $query .= " AND status = " . $conn->real_escape_string($filter_status);
            }
            $query .= " ORDER BY display_order ASC";
            break;
            
        case 'budget':
            $query = "SELECT bs.*, c.name as category_name 
                     FROM budget_selections bs 
                     LEFT JOIN categories c ON bs.category_id = c.id 
                     WHERE 1=1";
            if ($filter_status !== '') {
                $query .= " AND bs.status = " . $conn->real_escape_string($filter_status);
            }
            if ($filter_category) {
                $query .= " AND bs.category_id = " . $conn->real_escape_string($filter_category);
            }
            $query .= " ORDER BY bs.display_order ASC";
            break;
            
        case 'product':
            $query = "SELECT p.*, c.name as category_name 
                     FROM products p 
                     LEFT JOIN categories c ON p.category_id = c.id 
                     WHERE 1=1";
            if ($filter_status !== '') {
                $query .= " AND p.status = " . $conn->real_escape_string($filter_status);
            }
            if ($filter_category) {
                $query .= " AND p.category_id = " . $conn->real_escape_string($filter_category);
            }
            $query .= " ORDER BY p.id DESC";
            break;
    }
    
    $result = $conn->query($query);
    if ($result) {
        while ($row = $result->fetch_assoc()) {
            $items[] = $row;
        }
        $result->close();
    }
    return $items;
}

// Get categories for filter dropdown
$categories = [];
$cat_query = "SELECT id, name FROM categories WHERE status = 1 ORDER BY name ASC";
$result = $conn->query($cat_query);
if ($result) {
    while ($row = $result->fetch_assoc()) {
        $categories[] = $row;
    }
    $result->close();
}

// Get items based on process type
$items = getItems($process, $conn, $filter_status, $filter_category);

// Handle update operation
if (isset($_POST['update'])) {
    $id = filter_input(INPUT_POST, 'id', FILTER_SANITIZE_NUMBER_INT);
    
    switch($process) {
        case 'category':
            $name = filter_input(INPUT_POST, 'name', FILTER_SANITIZE_STRING);
            $display_order = filter_input(INPUT_POST, 'display_order', FILTER_SANITIZE_NUMBER_INT);
            $status = filter_input(INPUT_POST, 'status', FILTER_SANITIZE_NUMBER_INT);
            
            $query = "UPDATE categories SET name = ?, display_order = ?, status = ? WHERE id = ?";
            $stmt = $conn->prepare($query);
            $stmt->bind_param("siii", $name, $display_order, $status, $id);
            break;
            
        case 'budget':
            $title = filter_input(INPUT_POST, 'title', FILTER_SANITIZE_STRING);
            $category_id = filter_input(INPUT_POST, 'category_id', FILTER_SANITIZE_NUMBER_INT);
            $budget_limit = filter_input(INPUT_POST, 'budget_limit', FILTER_SANITIZE_NUMBER_FLOAT, FILTER_FLAG_ALLOW_FRACTION);
            $display_order = filter_input(INPUT_POST, 'display_order', FILTER_SANITIZE_NUMBER_INT);
            $status = filter_input(INPUT_POST, 'status', FILTER_SANITIZE_NUMBER_INT);
            
            $query = "UPDATE budget_selections SET title = ?, category_id = ?, budget_limit = ?, display_order = ?, status = ? WHERE id = ?";
            $stmt = $conn->prepare($query);
            $stmt->bind_param("sidiii", $title, $category_id, $budget_limit, $display_order, $status, $id);
            break;
            
        case 'product':
            $title = filter_input(INPUT_POST, 'title', FILTER_SANITIZE_STRING);
            $category_id = filter_input(INPUT_POST, 'category_id', FILTER_SANITIZE_NUMBER_INT);
            $price = filter_input(INPUT_POST, 'price', FILTER_SANITIZE_NUMBER_FLOAT, FILTER_FLAG_ALLOW_FRACTION);
            $amazon_url = filter_input(INPUT_POST, 'amazon_url', FILTER_SANITIZE_URL);
            $flipkart_url = filter_input(INPUT_POST, 'flipkart_url', FILTER_SANITIZE_URL);
            $featured = filter_input(INPUT_POST, 'featured', FILTER_SANITIZE_NUMBER_INT);
            $status = filter_input(INPUT_POST, 'status', FILTER_SANITIZE_NUMBER_INT);
            $updated_at = date('Y-m-d H:i:s');

            $query = "UPDATE products SET title = ?, category_id = ?, price = ?, amazon_url = ?, flipkart_url = ?, featured = ?, status = ?, updated_at = ? WHERE id = ?";
            $stmt = $conn->prepare($query);
            $stmt->bind_param("sidssiisi", $title, $category_id, $price, $amazon_url, $flipkart_url, $featured, $status, $updated_at, $id);
            break;
    }
    
    if (isset($stmt) && $stmt->execute()) {
        echo "<script>alert('Updated successfully'); window.location.href='?process=$process';</script>";
    } else {
        echo "<script>alert('Update failed');</script>";
    }
}
?>

<style>
.filter-form { margin-bottom: 20px; padding: 15px; background-color: #f9f9f9; }
.image-preview { max-width: 100px; max-height: 100px; }
.status-active { color: green; }
.status-inactive { color: red; }
</style>

<section id="main-content">
    <section class="wrapper">
        <div class="row">
            <div class="col-md-12 mt">
                <div class="content-panel">
                    <h2><?php echo ucfirst($process); ?> Management</h2>
                    
                    <!-- Filter Form -->
                    <div class="filter-form">
                        <form method="GET" class="row">
                            <input type="hidden" name="process" value="<?php echo $process; ?>">
                            
                            <div class="col-md-3">
                                <select name="status" class="form-control">
                                    <option value="">All Status</option>
                                    <option value="1" <?php echo ($filter_status === '1') ? 'selected' : ''; ?>>Active</option>
                                    <option value="0" <?php echo ($filter_status === '0') ? 'selected' : ''; ?>>Inactive</option>
                                </select>
                            </div>
                            
                            <?php if ($process !== 'category'): ?>
                            <div class="col-md-3">
                                <select name="category" class="form-control">
                                    <option value="">All Categories</option>
                                    <?php foreach ($categories as $category): ?>
                                        <option value="<?php echo $category['id']; ?>" 
                                                <?php echo ($filter_category == $category['id']) ? 'selected' : ''; ?>>
                                            <?php echo htmlspecialchars($category['name']); ?>
                                        </option>
                                    <?php endforeach; ?>
                                </select>
                            </div>
                            <?php endif; ?>
                            
                            <div class="col-md-3">
                                <button type="submit" class="btn btn-primary">Filter</button>
                                <a href="affiliate_<?php echo $process; ?>.php" class="btn btn-success">Add New</a>
                            </div>
                        </form>
                    </div>

                    <!-- Data Table -->
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <?php if ($process === 'category'): ?>
                                    <th>Name</th>
                                    <th>Image</th>
                                    <th>Display Order</th>
                                <?php elseif ($process === 'budget'): ?>
                                    <th>Title</th>
                                    <th>Category</th>
                                    <th>Budget Limit</th>
                                    <th>Image</th>
                                    <th>Display Order</th>
                                <?php else: ?>
                                    <th>Title</th>
                                    <th>Category</th>
                                    <th>Price</th>
                                    <th>Image</th>
                                    <th>Amazon URL</th>
                                    <th>Flipkart URL</th>
                                    <th>Featured</th>
                                <?php endif; ?>
                                <th>Status</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php foreach ($items as $item): ?>
                                <tr>
                                    <form method="post">
                                        <?php if ($process === 'category'): ?>
                                            <td><input type="text" name="name" value="<?php echo htmlspecialchars($item['name']); ?>" class="form-control"></td>
                                            <td><img src="<?php echo htmlspecialchars($item['image_url']); ?>" class="image-preview"></td>
                                            <td><input type="number" name="display_order" value="<?php echo $item['display_order']; ?>" class="form-control"></td>
                                        <?php elseif ($process === 'budget'): ?>
                                            <td><input type="text" name="title" value="<?php echo htmlspecialchars($item['title']); ?>" class="form-control"></td>
                                            <td>
                                                <select name="category_id" class="form-control">
                                                    <?php foreach ($categories as $category): ?>
                                                        <option value="<?php echo $category['id']; ?>" 
                                                                <?php echo ($item['category_id'] == $category['id']) ? 'selected' : ''; ?>>
                                                            <?php echo htmlspecialchars($category['name']); ?>
                                                        </option>
                                                    <?php endforeach; ?>
                                                </select>
                                            </td>
                                            <td><input type="number" name="budget_limit" value="<?php echo $item['budget_limit']; ?>" class="form-control"></td>
                                            <td><img src="<?php echo htmlspecialchars($item['image_url']); ?>" class="image-preview"></td>
                                            <td><input type="number" name="display_order" value="<?php echo $item['display_order']; ?>" class="form-control"></td>
                                        <?php else: ?>
                                            <td><input type="text" name="title" value="<?php echo htmlspecialchars($item['title']); ?>" class="form-control"></td>
                                            <td>
                                                <select name="category_id" class="form-control">
                                                    <?php foreach ($categories as $category): ?>
                                                        <option value="<?php echo $category['id']; ?>" 
                                                                <?php echo ($item['category_id'] == $category['id']) ? 'selected' : ''; ?>>
                                                            <?php echo htmlspecialchars($category['name']); ?>
                                                        </option>
                                                    <?php endforeach; ?>
                                                </select>
                                            </td>
                                            <td><input type="number" name="price" value="<?php echo $item['price']; ?>" step="0.01" class="form-control"></td>
                                            <td><img src="<?php echo htmlspecialchars($item['image_url']); ?>" class="image-preview"></td>
                                            <td><input type="url" name="amazon_url" value="<?php echo htmlspecialchars($item['amazon_url']); ?>" class="form-control"></td>
                                            <td><input type="url" name="flipkart_url" value="<?php echo htmlspecialchars($item['flipkart_url']); ?>" class="form-control"></td>
                                            <td>
                                                <select name="featured" class="form-control">
                                                    <option value="1" <?php echo $item['featured'] ? 'selected' : ''; ?>>Yes</option>
                                                    <option value="0" <?php echo !$item['featured'] ? 'selected' : ''; ?>>No</option>
                                                </select>
                                            </td>
                                        <?php endif; ?>
                                        
                                        <td>
                                            <select name="status" class="form-control">
                                                <option value="1" <?php echo $item['status'] ? 'selected' : ''; ?>>Active</option>
                                                <option value="0" <?php echo !$item['status'] ? 'selected' : ''; ?>>Inactive</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input type="hidden" name="id" value="<?php echo $item['id']; ?>">
                                            <button type="submit" name="update" class="btn btn-primary btn-sm">Update</button>
                                            <a href="affiliate_delete.php?process=<?php echo $process; ?>&id=<?php echo $item['id']; ?>" 
                                               class="btn btn-danger btn-sm" 
                                               onclick="return confirm('Are you sure you want to delete this item?')">Delete</a>
                                        </td>
                                    </form>
                                </tr>
                            <?php endforeach; ?>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </section>
</section>

<?php include('footer.php'); ?>
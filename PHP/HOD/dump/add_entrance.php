<?php
// Include database connection
session_start();
if (!isset($_SESSION['username'])) {
    header('Location: login.php');
    exit();
}
require_once 'conn.php';
include('head.php');

// Check if it's a POST request
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Get POST data
    $entrance_name = $conn->real_escape_string($_POST['entrance_name']);
    $category = $conn->real_escape_string($_POST['category']);
    $deadline_date = $conn->real_escape_string($_POST['deadline_date']);
    $website_url = $conn->real_escape_string($_POST['website_url']);
    
    // Validate input
    if (empty($entrance_name) || empty($category) || empty($deadline_date) || empty($website_url)) {
        $error_message = 'All fields are required';
    } else {
        // Insert data into database
        $sql = "INSERT INTO entrance_notifications (entrance_name, category, deadline_date, website_url, created_at) 
                VALUES ('$entrance_name', '$category', '$deadline_date', '$website_url', NOW())";
        
        if ($conn->query($sql) === TRUE) {
            $success_message = 'Entrance notification added successfully';
        } else {
            $error_message = 'Error: ' . $conn->error;
        }
    }
}

$conn->close();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Entrance Notification</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .container {
            max-width: 800px;
            margin-top: 30px;
        }
    </style>
</head>
<body>

<section id="main-content">
    <section class="wrapper">
        <div class="row">
            <div class="col-lg-9">
                <div class="container">
                    <h1>Add Entrance Notification</h1>
                    
                    <?php if (isset($success_message)): ?>
                        <div class="alert alert-success" role="alert">
                            <?php echo $success_message; ?>
                        </div>
                    <?php endif; ?>
                    
                    <?php if (isset($error_message)): ?>
                        <div class="alert alert-danger" role="alert">
                            <?php echo $error_message; ?>
                        </div>
                    <?php endif; ?>
                    
                    <!-- Add Entrance Notification Form -->
                    <div class="card mt-4">
                        <div class="card-header">
                            <h2 class="h5 mb-0">Add New Entrance Notification</h2>
                        </div>
                        <div class="card-body">
                            <form id="addEntranceForm" method="POST">
                                <div class="mb-3">
                                    <label for="entrance_name" class="form-label">Entrance Name</label>
                                    <input type="text" class="form-control" id="entrance_name" name="entrance_name" required>
                                </div>
                                <div class="mb-3">
                                    <label for="category" class="form-label">Category</label>
                                    <input type="text" class="form-control" id="category" name="category" required>
                                </div>
                                <div class="mb-3">
                                    <label for="deadline_date" class="form-label">Deadline Date</label>
                                    <input type="date" class="form-control" id="deadline_date" name="deadline_date" required>
                                </div>
                                <div class="mb-3">
                                    <label for="website_url" class="form-label">Website URL</label>
                                    <input type="url" class="form-control" id="website_url" name="website_url" required>
                                </div>
                                <button type="submit" class="btn btn-primary">Add Entrance Notification</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</section>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<?php
include('footer.php');
?>
</body>
</html>
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
    $post_name = $conn->real_escape_string($_POST['post_name']);
    $company_name = $conn->real_escape_string($_POST['company_name']);
    $deadline = $conn->real_escape_string($_POST['deadline']);
    $description = $conn->real_escape_string($_POST['description']);
    $qualifications = $conn->real_escape_string($_POST['qualifications']);
    $email = isset($_POST['email']) ? $conn->real_escape_string($_POST['email']) : '';
    $website = $conn->real_escape_string($_POST['website']);
    $phoneno = isset($_POST['phoneno']) ? $conn->real_escape_string($_POST['phoneno']) : '';
    
    // Validate input - only check required fields
    if (empty($post_name) || empty($company_name) || empty($deadline) || empty($description) || empty($qualifications) 
        || empty($website)) {
        $error_message = 'Required fields must be filled';
    } else {
        // Insert data into database
        $sql = "INSERT INTO jobs (post_name, company_name, deadline, description, qualifications, email, website, phone) 
                VALUES ('$post_name', '$company_name', '$deadline', '$description', '$qualifications', '$email', '$website', '$phoneno')";
        
        if ($conn->query($sql) === TRUE) {
            $success_message = 'Job added successfully';
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
    <title>Add Job</title>
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
                    <h1>Add Job</h1>
                    
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
                    
                    <!-- Add Job Form -->
                    <div class="card mt-4">
                        <div class="card-header">
                            <h2 class="h5 mb-0">Add New Job</h2>
                        </div>
                        <div class="card-body">
                            <form id="addJobForm"  method="POST">
                                <div class="mb-3">
                                    <label for="post_name" class="form-label">Post Name</label>
                                    <input type="text" class="form-control" id="post_name" name="post_name" required>
                                </div>
                                <div class="mb-3">
                                    <label for="company_name" class="form-label">Company Name</label>
                                    <input type="text" class="form-control" id="company_name" name="company_name" required>
                                </div>
                                <div class="mb-3">
                                    <label for="deadline" class="form-label">Deadline</label>
                                    <input type="date" class="form-control" id="deadline" name="deadline" required>
                                </div>
                                <div class="mb-3">
                                    <label for="description" class="form-label">Job Description</label>
                                    <textarea class="form-control" id="description" name="description" rows="4" required></textarea>
                                </div>
                                <div class="mb-3">
                                    <label for="qualifications" class="form-label">Qualifications</label>
                                    <textarea class="form-control" id="qualifications" name="qualifications" rows="4" required></textarea>
                                </div>
                                <div class="mb-3">
                                    <label for="email" class="form-label">Email <span class="text-muted">(Optional)</span></label>
                                    <input type="email" class="form-control" id="email" name="email">
                                </div>
                                <div class="mb-3">
                                    <label for="website" class="form-label">Website</label>
                                    <input type="url" class="form-control" id="website" name="website" required>
                                </div>
                                <div class="mb-3">
                                    <label for="phoneno" class="form-label">Phone <span class="text-muted">(Optional)</span></label>
                                    <input type="tel" class="form-control" id="phoneno" name="phoneno">
                                </div>
                                <button type="submit" class="btn btn-primary">Add Job</button>
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
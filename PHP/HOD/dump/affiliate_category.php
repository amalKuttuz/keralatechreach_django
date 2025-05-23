<?php
session_start();
if (!isset($_SESSION['username'])) {
    header('Location: login.php');
    exit();
}
require_once('../conn.php');
include('head.php');

// Process form submission
if(isset($_POST['name'])) {
    $name = $_POST['name'];
    $display_order = $_POST['display_order'];
    $status = $_POST['status'];
    $image_url = '';

    // File upload handling
    if(isset($_FILES["image"]) && $_FILES["image"]["error"] == 0) {
        $target_dir = "../Affiliated/category/";
        if(!is_dir($target_dir)) {
            mkdir($target_dir, 0777, true);
        }

        $file_extension = strtolower(pathinfo($_FILES["image"]["name"], PATHINFO_EXTENSION));
        $new_filename = time() . '_' . rand(1000,9999) . '.' . $file_extension;
        $target_file = $target_dir . $new_filename;

        // Validate file
        $allowed_types = array('jpg', 'jpeg', 'png');
        if(!in_array($file_extension, $allowed_types)) {
            echo "<script>alert('Only JPG, JPEG & PNG files are allowed.');</script>";
            exit();
        }

        if($_FILES["image"]["size"] > 2000000) {
            echo "<script>alert('File is too large. Max 2MB allowed.');</script>";
            exit();
        }

        if(move_uploaded_file($_FILES["image"]["tmp_name"], $target_file)) {
            $image_url = "https://keralatechreach.in/Affiliated/category/".$new_filename;
        } else {
            echo "<script>alert('Failed to upload file.');</script>";
            exit();
        }
    }

    // Database insertion
    try {
        $sql = "INSERT INTO categories (name, image_url, display_order, status) VALUES (?, ?, ?, ?)";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("ssii", $name, $image_url, $display_order, $status);
        
        if($stmt->execute()) {
            echo "<script>alert('Category added successfully');</script>";
        } else {
            echo "<script>alert('Failed to add category');</script>";
        }
        $stmt->close();
    } catch (Exception $e) {
        echo "<script>alert('Error: " . $e->getMessage() . "');</script>";
    }
}
?>

<section id="main-content">
    <section class="wrapper">
        <div class="row">
            <div class="col-lg-9">
                <h2>Add Category</h2>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="form-panel">
                            <h4 class="mb"><i class="fa fa-angle-right"></i> Add Category</h4>
                            <form class="form-horizontal style-form" method="post" enctype="multipart/form-data">
                                <div class="form-group">
                                    <label class="col-sm-2 col-sm-2 control-label">Category Name</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" name="name" required>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-2 col-sm-2 control-label">Category Image</label>
                                    <div class="col-sm-10">
                                        <input type="file" name="image" class="form-control" required>
                                        <span class="help-block">Max file size: 2MB. Allowed types: JPG, JPEG, PNG</span>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-2 col-sm-2 control-label">Display Order</label>
                                    <div class="col-sm-10">
                                        <input type="number" class="form-control" name="display_order" required min="1">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-2 col-sm-2 control-label">Status</label>
                                    <div class="col-sm-10">
                                        <select name="status" class="form-control" required>
                                            <option value="1">Active</option>
                                            <option value="0">Inactive</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-lg-offset-2 col-lg-10">
                                        <button type="submit" class="btn btn-theme">Add Category</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</section>

<?php include('footer.php'); ?>
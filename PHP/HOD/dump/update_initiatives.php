<?php

session_start();
if (!isset($_SESSION['username'])) {
    header('Location: login.php');
    exit();
}
include('conn.php');
include('head.php');	


if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    try {
        $id = mysqli_real_escape_string($conn, $_POST['id']);
        $name = mysqli_real_escape_string($conn, $_POST['name']);
        $description = mysqli_real_escape_string($conn, $_POST['description']);
        $eligibility = mysqli_real_escape_string($conn, $_POST['eligibility']);
        $website_url = mysqli_real_escape_string($conn, $_POST['website_url']);
        
        $query = "UPDATE initiatives 
                  SET name = '$name', 
                      description = '$description', 
                      eligibility = '$eligibility', 
                      website_url = '$website_url' 
                  WHERE id = '$id'";
        
        if (mysqli_query($conn, $query)) {
            echo "Initiative updated successfully!";
        } else {
            echo "Error: " . mysqli_error($conn);
        }
    } catch(Exception $e) {
        echo "Error: " . $e->getMessage();
    }
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Update Government Initiative</title>
    <style>
        .form-group { margin-bottom: 15px; }
        label { display: block; margin-bottom: 5px; }
        input[type="text"], textarea {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
        }
        button { padding: 10px 20px; }
    </style>
</head>
<body>

 <section id="main-content">
      <section class="wrapper">
        <div class="row">
          <div class="col-lg-9">
    <h2>Update Government Initiative</h2>
    <?php
    require_once 'conn.php';
    
    if (isset($_GET['id'])) {
        $id = mysqli_real_escape_string($conn, $_GET['id']);
        $query = "SELECT * FROM initiatives WHERE id = '$id'";
        $result = mysqli_query($conn, $query);
        $initiative = mysqli_fetch_assoc($result);
        
        if ($initiative) {
    ?>
    <form action="" method="POST">
        <input type="hidden" name="id" value="<?php echo $initiative['id']; ?>">
        
        <div class="form-group">
            <label for="name">Initiative Name:</label>
            <input type="text" id="name" name="name" 
                value="<?php echo htmlspecialchars($initiative['name']); ?>" required>
        </div>
        
        <div class="form-group">
            <label for="description">Description:</label>
            <textarea id="description" name="description" rows="4" required><?php 
                echo htmlspecialchars($initiative['description']); 
            ?></textarea>
        </div>
        
        <div class="form-group">
            <label for="eligibility">Eligibility:</label>
            <textarea id="eligibility" name="eligibility" rows="4" required><?php 
                echo htmlspecialchars($initiative['eligibility']); 
            ?></textarea>
        </div>
        
        <div class="form-group">
            <label for="website_url">Website URL:</label>
            <input type="url" id="website_url" name="website_url" 
                value="<?php echo htmlspecialchars($initiative['website_url']); ?>" required>
        </div>
        
        <button type="submit">Update Initiative</button>
    </form>
    <?php
        } else {
            echo "Initiative not found.";
        }
    } else {
        echo "No initiative ID specified.";
    }
    ?>
      </div>
		  <!-- /col-lg-9 END SECTION MIDDLE -->
		</div>
		<!-- /row -->
	  </section>
	</section	

    <?php
    include('footer.php')
    ?>
</body>
</html>

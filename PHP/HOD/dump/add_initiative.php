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
        $name = mysqli_real_escape_string($conn, $_POST['name']);
        $description = mysqli_real_escape_string($conn, $_POST['description']);
        $eligibility = mysqli_real_escape_string($conn, $_POST['eligibility']);
        $website_url = mysqli_real_escape_string($conn, $_POST['website_url']);
        
        $query = "INSERT INTO initiatives (name, description, eligibility, website_url) 
                  VALUES ('$name', '$description', '$eligibility', '$website_url')";
        
        if (mysqli_query($conn, $query)) {
            echo "Initiative added successfully!";
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
    <title>Add Government Initiative</title>
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
    <h2>Add New Government Initiative</h2>
    <form action="" method="POST">
        <div class="form-group">
            <label for="name">Initiative Name:</label>
            <input type="text" id="name" name="name" required>
        </div>
        
        <div class="form-group">
            <label for="description">Description:</label>
            <textarea id="description" name="description" rows="4" required></textarea>
        </div>
        
        <div class="form-group">
            <label for="eligibility">Eligibility:</label>
            <textarea id="eligibility" name="eligibility" rows="4" required></textarea>
        </div>
        
        <div class="form-group">
            <label for="website_url">Website URL:</label>
            <input type="url" id="website_url" name="website_url" required>
        </div>
        
        <button type="submit">Add Initiative</button>
    </form>

    </div>
    </div>
    </section>
    </section>

<?php
include 'footer.php';

?>
</body>
</html>
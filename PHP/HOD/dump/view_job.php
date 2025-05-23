<?php
// Include database connection

session_start();
if (!isset($_SESSION['username'])) {
    header('Location: login.php');
    exit();
}
require_once 'conn.php';
include('head.php');	
// view_job.php

// Check if it's a POST request for updating or deleting a job
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (isset($_POST['update'])) {
        // Get POST data for update
        $job_id = $conn->real_escape_string($_POST['job_id']);
        $post_name = $conn->real_escape_string($_POST['post_name']);
        $company_name = $conn->real_escape_string($_POST['company_name']);
        $deadline = $conn->real_escape_string($_POST['deadline']);
        $description = $conn->real_escape_string($_POST['description']);
        $qualifications = $conn->real_escape_string($_POST['qualifications']);
        $email = $conn->real_escape_string($_POST['email']);
        $website = $conn->real_escape_string($_POST['website']);
        $phone = $conn->real_escape_string($_POST['phone']);
        
        // Validate input
        if (empty($job_id) || empty($post_name) || empty($company_name) || empty($deadline) || empty($description) || empty($qualifications) || empty($email) || empty($website) || empty($phone)) {
            echo 'All fields are required';
            exit;
        }
        
        // Update job in database
        $sql = "UPDATE jobs SET post_name='$post_name', company_name='$company_name', deadline='$deadline', 
                description='$description', qualifications='$qualifications', email='$email', website='$website', phone='$phone' WHERE id='$job_id'";
        
        if ($conn->query($sql) === TRUE) {
            echo 'Job updated successfully';
        } else {
            echo 'Error: ' . $conn->error;
        }
    } elseif (isset($_POST['delete'])) {
        // Get POST data for delete
        $job_id = $conn->real_escape_string($_POST['job_id']);
        
        // Delete job from database
        $sql = "DELETE FROM jobs WHERE id='$job_id'";
        
        if ($conn->query($sql) === TRUE) {
            echo 'Job deleted successfully';
        } else {
            echo 'Error: ' . $conn->error;
        }
    }
}

// Fetch all jobs from database
$sql = "SELECT * FROM jobs";
$result = $conn->query($sql);

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Jobs</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        table, th, td {
            border: 1px solid black;
        }
        th, td {
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        form {
            margin: 0;
        }
        input[type="text"], input[type="email"], input[type="url"], input[type="tel"] {
            width: 100%;
            box-sizing: border-box;
        }
        button {
            padding: 5px 10px;
            margin: 2px;
        }
    </style>
</head>
<body>

<section id="main-content">
    <section class="wrapper">
        <div class="row">
            <div class="col-lg-9">
<?php
if ($result->num_rows > 0) {
    echo '<table>';
    echo '<tr><th>ID</th><th>Post Name</th><th>Company Name</th><th>Deadline</th><th>Description</th><th>Qualifications</th><th>Email</th><th>Website</th><th>Phone</th><th>Actions</th></tr>';
    
    while ($row = $result->fetch_assoc()) {
        echo '<tr>';
        echo '<form method="POST" action="">';
        echo '<td><input type="hidden" name="job_id" value="' . $row['id'] . '">' . $row['id'] . '</td>';
        echo '<td><input type="text" name="post_name" value="' . $row['post_name'] . '"></td>';
        echo '<td><input type="text" name="company_name" value="' . $row['company_name'] . '"></td>';
        echo '<td><input type="text" name="deadline" value="' . $row['deadline'] . '"></td>';
        echo '<td><input type="text" name="description" value="' . $row['description'] . '"></td>';
        echo '<td><input type="text" name="qualifications" value="' . $row['qualifications'] . '"></td>';
        echo '<td><input type="email" name="email" value="' . $row['email'] . '"></td>';
        echo '<td><input type="url" name="website" value="' . $row['website'] . '"></td>';
        echo '<td><input type="tel" name="phone" value="' . $row['phone'] . '"></td>';
        echo '<td>';
        echo '<button type="submit" name="update">Update</button>';
        echo '<button type="submit" name="delete">Delete</button>';
        echo '</td>';
        echo '</form>';
        echo '</tr>';
    }
    
    echo '</table>';
} else {
    echo 'No jobs found';
}

$conn->close();

include('footer.php');
?>

</div>
</div>
</section>
</section>
</body>
</html>
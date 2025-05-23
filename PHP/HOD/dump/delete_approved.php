<?php

session_start();
if (!isset($_SESSION['username'])) {
    header('Location: login.php');
    exit();
}
include('conn.php');

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $id = $_POST['id'];

    // Debugging: Check if ID is received
    if (empty($id)) {
        echo "<script>alert('ID is missing'); window.location.href='approved.php';</script>";
        exit();
    }

    $q = "DELETE FROM approved WHERE approved_id = $id";
    $r = mysqli_query($conn, $q);

    // Debugging: Check if query executed successfully
    if ($r) {
        echo "<script>alert('Deleted successfully'); window.location.href='approved.php';</script>";
    } else {
        // Display MySQL error
        $error = mysqli_error($conn);
        echo "<script>alert('Deletion failed: $error'); window.location.href='approved.php';</script>";
    }
}
?>
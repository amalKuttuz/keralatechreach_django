<?php

session_start();
if (!isset($_SESSION['username'])) {
    header('Location: login.php');
    exit();
}
include('conn.php');

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $degree_id = $_POST['degree_id'];

    $sql = "DELETE FROM degree WHERE id = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $degree_id);
    $stmt->execute();

    if ($stmt->affected_rows > 0) {
        ?>
        <script>
            alert("Degree deleted successfully");
            window.location.href = "view_degree.php";
        </script>
        <?php
    } else {
        ?>
        <script>
            alert("Failed to delete degree");
            window.location.href = "view_degree.php";
        </script>
        <?php
    }

    $stmt->close();
    $conn->close();
}
?>
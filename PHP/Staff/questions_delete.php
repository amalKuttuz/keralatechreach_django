<?php

session_start();
if (!isset($_SESSION['username'])) {
    header('Location: login.php');
    exit();
}
include('conn.php');

if ($_SERVER['REQUEST_METHOD'] === 'GET') {
    $question_id = $_GET['question_id'];

    $sql = "DELETE  FROM approved WHERE approved_id = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $question_id);
    $stmt->execute();

    if ($stmt->affected_rows > 0) {
        ?>
        <script>
            alert("Question deleted successfully");
            window.location.href = "questions_view.php";
        </script>
        <?php
    } else {
        ?>
        <script>
            alert("Failed to delete question");
            window.location.href = "questions_view.php";
        </script>
        <?php
    }

    $stmt->close();
    $conn->close();
}
?>
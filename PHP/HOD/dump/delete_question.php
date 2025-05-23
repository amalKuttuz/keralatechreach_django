<?php

session_start();
if (!isset($_SESSION['username'])) {
    header('Location: login.php');
    exit();
}
include('conn.php');

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $question_id = $_POST['question_id'];

    $sql = "DELETE FROM question WHERE id = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $question_id);
    $stmt->execute();

    if ($stmt->affected_rows > 0) {
        ?>
        <script>
            alert("Question deleted successfully");
            window.location.href = "new_questions.php";
        </script>
        <?php
    } else {
        ?>
        <script>
            alert("Failed to delete question");
            window.location.href = "new_questions.php";
        </script>
        <?php
    }

    $stmt->close();
    $conn->close();
}
?>
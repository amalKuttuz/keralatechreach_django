<?php

session_start();
if (!isset($_SESSION['username'])) {
    header('Location: login.php');
    exit();
}
include('conn.php');

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    if (isset($_POST['update'])) {
        $id = $_POST['update'];
        $exam_name = $_POST['exam_name'][0];
        $exam_date = $_POST['exam_date'][0];
        $exam_url = $_POST['exam_url'][0];

        $sql = "UPDATE exam SET exam_name='$exam_name', exam_date='$exam_date', exam_url='$exam_url' WHERE id='$id'";
        if ($conn->query($sql) === TRUE) {
            echo "Exam updated successfully";
        } else {
            echo "Error updating exam: " . $conn->error;
        }
    } elseif (isset($_POST['delete'])) {
        $id = $_POST['delete'];

        $sql = "DELETE FROM exam WHERE id='$id'";
        if ($conn->query($sql) === TRUE) {
            echo "Exam deleted successfully";
        } else {
            echo "Error deleting exam: " . $conn->error;
        }
    }
}

$conn->close();
header('Location: exam_select.php');
exit();

?>
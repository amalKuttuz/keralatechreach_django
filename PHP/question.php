<?php
include 'conn.php';
include 'head.php';

if (isset($_POST['deg']) && isset($_POST['sem']) && isset($_POST['qyear'])) {
    $deg = $_POST['deg'];
    $sem = $_POST['sem'];
    $qyear = $_POST['qyear'];

    $sql = "SELECT file FROM question WHERE deg = ? AND sem = ? AND qyear = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("sss", $deg, $sem, $qyear);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        $file = $row['file'];
        echo "<embed src='$file' width='100%' height='1000' type='application/pdf'>";
    } else {
        echo "<script>alert('No file found for the selected criteria.');</script>";
    }

    $stmt->close();
    $conn->close();
} else {
    echo "Please select degree, semester, and year.";
}
?>
<?php
// delete_entrance.php
session_start();
if (!isset($_SESSION['username'])) {
    header('Location: login.php');
    exit();
}
include('conn.php');

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['id'])) {
    $id = filter_input(INPUT_POST, 'id', FILTER_SANITIZE_NUMBER_INT);
    
    if (!empty($id)) {
        $deleteQuery = "DELETE FROM entrance_notifications WHERE id = ?";
        $stmt = $conn->prepare($deleteQuery);
        $stmt->bind_param("i", $id);
        
        if ($stmt->execute()) {
            echo "<script>
                    alert('Entrance notification deleted successfully');
                    window.location.href = 'view_entrance.php';
                </script>";
        } else {
            echo "<script>
                    alert('Error deleting entrance notification: " . $stmt->error . "');
                    window.location.href = 'view_entrance.php';
                </script>";
        }
        $stmt->close();
    } else {
        echo "<script>
                alert('Invalid ID!');
                window.location.href = 'view_entrance.php';
            </script>";
    }
} else {
    header('Location: view_entrance.php');
    exit();
}

$conn->close();
?>
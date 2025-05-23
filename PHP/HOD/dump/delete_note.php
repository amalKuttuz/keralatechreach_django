<?php
session_start();
if (!isset($_SESSION['username'])) {
    header('Location: login.php');
    exit();
}
include('conn.php');

if (isset($_POST['id'])) {
    $id = $_POST['id'];
    
    // First, get the file path to delete the actual file
    $query = "SELECT qtext FROM notes WHERE approved_id = '$id'";
    $result = mysqli_query($conn, $query);
    
    if ($result && mysqli_num_rows($result) > 0) {
        $row = mysqli_fetch_assoc($result);
        $filePath = $row['qtext'];
        
        // Delete the record from the database
        $deleteQuery = "DELETE FROM notes WHERE approved_id = '$id'";
        $deleteResult = mysqli_query($conn, $deleteQuery);
        
        if ($deleteResult) {
            // Try to delete the file if it exists
            if (!empty($filePath) && file_exists($filePath)) {
                @unlink($filePath);
            }
            
            // Redirect back with success message
            echo "<script>
                alert('Note deleted successfully');
                window.location.href = 'view_notes.php';
            </script>";
        } else {
            // Redirect back with error message
            echo "<script>
                alert('Error deleting note: " . mysqli_error($conn) . "');
                window.location.href = 'view_notes.php';
            </script>";
        }
    } else {
        // Redirect back with error message
        echo "<script>
            alert('Note not found');
            window.location.href = 'view_notes.php';
        </script>";
    }
} else {
    // Redirect back if no ID was provided
    header('Location: view_notes.php');
    exit();
}
?>
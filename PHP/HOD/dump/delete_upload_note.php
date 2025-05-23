<?php
session_start();
if (!isset($_SESSION['username'])) {
    header('Location: login.php');
    exit();
}

include('conn.php');

if (isset($_GET['id']) && is_numeric($_GET['id'])) {
    $note_id = $_GET['id'];
    
    // Get file path before deleting the record
    $query = "SELECT file FROM notes_upload WHERE id = '$note_id'";
    $result = mysqli_query($conn, $query);
    
    if ($row = mysqli_fetch_assoc($result)) {
        $file_path = $row['file'];
        
        // Delete the record from the database
        $delete_query = "DELETE FROM notes_upload WHERE id = '$note_id'";
        $delete_result = mysqli_query($conn, $delete_query);
        
        if ($delete_result) {
            // Try to delete the physical file (but continue even if this fails)
            if (file_exists($file_path)) {
                @unlink($file_path);
            }
            
            echo "<script>
                alert('Note deleted successfully');
                window.location.href = 'new_notes_upload.php';
            </script>";
        } else {
            echo "<script>
                alert('Error deleting note: " . mysqli_error($conn) . "');
                window.location.href = 'new_notes_upload.php';
            </script>";
        }
    } else {
        echo "<script>
            alert('Note not found');
            window.location.href = 'new_notes_upload.php';
        </script>";
    }
} else {
    echo "<script>
        alert('Invalid note ID');
        window.location.href = 'new_notes_upload.php';
    </script>";
}
?>
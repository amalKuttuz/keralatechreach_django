<?php
// delete_event.php

session_start();
if (!isset($_SESSION['username'])) {
    header('Location: login.php');
    exit();
}

include('conn.php');

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (!isset($_POST['id']) || !is_numeric($_POST['id'])) {
        $_SESSION['error_message'] = 'Invalid event ID';
        header('Location: view_event.php');
        exit();
    }
    
    $event_id = (int)$_POST['id'];
    
    if ($conn->connect_error) {
        $_SESSION['error_message'] = 'Connection failed: ' . $conn->connect_error;
        header('Location: view_event.php');
        exit();
    }
    
    // Prepare delete query
    $stmt = $conn->prepare("DELETE FROM events WHERE id = ?");
    $stmt->bind_param("i", $event_id);
    
    if ($stmt->execute()) {
        $_SESSION['success_message'] = 'Event deleted successfully';
    } else {
        $_SESSION['error_message'] = 'Error deleting event: ' . $stmt->error;
    }
    
    $stmt->close();
    $conn->close();
    
    header('Location: view_event.php');
    exit();
} else {
    $_SESSION['error_message'] = 'Invalid request method';
    header('Location: view_event.php');
    exit();
}
?>
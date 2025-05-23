<?php
// update_event.php

session_start();
if (!isset($_SESSION['username'])) {
    header('Location: login.php');
    exit();
}

include('conn.php');

// Return as JSON
header('Content-Type: application/json');

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (!isset($_POST['id']) || !is_numeric($_POST['id'])) {
        echo json_encode(['success' => false, 'message' => 'Invalid event ID']);
        exit();
    }
    
    $event_id = (int)$_POST['id'];
    
    // Validate and sanitize input
    $event_start = filter_input(INPUT_POST, 'event_start', FILTER_SANITIZE_STRING);
    $event_end = filter_input(INPUT_POST, 'event_end', FILTER_SANITIZE_STRING);
    $event_name = filter_input(INPUT_POST, 'name', FILTER_SANITIZE_STRING);
    $event_location = filter_input(INPUT_POST, 'place', FILTER_SANITIZE_STRING);
    $event_district = filter_input(INPUT_POST, 'district', FILTER_SANITIZE_STRING);
    
    // Validate required fields
    if (empty($event_start) || empty($event_end) || empty($event_name) || 
        empty($event_location) || empty($event_district)) {
        echo json_encode(['success' => false, 'message' => 'All fields are required']);
        exit();
    }
    
    // Validate dates
    if (!preg_match('/^\d{4}-\d{2}-\d{2}$/', $event_start) || !preg_match('/^\d{4}-\d{2}-\d{2}$/', $event_end)) {
        echo json_encode(['success' => false, 'message' => 'Invalid date format']);
        exit();
    }
    
    if ($conn->connect_error) {
        echo json_encode(['success' => false, 'message' => 'Connection failed: ' . $conn->connect_error]);
        exit();
    }
    
    // Prepare update query
    $stmt = $conn->prepare("UPDATE events SET event_start = ?, event_end = ?, name = ?, place = ?, district = ? WHERE id = ?");
    $stmt->bind_param("sssssi", $event_start, $event_end, $event_name, $event_location, $event_district, $event_id);
    
    if ($stmt->execute()) {
        echo json_encode(['success' => true, 'message' => 'Event updated successfully']);
    } else {
        echo json_encode(['success' => false, 'message' => 'Error updating event: ' . $stmt->error]);
    }
    
    $stmt->close();
    $conn->close();
} else {
    echo json_encode(['success' => false, 'message' => 'Invalid request method']);
}
?>
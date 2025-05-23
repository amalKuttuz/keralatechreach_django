<?php
// /m_events.php

include('../../conn.php');

$api_key = isset($_GET['api_key']) ? $_GET['api_key'] : '';
$valid_key = "7f2ff333-df7e-4f59-be36-f2d7f6ed230f"; // production, store this securely

if ($api_key !== $valid_key) {
    http_response_code(401);
    echo json_encode(['error' => 'Unauthorized access']);
    exit;
}

// Determine which action to perform
$action = isset($_GET['action']) ? $_GET['action'] : '';

// MAIN ROUTING LOGIC - SINGLE ENTRY POINT
try {
    if ($action == 'getAllEvents') {
        getAllEvents($conn);
    } elseif ($action == 'getUpdatedEvents') {
        $lastUpdate = isset($_GET['lastUpdate']) ? $_GET['lastUpdate'] : '2025-03-01 00:00:00';
        getUpdatedEvents($conn, $lastUpdate);
    } elseif ($action == 'getEventsByCategory') {
        $categoryId = isset($_GET['categoryId']) ? $_GET['categoryId'] : '';
        if (!empty($categoryId)) {
            getEventsByCategory($conn, $categoryId);
        } else {
            http_response_code(400);
            echo json_encode(['error' => 'Category ID is required']);
        }
    } else {
        // Invalid action
        http_response_code(400);
        echo json_encode(['error' => 'Invalid action specified']);
    }
} catch (Exception $e) {
    http_response_code(500);
    echo json_encode(['error' => 'Internal Server Error', 'message' => $e->getMessage()]);
    error_log($e->getMessage());
    exit;
}

function getAllEvents($conn) {
    try {
        // Prepare response object
        $response = array(
            "events" => array(),
            "categories" => array(),
            "districts" => array(),
            "notes" => array()
        );

        // Fetch Categories
        $categoryQuery = "SELECT category_id, category, created_at FROM event_category";
        $categoryResult = $conn->query($categoryQuery);
        if (!$categoryResult) {
            throw new Exception("Error in category query: " . $conn->error);
        }
        while ($category = $categoryResult->fetch_assoc()) {
            $response["categories"][] = array(
                "category_id" => $category['category_id'],
                "category_name" => $category['category'],
                "created_at" => $category['created_at']
            );
        }

        // Fetch Districts
        $districtQuery = "SELECT district_id, district, created_at FROM districts";
        $districtResult = $conn->query($districtQuery);
        if (!$districtResult) {
            throw new Exception("Error in district query: " . $conn->error);
        }
        while ($district = $districtResult->fetch_assoc()) {
            $response["districts"][] = array(
                "district_id" => $district['district_id'],
                "district_name" => $district['district'],
                "created_at" => $district['created_at']
            );
        }

        // Fetch Events with Sponsor Data
        $eventQuery = "SELECT e.*,
            c.category as category_name,
            d.district as district_name
            FROM events e
            LEFT JOIN event_category c ON e.category_id = c.category_id
            LEFT JOIN districts d ON e.district_id = d.district_id";
        $eventResult = $conn->query($eventQuery);
        if (!$eventResult) {
            throw new Exception("Error in event query: " . $conn->error);
        }
        while ($event = $eventResult->fetch_assoc()) {
            $response["events"][] = array(
                "id" => $event['id'],
                "category_id" => $event['category_id'],
                "district_id" => $event['district_id'],
                "event_start" => $event['event_start'],
                "event_end" => $event['event_end'],
                "name" => $event['name'],
                "place" => $event['place'],
                "link" => $event['link'],
                "map_link" => $event['map_link'],
                "created_at" => $event['created_at'],
                "description" => $event['description'],
                "category_name" => $event['category_name'],
                "district_name" => $event['district_name']
            );
        }

        // Fetch Notes
        $notesQuery = "SELECT * FROM notes";
        $notesResult = $conn->query($notesQuery);
        if (!$notesResult) {
            throw new Exception("Error in notes query: " . $conn->error);
        }
        while ($note = $notesResult->fetch_assoc()) {
            $response["notes"][] = array(
                "approved_id" => $note['approved_id'],
                "degree" => $note['degree'],
                "semester" => $note['semester'],
                "module" => $note['module'],
                "subject" => $note['subject'],
                "qtext" => $note['qtext'],
                "qyear" => $note['qyear'],
                "q_id" => $note['nu_id'],
                "university" => $note['university'],
                "updated_date" => $note['updated_date']
            );
        }

        // Send JSON response
        header('Content-Type: application/json');
        echo json_encode($response);
    } catch (Exception $e) {
        http_response_code(500);
        echo json_encode(['error' => 'Internal Server Error', 'message' => $e->getMessage()]);
        error_log($e->getMessage());
        exit;
    }
}

// Similar error handling should be added to getUpdatedEvents and getEventsByCategory functions

// Close the database connection
$conn->close();
?>
<?php
include("../conn.php");

// Set headers for JSON response
header('Content-Type: application/json');

// Get request method
$method = $_SERVER['REQUEST_METHOD'];

switch ($method) {
    case 'GET':
        // Fetch entrance notifications ordered by deadline (nearest first)
        $sql = "SELECT id, entrance_name, category, deadline_date, website_url, 
                DATEDIFF(deadline_date, CURDATE()) as days_left, 
                DATE_FORMAT(deadline_date, '%b') as month, 
                DAY(deadline_date) as day 
                FROM entrance_notifications 
                WHERE deadline_date >= CURDATE() 
                ORDER BY deadline_date ASC";
                
        $result = $conn->query($sql);
        
        if ($result) {
            $entrances = array();
            while ($row = $result->fetch_assoc()) {
                $entrances[] = $row;
            }
            echo json_encode(array("status" => "success", "data" => $entrances));
        } else {
            echo json_encode(array("status" => "error", "message" => "Failed to fetch entrance notifications"));
        }
        break;
        
    case 'POST':
        // Add new entrance notification
        $data = json_decode(file_get_contents('php://input'), true);
        
        // Simple admin validation - in a real app, use proper authentication
        $is_admin = false;
        if (isset($data['admin_key']) && $data['admin_key'] === "YOUR_ADMIN_KEY") {
            $is_admin = true;
        }
        
        if (!$is_admin) {
            echo json_encode(array("status" => "error", "message" => "Unauthorized action"));
            break;
        }
        
        if (isset($data['entrance_name']) && isset($data['deadline_date']) && isset($data['category'])) {
            $entrance_name = $conn->real_escape_string($data['entrance_name']);
            $category = $conn->real_escape_string($data['category']);
            $deadline_date = $conn->real_escape_string($data['deadline_date']);
            $website_url = isset($data['website_url']) ? $conn->real_escape_string($data['website_url']) : '';
            
            $sql = "INSERT INTO entrance_notifications (entrance_name, category, deadline_date, website_url) 
                    VALUES ('$entrance_name', '$category', '$deadline_date', '$website_url')";
            
            if ($conn->query($sql)) {
                echo json_encode(array("status" => "success", "message" => "Entrance notification added successfully"));
            } else {
                echo json_encode(array("status" => "error", "message" => "Failed to add entrance notification"));
            }
        } else {
            echo json_encode(array("status" => "error", "message" => "Missing required fields"));
        }
        break;
        
    case 'PUT':
        // Update existing entrance notification
        $data = json_decode(file_get_contents('php://input'), true);
        
        if (isset($data['id'])) {
            $id = $conn->real_escape_string($data['id']);
            
            // Simple admin validation - in a real app, use proper authentication
            $is_admin = false;
            if (isset($data['admin_key']) && $data['admin_key'] === "YOUR_ADMIN_KEY") {
                $is_admin = true;
            }
            
            if (!$is_admin) {
                echo json_encode(array("status" => "error", "message" => "Unauthorized action"));
                exit;
            }
            
            $updates = array();
            
            if (isset($data['entrance_name'])) {
                $entrance_name = $conn->real_escape_string($data['entrance_name']);
                $updates[] = "entrance_name = '$entrance_name'";
            }
            
            if (isset($data['category'])) {
                $category = $conn->real_escape_string($data['category']);
                $updates[] = "category = '$category'";
            }
            
            if (isset($data['deadline_date'])) {
                $deadline_date = $conn->real_escape_string($data['deadline_date']);
                $updates[] = "deadline_date = '$deadline_date'";
            }
            
            if (isset($data['website_url'])) {
                $website_url = $conn->real_escape_string($data['website_url']);
                $updates[] = "website_url = '$website_url'";
            }
            
            if (!empty($updates)) {
                $sql = "UPDATE entrance_notifications SET " . implode(", ", $updates) . " WHERE id = $id";
                
                if ($conn->query($sql)) {
                    echo json_encode(array("status" => "success", "message" => "Entrance notification updated successfully"));
                } else {
                    echo json_encode(array("status" => "error", "message" => "Failed to update entrance notification"));
                }
            } else {
                echo json_encode(array("status" => "error", "message" => "No fields to update"));
            }
        } else {
            echo json_encode(array("status" => "error", "message" => "Missing ID field"));
        }
        break;
        
    case 'DELETE':
        // Delete entrance notification
        $data = json_decode(file_get_contents('php://input'), true);
        
        // Simple admin validation - in a real app, use proper authentication
        $is_admin = false;
        if (isset($data['admin_key']) && $data['admin_key'] === "YOUR_ADMIN_KEY") {
            $is_admin = true;
        }
        
        if (!$is_admin) {
            echo json_encode(array("status" => "error", "message" => "Unauthorized action"));
            break;
        }
        
        if (isset($data['id'])) {
            $id = $conn->real_escape_string($data['id']);
            $sql = "DELETE FROM entrance_notifications WHERE id = $id";
            
            if ($conn->query($sql)) {
                echo json_encode(array("status" => "success", "message" => "Entrance notification deleted successfully"));
            } else {
                echo json_encode(array("status" => "error", "message" => "Failed to delete entrance notification"));
            }
        } else {
            echo json_encode(array("status" => "error", "message" => "Missing ID field"));
        }
        break;
        
    default:
        echo json_encode(array("status" => "error", "message" => "Invalid request method"));
        break;
}

$conn->close();
?>
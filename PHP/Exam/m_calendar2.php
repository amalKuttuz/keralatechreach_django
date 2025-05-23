<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST, OPTIONS');
header('Access-Control-Allow-Headers: Content-Type');
include '../conn.php';

$api_key = isset($_GET['api_key']) ? $_GET['api_key'] : '';
$valid_key = "7f2ff333-df7e-4f59-be36-f2d7f6ed230f"; // In production, store this securely

if ($api_key !== $valid_key) {
    http_response_code(401);
    echo json_encode(['error' => 'Unauthorized access']);
    exit;
}
class EventAPI {
    private $conn;

    public function __construct($conn) {
        $this->conn = $conn;
        if ($this->conn->connect_error) {
            $this->sendResponse(500, ['error' => 'Database connection failed: ' . $this->conn->connect_error]);
            exit;
        }
    }

    public function handleRequest() {
        // Separate action and potential extra parameters
        $rawAction = isset($_GET['action']) ? $_GET['action'] : 'getEventDates';
        $actionParts = explode('?', $rawAction);
        $action = strtolower($actionParts[0]);
        
        // If additional parameters were in the action, parse them
        if (isset($actionParts[1])) {
            parse_str($actionParts[1], $extraParams);
            $_GET = array_merge($_GET, $extraParams);
        }
        
        switch ($action) {
            case 'geteventdates':
                $this->getEventDates();
                break;
            case 'geteventsbyid':
                $this->getEventsById();
                break;
            case 'getcategories':
                $this->getCategories();
                break;
            case 'getdistricts':
                $this->getDistricts();
                break;
            case 'getfilteredevents':
                $this->getFilteredEvents();
                break;
            default:
                $this->sendResponse(400, [
                    'error' => 'Invalid action', 
                    'received_action' => $rawAction,
                    'parsed_action' => $action
                ]);
        }
    }

    public function getEventDates() {
        try {
            $query = "SELECT e.id, e.category_id, DATE(e.event_start) AS start_date, 
                    DATE(e.event_end) AS end_date, e.name, e.place, 
                    d.district_id, d.district, c.category 
                    FROM events e 
                    LEFT JOIN districts d ON e.district_id = d.district_id 
                    LEFT JOIN event_category c ON e.category_id = c.category_id 
                    ORDER BY e.event_start";
            
            $result = $this->conn->query($query);
            if (!$result) {
                throw new Exception("Query failed: " . $this->conn->error);
            }
            
            $eventDates = [];
            while ($row = $result->fetch_assoc()) {
                $eventDates[] = [
                    'id' => (int)$row['id'],
                    'category_id' => (int)$row['category_id'],
                    'event_start' => $row['start_date'],
                    'event_end' => $row['end_date'],
                    'name' => $row['name'],
                    'place' => $row['place'],
                    'district_id' => $row['district_id'] ? (int)$row['district_id'] : null,
                    'district' => $row['district'],
                    'category' => $row['category']
                ];
            }
            
            $this->sendResponse(200, ['eventDates' => $eventDates]);
        } catch (Exception $e) {
            $this->sendResponse(500, ['error' => $e->getMessage()]);
        }
    }

    public function getEventsById() {
        try {
            if (!isset($_GET['id'])) {
                throw new Exception('Please provide an id.');
            }
            
            $id = $this->conn->real_escape_string($_GET['id']);
            
            $sql = "SELECT e.id, e.category_id, e.event_start, e.event_end, 
                    e.name, e.link, e.place, e.description, e.map_link, 
                    d.district_id, d.district, 
                    c.category_id AS event_category_id, c.category 
                    FROM events e 
                    LEFT JOIN districts d ON e.district_id = d.district_id 
                    LEFT JOIN event_category c ON e.category_id = c.category_id 
                    WHERE e.id = '$id'";
            
            $result = $this->conn->query($sql);
            
            if (!$result) {
                throw new Exception('Query failed: ' . $this->conn->error);
            }
            
            $events = [];
            while ($row = $result->fetch_assoc()) {
                $events[] = [
                    'id' => (int)$row['id'],
                    'category_id' => (int)$row['category_id'],
                    'event_start' => $row['event_start'],
                    'event_end' => $row['event_end'],
                    'name' => $row['name'],
                    'link' => $row['link'],
                    'place' => $row['place'],
                    'description' => $row['description'],
                    'map_link' => $row['map_link'],
                    'district_id' => $row['district_id'] ? (int)$row['district_id'] : null,
                    'district' => $row['district'],
                    'category_id' => $row['event_category_id'] ? (int)$row['event_category_id'] : null,
                    'category' => $row['category']
                ];
            }
            
            $this->sendResponse(200, ['events' => $events]);
        } catch (Exception $e) {
            $this->sendResponse(500, ['error' => $e->getMessage()]);
        }
    }
    
    public function getCategories() {
        try {
            $query = "SELECT category_id, category FROM event_category ORDER BY category";
            $result = $this->conn->query($query);
            
            if (!$result) {
                throw new Exception("Query failed: " . $this->conn->error);
            }
            
            $categories = [];
            while ($row = $result->fetch_assoc()) {
                $categories[] = [
                    'id' => (int)$row['category_id'],
                    'category' => $row['category']
                ];
            }
            
            $this->sendResponse(200, ['categories' => $categories]);
        } catch (Exception $e) {
            $this->sendResponse(500, ['error' => $e->getMessage()]);
        }
    }
    
    public function getDistricts() {
        try {
            $query = "SELECT district_id, district FROM districts ORDER BY district";
            $result = $this->conn->query($query);
            
            if (!$result) {
                throw new Exception("Query failed: " . $this->conn->error);
            }
            
            $districts = [];
            while ($row = $result->fetch_assoc()) {
                $districts[] = [
                    'id' => (int)$row['district_id'],
                    'district' => $row['district']
                ];
            }
            
            $this->sendResponse(200, ['districts' => $districts]);
        } catch (Exception $e) {
            $this->sendResponse(500, ['error' => $e->getMessage()]);
        }
    }
    
 public function getFilteredEvents() {
    try {
        $categoryId = isset($_GET['category_id']) ? (int)$_GET['category_id'] : null;
        $districtId = isset($_GET['district_id']) ? (int)$_GET['district_id'] : null;
        $date = isset($_GET['date']) ? $this->conn->real_escape_string($_GET['date']) : null;
        
        // Debug logging
        error_log("Received Filters - Category: $categoryId, District: $districtId, Date: $date");
        
        $whereConditions = [];
        
        $sql = "SELECT e.id, e.category_id, DATE(e.event_start) AS start_date, 
                DATE(e.event_end) AS end_date, e.name, e.place, 
                d.district_id, d.district, c.category 
                FROM events e 
                LEFT JOIN districts d ON e.district_id = d.district_id 
                LEFT JOIN event_category c ON e.category_id = c.category_id";

                //Category filter
         if ($categoryId) {
            $whereConditions[] = "e.category_id = $categoryId";
        }
        
        // District filter
        if ($districtId) {
            $whereConditions[] = "e.district_id = $districtId";
            error_log("Added district filter: e.district_id = $districtId");
        }
        
        // Date filter with more explicit logging
        if ($date) {
            $whereConditions[] = "('$date' BETWEEN DATE(e.event_start) AND DATE(e.event_end))";
            error_log("Added date filter: '$date' BETWEEN DATE(e.event_start) AND DATE(e.event_end)");
        }
        
        // Add WHERE clause if there are any conditions
        if (!empty($whereConditions)) {
            $sql .= " WHERE " . implode(" AND ", $whereConditions);
            error_log("Final SQL Query: " . $sql);
        }
        
        $sql .= " ORDER BY e.event_start";
        
        $result = $this->conn->query($sql);
        
        if (!$result) {
            throw new Exception('Query failed: ' . $this->conn->error);
        }
        
        $eventDates = [];
        while ($row = $result->fetch_assoc()) {
            // Log each row for debugging
            error_log("Row Debug: " . json_encode($row));
            
            $eventDates[] = [
                'id' => (int)$row['id'],
                'category_id' => (int)$row['category_id'],
                'event_start' => $row['start_date'],
                'event_end' => $row['end_date'],
                'name' => $row['name'],
                'place' => $row['place'],
                'district_id' => $row['district_id'] ? (int)$row['district_id'] : null,
                'district' => $row['district'],
                'category' => $row['category']
            ];
        }
        
        error_log("Total filtered events: " . count($eventDates));
        
        $this->sendResponse(200, ['eventDates' => $eventDates]);
    } catch (Exception $e) {
        error_log("Exception in getFilteredEvents: " . $e->getMessage());
        $this->sendResponse(500, ['error' => $e->getMessage()]);
    }
}

    private function sendResponse($status, $data) {
        http_response_code($status);
        echo json_encode($data);
    }
}

$api = new EventAPI($conn);
$api->handleRequest();
?>
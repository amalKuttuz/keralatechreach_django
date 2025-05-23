<?php
header("Content-Type: application/json");
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST, GET");
header("Access-Control-Allow-Headers: Content-Type, Authorization");

include('../../conn.php');

// Verify API key
$api_key = isset($_GET['api_key']) ? $_GET['api_key'] : '';
$headers = getallheaders();
$auth_header = isset($headers['Authorization']) ? $headers['Authorization'] : '';

if (empty($api_key) && !empty($auth_header)) {
    // Extract API key from Authorization header if present
    $auth_parts = explode(' ', $auth_header);
    if (count($auth_parts) == 2 && strtolower($auth_parts[0]) == 'bearer') {
        $api_key = $auth_parts[1];
    }
}

$valid_key = "7f2ff333-df7e-4f59-be36-f2d7f6ed230f"; // In production, store securely

if ($api_key !== $valid_key) {
    http_response_code(401);
    echo json_encode(['error' => 'Unauthorized access']);
    exit;
}

// Handle different request methods
$method = $_SERVER['REQUEST_METHOD'];

if ($method === 'POST') {
    // For submitting analytics data
    $json_data = file_get_contents("php://input");
    $data = json_decode($json_data, true);
    
    if (!$data) {
        http_response_code(400);
        echo json_encode(['error' => 'Invalid JSON data']);
        exit;
    }
    
    $response = handleAnalyticsSubmission($conn, $data);
    echo json_encode($response);
} 
else if ($method === 'GET') {
    // For retrieving analytics reports
    // $action = isset($_GET['action']) ? $_GET['action'] : '';
    
    // switch ($action) {
    //     case 'eventReport':
    //         if (!isset($_GET['event_id'])) {
    //             http_response_code(400);
    //             echo json_encode(['error' => 'Missing event_id parameter']);
    //             exit;
    //         }
    //         $event_id = $conn->real_escape_string($_GET['event_id']);
    //         $report = getEventReport($conn, $event_id);
    //         echo json_encode($report);
    //         break;
            
    //     case 'sponsorReport':
    //         if (!isset($_GET['sponsor_id'])) {
    //             http_response_code(400);
    //             echo json_encode(['error' => 'Missing sponsor_id parameter']);
    //             exit;
    //         }
    //         $sponsor_id = $conn->real_escape_string($_GET['sponsor_id']);
    //         $report = getSponsorReport($conn, $sponsor_id);
    //         echo json_encode($report);
    //         break;
            
    //     case 'overallStats':
    //         $stats = getOverallStats($conn);
    //         echo json_encode($stats);
    //         break;
            
    //     default:
    //         http_response_code(400);
    //         echo json_encode(['error' => 'Invalid action parameter']);
    //         break;
    // }
}
else {
    http_response_code(405); 
    echo json_encode(['error' => 'Method not allowed']);
}

// Function to handle submission of analytics data
function handleAnalyticsSubmission($conn, $data) {
    // Validate required fields
    if (!isset($data['install_id']) || !isset($data['events'])) {
        return ['success' => false, 'error' => 'Missing required fields'];
    }
    
    $user_id = $conn->real_escape_string($data['install_id']);
    $events = $data['events'];
    $success_count = 0;
    $error_count = 0;
    
    // Begin transaction for better performance and consistency
    $conn->begin_transaction();
    
    try {
        foreach ($events as $event) {
            if (!isset($event['event_id']) || !isset($event['event_type'])) {
                $error_count++;
                continue; // Skip this event
            }
            
            $event_id = $conn->real_escape_string($event['event_id']);
            $event_type = $conn->real_escape_string($event['event_type']);
            $timestamp = isset($event['timestamp']) ? $conn->real_escape_string($event['timestamp']) : date('Y-m-d H:i:s');
            
            if ($event_type === 'impression') {
                // Store impression
                $source = isset($event['source']) ? $conn->real_escape_string($event['source']) : 'unknown';
                
                $stmt = $conn->prepare("INSERT INTO event_impressions (event_id, user_id, timestamp, source) VALUES (?, ?, ?, ?)");
                $stmt->bind_param("isss", $event_id, $user_id, $timestamp, $source);
                
                if ($stmt->execute()) {
                    $success_count++;
                } else {
                    $error_count++;
                }
                $stmt->close();
            } 
            else {
                // Store interaction
                $stmt = $conn->prepare("INSERT INTO event_interactions (event_id, user_id, interaction_type, timestamp) VALUES (?, ?, ?, ?)");
                $stmt->bind_param("isss", $event_id, $user_id, $event_type, $timestamp);
                
                if ($stmt->execute()) {
                    $success_count++;
                } else {
                    $error_count++;
                }
                $stmt->close();
            }
        }
        
        // Commit the transaction
        $conn->commit();
        
        return [
            'success' => true,
            'processed' => count($events),
            'successful' => $success_count,
            'failed' => $error_count
        ];
    } 
    catch (Exception $e) {
        // Rollback on failure
        $conn->rollback();
        return ['success' => false, 'error' => $e->getMessage()];
    }
}

// Function to get event analytics report
// function getEventReport($conn, $event_id) {
//     // Get basic event info
//     $event_info_query = "SELECT e.id, e.name, e.description, e.event_start, e.event_end, 
//                          e.is_sponsored, e.sponsor_name, e.sponsor_level
//                          FROM events e WHERE e.id = ?";
    
//     $stmt = $conn->prepare($event_info_query);
//     $stmt->bind_param("i", $event_id);
//     $stmt->execute();
//     $result = $stmt->get_result();
    
//     if ($result->num_rows === 0) {
//         return ['error' => 'Event not found'];
//     }
    
//     $event_info = $result->fetch_assoc();
//     $stmt->close();
    
//     // Get impression stats
//     $impression_query = "SELECT COUNT(*) as total_impressions, 
//                          COUNT(DISTINCT user_id) as unique_impressions,
//                          source, 
//                          DATE(timestamp) as date
//                          FROM event_impressions 
//                          WHERE event_id = ? 
//                          GROUP BY source, DATE(timestamp)
//                          ORDER BY date ASC";
    
//     $stmt = $conn->prepare($impression_query);
//     $stmt->bind_param("i", $event_id);
//     $stmt->execute();
//     $impressions = $stmt->get_result()->fetch_all(MYSQLI_ASSOC);
//     $stmt->close();
    
//     // Get interaction stats
//     $interaction_query = "SELECT COUNT(*) as total_interactions,
//                           COUNT(DISTINCT user_id) as unique_interactions,
//                           interaction_type,
//                           DATE(timestamp) as date
//                           FROM event_interactions
//                           WHERE event_id = ?
//                           GROUP BY interaction_type, DATE(timestamp)
//                           ORDER BY date ASC";
    
//     $stmt = $conn->prepare($interaction_query);
//     $stmt->bind_param("i", $event_id);
//     $stmt->execute();
//     $interactions = $stmt->get_result()->fetch_all(MYSQLI_ASSOC);
//     $stmt->close();
    
//     // Combine all data
//     return [
//         'event' => $event_info,
//         'impressions' => $impressions,
//         'interactions' => $interactions,
//         'summary' => [
//             'total_impressions' => array_sum(array_column($impressions, 'total_impressions')),
//             'unique_impressions' => count(array_unique(array_column($impressions, 'user_id'))),
//             'total_interactions' => array_sum(array_column($interactions, 'total_interactions')),
//             'unique_interactions' => count(array_unique(array_column($interactions, 'user_id')))
//         ]
//     ];
// }

// Function to get sponsor report
// function getSponsorReport($conn, $sponsor_id) {
//     // Find all events for this sponsor
//     $events_query = "SELECT id, name FROM events 
//                     WHERE is_sponsored = 1 AND sponsor_id = ?
//                     ORDER BY event_start DESC";
    
//     $stmt = $conn->prepare($events_query);
//     $stmt->bind_param("i", $sponsor_id);
//     $stmt->execute();
//     $events = $stmt->get_result()->fetch_all(MYSQLI_ASSOC);
//     $stmt->close();
    
//     if (count($events) === 0) {
//         return ['error' => 'No sponsored events found for this sponsor'];
//     }
    
//     $event_ids = array_column($events, 'id');
//     $event_id_list = implode(',', $event_ids);
    
//     // Get aggregated impressions for all events
//     $impressions_query = "SELECT e.id as event_id, e.name as event_name, 
//                          COUNT(*) as impressions, 
//                          COUNT(DISTINCT i.user_id) as unique_visitors
//                          FROM events e
//                          JOIN event_impressions i ON e.id = i.event_id
//                          WHERE e.id IN ($event_id_list)
//                          GROUP BY e.id";
    
//     $result = $conn->query($impressions_query);
//     $impression_stats = $result->fetch_all(MYSQLI_ASSOC);
    
//     // Get interaction rates
//     $interactions_query = "SELECT e.id as event_id, 
//                           i.interaction_type,
//                           COUNT(*) as count
//                           FROM events e
//                           JOIN event_interactions i ON e.id = i.event_id
//                           WHERE e.id IN ($event_id_list)
//                           GROUP BY e.id, i.interaction_type";
    
//     $result = $conn->query($interactions_query);
//     $interaction_stats = $result->fetch_all(MYSQLI_ASSOC);
    
//     // Process interaction stats by event
//     $processed_interactions = [];
//     foreach ($interaction_stats as $stat) {
//         $event_id = $stat['event_id'];
//         if (!isset($processed_interactions[$event_id])) {
//             $processed_interactions[$event_id] = [];
//         }
//         $processed_interactions[$event_id][$stat['interaction_type']] = $stat['count'];
//     }
    
//     // Combine stats for final report
//     $event_reports = [];
//     foreach ($impression_stats as $stat) {
//         $event_id = $stat['event_id'];
//         $report = [
//             'event_id' => $event_id,
//             'event_name' => $stat['event_name'],
//             'impressions' => $stat['impressions'],
//             'unique_visitors' => $stat['unique_visitors'],
//             'interactions' => isset($processed_interactions[$event_id]) ? $processed_interactions[$event_id] : []
//         ];
        
//         // Calculate engagement rate
//         $total_interactions = 0;
//         if (isset($processed_interactions[$event_id])) {
//             foreach ($processed_interactions[$event_id] as $count) {
//                 $total_interactions += $count;
//             }
//         }
        
//         $report['total_interactions'] = $total_interactions;
//         $report['engagement_rate'] = $stat['impressions'] > 0 ? $total_interactions / $stat['impressions'] : 0;
        
//         $event_reports[] = $report;
//     }
    
//     // Get sponsor info
//     $sponsor_query = "SELECT * FROM sponsors WHERE id = ?";
//     $stmt = $conn->prepare($sponsor_query);
//     $stmt->bind_param("i", $sponsor_id);
//     $stmt->execute();
//     $sponsor = $stmt->get_result()->fetch_assoc();
//     $stmt->close();
    
//     return [
//         'sponsor' => $sponsor,
//         'events' => $event_reports,
//         'summary' => [
//             'total_events' => count($events),
//             'total_impressions' => array_sum(array_column($impression_stats, 'impressions')),
//             'total_unique_visitors' => array_sum(array_column($impression_stats, 'unique_visitors')),
//             'avg_engagement_rate' => array_sum(array_column($event_reports, 'engagement_rate')) / count($event_reports)
//         ]
//     ];
// }

// Function to get overall stats
// function getOverallStats($conn) {
//     // Get overall event stats
//     $event_stats_query = "SELECT 
//                          COUNT(*) as total_events,
//                          COUNT(CASE WHEN is_sponsored = 1 THEN 1 END) as sponsored_events,
//                          COUNT(CASE WHEN event_end >= CURDATE() THEN 1 END) as upcoming_events,
//                          COUNT(CASE WHEN is_sponsored = 1 AND event_end >= CURDATE() THEN 1 END) as upcoming_sponsored
//                          FROM events";
    
//     $result = $conn->query($event_stats_query);
//     $event_stats = $result->fetch_assoc();
    
//     // Get impression stats
//     $impression_query = "SELECT 
//                         COUNT(*) as total_impressions,
//                         COUNT(DISTINCT user_id) as unique_users,
//                         COUNT(DISTINCT event_id) as events_with_impressions
//                         FROM event_impressions";
    
//     $result = $conn->query($impression_query);
//     $impression_stats = $result->fetch_assoc();
    
//     // Get interaction stats
//     $interaction_query = "SELECT 
//                          interaction_type,
//                          COUNT(*) as count,
//                          COUNT(DISTINCT user_id) as unique_users,
//                          COUNT(DISTINCT event_id) as events_with_interaction
//                          FROM event_interactions
//                          GROUP BY interaction_type";
    
//     $result = $conn->query($interaction_query);
//     $interaction_stats = $result->fetch_all(MYSQLI_ASSOC);
    
//     // Calculate engagement rate
//     $engagement_rate = 0;
//     if ($impression_stats['total_impressions'] > 0) {
//         $total_interactions = array_sum(array_column($interaction_stats, 'count'));
//         $engagement_rate = $total_interactions / $impression_stats['total_impressions'];
//     }
    
//     return [
//         'event_stats' => $event_stats,
//         'impression_stats' => $impression_stats,
//         'interaction_stats' => $interaction_stats,
//         'engagement_rate' => $engagement_rate,
//         'timestamp' => date('Y-m-d H:i:s')
//     ];
// }

$conn->close();
?>
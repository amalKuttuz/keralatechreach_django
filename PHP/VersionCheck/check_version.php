<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');

require_once('../conn.php');

// Check if the request method is GET
if ($_SERVER['REQUEST_METHOD'] === 'GET') {
    // Fetch the latest version information
    $sql = "SELECT 
                version_code, 
                version_name, 
                update_url, 
                update_message,
                is_mandatory
            FROM app_versions 
            WHERE is_active = 1 
            ORDER BY version_code DESC 
            LIMIT 1";

    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        // Fetch the latest version details
        $row = $result->fetch_assoc();
        
        // Prepare response
        $response = [
            'error' => false,
            'version_code' => intval($row['version_code']),
            'version_name' => $row['version_name'],
            'update_url' => $row['update_url'],
            'update_message' => $row['update_message'],
            'is_mandatory' => boolval($row['is_mandatory'])
        ];
        
        // Return JSON response
        echo json_encode($response);
    } else {
        // No version found
        http_response_code(404);
        echo json_encode([
            'error' => true,
            'message' => 'No version information available'
        ]);
    }

    $conn->close();
} else {
    // Invalid request method
    http_response_code(405);
    echo json_encode([
        'error' => true,
        'message' => 'Invalid request method'
    ]);
}
?>
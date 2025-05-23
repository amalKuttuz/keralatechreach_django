<?php
header("Content-Type: application/json");
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET");
header("Access-Control-Allow-Headers: Content-Type");

include('../../conn.php');
$api_key = isset($_GET['api_key']) ? $_GET['api_key'] : '';
$valid_key = "7f2ff333-df7e-4f59-be36-f2d7f6ed230f"; // In production, store this securely

if ($api_key !== $valid_key) {
    http_response_code(401);
    echo json_encode(['error' => 'Unauthorized access']);
    exit;
}

// Check if university is requested
$queryType = isset($_GET['type']) ? $_GET['type'] : 'all';


if ($queryType === 'university') {
    // Fetch all universities with ID
    $sql = "SELECT DISTINCT university_name, id FROM university ORDER BY university_name";
    $result = $conn->query($sql);

    $universities = [];
    if ($result->num_rows > 0) {
        while($row = $result->fetch_assoc()) {
            $universities[] = [
                'id' => $row['id'],
                'name' => $row['university_name']
            ];
        }
    } 
    echo json_encode($universities);
} else if ($queryType === 'degree' && isset($_GET['university_id'])) {
    // Fetch degrees for a specific university using ID
    $universityId = $conn->real_escape_string($_GET['university_id']);
    $sql = "SELECT DISTINCT d.degree_name 
            FROM degree d
            WHERE d.university_id = '$universityId'
            ORDER BY d.degree_name";
    $result = $conn->query($sql);

    $degrees = [];
    if ($result->num_rows > 0) {
        while($row = $result->fetch_assoc()) {
            $degrees[] = $row['degree_name'];
        }
    }

    echo json_encode($degrees);
} else {
    // Fetch all degrees (default behavior for backward compatibility)
    $sql = "SELECT DISTINCT degree_name FROM degree ORDER BY degree_name";
    $result = $conn->query($sql);

    $degrees = [];
    if ($result->num_rows > 0) {
        while($row = $result->fetch_assoc()) {
            $degrees[] = $row['degree_name'];
        }
    }

    echo json_encode($degrees);
}

$conn->close();
?>
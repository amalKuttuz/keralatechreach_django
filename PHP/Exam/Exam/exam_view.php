<?php
header("Content-Type: application/json");
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET");
header("Access-Control-Allow-Headers: Content-Type");

include('../conn.php');

$api_key = isset($_GET['api_key']) ? $_GET['api_key'] : '';
$valid_key = "7f2ff333-df7e-4f59-be36-f2d7f6ed230f"; // In production, store this securely

if ($api_key !== $valid_key) {
    http_response_code(401);
    echo json_encode(['error' => 'Unauthorized access']);
    exit;
}

// Check if required parameters are set
if (!isset($_GET['university']) || !isset($_GET['degree']) || !isset($_GET['semester']) || !isset($_GET['admission_year'])) {
    echo json_encode(["error" => "Missing required parameters"]);
    exit();
}

// Sanitize input to prevent SQL injection
$university = $conn->real_escape_string($_GET['university']);
$degree = $conn->real_escape_string($_GET['degree']);
$semester = $conn->real_escape_string($_GET['semester']);
$admission_year = $conn->real_escape_string($_GET['admission_year']);

// Prepare SQL query with university filter
$sql = "SELECT e.* FROM exam e
        JOIN university u ON e.university_id = u.id
        WHERE u.university_name = '$university'
        AND e.degree_name = '$degree' 
        AND e.semester = '$semester' 
        AND e.admission_year = '$admission_year'";

$result = $conn->query($sql);

$exams = [];
if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        // Prepare each exam as an associative array
        $exam = [
            'id' => $row['id'],
            'exam_name' => $row['exam_name'],
            'exam_date' => $row['exam_date'],
            'exam_url' => $row['exam_url'],
            'degree_name' => $row['degree_name'],
            'semester' => $row['semester'],
            'admission_year' => $row['admission_year'],
            'university_id' => $row['university_id']
        ];
        $exams[] = $exam;
    }
}

// Return JSON response
echo json_encode($exams);

$conn->close();
?>
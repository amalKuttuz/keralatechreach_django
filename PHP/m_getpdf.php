<?php

include('conn.php'); 
$api_key = isset($_GET['api_key']) ? $_GET['api_key'] : '';
$valid_key = "7f2ff333-df7e-4f59-be36-f2d7f6ed230f"; // In production, store this securely

if ($api_key !== $valid_key) {
    http_response_code(401);
    echo json_encode(['error' => 'Unauthorized access']);
    exit;
}

if ($_SERVER['REQUEST_METHOD'] == 'GET') {
    $degree = $_GET['degree'];
    $semester = $_GET['semester'];
    $university_id=$_GET['university_id'];

    // Sanitize the inputs
    $degree = mysqli_real_escape_string($conn, $degree);
    $semester = mysqli_real_escape_string($conn, $semester);

    // Query to fetch available years (qyear) for the given degree and semester
    $query = "SELECT DISTINCT  qyear, qtext, subj FROM approved WHERE deg='$degree' AND sem='$semester' AND university=$university_id ORDER BY qyear";
    $result = mysqli_query($conn, $query);

    if ($result) {
        // Fetch the results into an array
        $pdfs = [];
        while ($row = mysqli_fetch_assoc($result)) {
            $pdfs[] = [
                // 'id' => $row['approved_id'],
                'qyear' => $row['qyear'],
                'subj' => $row['subj'],
                'qtext' => $row['qtext']
            ];
        }

        // Return data as JSON
        header('Content-Type: application/json');
        if (empty($pdfs)) {
            echo json_encode(["error" => "No records found for the given degree and semester"]);
        } else {
            echo json_encode($pdfs);
        }
    } else {
        echo json_encode(["error" => "Database query failed"]);
    }
} else {
    echo json_encode(["error" => "Invalid request method"]);
}

?>

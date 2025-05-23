<?php
header('Content-Type: application/json');
include '../../conn.php';

// Initialize response array
$response = ["success" => false, "message" => "Unknown error occurred"];

// Check request method
if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    $response["message"] = "Invalid request method.";
    echo json_encode($response);
    exit;
}

// Validate required fields
$deg = $_POST['degree'] ?? '';
$subj = $_POST['subj'] ?? '';
$sem = $_POST['sem'] ?? '';
$qyear = $_POST['qyear'] ?? '';
$university = $_POST['university'] ?? ''; // Added university field

if (empty($deg) || empty($sem) || empty($qyear) || empty($university)) {
    $response["message"] = "Required fields are missing.";
    echo json_encode($response);
    exit;
}

// Sanitize inputs to prevent SQL injection
$deg = mysqli_real_escape_string($conn, $deg);
$subj = mysqli_real_escape_string($conn, $subj);
$sem = mysqli_real_escape_string($conn, $sem);
$qyear = mysqli_real_escape_string($conn, $qyear);
$university = mysqli_real_escape_string($conn, $university);

// Check if file was uploaded properly
if (!isset($_FILES['file']) || $_FILES['file']['error'] !== 0) {
    $response["message"] = "No file uploaded or an error occurred.";
    echo json_encode($response);
    exit;
}

// Process file upload
$file = $_FILES['file'];
$filename = $file['name'];
$filepath = $file['tmp_name'];
$filesize = $file['size'];

// Basic file validation
$allowed_extensions = ['pdf'];
$file_extension = strtolower(pathinfo($filename, PATHINFO_EXTENSION));

if (!in_array($file_extension, $allowed_extensions)) {
    $response["message"] = "Only PDF files are allowed.";
    echo json_encode($response);
    exit;
}

// Limit file size (10MB)
if ($filesize > 30000000) {
    $response["message"] = "File size exceeds limit (10MB).";
    echo json_encode($response);
    exit;
}

// Create a unique filename
$new_filename = uniqid('paper_') . '_' . date('Ymd') . '.' . $file_extension;
$upload_dir = '../upload/';
$destfile = $upload_dir . $new_filename;

// Ensure the upload directory exists
if (!is_dir($upload_dir)) {
    if (!mkdir($upload_dir, 0755, true)) {
        $response["message"] = "Failed to create upload directory.";
        echo json_encode($response);
        exit;
    }
}

// Move the uploaded file
if (!move_uploaded_file($filepath, $destfile)) {
    $response["message"] = "Failed to move uploaded file.";
    echo json_encode($response);
    exit;
}

// Insert into database
$timestamp = date('Y-m-d H:i:s');
$insertquery = "INSERT INTO question (deg, subj, sem, qyear, university, file, upload_date) 
                VALUES ('$deg', '$subj', '$sem', '$qyear', '$university', '$destfile', '$timestamp')";

try {
    if (mysqli_query($conn, $insertquery)) {
        $response = [
            "success" => true,
            "message" => "File uploaded successfully",
            "file_id" => mysqli_insert_id($conn),
            "filename" => $new_filename
        ];
    } else {
        $response["message"] = "Database insertion failed: " . mysqli_error($conn);
        // Delete file if database insertion fails
        @unlink($destfile);
    }
} catch (Exception $e) {
    $response["message"] = "Error: " . $e->getMessage();
    // Delete file if exception occurs
    @unlink($destfile);
}

// Return response
echo json_encode($response);
?>
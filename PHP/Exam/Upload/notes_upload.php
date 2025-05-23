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
$title = $_POST['title'] ?? '';
$module = $_POST['module'] ?? '';
$degree = $_POST['degree'] ?? '';
$semester = $_POST['semester'] ?? '';
$university = $_POST['university'] ?? '';
$year = $_POST['year'] ?? '';

if (empty($title) || empty($module) || empty($degree) || empty($semester) || 
    empty($university) || empty($year)) {
    $response["message"] = "Required fields are missing.";
    echo json_encode($response);
    exit;
}

// Sanitize inputs
$title = mysqli_real_escape_string($conn, $title);
$module = mysqli_real_escape_string($conn, $module);
$degree = mysqli_real_escape_string($conn, $degree);
$semester = mysqli_real_escape_string($conn, $semester);
$university = mysqli_real_escape_string($conn, $university);
$year = mysqli_real_escape_string($conn, $year);

// Check file upload
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

// Validate file type
$allowed_extensions = ['pdf'];
$file_extension = strtolower(pathinfo($filename, PATHINFO_EXTENSION));

if (!in_array($file_extension, $allowed_extensions)) {
    $response["message"] = "Only PDF files are allowed.";
    echo json_encode($response);
    exit;
}

// Check file size (10MB limit)
if ($filesize > 10000000) {
    $response["message"] = "File size exceeds limit (10MB).";
    echo json_encode($response);
    exit;
}

// Create unique filename
$new_filename = uniqid('note_') . '_' . date('Ymd') . '.' . $file_extension;
$upload_dir = '../upload/notes/';
$destfile = $upload_dir . $new_filename;

// Create upload directory if it doesn't exist
if (!is_dir($upload_dir)) {
    if (!mkdir($upload_dir, 0755, true)) {
        $response["message"] = "Failed to create upload directory.";
        echo json_encode($response);
        exit;
    }
}

// Move uploaded file
if (!move_uploaded_file($filepath, $destfile)) {
    $response["message"] = "Failed to move uploaded file.";
    echo json_encode($response);
    exit;
}

// Insert into database
$timestamp = date('Y-m-d H:i:s');
$insertquery = "INSERT INTO notes_upload (
                    title, 
                    module, 
                    degree, 
                    semester, 
                    university, 
                    year, 
                    file, 
                    upload_date
                ) VALUES (
                    '$title',
                    '$module', 
                    '$degree', 
                    '$semester', 
                    '$university', 
                    '$year', 
                    '$destfile', 
                    '$timestamp'
                )";

try {
    if (mysqli_query($conn, $insertquery)) {
        $response = [
            "success" => true,
            "message" => "Note uploaded successfully",
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
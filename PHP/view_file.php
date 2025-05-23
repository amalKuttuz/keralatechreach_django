<?php
include('head.php');
include('conn.php');

if (isset($_GET['add'])) {
    $id = $_GET['add'];

    // Sanitize the input
    $id = mysqli_real_escape_string($conn, $id);

    // Query to fetch the file path based on the id
    $query = "SELECT qtext FROM approved WHERE approved_id='$id'";
    $result = mysqli_query($conn, $query);

    if ($result && mysqli_num_rows($result) > 0) {
        $row = mysqli_fetch_assoc($result);
        $file = "HOD/".$row['qtext'];

        // Ensure the file exists
        if (file_exists($file)) {
            // Get the full URL of the file
            $fileUrl = 'http://' . $_SERVER['HTTP_HOST'] . '/' . $file;

            // Use Microsoft Office Online Viewer to display the document
            echo '<iframe src="https://view.officeapps.live.com/op/embed.aspx?src=' . urlencode($fileUrl) . '" width="800" height="600"></iframe>'; 

        } else {
            echo "File not found.";
        }
    } else {
        echo "No record found for the given ID.";
    }
} else {
    echo "No ID specified.";
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>View File</title>
</head>
<body>
	
</body>
</html>
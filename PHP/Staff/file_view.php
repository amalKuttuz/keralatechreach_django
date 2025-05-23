<?php
session_start();
if (!isset($_SESSION['username'])) {
    header('Location: login.php');
    exit();
}
include('head.php');
include('conn.php');

if (isset($_GET['file'])) {
    $file = $_GET['file'];

    // Ensure the file exists
    if (file_exists($file)) {
        // Read the file contents
        $contents = file_get_contents($file);
    } else {
        $contents = "File not found.";
    }
} else {
    $contents = "No file specified.";
}
?>

<section id="main-content">
    <section class="wrapper">
        <div class="row">
            <div class="col-md-12 mt">
    <pre><?php echo htmlspecialchars($contents); ?></pre>
</div>
</div>
</section>
</section>
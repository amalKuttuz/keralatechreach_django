<!-- filepath: e:\KSTUDENTS\backups\april 23\Staff\main.php -->
<?php

session_start();
if (!isset($_SESSION['username'])) {
    header('Location: login.php');
    exit();
}
include('conn.php');
include('head.php');

?>

    <!-- Main Content -->
    <main class="main-content">
        <button class="btn btn-primary mb-3" id="open-sidebar">☰</button>
        <h1>Welcome to the Dashboard</h1>
        <p>This is a mobile-friendly template with a closable sidebar.</p>
        <p>Click the hamburger menu to toggle the sidebar.</p>
    </main>
</div>

<?php include 'footer.php'; ?>
<?php
session_start();
if (!isset($_SESSION['username'])) {
    header('Location: login.php');
    exit();
}
include('conn.php');
include('head.php');

$message = '';
$success = false;

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $university_name = filter_input(INPUT_POST, 'university_name', FILTER_SANITIZE_STRING);

    if (!empty($university_name)) {
        $stmt = $conn->prepare("INSERT INTO university (university_name) VALUES (?)");
        $stmt->bind_param("s", $university_name);

        if ($stmt->execute()) {
            $message = "University added successfully!";
            $success = true;
        } else {
            $message = "Error adding university: " . $stmt->error;
        }
        $stmt->close();
    } else {
        $message = "University name is required!";
    }
    $conn->close();
}
?>

<section id="main-content">
    <section class="wrapper">
        <div class="row">
            <div class="col-md-12 mt">
                <div class="content-panel">
                    <h1>Add University</h1>

                    <?php if ($message): ?>
                        <div class="message <?php echo $success ? 'success' : 'error'; ?>">
                            <?php echo htmlspecialchars($message); ?>
                        </div>
                    <?php endif; ?>

                    <form method="POST" action="">
                        <div class="form-group">
                            <label for="university_name">University Name:</label>
                            <input type="text" id="university_name" name="university_name" required>
                        </div>

                        <button type="submit">Add University</button>
                    </form>
                </div>
            </div>
        </div>
    </section>
</section>

<?php
include('footer.php');
?>
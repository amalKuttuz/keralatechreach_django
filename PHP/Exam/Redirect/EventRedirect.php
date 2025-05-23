<?php
// Get the query parameters
$event_name = isset($_GET['event_name']) ? $_GET['event_name'] : '';
$event_id = isset($_GET['event_id']) ? $_GET['event_id'] : '';

// Package name for the app
$package_name = 'com.keralatechreach.kstudents';

// Generate the app link
$app_link = "intent://www.keralatechreach.in/Exam/Redirect/EventRedirect.php?event_name=" . urlencode($event_name) . 
            "&event_id=" . urlencode($event_id) . 
            "#Intent;scheme=https;package=" . $package_name . 
            ";component=" . $package_name . "/com.keralatechreach.kstudents.Events.EventDetail2Activity;end";

// Fallback web URL
$web_url = "https://www.keralatechreach.in/Exam/Redirect/EventRedirect.php?event_name=" . urlencode($event_name) . 
           "&event_id=" . urlencode($event_id);

// Play Store URL
$play_store_url = "https://play.google.com/store/apps/details?id=" . $package_name;
?>

<!DOCTYPE html>
<html>
<head>
    <title>KStudents Event Details</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            padding: 20px;
        }
        .container {
            max-width: 600px;
            margin: 0 auto;
        }
        .button {
            display: inline-block;
            background-color: #4CAF50;
            color: white;
            padding: 12px 24px;
            text-align: center;
            text-decoration: none;
            font-size: 16px;
            margin: 10px 0;
            border-radius: 4px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>KStudents Event Details</h1>
        <p>View details for the event: <?php echo htmlspecialchars($event_name); ?></p>
        
        <a href="<?php echo $app_link; ?>" class="button">Open in App</a>
        <p>Don't have the app yet?</p>
        <a href="<?php echo $play_store_url; ?>" class="button">Download from Play Store</a>
    </div>
    
    <script>
    // Check if device is Android
    var isAndroid = /Android/i.test(navigator.userAgent);
    
    // Automatically try to open the app after a short delay
    setTimeout(function() {
        if (isAndroid) {
            // For Android, use intent URL
            window.location.href = "<?php echo $app_link; ?>";
        } else {
            // For non-Android, use web URL
            window.location.href = "<?php echo $web_url; ?>";
        }
        
        // Set a timeout to redirect to the Play Store if the app doesn't open (Android)
        // or just stay on web URL (non-Android)
        setTimeout(function() {
            if (isAndroid) {
                window.location.href = "<?php echo $play_store_url; ?>";
            }
        }, 5000);
    }, 8000);
    </script>
</body>
</html>
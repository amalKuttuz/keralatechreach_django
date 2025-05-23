<?php
$product_id = isset($_GET['product_id']) ? $_GET['product_id'] : '';
// Accept both 'product_name' and 'title'
$product_name = isset($_GET['product_name']) ? $_GET['product_name'] : (isset($_GET['title']) ? $_GET['title'] : '');
// Accept both 'category_id' and 'category'
$category_id = isset($_GET['category_id']) ? $_GET['category_id'] : (isset($_GET['category']) ? $_GET['category'] : '');
$category_name = isset($_GET['category_name']) ? $_GET['category_name'] : '';
$price = isset($_GET['price']) ? $_GET['price'] : '';
$package_name = 'com.keralatechreach.kstudents';

$app_link = "intent://www.keralatechreach.in/Exam/Redirect/ProductRedirect.php?product_id=" . urlencode($product_id) .
            "&product_name=" . urlencode($product_name) .
            "&category_id=" . urlencode($category_id) .
            "&category_name=" . urlencode($category_name) .
            "&price=" . urlencode($price) .
            "#Intent;scheme=https;package=" . $package_name . ";end";

$web_url = "https://www.keralatechreach.in/Exam/Redirect/ProductRedirect.php?product_id=" . urlencode($product_id) .
          "&product_name=" . urlencode($product_name) .
          "&category_id=" . urlencode($category_id) .
          "&category_name=" . urlencode($category_name) .
          "&price=" . urlencode($price);

$play_store_url = "https://play.google.com/store/apps/details?id=" . $package_name;
?>
<!DOCTYPE html>
<html>
<head>
    <title>KStudents Product Redirect</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        body { font-family: Arial, sans-serif; text-align: center; padding: 20px; }
        .container { max-width: 600px; margin: 0 auto; }
        .button { display: inline-block; background-color: #4CAF50; color: white; padding: 12px 24px; text-align: center; text-decoration: none; font-size: 16px; margin: 10px 0; border-radius: 4px; }
    </style>
</head>
<body>
    <div class="container">
        <h1>KStudents Product Redirect</h1>
        <p>View product details for <?php echo htmlspecialchars($product_name); ?></p>
        <a href="<?php echo $app_link; ?>" class="button">Open in App</a>
        <p>Don't have the app yet?</p>
        <a href="<?php echo $play_store_url; ?>" class="button">Download from Play Store</a>
    </div>
    <script>
        var isAndroid = /android/i.test(navigator.userAgent);
        setTimeout(function() {
            if (isAndroid) {
                window.location.href = "<?php echo $app_link; ?>";
            } else {
                window.location.href = "<?php echo $web_url; ?>";
            }
            setTimeout(function() {
                if (isAndroid) {
                    window.location.href = "<?php echo $play_store_url; ?>";
                }
            }, 5000);
        }, 800);
    </script>
</body>
</html>

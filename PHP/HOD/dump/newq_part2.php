<?php
include('conn.php');
include('head.php');

if (isset($_GET['approved_id'])) {
    $approved_id = $_GET['approved_id'];

    // Fetch the approved record
    $query = "SELECT * FROM approved WHERE approved_id='$approved_id'";
    $result = mysqli_query($conn, $query);

    if ($result && mysqli_num_rows($result) > 0) {
        $approved = mysqli_fetch_assoc($result);
        $degree = $approved['deg'];

        // Check if the degree exists in the degree table
        $degree_query = "SELECT * FROM degree WHERE degree_name='$degree'";
        $degree_result = mysqli_query($conn, $degree_query);

        if ($degree_result && mysqli_num_rows($degree_result) == 0) {
            // Degree does not exist, insert it
            $insert_degree_query = "INSERT INTO degree (degree_name) VALUES ('$degree')";
            mysqli_query($conn, $insert_degree_query);

            // Fetch the updated degree details
            $degree_result = mysqli_query($conn, $degree_query);
        }

        $degree_details = mysqli_fetch_assoc($degree_result);
    } else {
        $error = "No approved record found for the given ID.";
    }
} else {
    $error = "No approved ID specified.";
}
?>

<section id="main-content">
    <section class="wrapper">
        <div class="row">
            <div class="col-md-12 mt">
                <div class="content-panel">
                    <?php if (isset($error)) : ?>
                        <p><?php echo $error; ?></p>
                    <?php else : ?>
                        <h2>Approved Details</h2>
                        <p>Degree: <?php echo htmlspecialchars($degree_details['degree_name']); ?></p>
                        <!-- Add more details as needed -->
                    <?php endif; ?>
                </div>
            </div>
        </div>
    </section>
</section>

<?php include('footer.php'); ?>
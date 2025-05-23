<?php

session_start();
if (!isset($_SESSION['username'])) {
    header('Location: login.php');
    exit();
}
include('conn.php');
include('head.php');	

// Fetch universities
$sql2 = "SELECT id, university_name FROM university";
$uni = $conn->query($sql2);

if(isset($_POST['degree'])){
    $degree = $_POST['degree'];
    $university_id = $_POST['university_id'];
    // $pg = isset($_POST['pg']) ? 1 : 0;
    // $ug = isset($_POST['ug']) ? 1 : 0;
    // $sem_no = $_POST['sem_no'];

    $sql = "INSERT INTO degree (degree_name, university_id) VALUES (?, ?)";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("si", $degree, $university_id);
    $query = $stmt->execute();
    if ($query) {
        echo "<script>alert('Data inserted successfully');</script>";
    } else {
        echo "<script>alert('Data not inserted');</script>";
    }
    $stmt->close();
    $conn->close();
}

?>
<section id="main-content">
    <section class="wrapper">
        <div class="row">
            <div class="col-lg-9">
                <h2>Add Degree</h2>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="form-panel">
                            <h4 class="mb"><i class="fa fa-angle-right"></i> Add Degree</h4>
                            <form class="form-horizontal style-form" method="post">
                                <div class="form-group">
                                    <label class="col-sm-2 col-sm-2 control-label">Degree</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" name="degree" required>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 col-sm-2 control-label">University</label>
                                    <div class="col-sm-10">
                                        <select name="university_id" class="form-controller" required>
                                            <option value="">Select University</option>
                                            <?php while ($row = $uni->fetch_assoc()): ?>
                                                <option value="<?php echo htmlspecialchars($row['id']); ?>">
                                                    <?php echo htmlspecialchars($row['university_name']); ?>
                                                </option>
                                            <?php endwhile; ?>
                                        </select>
                                    </div>
                                </div>
                              
                                <div class="form-group">
                                    <div class="col-lg-offset-2 col-lg-10">
                                        <button type="submit" class="btn btn-theme">Add Degree</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</section>

<?php
include('footer.php');
?>
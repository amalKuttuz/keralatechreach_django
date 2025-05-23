<?php
session_start();
if (!isset($_SESSION['username'])) {
    header('Location: login.php');
    exit();
}
include('conn.php');
include('head.php');

$sql = "SELECT degree_name FROM degree";
$result = $conn->query($sql);

$sql2 = "SELECT id, university_name FROM university";
$uni = $conn->query($sql2);

if (isset($_POST['submit'])) {
    $deg = $_POST['degree'];
    $subj = $_POST['subj'];
    $sem = $_POST['sem'];
    $qyear = $_POST['qyear'];
    $university = $_POST['university'];

    if (isset($_FILES['file']) && $_FILES['file']['error'] == 0) {
        $file = $_FILES['file'];
        $filename = $file['name'];
        $filepath = $file['tmp_name'];
        $fileerror = $file['error'];

        if ($fileerror == 0) {
            $destfile = 'qtext/' . $filename;

            // Ensure the upload directory exists
            if (!is_dir('qtext')) {
                mkdir('qtext', 0777, true);
            }

            if (move_uploaded_file($filepath, $destfile)) {
                $insertquery = "INSERT INTO approved(deg, subj, sem, qyear, qtext, university) VALUES('$deg', '$subj', '$sem', '$qyear', '$destfile', '$university')";

                $query = mysqli_query($conn, $insertquery);

                if ($query) {
                    echo "<script>alert('Data inserted successfully');</script>";
                } else {
                    echo "<script>alert('Data not inserted');</script>";
                }
            } else {
                echo "<script>alert('Failed to move uploaded file');</script>";
            }
        } else {
            echo "<script>alert('File upload error');</script>";
        }
    } else {
        echo "<script>alert('No file uploaded or an error occurred.');</script>";
    }
}
?>

<section id="main-content">
    <section class="wrapper">
        <div class="row">
            <div class="col-lg-9">
                <div class="row mt">
                    <div class="col-lg-12">
                        <h4><i class="fa fa-angle-right"></i> Add new question</h4>
                        <div class="form-panel">
                            <div class="form">
                                <form class="form cmxform form-horizontal style-form" id="commentForm" method="post" enctype="multipart/form-data" style="margin:10px">
                                    <div class="row">
                                        <div class="col-md-6 pt_right">
                                            <div class="form-group">
                                                <?php
                                                echo '<select name="university" id="university" class="form-controller" required>';
                                                echo '<option value="">Select University</option>';
                                                while ($row = $uni->fetch_assoc()) {
                                                    echo '<option value="' . htmlspecialchars($row["id"]) . '">' . htmlspecialchars($row["university_name"]) . '</option>';
                                                }
                                                echo '</select>';
                                                ?>
                                            </div>
                                        </div>
                                        <div class="col-md-6 pt_right">
                                            <div class="form-group">
                                                <?php
                                                echo '<select name="degree" id="degree" class="form-controller" required>';
                                                echo '<option value="">Select Degree</option>';
                                                while ($row = $result->fetch_assoc()) {
                                                    echo '<option value="' . htmlspecialchars($row["degree_name"]) . '">' . htmlspecialchars($row["degree_name"]) . '</option>';
                                                }
                                                echo '</select>';
                                                ?>
                                            </div>
                                        </div>
                                        <div class="col-md-6 pt_right">
                                            <div class="form-group">
                                                <input class="form-controller" id="form_branch" name="subj" placeholder="eg English" type="text">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <select name="sem" class="form-controller">
                                                    <option value="0">Semester</option>
                                                    <option value="1">Sem 1</option>
                                                    <option value="2">Sem 2</option>
                                                    <option value="3">Sem 3</option>
                                                    <option value="4">Sem 4</option>
                                                    <option value="5">Sem 5</option>
                                                    <option value="6">Sem 6</option>
                                                    <option value="7">Sem 7</option>
                                                    <option value="8">Sem 8</option>
                                                    <option value="9">Sem 9</option>
                                                    <option value="10">Sem 10</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <select name="qyear" class="form-controller">
                                                    <option value="0">Year</option>
                                                    <option value="2020">2020</option>
                                                    <option value="2021">2021</option>
                                                    <option value="2022">2022</option>
                                                    <option value="2023">2023</option>
                                                    <option value="2024">2024</option>
                                                    <option value="2025">2025</option>
                                                    <option value="2026">2026</option>
                                                    <option value="2027">2027</option>
                                                    <option value="2028">2028</option>
                                                    <option value="2029">2029</option>
                                                    <option value="2030">2030</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-md-6 pt_right">
                                            <div class="form-group">
                                                <input class="form-controller" id="form_file" name="file" type="file">
                                            </div>
                                        </div>
                                        <div class="col-md-12 text-center">
                                            <input type="submit" name="submit" class="btn btn-default btn-submit" value="Submit">
                                        </div>
                                    </div>
                                </form>
                                <?php include 'footer.php'; ?>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</section>
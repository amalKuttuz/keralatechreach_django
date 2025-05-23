<?php

session_start();
if (!isset($_SESSION['username'])) {
    header('Location: login.php');
    exit();
}
include('conn.php');
include('head.php');    

?>

<section id="main-content">
    <section class="wrapper">
        <div class="row">
            <div class="col-lg-9">
                <!--main content start-->
                <h2>View Exam</h2>
                <?php
                if ($_SERVER['REQUEST_METHOD'] == 'POST') {
                    $degree = $_POST['degree'];
                    $semester = $_POST['semester'];
                    $admission_year = $_POST['admission_year'];

                    $sql = "SELECT * FROM exam WHERE degree_name='$degree' AND semester='$semester' AND admission_year='$admission_year'";
                    $result = $conn->query($sql);

                    if ($result->num_rows > 0) {
                        echo "<h3>Degree: $degree</h3>";
                        echo "<h3>Semester: $semester</h3>";
                        echo "<h3>Admission Year: $admission_year</h3>";
                        echo "<form method='post' action='exam_update.php'>";
                        echo "<table class='table table-hover'>
                                <thead>
                                    <tr>
                                        <th>Exam Name</th>
                                        <th>Exam Date</th>
                                        <th>Exam Url</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>";
                        while($row = $result->fetch_assoc()) {
                            echo "<tr>
                                    <td><input type='text' name='exam_name[]' value='".$row['exam_name']."'></td>
                                    <td><input type='date' name='exam_date[]' value='".$row['exam_date']."'></td>
                                    <td><input type='url' name='exam_url[]' value='".$row['exam_url']."'></td>
                                    <td>
                                        <button type='submit' name='update' value='".$row['id']."'>Update</button>
                                        <button type='submit' name='delete' value='".$row['id']."'>Delete</button>
                                    </td>
                                  </tr>";
                        }
                        echo "</table>";
                        echo "</form>";
                    } else {
                        echo "No exams found for the selected criteria.";
                    }
                }
                ?>

            </div>
        </div>
    </section>    
</section>

<?php
include('footer.php');
?>
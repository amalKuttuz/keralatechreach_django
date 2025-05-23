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

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $degree_name = $_POST['degree_name'];
    $semester = $_POST['semester'];
    $admission_year = $_POST['admission_year'];
    $exam_name = $_POST['exam_name'];
    $exam_date = $_POST['exam_date'];
    $exam_url = $_POST['exam_url'];

    $insert_sql = "INSERT INTO exam (degree_name, semester, admission_year, exam_name, exam_date, exam_url) 
                   VALUES ('$degree_name', '$semester', '$admission_year', '$exam_name', '$exam_date', '$exam_url')";

    if ($conn->query($insert_sql) === TRUE) {
        echo "New exam added successfully";
    } else {
        echo "Error: " . $insert_sql . "<br>" . $conn->error;
    }
}

?>

<style>
    .form-horizontal {
        max-width: 600px;
        margin: auto;
    }
    .form-horizontal select, 
    .form-horizontal input[type="text"], 
	.form-horizontal input[type="url"], 
	.form-horizontal input[type="date"], 
    .form-horizontal input[type="submit"] {
        display: block;
        width: 100%;
        padding: 10px;
        margin: 10px 0;
		
    }
</style>

<section id="main-content">
    <section class="wrapper">
        <div class="row">
            <div class="col-lg-9">
                <!--main content start-->
                <h2>Add Exam</h2>
                <form class="form-horizontal style-form" method="post">
                    <select name="degree_name" required>
                        <option>Select Degree</option>
                        <?php
                        while ($row = $result->fetch_assoc()) {
                            echo '<option value="' . $row['degree_name'] . '">' . $row['degree_name'] . '</option>';
                        }
                        ?>
                    </select>
                    <select name="semester" required>
					
						<option>Select Semester</option>
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
						<option value="6">6</option>
						<option value="7">7</option>
						<option value="8">8</option>
			
                    </select>
                    <select name="admission_year" required>
                        <option>Select admission_year</option>
                       
                        <option>2019</option>
                        <option>2020</option>
                        <option>2021</option>
                        <option>2022</option>
                        <option>2023</option>
                        <option>2024</option>
                        <option>2025</option>
                    </select>
                    <input type="text" name="exam_name" placeholder="Exam Name" required>    
                    <input type="date" name="exam_date" placeholder="Exam Date" required>
                    <input type="url" name="exam_url" placeholder="Exam Url" required>
                    <input type="submit" name="submit" value="Add Exam">
                </form>         
            </div>
        </div>
    </section>    
</section>

<?php
$conn->close();
include('footer.php');
?>
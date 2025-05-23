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
                <h2> Exam View</h2>
				<form method="post" action='exam_view.php'>
					<select name="degree" id="degree">
						<option>Select Degree</option>
						<?php
						$sql = "SELECT degree_name FROM degree";	
						$result = $conn->query($sql);
						if ($result->num_rows > 0) {
							while($row = $result->fetch_assoc()) {
								echo "<option value='".$row['degree_name']."'>".$row['degree_name']."</option>";
							}
						}
						?>
					</select>
					<select name="semester">
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
					<select name="admission_year">
						<option>Select Admission Year</option>
						<option value="2019">2019</option>
						<option value="2020">2020</option>
						<option value="2021">2021</option>
						<option value="2022">2022</option>
						<option value="2023">2023</option>
						<option value="2024">2024</option>
						<option value="2025">2025</option>
					
						</select>
					<input type="submit" value="View" name="submit">

</form>


</div>
</div>
</section>
</section>
<?php
include('footer.php');
?>
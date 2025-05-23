<?php
include 'conn.php';
include 'head.php';

if (isset($_POST['submit'])) {
    // $name = $_POST['name'];
    // $email = $_POST['email'];
    $deg = $_POST['degree'];
    $subj = $_POST['subj'];
    $sem = $_POST['sem'];
    $qyear = $_POST['qyear'];

    if (isset($_FILES['file']) && $_FILES['file']['error'] == 0) {
        $file = $_FILES['file'];
        $filename = $file['name'];
        $filepath = $file['tmp_name'];
        $fileerror = $file['error'];

        if ($fileerror == 0) {
            $destfile = 'upload/' . $filename;

            // Ensure the upload directory exists
            if (!is_dir('upload')) {
                mkdir('upload', 0777, true);
            }

            if (move_uploaded_file($filepath, $destfile)) {
                $insertquery = "INSERT INTO question( deg, subj, sem, qyear, file) VALUES( '$deg', '$subj', '$sem', '$qyear', '$destfile')";

                $query = mysqli_query($conn, $insertquery);

                if ($query) {
                    ?>
                    <script>
                        alert("Data inserted successfully");
                    </script>
                    <?php
                } else {
                    ?>
                    <script>
                        alert("Data not inserted");
                    </script>
                    <?php
                }
            } else {
                ?>
                <script>
                    alert("Failed to move uploaded file");
                </script>
                <?php
            }
        } else {
            ?>
            <script>
                alert("File upload error");
            </script>
            <?php
        }
    } else {
        ?>
        <script>
            alert("No file uploaded or an error occurred.");
        </script>
        <?php
    }
}
?>

<form class="form" method="post" enctype="multipart/form-data">
    <div class="row">
    
        <div class="col-md-6 pt_right">
            <div class="form-group">
			<select name="degree" id="degree" class="form-controller" required>
				<option value="0">Select Degree</option>
				<option value="Select Degree">Select Degree</option>
					<option value="B.Tech">B.Tech</option>
					<option value="B.Sc">B.Sc</option>
					<option value="B.Com">B.Com</option>
					<option value="B.A">B.A</option>
					<option value="BBA">BBA</option>
					<option value="BCA">BCA</option>
					<option value="B.Ed">B.Ed</option>
					<option value="LLB">LLB</option>
					<option value="B.Pharm">B.Pharm</option>
					<option value="M.Tech">M.Tech</option>
					<option value="M.Sc">M.Sc</option>
					<option value="M.Com">M.Com</option>
					<option value="M.A">M.A</option>
					<option value="MBA">MBA</option>
					<option value="MCA">MCA</option>
					<option value="M.Ed">M.Ed</option>
					<option value="LLM">LLM</option>
					<option value="M.Pharm">M.Pharm</option>
</select>
            </div>
        </div>
        <div class="col-md-6 pt_right">
            <div class="form-group">
                <input class="form-controller" id="form_branch" name="subj" placeholder="eg English" type="text">
            </div>
        </div>
		<div
					class="col-md-6"> <div
						class="form-group">
				
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
					</div></div>

					<div
					class="col-md-6"> <div
						class="form-group">
				
							    <select name="qyear" class="form-controller">
									<option value="0">Year</option>
									<option value="2020">2020</option>
									<option value="2021">2021</option>
									<option value="2022">2022</option>
									<option value="2023">2023</option>
									<option value="2024">2024</option>
									<option value="2025">2024</option>
									<option value="2026">2026</option>
									<option value="2027">2027</option>
									<option value="2028">2028</option>
									<option value="2029">2029</option>
									<option value="2030">2030</option>
									
								</select>
					</div></div>
					
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



<?php
include 'footer.php';

?>
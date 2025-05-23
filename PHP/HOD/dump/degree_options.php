<!-- <option value="Select Degree">Select Degree</option>
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
<option value="M.Pharm">M.Pharm</option> -->
<?php
	include('conn.php');
	$sql = "SELECT * FROM degree";
	$result = $conn->query($sql);
	if ($result->num_rows > 0) {
		while($row = $result->fetch_assoc()) {
			echo "<option value='".$row['degree_id']."'>".$row['degree_name']."</option>";
		}
	}


?>
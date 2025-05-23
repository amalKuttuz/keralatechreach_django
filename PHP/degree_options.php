<!-- <option value="0">Select Degree</option>
<option value="1">B.Tech</option>
<option value="2">B.Sc</option>
<option value="3">B.Com</option>
<option value="4">B.A</option>
<option value="5">BBA</option>
<option value="6">BCA</option>
<option value="7">B.Ed</option>
<option value="8">LLB</option>
<option value="9">B.Pharm</option>
<option value="10">M.Tech</option>
<option value="11">M.Sc</option>
<option value="12">M.Com</option>
<option value="13">M.A</option>
<option value="14">MBA</option>
<option value="15">MCA</option>
<option value="16">M.Ed</option>
<option value="17">LLM</option>
<option value="18">M.Pharm</option> -->
<?php
	include('conn.php');
	$sql = "SELECT * FROM degree";
	$result = $conn->query($sql);
	if ($result->num_rows > 0) {
		while($row = $result->fetch_assoc()) {
			echo "<option value='".$row['degree_name']."'>".$row['degree_name']."</option>";
		}
	}


?>
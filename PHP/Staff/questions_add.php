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

// For storing upload results
$uploadResults = [];

if (isset($_POST['submit'])) {
    $university = $_POST['university'];
    $deg = $_POST['degree'];
    $sem = $_POST['sem'];
    $qyear = $_POST['year'];
    $user_id=$_SESSION['userid'];
    
    // Check if main fields are filled
    if (empty($deg) || $sem == 'Select Semester' || $qyear == 'Select Year' || empty($university)) {
        echo "<script>alert('Please fill all required fields (University, Degree, Semester, Year)');</script>";
    } else {
        $totalSuccess = 0;
        $totalFailed = 0;
        
        // Ensure the upload directory exists
          // Ensure the upload directory exists
        if (!is_dir('../HOD/qtext')) {
            mkdir('../HOD/qtext', 0777, true);
        }
        
        // Process each subject-file pair
        for ($i = 0; $i < count($_POST['subjects']); $i++) {
            $subj = $_POST['subjects'][$i];
            
            // Skip empty subject entries
            if (empty($subj)) {
                continue;
            }
            
            // Check if file exists for this subject
            if (isset($_FILES['files']['name'][$i]) && !empty($_FILES['files']['name'][$i])) {
                if ($_FILES['files']['error'][$i] == 0) {
                    $filename = $_FILES['files']['name'][$i];
                    $filepath = $_FILES['files']['tmp_name'][$i];
                    $filesize = $_FILES['files']['size'][$i];
                    
                    // Set a file size limit (10MB)
                    $maxFileSize = 16 * 1024 * 1024;
                    
                    if ($filesize > $maxFileSize) {
                        $uploadResults[] = [
                            'subject' => $subj,
                            'name' => $filename,
                            'status' => 'failed',
                            'message' => 'File exceeds maximum size limit (16MB)'
                        ];
                        $totalFailed++;
                        continue;
                    }
                    
                    $destfile = 'qtext/' . time() . '_' . $filename; // Adding timestamp to prevent filename conflicts
                    $destfile2='../HOD/qtext/' . time() . '_' . $filename; // Adding timestamp to prevent filename conflicts
                    if (move_uploaded_file($filepath, $destfile2)) {
                        $insertquery = "INSERT INTO approved(deg, subj, sem, qyear, qtext, university,q_id) 
                                        VALUES('$deg', '$subj', '$sem', '$qyear', '$destfile', '$university','$user_id')";
                        
                        $query = mysqli_query($conn, $insertquery);
                        
                        if ($query) {
                            $uploadResults[] = [
                                'subject' => $subj,
                                'name' => $filename,
                                'status' => 'success',
                                'message' => 'Successfully uploaded'
                            ];
                            $totalSuccess++;
                        } else {
                            $uploadResults[] = [
                                'subject' => $subj,
                                'name' => $filename,
                                'status' => 'failed',
                                'message' => 'Database insertion failed: ' . mysqli_error($conn)
                            ];
                            $totalFailed++;
                            
                            // Remove the file if database insertion failed
                            if (file_exists($destfile)) {
                                unlink($destfile);
                            }
                        }
                    } else {
                        $uploadResults[] = [
                            'subject' => $subj,
                            'name' => $filename,
                            'status' => 'failed',
                            'message' => 'Failed to move uploaded file'
                        ];
                        $totalFailed++;
                    }
                } else {
                    $errorMessages = [
                        1 => 'The uploaded file exceeds the upload_max_filesize directive in php.ini',
                        2 => 'The uploaded file exceeds the MAX_FILE_SIZE directive specified in the HTML form',
                        3 => 'The uploaded file was only partially uploaded',
                        6 => 'Missing a temporary folder',
                        7 => 'Failed to write file to disk',
                        8 => 'A PHP extension stopped the file upload'
                    ];
                    
                    $errorCode = $_FILES['files']['error'][$i];
                    $errorMessage = isset($errorMessages[$errorCode]) ? $errorMessages[$errorCode] : 'Unknown error';
                    
                    $uploadResults[] = [
                        'subject' => $subj,
                        'name' => $_FILES['files']['name'][$i],
                        'status' => 'failed',
                        'message' => $errorMessage
                    ];
                    $totalFailed++;
                }
            } else {
                $uploadResults[] = [
                    'subject' => $subj,
                    'name' => 'No file',
                    'status' => 'failed',
                    'message' => 'No file selected for this subject'
                ];
                $totalFailed++;
            }
        }
        
        if ($totalSuccess > 0) {
            echo "<script>alert('$totalSuccess files uploaded successfully. $totalFailed files failed.');</script>";
        } else {
            echo "<script>alert('No files were uploaded successfully. Please check the error messages below.');</script>";
        }
    }
}
?>

<!-- Main Content -->
<main class="main-content">
    <button class="btn btn-primary mb-3" id="open-sidebar">☰</button>
    <h1>Add Questions</h1>
    <p>Fill in the details below to upload question papers.</p>
    
    <form action="questions_add.php" method="POST" enctype="multipart/form-data">
        <div class="form-group">
            <label for="university">University:</label>
            <select name="university" id="university" class="form-control">
                <option value="">Select University</option>
                <?php while ($row = $uni->fetch_assoc()) { ?>
                    <option value="<?php echo $row['id']; ?>"><?php echo $row['university_name']; ?></option>
                <?php } ?>
            </select>
        </div>
        
        <div class="form-group">
            <label for="degree">Degree:</label>
            <select name="degree" id="degree" class="form-control">
                <option value="">Select Degree</option>
                <?php while ($row = $result->fetch_assoc()) { ?>
                    <option value="<?php echo $row['degree_name']; ?>"><?php echo $row['degree_name']; ?></option>
                <?php } ?>
            </select>
        </div>
        
        <div class="form-group">
            <label for="sem">Semester:</label>
            <select name="sem" id="sem" class="form-control">
                <option value="Select Semester">Select Semester</option>
                <?php for ($i = 1; $i <= 8; $i++) { ?>
                    <option value="<?php echo $i; ?>">Semester <?php echo $i; ?></option>
                <?php } ?>
            </select>
        </div>
        
        <div class="form-group">
            <label for="year">Year:</label>
            <select name="year" id="year" class="form-control">
                <option value="Select Year">Select Year</option>
                <?php for ($i = date('Y'); $i >= 2000; $i--) { ?>
                    <option value="<?php echo $i; ?>"><?php echo $i; ?></option>
                <?php } ?>
            </select>
        </div>
        
        <div id="subjects-container">
            <div class="form-group">
                <label for="subjects[]">Subject:</label>
                <input type="text" name="subjects[]" class="form-control" placeholder="Enter Subject Name">
                <label for="files[]">File:</label>
                <input type="file" name="files[]" class="form-control">
            </div>
        </div>
        
        <button type="button" class="btn btn-secondary mb-3" id="add-subject">Add Another Subject</button>
        
        <button type="submit" name="submit" class="btn btn-success">Submit</button>
    </form>
</main>

<script>
    document.getElementById('add-subject').addEventListener('click', function () {
        const container = document.getElementById('subjects-container');
        const newField = `
            <div class="form-group">
                <label for="subjects[]">Subject:</label>
                <input type="text" name="subjects[]" class="form-control" placeholder="Enter Subject Name">
                <label for="files[]">File:</label>
                <input type="file" name="files[]" class="form-control">
            </div>`;
        container.insertAdjacentHTML('beforeend', newField);
    });
</script>

<?php include 'footer.php'; ?>
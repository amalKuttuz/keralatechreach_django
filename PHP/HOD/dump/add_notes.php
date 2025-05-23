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

    // Check if main fields are filled
    if (empty($deg) || $sem == 'Select Semester' || $qyear == 'Select Year' || empty($university)) {
        echo "<script>alert('Please fill all required fields (University, Degree, Semester, Year)');</script>";
    } else {
        $totalSuccess = 0;
        $totalFailed = 0;

        // Ensure the upload directory exists
        if (!is_dir('notes')) {
            mkdir('notes', 0777, true);
        }

        // Process each module-subject-file pair
        for ($i = 0; $i < count($_POST['modules']); $i++) {
            $module = $_POST['modules'][$i];
            $subj = $_POST['subjects'][$i];

            // Skip empty module or subject entries
            if (empty($module) || empty($subj)) {
                continue;
            }

            // Check if file exists for this module-subject
            if (isset($_FILES['files']['name'][$i]) && !empty($_FILES['files']['name'][$i])) {
                if ($_FILES['files']['error'][$i] == 0) {
                    $filename = $_FILES['files']['name'][$i];
                    $filepath = $_FILES['files']['tmp_name'][$i];
                    $filesize = $_FILES['files']['size'][$i];

                    // Set a file size limit (10MB)
                    $maxFileSize = 10 * 1024 * 1024;

                    if ($filesize > $maxFileSize) {
                        $uploadResults[] = [
                            'module' => $module,
                            'subject' => $subj,
                            'name' => $filename,
                            'status' => 'failed',
                            'message' => 'File exceeds maximum size limit (10MB)'
                        ];
                        $totalFailed++;
                        continue;
                    }

                    $destfile = 'notes/' . time() . '_' . $filename;

                    if (move_uploaded_file($filepath, $destfile)) {
                        $insertquery = "INSERT INTO notes(degree, semester, module, subject, qtext, qyear, university, updated_date)
                                        VALUES('$deg', '$sem', '$module', '$subj', '$destfile', '$qyear', '$university', NOW())";

                        $query = mysqli_query($conn, $insertquery);

                        if ($query) {
                            $uploadResults[] = [
                                'module' => $module,
                                'subject' => $subj,
                                'name' => $filename,
                                'status' => 'success',
                                'message' => 'Successfully uploaded'
                            ];
                            $totalSuccess++;
                        } else {
                            $uploadResults[] = [
                                'module' => $module,
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
                            'module' => $module,
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
                        'module' => $_POST['modules'][$i],
                        'subject' => $subj,
                        'name' => $_FILES['files']['name'][$i],
                        'status' => 'failed',
                        'message' => $errorMessage
                    ];
                    $totalFailed++;
                }
            } else {
                $uploadResults[] = [
                    'module' => $module,
                    'subject' => $subj,
                    'name' => 'No file',
                    'status' => 'failed',
                    'message' => 'No file selected for this module and subject'
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

<section id="main-content">
    <section class="wrapper">
        <div class="row">
            <div class="col-lg-12">
                <div class="row mt">
                    <div class="col-lg-12">
                        <h4><i class="fa fa-angle-right"></i> Upload Notes</h4>
                        <div class="form-panel">
                            <div class="form">
                                <form class="form cmxform form-horizontal style-form" id="uploadForm" method="post" enctype="multipart/form-data" style="margin:10px">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>University:</label>
                                                <?php
                                                echo '<select name="university" id="university" class="form-control" required>';
                                                echo '<option value="">Select University</option>';
                                                while ($row = $uni->fetch_assoc()) {
                                                    echo '<option value="' . htmlspecialchars($row["id"]) . '">' . htmlspecialchars($row["university_name"]) . '</option>';
                                                }
                                                echo '</select>';
                                                ?>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Degree:</label>
                                                <?php
                                                echo '<select name="degree" id="degree" class="form-control" required>';
                                                echo '<option value="">Select Degree</option>';
                                                while ($row = $result->fetch_assoc()) {
                                                    echo '<option value="' . htmlspecialchars($row["degree_name"]) . '">' . htmlspecialchars($row["degree_name"]) . '</option>';
                                                }
                                                echo '</select>';
                                                ?>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Semester:</label>
                                                <select name="sem" class="form-control" required>
                                                    <option>Select Semester</option>
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
                                                <label>Year:</label>
                                                <select name="year" class="form-control" required>
                                                    <option>Select Year</option>
                                                    <?php for ($year = 2020; $year <= 2030; $year++): ?>
                                                        <option value="<?php echo $year; ?>"><?php echo $year; ?></option>
                                                    <?php endfor; ?>
                                                </select>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="module-subject-file-container">
                                        <h5>Module, Subject, File Pairs</h5>
                                        <div id="module-subject-file-wrapper">
                                            <div class="row module-subject-file-row mb-3">
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <label>Module:</label>
                                                        <input type="text" name="modules[]" class="form-control" placeholder="eg Module 1" required>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <label>Subject:</label>
                                                        <input type="text" name="subjects[]" class="form-control" placeholder="eg English" required>
                                                    </div>
                                                </div>
                                                <div class="col-md-3">
                                                    <div class="form-group">
                                                        <label>File: <small>(Max 10MB)</small></label>
                                                        <input type="file" name="files[]" class="form-control" required>
                                                    </div>
                                                </div>
                                                <div class="col-md-1">
                                                    <div class="form-group">
                                                        <label>&nbsp;</label>
                                                        <button type="button" class="btn btn-danger remove-row form-control">
                                                            <i class="fa fa-trash"></i>
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-3">
                                            <div class="col-md-12">
                                                <button type="button" id="add-more-btn" class="btn btn-info">
                                                    <i class="fa fa-plus"></i> Add Another Pair
                                                </button>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-12 text-center">
                                            <input type="submit" name="submit" class="btn btn-primary btn-submit" value="Upload Files">
                                        </div>
                                    </div>
                                </form>

                                <?php if (!empty($uploadResults)): ?>
                                    <div class="upload-results mt-4">
                                        <h4>Upload Results</h4>
                                        <div class="table-responsive">
                                            <table class="table table-striped table-hover">
                                                <thead>
                                                    <tr>
                                                        <th>Module</th>
                                                        <th>Subject</th>
                                                        <th>File Name</th>
                                                        <th>Status</th>
                                                        <th>Message</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <?php foreach ($uploadResults as $result): ?>
                                                        <tr class="<?php echo $result['status'] == 'success' ? 'success' : 'danger'; ?>">
                                                            <td><?php echo htmlspecialchars($result['module']); ?></td>
                                                            <td><?php echo htmlspecialchars($result['subject']); ?></td>
                                                            <td><?php echo htmlspecialchars($result['name']); ?></td>
                                                            <td><?php echo ucfirst(htmlspecialchars($result['status'])); ?></td>
                                                            <td><?php echo htmlspecialchars($result['message']); ?></td>
                                                        </tr>
                                                    <?php endforeach; ?>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                <?php endif; ?>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</section>

<script>
document.addEventListener('DOMContentLoaded', function() {
    // Add more module-subject-file pairs
    document.getElementById('add-more-btn').addEventListener('click', function() {
        const wrapper = document.getElementById('module-subject-file-wrapper');
        const newRow = document.createElement('div');
        newRow.className = 'row module-subject-file-row mb-3';
        newRow.innerHTML = `
            <div class="col-md-4">
                <div class="form-group">
                    <label>Module:</label>
                    <input type="text" name="modules[]" class="form-control" placeholder="eg Module 1" required>
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group">
                    <label>Subject:</label>
                    <input type="text" name="subjects[]" class="form-control" placeholder="eg English" required>
                </div>
            </div>
            <div class="col-md-3">
                <div class="form-group">
                    <label>File: <small>(Max 10MB)</small></label>
                    <input type="file" name="files[]" class="form-control" required>
                </div>
            </div>
            <div class="col-md-1">
                <div class="form-group">
                    <label>&nbsp;</label>
                    <button type="button" class="btn btn-danger remove-row form-control">
                        <i class="fa fa-trash"></i>
                    </button>
                </div>
            </div>
        `;
        wrapper.appendChild(newRow);

        // Add event listener to remove button
        newRow.querySelector('.remove-row').addEventListener('click', function() {
            wrapper.removeChild(newRow);
        });
    });
});
</script>

<?php include 'footer.php'; ?>
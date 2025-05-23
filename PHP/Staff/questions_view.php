<?php
session_start();
if (!isset($_SESSION['username'])) {
    header('Location: login.php');
    exit();
}
include('conn.php');
include('head.php');

// Initialize filter variables
$filter_degree = filter_input(INPUT_GET, 'degree', FILTER_SANITIZE_STRING);
$filter_subject = filter_input(INPUT_GET, 'subject', FILTER_SANITIZE_STRING);
$filter_university = filter_input(INPUT_GET, 'university', FILTER_SANITIZE_NUMBER_INT);

// Build query with filters
$q = "SELECT a.*, u.university_name FROM approved a
      LEFT JOIN university u ON a.university = u.id
      WHERE 1=1";

if (!empty($filter_degree)) {
    $q .= " AND a.deg LIKE '%" . $conn->real_escape_string($filter_degree) . "%'";
}
if (!empty($filter_subject)) {
    $q .= " AND a.subj LIKE '%" . $conn->real_escape_string($filter_subject) . "%'";
}
if (!empty($filter_university)) {
    $q .= " AND a.university = '" . $conn->real_escape_string($filter_university) . "'";
}

$q .= " ORDER BY a.deg, a.qyear DESC";
$r = mysqli_query($conn, $q);

// Get universities for filter dropdown
$sql2 = "SELECT id, university_name FROM university ORDER BY university_name";
$uni = $conn->query($sql2);

// Handle update operations
if (isset($_POST['submit'])) {
    // Retrieve form values
    $id = $_POST['id'];
    $deg = $_POST['deg'];
    $subj = $_POST['subj'];
    $sem = $_POST['sem'];
    $qyear = $_POST['qyear'];
    $university = $_POST['university'];

    // Check if a file has been uploaded
    if (isset($_FILES['qtext']) && $_FILES['qtext']['error'] == 0) {
        $file = $_FILES['qtext'];
        $filename = $file['name'];
        $filepath = $file['tmp_name'];
        $fileerror = $file['error'];

        if ($fileerror == 0) {
            // Set destination for file upload
            $destfile = 'qtext/' . $filename;
			$destfile2 = '../HOD/qtext/' . $filename;

            // Ensure the upload directory exists, if not create it
            if (!is_dir('../HOD/qtext')) {
                mkdir('../HOD/qtext', 0777, true);
            }

            // Move the uploaded file to the desired directory
            if (move_uploaded_file($filepath, $destfile2)) {
                // Update database query with the file path
                $insertquery = "UPDATE approved SET 
                                deg = '$deg', 
                                subj = '$subj', 
                                sem = '$sem', 
                                qyear = '$qyear', 
                                qtext = '$destfile', 
                                university = '$university' 
                                WHERE approved_id = '$id'";
                $query = mysqli_query($conn, $insertquery);

                if ($query) {
                    echo "<script>
                        alert('Question updated successfully');
                        window.location.href = 'questions_view.php';
                    </script>";
                } else {
                    echo "<script>
                        alert('Error updating question in the database.');
                        window.location.href = 'questions_view.php';
                    </script>";
                }
            } else {
                echo "<script>
                    alert('Failed to move uploaded file.');
                    window.location.href = 'questions_view.php';
                </script>";
            }
        } else {
            echo "<script>
                alert('File upload error. Code: $fileerror');
                window.location.href = 'questions_view.php';
            </script>";
        }
    } else {
        // Update without changing the file
        $updateQuery = "UPDATE approved SET 
                        deg = '$deg', 
                        subj = '$subj', 
                        sem = '$sem', 
                        qyear = '$qyear', 
                        university = '$university' 
                        WHERE approved_id = '$id'";
        $query = mysqli_query($conn, $updateQuery);

        if ($query) {
            echo "<script>
                alert('Question updated successfully');
                window.location.href = 'questions_view.php';
            </script>";
        } else {
            echo "<script>
                alert('Error updating question in the database.');
                window.location.href = 'questions_view.php';
            </script>";
        }
    }
}
?>

<head>

<!-- Add some padding for better mobile experience -->
<style>
    body {
        padding: 10px;
    }
    .table-responsive {
        overflow-x: auto;
    }
</style>
</head>
<!-- filepath: e:\KSTUDENTS\backups\april 23\Staff\questions_view.php -->
<!-- filepath: e:\KSTUDENTS\backups\april 23\Staff\questions_view.php -->
<main class="main-content">
    <button class="btn btn-primary mb-3" id="open-sidebar">☰</button>
    <h1>View Questions</h1>
  

    <!-- Filter Section -->
    <form action="questions_view.php" method="GET" class="mb-4">
        <div class="row">
            <div class="col-12 col-md-4 mb-3">
                <label for="degree" class="form-label">Degree:</label>
                <input type="text" name="degree" id="degree" class="form-control" placeholder="Enter Degree" value="<?php echo htmlspecialchars($filter_degree); ?>">
            </div>
            <div class="col-12 col-md-4 mb-3">
                <label for="subject" class="form-label">Subject:</label>
                <input type="text" name="subject" id="subject" class="form-control" placeholder="Enter Subject" value="<?php echo htmlspecialchars($filter_subject); ?>">
            </div>
            <div class="col-12 col-md-4 mb-3">
                <label for="university" class="form-label">University:</label>
                <select name="university" id="university" class="form-control">
                    <option value="">Select University</option>
                    <?php while ($row = $uni->fetch_assoc()) { ?>
                        <option value="<?php echo $row['id']; ?>" <?php echo ($filter_university == $row['id']) ? 'selected' : ''; ?>>
                            <?php echo $row['university_name']; ?>
                        </option>
                    <?php } ?>
                </select>
            </div>
        </div>
        <div class="text-center">
            <button type="submit" class="btn btn-primary">Apply Filters</button>
            <a href="questions_view.php" class="btn btn-secondary">Reset</a>
        </div>
    </form>

    <!-- Questions Table -->
    <div class="table-responsive">
        <table class="table table-striped table-bordered">
            <thead class="table-dark">
                <tr>
                    <th>Degree</th>
                    <th>Subject</th>
                    <th>Semester</th>
                    <th>Year</th>
                    <th>University</th>
                    <th>File</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
			<?php if (mysqli_num_rows($r) > 0) { ?>
    <?php while ($row = mysqli_fetch_assoc($r)) { ?>
        <tr>
            <form method="post" action="" enctype="multipart/form-data">
                <td><input type="text" name="deg" class="form-control" value="<?php echo htmlspecialchars($row['deg']); ?>"></td>
                <td><input type="text" name="subj" class="form-control" value="<?php echo htmlspecialchars($row['subj']); ?>"></td>
                <td><input type="text" name="sem" class="form-control" value="<?php echo htmlspecialchars($row['sem']); ?>"></td>
                <td><input type="text" name="qyear" class="form-control" value="<?php echo htmlspecialchars($row['qyear']); ?>"></td>
                <td>
                    <select name="university" class="form-control">
                        <?php
                        $uni->data_seek(0); // Reset pointer to the beginning
                        while ($uni_row = $uni->fetch_assoc()) {
                            $selected = $uni_row['id'] == $row['university'] ? 'selected' : '';
                            echo '<option value="' . htmlspecialchars($uni_row["id"]) . '" ' . $selected . '>' . htmlspecialchars($uni_row["university_name"]) . '</option>';
                        }
                        ?>
                    </select>
                </td>
                <td>
                    <?php if (!empty($row['qtext'])) { ?>
                        <a href="file_view.php?file=../HOD/<?php echo htmlspecialchars($row['qtext']); ?>" target="_blank" class="btn btn-sm btn-info">View</a>
                    <?php } else { ?>
                        <span class="text-muted">No File</span>
                    <?php } ?>
                    <input type="file" name="qtext" class="form-control mt-2">
                </td>
                <td>
                    <input type="hidden" name="id" value="<?php echo $row['approved_id']; ?>">
                    <button type="submit" name="submit" class="btn btn-primary btn-sm">Update</button>
                    <a href="questions_delete.php?question_id=<?php echo $row['approved_id']; ?>" class="btn btn-sm btn-danger" onclick="return confirm('Are you sure you want to delete this question?');">Delete</a>
                </td>
            </form>
        </tr>
    <?php } ?>
<?php } else { ?>
    <tr>
        <td colspan="7" class="text-center">No questions found.</td>
    </tr>
<?php } ?>
            </tbody>
        </table>
    </div>
</main>



<!-- Footer -->
<?php include('footer.php'); ?>

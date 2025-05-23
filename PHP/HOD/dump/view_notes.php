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
$filter_module = filter_input(INPUT_GET, 'module', FILTER_SANITIZE_STRING);
$filter_university = filter_input(INPUT_GET, 'university', FILTER_SANITIZE_NUMBER_INT);

// Build query with filters
$q = "SELECT n.*, u.university_name FROM notes n
      LEFT JOIN university u ON n.university = u.id
      WHERE 1=1";

if (!empty($filter_degree)) {
    $q .= " AND n.degree LIKE '%" . $conn->real_escape_string($filter_degree) . "%'";
}
if (!empty($filter_subject)) {
    $q .= " AND n.subject LIKE '%" . $conn->real_escape_string($filter_subject) . "%'";
}
if (!empty($filter_module)) {
    $q .= " AND n.module LIKE '%" . $conn->real_escape_string($filter_module) . "%'";
}
if (!empty($filter_university)) {
    $q .= " AND n.university = '" . $conn->real_escape_string($filter_university) . "'";
}

$q .= " ORDER BY n.degree, n.semester, n.qyear DESC";
$r = mysqli_query($conn, $q);

// Get universities for filter dropdown
$sql2 = "SELECT id, university_name FROM university ORDER BY university_name";
$uni = $conn->query($sql2);

// Handle update operations
if (isset($_POST['submit'])) {
    // Retrieve form values
    $id = $_POST['id'];
    $degree = $_POST['degree'];
    $subject = $_POST['subject'];
    $semester = $_POST['semester'];
    $module = $_POST['module'];
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
            $destfile = 'notes/' . $filename;

            // Ensure the upload directory exists, if not create it
            if (!is_dir('notes')) {
                mkdir('notes', 0777, true);
            }

            // Move the uploaded file to the desired directory
            if (move_uploaded_file($filepath, $destfile)) {
                // Update database query with the file path
                $insertquery = "UPDATE notes SET 
                                degree = '$degree', 
                                subject = '$subject', 
                                semester = '$semester', 
                                module = '$module',
                                qyear = '$qyear', 
                                qtext = '$destfile', 
                                university = '$university' 
                                WHERE approved_id = '$id'";
                $query = mysqli_query($conn, $insertquery);

                if ($query) {
                    echo "<script>
                        alert('Note updated successfully');
                        window.location.href = 'view_notes.php';
                    </script>";
                } else {
                    echo "<script>
                        alert('Error updating note in the database: " . mysqli_error($conn) . "');
                        window.location.href = 'view_notes.php';
                    </script>";
                }
            } else {
                echo "<script>
                    alert('Failed to move uploaded file.');
                    window.location.href = 'view_notes.php';
                </script>";
            }
        } else {
            echo "<script>
                alert('File upload error. Code: $fileerror');
                window.location.href = 'view_notes.php';
            </script>";
        }
    } else {
        // Update without changing the file
        $updateQuery = "UPDATE notes SET 
                        degree = '$degree', 
                        subject = '$subject', 
                        semester = '$semester',
                        module = '$module', 
                        qyear = '$qyear', 
                        university = '$university' 
                        WHERE approved_id = '$id'";
        $query = mysqli_query($conn, $updateQuery);

        if ($query) {
            echo "<script>
                alert('Note updated successfully');
                window.location.href = 'view_notes.php';
            </script>";
        } else {
            echo "<script>
                alert('Error updating note in the database: " . mysqli_error($conn) . "');
                window.location.href = 'view_notes.php';
            </script>";
        }
    }
}
?>

<style>
    .container-fluid {
        padding: 20px;
    }
    .panel {
        border-radius: 5px;
        box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        margin-bottom: 30px;
    }
    .panel-heading {
        background-color: #f8f9fa;
        padding: 15px;
        border-bottom: 1px solid #e9ecef;
        border-top-left-radius: 5px;
        border-top-right-radius: 5px;
    }
    .panel-title {
        margin: 0;
        font-size: 20px;
        color: #333;
    }
    .filter-form {
        background-color: #f8f9fa;
        padding: 20px;
        border-radius: 5px;
        margin-bottom: 20px;
    }
    .filter-row {
        display: flex;
        flex-wrap: wrap;
        margin: 0 -10px;
    }
    .filter-col {
        flex: 1;
        padding: 0 10px;
        min-width: 200px;
        margin-bottom: 15px;
    }
    .filter-submit {
        width: 100%;
        text-align: right;
        padding: 0 10px;
    }
    .form-control {
        width: 100%;
        padding: 8px 12px;
        border: 1px solid #ced4da;
        border-radius: 4px;
        height: 38px;
    }
    .btn {
        display: inline-block;
        font-weight: 400;
        text-align: center;
        white-space: nowrap;
        vertical-align: middle;
        user-select: none;
        border: 1px solid transparent;
        padding: 0.375rem 0.75rem;
        font-size: 1rem;
        line-height: 1.5;
        border-radius: 0.25rem;
        cursor: pointer;
    }
    .btn-primary {
        color: #fff;
        background-color: #007bff;
        border-color: #007bff;
    }
    .btn-secondary {
        color: #fff;
        background-color: #6c757d;
        border-color: #6c757d;
    }
    .btn-danger {
        color: #fff;
        background-color: #dc3545;
        border-color: #dc3545;
    }
    .btn-sm {
        padding: 0.25rem 0.5rem;
        font-size: 0.875rem;
        line-height: 1.5;
    }
    table {
        width: 100%;
        border-collapse: collapse;
        margin: 20px 0;
        font-size: 16px;
        text-align: left;
    }
    th, td {
        padding: 12px 15px;
        border-bottom: 1px solid #ddd;
        vertical-align: middle;
    }
    th {
        background-color: #f2f2f2;
        font-weight: 600;
    }
    tr:hover {
        background-color: #f5f5f5;
    }
    .file-input {
        width: 100%;
        max-width: 250px;
    }
    .view-file {
        color: #007bff;
        text-decoration: none;
    }
    .view-file:hover {
        text-decoration: underline;
    }
    .no-records {
        text-align: center;
        padding: 20px;
        font-style: italic;
        color: #6c757d;
    }
</style>

<section id='main-content'>
<section class="wrapper">

<div class="container-fluid">
    <div class="panel">
        <div class="panel-heading">
            <h3 class="panel-title">View Notes</h3>
        </div>
    </div>
        
    <!-- Filter Form -->
    <div class="filter-form">
        <form method="GET" action="">
            <div class="filter-row">
                <div class="filter-col">
                    <label for="degree">Degree:</label>
                    <input type="text" id="degree" name="degree" class="form-control" placeholder="Filter by degree" value="<?php echo htmlspecialchars($filter_degree); ?>">
                </div>
                <div class="filter-col">
                    <label for="subject">Subject:</label>
                    <input type="text" id="subject" name="subject" class="form-control" placeholder="Filter by subject" value="<?php echo htmlspecialchars($filter_subject); ?>">
                </div>
                <div class="filter-col">
                    <label for="module">Module:</label>
                    <input type="text" id="module" name="module" class="form-control" placeholder="Filter by module" value="<?php echo htmlspecialchars($filter_module); ?>">
                </div>
                <div class="filter-col">
                    <label for="university">University:</label>
                    <select id="university" name="university" class="form-control">
                        <option value="">All Universities</option>
                        <?php
                        $uni->data_seek(0); // Reset pointer to the beginning
                        while ($uni_row = $uni->fetch_assoc()) {
                            $selected = $uni_row['id'] == $filter_university ? 'selected' : '';
                            echo '<option value="' . htmlspecialchars($uni_row["id"]) . '" ' . $selected . '>' . htmlspecialchars($uni_row["university_name"]) . '</option>';
                        }
                        ?>
                    </select>
                </div>
            </div>
            <div class="filter-submit">
                <button type="submit" class="btn btn-primary">Apply Filters</button>
                <a href="view_notes.php" class="btn btn-secondary">Reset</a>
            </div>
        </form>
    </div>
    
    <!-- Notes Table -->
    <div class="table-responsive">
        <?php if (mysqli_num_rows($r) > 0): ?>
            <table class="table">
                <thead>
                    <tr>
                        <th>Degree</th>
                        <th>Subject</th>
                        <th>Semester</th>
                        <th>Module</th>                        
                        <th>Year</th>
                        <th>University</th>
                        <th>Note File</th>
                        <th>Update</th>
                        <th>Delete</th>
                    </tr>
                </thead>
                <tbody>
                    <?php while ($row = mysqli_fetch_assoc($r)) { ?>
                        <tr>
                            <form method="post" action="" enctype="multipart/form-data">
                                <td><input type="text" name="degree" class="form-control" value="<?php echo htmlspecialchars($row['degree']); ?>"></td>
                                <td><input type="text" name="subject" class="form-control" value="<?php echo htmlspecialchars($row['subject']); ?>"></td>
                                <td><input type="text" name="semester" class="form-control" value="<?php echo htmlspecialchars($row['semester']); ?>"></td>
                                <td><input type="text" name="module" class="form-control" value="<?php echo htmlspecialchars($row['module']); ?>"></td>
                                <td><input type="text" name="qyear" class="form-control" value="<?php echo htmlspecialchars($row['qyear']); ?>"></td>
                                <td>
                                    <select name="university" class="form-control" required>
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
                                    <?php if (!empty($row['qtext'])): ?>
                                        <a href="view_file.php?file=<?php echo htmlspecialchars($row['qtext']); ?>" class="view-file" target="_blank">View Note</a>
                                    <?php else: ?>
                                        <span class="text-muted">No file</span>
                                    <?php endif; ?>
                                    <input type="file" name="qtext" class="file-input">
                                </td>
                                <td>
                                    <input type="hidden" name="id" value="<?php echo $row['approved_id']; ?>">
                                    <button type="submit" name="submit" class="btn btn-primary btn-sm">Update</button>
                                </td>
                            </form>
                            <td>
                                <form method="post" action="delete_note.php" onsubmit="return confirm('Are you sure you want to delete this note?');">
                                    <input type="hidden" name="id" value="<?php echo $row['approved_id']; ?>">
                                    <button type="submit" class="btn btn-danger btn-sm">Delete</button>
                                </form>
                            </td>
                        </tr>
                    <?php } ?>
                </tbody>
            </table>
        <?php else: ?>
            <div class="no-records">
                <p>No notes found. Try changing your filters or add new notes.</p>
            </div>
        <?php endif; ?>
    </div>
</div>

<?php include('footer.php'); ?>
</section>
</section>
<?php
session_start();
if (!isset($_SESSION['username'])) {
    header('Location: login.php');
    exit();
}
include('conn.php');
include('head.php');

// Fetch all unapproved notes (status = 0 or null)
$q = "SELECT * FROM notes_upload WHERE status IS NULL OR status = '1'";
$r = mysqli_query($conn, $q);

// Fetch universities for dropdown
$sql2 = "SELECT id, university_name FROM university";
$uni = $conn->query($sql2);

if (isset($_POST['submit'])) {
    // Retrieve form values
    $note_id = $_POST['note_id'];
    $degree = $_POST['degree'];
    $semester = $_POST['semester'];
    $module = $_POST['module'];
    $title = $_POST['title']; // This will be used as subject in notes table
    $year = $_POST['year'];
    $university = $_POST['university'];
    $original_file = $_POST['original_file'];
    
    // Create destination directory if it doesn't exist
    $dest_dir = 'notes/';
    if (!is_dir($dest_dir)) {
        mkdir($dest_dir, 0777, true);
    }
    
    // Generate new filename
    $file_info = pathinfo($original_file);
    $new_filename = 'note_' . $note_id . '_' . time() . '.' . $file_info['extension'];
    $dest_file = $dest_dir . $new_filename;
    
    // Copy the file to the new location
    if (copy($original_file, $dest_file)) {
        // Update notes_upload table to mark as approved
        $update_query = "UPDATE notes_upload SET status = '0' WHERE id = '$note_id'";
        
        // Insert into notes table
        $current_date = date('Y-m-d H:i:s');
        $insert_query = "INSERT INTO notes (degree, semester, module, subject, qtext, qyear, university, updated_date, nu_id) 
                        VALUES ('$degree', '$semester', '$module', '$title', '$dest_file', '$year', '$university', '$current_date', '$note_id')";
        
        $update_result = mysqli_query($conn, $update_query);
        $insert_result = mysqli_query($conn, $insert_query);
        
        if ($update_result && $insert_result) {
            echo "<script>
                alert('Note approved successfully');
                window.location.href = 'new_notes_upload.php';
            </script>";
        } else {
            echo "<script>
                alert('Error updating database: " . mysqli_error($conn) . "');
                window.location.href = 'new_notes_upload.php';
            </script>";
        }
    } else {
        echo "<script>
            alert('Failed to copy file to destination directory');
            window.location.href = 'new_notes_upload.php';
        </script>";
    }
}
?>

<style>
    table {
        width: 100%;
        border-collapse: collapse;
        margin: 20px 0;
        font-size: 16px;
        text-align: left;
    }
    th, td {
        padding: 10px;
        border-bottom: 1px solid #ddd;
    }
    th {
        background-color: #f2f2f2;
    }
    tr:hover {
        background-color: #f5f5f5;
    }
    button {
        background-color: #4CAF50;
        color: white;
        border: none;
        padding: 8px 16px;
        cursor: pointer;
        border-radius: 4px;
    }
    button.delete {
        background-color: #f44336;
    }
    button:hover {
        opacity: 0.8;
    }
    .form-control {
        width: 100%;
        padding: 6px;
        border: 1px solid #ddd;
        border-radius: 4px;
    }
</style>

<section id="main-content">
    <section class="wrapper">
        <div class="row">
            <div class="col-md-12 mt">
                <div class="content-panel">
                    <h2>New Uploaded Notes</h2>
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th>Title</th>
                                <th>Module</th>
                                <th>Degree</th>
                                <th>Semester</th>
                                <th>Year</th>
                                <th>University</th>
                                <th>File</th>
                                <th>Upload Date</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php 
                            if (mysqli_num_rows($r) > 0) {
                                while ($row = mysqli_fetch_assoc($r)) { 
                            ?>
                                <tr>
                                    <form method="post" action="">
                                        <td><input type="text" name="title" class="form-control" value="<?php echo htmlspecialchars($row['title']); ?>"></td>
                                        <td><input type="text" name="module" class="form-control" value="<?php echo htmlspecialchars($row['module']); ?>"></td>
                                        <td><input type="text" name="degree" class="form-control" value="<?php echo htmlspecialchars($row['degree']); ?>"></td>
                                        <td><input type="text" name="semester" class="form-control" value="<?php echo htmlspecialchars($row['semester']); ?>"></td>
                                        <td><input type="text" name="year" class="form-control" value="<?php echo htmlspecialchars($row['year']); ?>"></td>
                                        <td>
                                            <select name="university" class="form-control" required>
                                                <option value="">Select University</option>
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
                                            <a href="<?php echo htmlspecialchars($row['file']); ?>" target="_blank">View File</a>
                                            <input type="hidden" name="original_file" value="<?php echo htmlspecialchars($row['file']); ?>">
                                        </td>
                                        <td><?php echo htmlspecialchars($row['upload_date']); ?></td>
                                        <td>
                                            <input type="hidden" name="note_id" value="<?php echo $row['id']; ?>">
                                            <button type="submit" name="submit">Approve</button>
                                            <button type="button" onclick="deleteNote(<?php echo $row['id']; ?>)" class="delete">Delete</button>
                                        </td>
                                    </form>
                                </tr>
                            <?php 
                                }
                            } else {
                                echo '<tr><td colspan="9" style="text-align:center;">No new notes to approve</td></tr>';
                            }
                            ?>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </section>
</section>

<script>
function deleteNote(noteId) {
    if (confirm('Are you sure you want to delete this note?')) {
        window.location.href = 'delete_upload_note.php?id=' + noteId;
    }
}
</script>

<?php include('footer.php'); ?>
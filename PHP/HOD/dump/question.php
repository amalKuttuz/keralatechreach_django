<?php

session_start();
if (!isset($_SESSION['username'])) {
    header('Location: login.php');
    exit();
}


include('conn.php');
include('head.php');

$q = "SELECT * FROM question WHERE status = '0'";
$r = mysqli_query($conn, $q);

if (isset($_POST['submit'])) {
    // Retrieve form values
    $question_id = $_POST['question_id'];
    $name = $_POST['name'];
    $email = $_POST['email'];
    $deg = $_POST['deg'];
    $subj = $_POST['subj'];
    $sem = $_POST['sem'];
    $qyear = $_POST['qyear'];
    $qtext = $_POST['qtext'];

    // Debugging: Display alert with the question text
    echo "<script>alert('$qtext');</script>";

    // Check if a file has been uploaded
    if (isset($_FILES['qtext']) && $_FILES['qtext']['error'] == 0) {
        $file = $_FILES['qtext'];
        $filename = $file['name'];
        $filepath = $file['tmp_name'];
        $fileerror = $file['error'];

        if ($fileerror == 0) {
            // Set destination for file upload
            $destfile = 'qtext/' . $filename;

            // Ensure the upload directory exists, if not create it
            if (!is_dir('qtext')) {
                mkdir('qtext', 0777, true);
            }

            // Move the uploaded file to the desired directory
            if (move_uploaded_file($filepath, $destfile)) {
                // Update database query with the file path properly quoted
                $insertquery = "UPDATE question SET name = '$name', email = '$email', deg = '$deg', subj = '$subj', sem = '$sem', qyear = '$qyear', status = '1', qtext = '$destfile' WHERE id = '$question_id'";

                $query = mysqli_query($conn, $insertquery);

                if ($query) {
                    echo "<script>
                        alert('Data updated successfully');
                        window.location.href = 'new_questions.php';
                    </script>";
                } else {
                    echo "<script>
                        alert('Error updating data in the database.');
                        window.location.href = 'new_questions.php';
                    </script>";
                }
            } else {
                echo "<script>
                    alert('Failed to move uploaded file.');
                    window.location.href = 'new_questions.php';
                </script>";
            }
        } else {
            echo "<script>
                alert('File upload error. Code: $fileerror');
                window.location.href = 'new_questions.php';
            </script>";
        }
    } else {
        echo "<script>
            alert('No file uploaded or an error occurred. Error code: " . $_FILES['qtext']['error'] . "');
            window.location.href = 'new_questions.php';
        </script>";
    }
}
?>

<style>
    table {
        width: 100%;
        border-collapse: collapse;
        margin: 20px 0;
        font-size: 18px;
        text-align: left;
    }
    th, td {
        padding: 12px;
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
        padding: 10px 20px;
        cursor: pointer;
    }
    button.delete {
        background-color: #f44336;
    }
    button:hover {
        opacity: 0.8;
    }
</style>

<section id="main-content">
    <section class="wrapper">
        <div class="row">
            <div class="col-md-12 mt">
                <div class="content-panel">
                    <h2>New Questions</h2>
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th>Name</th>
                                <th>Email</th>
                                <th>Degree</th>
                                <th>Subject</th>
                                <th>Semester</th>
                                <th>Year</th>
                                <th>File</th>
                                <th>Text file</th>
                                <th>Accept</th>
                                <th>Delete</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php while ($row = mysqli_fetch_assoc($r)) { ?>
                                <tr>
                                    <form method="post" action="" enctype="multipart/form-data">
                                        <td><input type="text" name="name" value="<?php echo htmlspecialchars($row['name']); ?>"></td>
                                        <td><input type="text" name="email" value="<?php echo htmlspecialchars($row['email']); ?>"></td>
                                        <td><input type="text" name="deg" value="<?php echo htmlspecialchars($row['deg']); ?>"></td>
                                        <td><input type="text" name="subj" value="<?php echo htmlspecialchars($row['subj']); ?>"></td>
                                        <td><input type="text" name="sem" value="<?php echo htmlspecialchars($row['sem']); ?>"></td>
                                        <td><input type="text" name="qyear" value="<?php echo htmlspecialchars($row['qyear']); ?>"></td>
                                        <td><a href="../<?php echo htmlspecialchars($row['file']); ?>" target="_blank">View File</a></td>
                                        <td><input type="file" name="qtext" id="qtext"></td>
                                        <td>
                                            <input type="hidden" name="question_id" value="<?php echo $row['id']; ?>">
                                            <button type="submit" name="submit">Accept</button>
                                        </td>
                                    </form>
                                    <td>
                                        <form method="post" action="delete_question.php" onsubmit="return confirm('Are you sure you want to delete this question?');">
                                            <input type="hidden" name="question_id" value="<?php echo $row['id']; ?>">
                                            <button type="submit" class="delete">Delete</button>
                                        </form>
                                    </td>
                                </tr>
                            <?php } ?>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </section>
</section>

<?php include('footer.php'); ?>

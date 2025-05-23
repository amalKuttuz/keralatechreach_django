<?php
// view_entrance.php

session_start();
if (!isset($_SESSION['username'])) {
    header('Location: login.php');
    exit();
}
include('conn.php');
include('head.php');

$filter_name = filter_input(INPUT_GET, 'name', FILTER_SANITIZE_STRING);
$filter_category = filter_input(INPUT_GET, 'category', FILTER_SANITIZE_STRING);
$filter_deadline = filter_input(INPUT_GET, 'deadline', FILTER_SANITIZE_STRING);

// Get existing entrance notifications with filters
function getEntranceNotifications($filter_name = '', $filter_category = '', $filter_deadline = '')
{
    $notifications = [];
    include('conn.php');
    $q = "SELECT * FROM entrance_notifications WHERE 1=1";

    if (!empty($filter_name)) {
        $q .= " AND entrance_name LIKE '%" . $conn->real_escape_string($filter_name) . "%'";
    }
    if (!empty($filter_category)) {
        $q .= " AND category LIKE '%" . $conn->real_escape_string($filter_category) . "%'";
    }
    if (!empty($filter_deadline)) {
        $q .= " AND deadline_date <= '" . $conn->real_escape_string($filter_deadline) . "'";
    }

    $q .= " ORDER BY deadline_date ASC";
    $result = mysqli_query($conn, $q);

    if ($result) {
        while ($row = $result->fetch_assoc()) {
            $notifications[] = $row;
        }
        $result->close();
    }

    return $notifications;
}

// Handle entrance notification update
if (isset($_POST['update'])) {
    $id = filter_input(INPUT_POST, 'id', FILTER_SANITIZE_NUMBER_INT);
    $entrance_name = filter_input(INPUT_POST, 'entrance_name', FILTER_SANITIZE_STRING);
    $category = filter_input(INPUT_POST, 'category', FILTER_SANITIZE_STRING);
    $deadline_date = filter_input(INPUT_POST, 'deadline_date', FILTER_SANITIZE_STRING);
    $website_url = filter_input(INPUT_POST, 'website_url', FILTER_SANITIZE_URL);

    if (!empty($id) && !empty($entrance_name) && !empty($category) && !empty($deadline_date) && !empty($website_url)) {
        $updateQuery = "UPDATE entrance_notifications SET 
                            entrance_name = ?, 
                            category = ?, 
                            deadline_date = ?, 
                            website_url = ?, 
                            created_at = NOW() 
                        WHERE id = ?";
        $stmt = $conn->prepare($updateQuery);
        $stmt->bind_param("ssssi", $entrance_name, $category, $deadline_date, $website_url, $id);

        if ($stmt->execute()) {
            echo "<script>
                    alert('Entrance notification updated successfully');
                    window.location.href = 'view_entrance.php';
                </script>";
        } else {
            echo "<script>
                    alert('Error updating entrance notification: " . $stmt->error . "');
                    window.location.href = 'view_entrance.php';
                </script>";
        }
        $stmt->close();
    } else {
        echo "<script>
                alert('All fields are required!');
                window.location.href = 'view_entrance.php';
            </script>";
    }
}

$entrance_notifications = getEntranceNotifications($filter_name, $filter_category, $filter_deadline);
?>

<style>
    table {
        width: 100%;
        border-collapse: collapse;
        margin: 20px 0;
        font-size: 18px;
        text-align: left;
    }

    th,
    td {
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

    .filter-form {
        margin-bottom: 20px;
        padding: 15px;
        background-color: #f9f9f9;
        border-radius: 5px;
    }

    .form-control {
        width: 100%;
        padding: 8px;
        margin-bottom: 10px;
        border: 1px solid #ddd;
        border-radius: 4px;
    }
</style>

<section id="main-content">
    <section class="wrapper">
        <div class="row">
            <div class="col-md-12 mt">
                <div class="content-panel">
                    <h2>Entrance Notification Management</h2>
                    <div class="filter-form">
                        <form method="GET" action="">
                            <div class="row">
                                <div class="col-md-4">
                                    <input type="text" id="name" name="name" class="form-control" placeholder="Filter by Name" value="<?php echo htmlspecialchars($filter_name); ?>">
                                </div>
                                <div class="col-md-4">
                                    <input type="text" id="category" name="category" class="form-control" placeholder="Filter by Category" value="<?php echo htmlspecialchars($filter_category); ?>">
                                </div>
                                <div class="col-md-4">
                                    <input type="date" id="deadline" name="deadline" class="form-control" placeholder="Filter by Deadline" value="<?php echo htmlspecialchars($filter_deadline); ?>">
                                </div>
                                <div class="col-md-12 text-center">
                                    <button type="submit" class="btn btn-default">Filter</button>
                                </div>
                            </div>
                        </form>
                    </div>
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th>Entrance Name</th>
                                <th>Category</th>
                                <th>Deadline Date</th>
                                <th>Website URL</th>
                                <th>Created At</th>
                                <th>Update</th>
                                <th>Delete</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php foreach ($entrance_notifications as $notification) : ?>
                                <tr>
                                    <form method="post" action="">
                                        <td><input type="text" name="entrance_name" value="<?php echo htmlspecialchars($notification['entrance_name']); ?>" class="form-control"></td>
                                        <td><input type="text" name="category" value="<?php echo htmlspecialchars($notification['category']); ?>" class="form-control"></td>
                                        <td><input type="date" name="deadline_date" value="<?php echo htmlspecialchars($notification['deadline_date']); ?>" class="form-control"></td>
                                        <td><input type="url" name="website_url" value="<?php echo htmlspecialchars($notification['website_url']); ?>" class="form-control"></td>
                                        <td><?php echo htmlspecialchars($notification['created_at']); ?></td>
                                        <td>
                                            <input type="hidden" name="id" value="<?php echo $notification['id']; ?>">
                                            <button type="submit" name="update">Update</button>
                                        </td>
                                    </form>
                                    <td>
                                        <form method="post" action="delete_entrance.php" onsubmit="return confirm('Are you sure you want to delete this entrance notification?');">
                                            <input type="hidden" name="id" value="<?php echo $notification['id']; ?>">
                                            <button type="submit" class="delete">Delete</button>
                                        </form>
                                    </td>
                                </tr>
                            <?php endforeach; ?>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </section>
</section>

<?php include('footer.php'); ?>
<?php
// view_event.php

session_start();
if (!isset($_SESSION['username'])) {
    header('Location: login.php');
    exit();
}
include('conn.php');
include('head.php');

$filter_place = filter_input(INPUT_GET, 'place', FILTER_SANITIZE_STRING);
$filter_date = filter_input(INPUT_GET, 'date', FILTER_SANITIZE_STRING);
$filter_district = filter_input(INPUT_GET, 'district', FILTER_SANITIZE_NUMBER_INT);
$filter_category = filter_input(INPUT_GET, 'category', FILTER_SANITIZE_NUMBER_INT);

// Get existing events with filters
function getEvents($filter_place = '', $filter_date = '', $filter_district = '', $filter_category = '')
{
    $events = [];
    include('conn.php');
    $q = "SELECT events.*, event_category.category, districts.district 
          FROM events 
          JOIN event_category ON events.category_id = event_category.category_id 
          JOIN districts ON events.district_id = districts.district_id 
          WHERE 1=1";

    if (!empty($filter_place)) {
        $q .= " AND place LIKE '%" . $conn->real_escape_string($filter_place) . "%'";
    }
    if (!empty($filter_date)) {
        $q .= " AND event_start <= '" . $conn->real_escape_string($filter_date) . "' AND event_end >= '" . $conn->real_escape_string($filter_date) . "'";
    }
    if (!empty($filter_district)) {
        $q .= " AND events.district_id = '" . $conn->real_escape_string($filter_district) . "'";
    }
    if (!empty($filter_category)) {
        $q .= " AND events.category_id = '" . $conn->real_escape_string($filter_category) . "'";
    }

    $q .= " ORDER BY event_start DESC";
    $result = mysqli_query($conn, $q);

    if ($result) {
        while ($row = $result->fetch_assoc()) {
            $events[] = $row;
        }
        $result->close();
    }

    return $events;
}

// Fetch districts for the dropdown
$districts = [];
$result = $conn->query("SELECT * FROM districts");
if ($result) {
    while ($row = $result->fetch_assoc()) {
        $districts[] = $row;
    }
    $result->close();
}

// Fetch categories for the dropdown
$categories = [];
$result = $conn->query("SELECT * FROM event_category");
if ($result) {
    while ($row = $result->fetch_assoc()) {
        $categories[] = $row;
    }
    $result->close();
}

// Handle event update
if (isset($_POST['update'])) {
    $id = filter_input(INPUT_POST, 'id', FILTER_SANITIZE_NUMBER_INT);
    $event_start = filter_input(INPUT_POST, 'event_start', FILTER_SANITIZE_STRING);
    $event_end = filter_input(INPUT_POST, 'event_end', FILTER_SANITIZE_STRING);
    $name = filter_input(INPUT_POST, 'name', FILTER_SANITIZE_STRING);
    $place = filter_input(INPUT_POST, 'place', FILTER_SANITIZE_STRING);
    $district_id = filter_input(INPUT_POST, 'district', FILTER_SANITIZE_NUMBER_INT);
    $category_id = filter_input(INPUT_POST, 'category_id', FILTER_SANITIZE_NUMBER_INT);
    $link = filter_input(INPUT_POST, 'link', FILTER_SANITIZE_URL);
    $map_link = filter_input(INPUT_POST, 'map_link', FILTER_SANITIZE_URL);

    if (!empty($id) && !empty($event_start) && !empty($event_end) && !empty($name) && !empty($place) && !empty($district_id) && !empty($category_id)) {
        $updateQuery = "UPDATE events SET 
                            event_start = ?, 
                            event_end = ?, 
                            name = ?, 
                            place = ?, 
                            district_id = ?, 
                            category_id = ?, 
                            link = ?, 
                            map_link = ?, 
                            created_at = NOW() 
                        WHERE id = ?";
        $stmt = $conn->prepare($updateQuery);
        $stmt->bind_param("ssssisssi", $event_start, $event_end, $name, $place, $district_id, $category_id, $link, $map_link, $id);

        if ($stmt->execute()) {
            echo "<script>
                    alert('Event updated successfully');
                    window.location.href = 'view_event.php';
                </script>";
        } else {
            echo "<script>
                    alert('Error updating event: " . $stmt->error . "');
                    window.location.href = 'view_event.php';
                </script>";
        }
        $stmt->close();
    } else {
        echo "<script>
                alert('All fields are required!');
                window.location.href = 'view_event.php';
            </script>";
    }
}

$recent_events = getEvents($filter_place, $filter_date, $filter_district, $filter_category);
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
                    <h2>Event Management</h2>
                    <div class="filter-form">
                        <form method="GET" action="">
                            <div class="row">
                                <div class="col-md-3">
                                    <input type="text" id="place" name="place" class="form-control" placeholder="Filter by Place" value="<?php echo htmlspecialchars($filter_place); ?>">
                                </div>
                                <div class="col-md-3">
                                    <input type="date" id="date" name="date" class="form-control" placeholder="Filter by Date" value="<?php echo htmlspecialchars($filter_date); ?>">
                                </div>
                                <div class="col-md-3">
                                    <select id="district" name="district" class="form-control">
                                        <option value="">Select District</option>
                                        <?php foreach ($districts as $district) : ?>
                                            <option value="<?php echo htmlspecialchars($district['district_id']); ?>" <?php echo ($filter_district == $district['district_id']) ? 'selected' : ''; ?>><?php echo htmlspecialchars($district['district']); ?></option>
                                        <?php endforeach; ?>
                                    </select>
                                </div>
                                <div class="col-md-3">
                                    <select id="category" name="category" class="form-control">
                                        <option value="">Select Category</option>
                                        <?php foreach ($categories as $category) : ?>
                                            <option value="<?php echo htmlspecialchars($category['category_id']); ?>" <?php echo ($filter_category == $category['category_id']) ? 'selected' : ''; ?>><?php echo htmlspecialchars($category['category']); ?></option>
                                        <?php endforeach; ?>
                                    </select>
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
                                <th>Start Date</th>
                                <th>End Date</th>
                                <th>Name</th>
                                <th>Location</th>
                                <th>District</th>
                                <th>Category</th>
                                <th>Website</th>
                                <th>Map Link</th>
                                <th>Update</th>
                                <th>Delete</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php foreach ($recent_events as $event) : ?>
                                <tr>
                                    <form method="post" action="">
                                        <td><input type="date" name="event_start" value="<?php echo htmlspecialchars($event['event_start']); ?>" class="form-control"></td>
                                        <td><input type="date" name="event_end" value="<?php echo htmlspecialchars($event['event_end']); ?>" class="form-control"></td>
                                        <td><input type="text" name="name" value="<?php echo htmlspecialchars($event['name']); ?>" class="form-control"></td>
                                        <td><input type="text" name="place" value="<?php echo htmlspecialchars($event['place']); ?>" class="form-control"></td>
                                        <td>
                                            <select name="district" class="form-control">
                                                <option value="">Select District</option>
                                                <?php foreach ($districts as $district) : ?>
                                                    <option value="<?php echo htmlspecialchars($district['district_id']); ?>" <?php echo ($district['district_id'] == $event['district_id']) ? 'selected' : ''; ?>><?php echo htmlspecialchars($district['district']); ?></option>
                                                <?php endforeach; ?>
                                            </select>
                                        </td>
                                        <td>
                                            <select name="category_id" class="form-control">
                                                <option value="">Select Category</option>
                                                <?php foreach ($categories as $category) : ?>
                                                    <option value="<?php echo htmlspecialchars($category['category_id']); ?>" <?php echo ($category['category_id'] == $event['category_id']) ? 'selected' : ''; ?>><?php echo htmlspecialchars($category['category']); ?></option>
                                                <?php endforeach; ?>
                                            </select>
                                        </td>
                                        <td><input type="text" name="link" value="<?php echo htmlspecialchars($event['link']); ?>" class="form-control"></td>
                                        <td><input type="text" name="map_link" value="<?php echo htmlspecialchars($event['map_link']); ?>" class="form-control"></td>
                                        <td>
                                            <input type="hidden" name="id" value="<?php echo $event['id']; ?>">
                                            <button type="submit" name="update">Update</button>
                                        </td>
                                    </form>
                                    <td>
                                        <form method="post" action="delete_event.php" onsubmit="return confirm('Are you sure you want to delete this event?');">
                                            <input type="hidden" name="id" value="<?php echo $event['id']; ?>">
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
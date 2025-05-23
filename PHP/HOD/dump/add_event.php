<?php
// add_event.php

session_start();
if (!isset($_SESSION['username'])) {
    header('Location: login.php');
    exit();
}
include('conn.php');
include('head.php');

$message = '';
$success = false;

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if ($conn->connect_error) {
        $message = "Connection failed: " . $conn->connect_error;
    } else {
        // Validate and sanitize input
        $event_start = filter_input(INPUT_POST, 'event_start', FILTER_SANITIZE_STRING);
        $event_end = filter_input(INPUT_POST, 'event_end', FILTER_SANITIZE_STRING);
        $district_id = filter_input(INPUT_POST, 'district_id', FILTER_SANITIZE_NUMBER_INT);
        $event_name = filter_input(INPUT_POST, 'event_name', FILTER_SANITIZE_STRING);
        $event_location = filter_input(INPUT_POST, 'event_location', FILTER_SANITIZE_STRING);
        $event_website = filter_input(INPUT_POST, 'event_website', FILTER_SANITIZE_URL);
        $event_map = filter_input(INPUT_POST, 'event_map', FILTER_SANITIZE_URL);
        $event_description = filter_input(INPUT_POST, 'event_description', FILTER_SANITIZE_STRING);
        $category_id = filter_input(INPUT_POST, 'category_id', FILTER_SANITIZE_NUMBER_INT);

        if (!empty($event_name) && !empty($event_location) && !empty($event_website) && !empty($event_map) && !empty($event_description) && !empty($category_id) && !empty($event_start) && !empty($event_end) && !empty($district_id)) {
            $stmt = $conn->prepare("INSERT INTO events (category_id, event_start, event_end, name, place, link, map_link, description, district_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)");
            $stmt->bind_param("isssssssi", $category_id, $event_start, $event_end, $event_name, $event_location, $event_website, $event_map, $event_description, $district_id);

            if ($stmt->execute()) {
                $message = "Event added successfully!";
                echo "<script>
                    alert('Event added successfully!');
                    window.location.href='add_event.php';
                    </script>";
                $success = true;
            } else {
                $message = "Error adding event: " . $stmt->error;
            }
            $stmt->close();
        } else {
            $message = "All fields are required!";
        }
        $conn->close();
    }
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
?>

<section id="main-content">
    <section class="wrapper">
        <div class="row">
            <div class="col-md-12 mt">
                <div class="content-panel">
                    <div class="panel-heading">
                        <h4><i class="fa fa-calendar"></i> Event Management</h4>
                    </div>
                    <div class="">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-panel">
                                    <h4 class="mb"><i class="fa fa-plus-circle"></i> Add New Event</h4>
                                    <form class="form-horizontal style-form" method="POST" action="">
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">Event Start</label>
                                            <div class="col-sm-9">
                                                <input type="date" class="form-control" id="event_start" name="event_start" required>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">Event End</label>
                                            <div class="col-sm-9">
                                                <input type="date" class="form-control" id="event_end" name="event_end" required>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">District</label>
                                            <div class="col-sm-9">
                                                <select class="form-control" id="district_id" name="district_id" required>
                                                    <option value="">Select District</option>
                                                    <?php foreach ($districts as $district) : ?>
                                                        <option value="<?php echo htmlspecialchars($district['district_id']); ?>"><?php echo htmlspecialchars($district['district']); ?></option>
                                                    <?php endforeach; ?>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">Event Name</label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control" id="event_name" name="event_name" placeholder="Enter event name" required>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">Event Category</label>
                                            <div class="col-sm-9">
                                                <select class="form-control" id="category_id" name="category_id" required>
                                                    <option value="">Select Category</option>
                                                    <?php foreach ($categories as $category) : ?>
                                                        <option value="<?php echo htmlspecialchars($category['category_id']); ?>"><?php echo htmlspecialchars($category['category']); ?></option>
                                                    <?php endforeach; ?>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">Event Location</label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control" id="event_location" name="event_location" placeholder="Enter event location" required>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">Event Website</label>
                                            <div class="col-sm-9">
                                                <input type="url" class="form-control" id="event_website" name="event_website" placeholder="https://example.com" required>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">Event Map</label>
                                            <div class="col-sm-9">
                                                <input type="url" class="form-control" id="event_map" name="event_map" placeholder="https://maps.google.com/..." required>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">Description</label>
                                            <div class="col-sm-9">
                                                <textarea class="form-control" id="event_description" name="event_description" rows="4" placeholder="Event description" required></textarea>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-sm-offset-3 col-sm-9">
                                                <button type="submit" class="btn btn-primary"><i class="fa fa-save"></i> Add Event</button>
                                                <button type="reset" class="btn btn-default"><i class="fa fa-refresh"></i> Reset</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</section>

<?php
include('footer.php');
?>
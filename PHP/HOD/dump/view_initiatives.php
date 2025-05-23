<?php
// view_initiatives.php
session_start();
if (!isset($_SESSION['username'])) {
    header('Location: login.php');
    exit();
}
include('conn.php');
include('head.php');

$query = "SELECT * FROM initiatives";
$result = mysqli_query($conn, $query);
?>

<!DOCTYPE html>
<html>
<head>
    <title>View Initiatives</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        table, th, td {
            border: 1px solid black;
        }
        th, td {
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        .form-group { margin-bottom: 15px; }
        label { display: block; margin-bottom: 5px; }
        input[type="text"], textarea {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
        }
        button { padding: 10px 20px; }
    </style>
</head>
<body>

<section id="main-content">
      <section class="wrapper">
        <div class="row">
          <div class="col-lg-9">

    <h2>View and Update Initiatives</h2>
    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Description</th>
            <th>Eligibility</th>
            <th>Website URL</th>
            <th>Action</th>
        </tr>
        <?php
        while ($row = mysqli_fetch_assoc($result)) {
            echo "<tr>";
            echo "<td>" . htmlspecialchars($row['id']) . "</td>";
            echo "<td>" . htmlspecialchars($row['name']) . "</td>";
            echo "<td>" . htmlspecialchars($row['description']) . "</td>";
            echo "<td>" . htmlspecialchars($row['eligibility']) . "</td>";
            echo "<td>" . htmlspecialchars($row['website_url']) . "</td>";
            echo "<td><a href='update_initiatives.php?id=" . htmlspecialchars($row['id']) . "'>Update</a></td>";
            echo "</tr>";
        }
        ?>
    </table>

    </div>
    </div>
    </section>
    </section>
</body>
</html>

<?php
include('footer.php');
?>
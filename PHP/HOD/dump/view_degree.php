<?php

session_start();
if (!isset($_SESSION['username'])) {
    header('Location: login.php');
    exit();
}
include('conn.php');
include('head.php');

$q = "SELECT * FROM degree GROUP BY degree_name";
$r = mysqli_query($conn, $q);

?>

<section id="main-content">
    <section class="wrapper">
        <div class="row">
		<div class="col-md-12 mt">
            <div class="content-panel">
              <table class="table table-hover">
                <tr>
                    <th>Degree</th>
                    <th>University number</th>
                    <th>Number of Semester</th>
                    <th>Delete</th>
                </tr>
                <?php while ($row = mysqli_fetch_assoc($r)) { ?>
                    <tr>
                        <td><?php echo htmlspecialchars($row['degree_name']); ?></td>
                        
                        <td><?php echo htmlspecialchars($row['university_id']); ?></td>
                        <td>
                            <form method="post" action="delete_degree.php">
                                <input type="hidden" name="degree_id" value="<?php echo $row['id']; ?>">
                                <button type="submit">Delete</button>
                            </form>
                        </td>
                    </tr>
                <?php } ?>
            </table>
			</div>
		</div>
        </div>
    </section>
</section>

<?php
include('footer.php');
?>
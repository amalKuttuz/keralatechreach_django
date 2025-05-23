<?php include('conn.php'); ?>
<?php include('head.php'); ?>

<form id="filterForm" action="get_pdf.php" method="GET">
  <label for="degree">Degree:</label>
  <select name="degree" id="degree" class="form-controller" required>
    <?php include 'degree_options.php'; ?>
  </select>

  <label for="semester">Semester:</label>
  <select name="semester" id="semester" class="form-controller" required>
    <option value="0">Select Semester</option>
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

  <button type="submit">Submit</button>
</form>

<?php include('footer.php'); ?>

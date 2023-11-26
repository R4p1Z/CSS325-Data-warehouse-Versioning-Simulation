<?php
  session_start();
  require_once 'connect.php';
?>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <link rel="stylesheet" href="style.css">
</head>
<body>
  <div class="container">
    <h2>Data Warehouse Versioning Simulator</h2>
    <div class="columns">
      <form method="post" action="addDprocess.php">
        <div class="column">
          <h3>Add dimension level</h3>
          <label for="addDL1">Query box:</label>
          <input type="text" id="addDL1" name="addDL1" placeholder="pls fill in">
          <div>
            <input type="submit" class="button btn-small" value="submit">
          </div>
        </div>
      </form>

      <form method="post" action="addDprocess.php">
        <div class="column">
          <h3>Add dimension table</h3>
          <label for="addD2">Query box:</label>
          <input type="text" id="Dname" name="Dname" placeholder="pls fill the dimension name">
          <input type="text" id="addD2" name="addD2" placeholder="pls query a new dimension">
          <div>
            <input type="submit" class="button btn-small" value="submit">
          </div>
        </div>
      </form>

      <div class="column">
        <h3>Update dimension level</h3>
        <label for="upDL1">Query box:</label>
        <input type="text" id="upDL1" name="upDL1" placeholder="pls fill in">
        <div>
          <input type="submit" class="button btn-small" value="submit">
        </div>
      </div>

      <div class="column">
        <h3>Update dimension table</h3>
        <label for="upD2">Query box:</label>
        <input type="text" id="upD2" name="upD2" placeholder="pls fill in">
        <div>
          <input type="submit" class="button btn-small" value="submit">
        </div>
      </div>

      <div class="column">
        <h3>Delete dimension level</h3>
        <label for="delDL1">Query box:</label>
        <input type="text" id="delDL1" name="delDL1" placeholder="pls fill in">
        <div>
          <input type="submit" class="button btn-small" value="submit">
        </div>
      </div>

      <div class="column">
        <h3>Delete dimension table</h3>
        <label for="delD2">Query box:</label>
        <input type="text" id="delD2" name="delD2" placeholder="pls fill in">
        <div>
          <input type="submit" class="button btn-small" value="submit">
        </div>
      </div>
      
      <div class="column">
        <form method="post" action="jump.php">
          <label for="dropdown">Select an option:</label>
            <select id="dropdown" name="dropdown">
              <?php
                $sql = "SELECT verNum FROM `ver_tab`;";
                $result = $connection->query($sql);

                while ($row = $result->fetch_assoc()) {
                  echo "<option value=\"" . $row['verNum'] . "\">Version " . $row['verNum'] . "</option>";
                }
              ?>
            </select>
            <input type="submit" class="button btn-small" value="Submit Version">
        </form>
      </div>
    </div>
  </div>
</body>
</html>

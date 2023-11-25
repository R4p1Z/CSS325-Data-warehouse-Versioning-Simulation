<?php
  session_start();
  require_once 'connect.php';

  if(isset($_POST) && !empty($_POST)) {

    $addDimsql = $_POST['addD2'];
    $addDimres = mysqli_query($connection, $addDimsql);
  }

  $count = "SELECT COUNT(*) AS RowCount FROM information_schema.tables WHERE table_schema = 'dw_sim' AND table_name NOT IN ('revenue', 'change_tab', 'ver_tab')";
  $result = mysqli_query($connection, $count);
  $row = $result->fetch_assoc();
  $rowCount = $row['RowCount'];
  $Did = $rowCount;
  $now = new DateTime();
  $time_stamp = $now->format('Y-m-d H:i:s');
  $Dimname = $_POST['Dname'];
  echo $Dimname;
  echo $Did;
  echo $time_stamp;

  $set = "ALTER TABLE $Dname ADD COLUMN Did INT(11) DEFAULT '$Did', time_stamp DATETIME DEFAULT '$time_stamp'";
  $setsql = mysqli_query($connection, $set);

  //"CREATE TABLE customer (ID INT PRIMARY KEY, Attribute1 VARCHAR(255), Attribute2 VARCHAR(255), Attribute3 VARCHAR(255), Attribute4 VARCHAR(255)) VALUES (1, 'Value1', 'Value2', 'Value3', 'Value4'), (2, 'Value5', 'Value6', 'Value7', 'Value8');"
?>
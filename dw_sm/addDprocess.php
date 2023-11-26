<?php
  require_once 'connect.php';

  if(isset($_POST) && !empty($_POST)) {

    $addDimsql = $_POST['addD2'];
    $addDimres = mysqli_query($connection, $addDimsql);

    $count = "SELECT COUNT(*) AS RowCount FROM information_schema.tables WHERE table_schema = 'dw_sim' AND table_name NOT IN ('revenue', 'change_tab', 'ver_tab')";
    $result = mysqli_query($connection, $count);
    $row = $result->fetch_assoc();
    $rowCount = $row['RowCount'];
    $Did = $rowCount;
    
    
    date_default_timezone_set('Asia/Bangkok');
    $now = new DateTime();
    $time_stamp = $now->format('Y-m-d H:i:s');
    $Dimname = $_POST['Dname'];
    echo $Dimname;
    echo $Did;
    echo $time_stamp;

    $setDid = "ALTER TABLE `$Dimname` ADD `Did` INT(11) NOT NULL;";
    $setsql = mysqli_query($connection, $setDid);
    $settsm = "ALTER TABLE `$Dimname` ADD `time_stamp` DATETIME NOT NULL;";
    $setTsql = mysqli_query($connection, $settsm);

    $countVer = "SELECT COUNT(*) AS numVer FROM `ver_tab`;";
    $countres = mysqli_query($connection, $countVer);
    $counter = $countres->fetch_assoc();
    $verNum = $counter['numVer'];
    $verNum = $verNum + 1;
    echo $verNum;

    $addVer = "INSERT INTO `ver_tab` (`verNum`, `time_stamp`) VALUES ('$verNum', '$time_stamp');";
    $addVerReal = mysqli_query($connection, $addVer);

    $DLname = $connection->query("DESCRIBE $Dimname");
    while ($row = $result->fetch_assoc()) {
      echo $row['Field'] . ", ";
    }
  }
  //header('location: home.php');
?>
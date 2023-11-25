<?php
  require_once 'connect.php';

// Query to fetch data from the database
$sql = "SELECT c FROM gg";
$result = $connection->query($sql);

// Check if there are rows in the result set
if ($result->num_rows > 0) {
    // Initialize an array to store the data
    $data = array();

    // Fetch data from each row and add it to the array
    while ($row = $result->fetch_assoc()) {
        $data[] = json_decode($row['c'], true); // Assuming 'c' is the JSON column
    }

    // Encode the array as a JSON string
    $json_data = json_encode($data);

    // Output the JSON data
    echo $json_data;
} else {
    echo "No data found.";
}

// Close the database connection
$conn->close();

?>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
</head>
<body>
  <input type="text" name="box">
  <input type="submit" name="button">
</body>
</html>
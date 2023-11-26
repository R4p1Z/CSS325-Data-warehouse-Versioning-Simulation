<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Version Selector</title>
</head>
<body>
    <form action="process.php" method="post">
        <label for="version">Select Version:</label>
        <select name="version" id="version">
            <?php
            // Connect to your MySQL database (replace with your actual connection details)
            $servername = "your_servername";
            $username = "your_username";
            $password = "your_password";
            $dbname = "your_dbname";

            $conn = new mysqli($servername, $username, $password, $dbname);

            // Check connection
            if ($conn->connect_error) {
                die("Connection failed: " . $conn->connect_error);
            }

            // Fetch version numbers from the database
            $sql = "SELECT version_number FROM versions";
            $result = $conn->query($sql);

            // Populate the dropdown with version numbers
            while ($row = $result->fetch_assoc()) {
                echo "<option value=\"" . $row['version_number'] . "\">Version " . $row['version_number'] . "</option>";
            }

            // Close the database connection
            $conn->close();
            ?>
        </select>
        <input type="submit" value="Submit">
    </form>
</body>
</html>

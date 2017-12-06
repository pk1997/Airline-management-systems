<html>
    <body>
        <head>
<link rel="stylesheet" type="text/css" href="table.css">
</head>  
        

<?php
$servername = "localhost";
$username = "root";
$password = "1234";
$dbname = "flight db";
$city = $_POST["city"];
        

// Create connection
$conn = new mysqli("localhost","root","1234","flight db");
// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
} 

$result = mysqli_query($conn, "CALL getFlightsByCity('$city');") or die("Query fail :" .mysqli_error());
?>
        <table class="container"><tr><th>city</th><th>date</th><th>origin</th><th>airline</th><th>dep_time</th><th>destination</th></tr>

<?php if ($result->num_rows > 0) {
    
    // output data of each row
    while($row = $result->fetch_assoc()) {
        echo "<tr><td>" . $row["city"]. "</td><td>" . $row["d_date"]. "</td><td> " . $row["origin"]. "</td><td>" . $row["airline"]. "</td><td>" . $row["d_time"]."</td><td>" . $row["destination"] ."</td></tr>";
    }
    
} else {
    echo "0 results";
}
        

$conn->close();
?> 
            </table>
        
    </body>
</html>
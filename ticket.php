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
$email = $_POST["email"];
#$city1 = $_POST["city2"];
        

// Create connection
$conn = new mysqli("localhost","root","1234","flight db");
// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
} 

$result = mysqli_query($conn, "call ticket('$email')") or die("Query fail :" .mysqli_error());
        ?>
        <table class="container"><tr><th>fname</th><th>lname</th><th>TicketNo</th><th>DepDate</th><th>Destination</th><th>Origin</th></tr>
<?php
if ($result->num_rows > 0) {
    
    // output data of each row
    while($row = $result->fetch_assoc()) {
        echo "<tr><td>" . $row["fname"]. "</td><td>" . $row["lname"]. "</td><td> " . $row["ticketid"]. "</td><td>" . $row["date"] . "</td><td>" . $row["origin"]. "</td><td>" . $row["destination"]."</td></tr>";
    }
    echo "</table>";
} else {
    echo "<h1>No ticket Found</h1>";
}
        

$conn->close();
?> 
        </table>
        <h1>To Book A Seat</h1>
        <a href="book.html"><h1>click here</h1></a>
        
        <h2> Please Remember The FlightId</h2>
    </body>
</html>
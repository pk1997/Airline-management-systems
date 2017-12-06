`<html>
    <body>
        <head>
<link rel="stylesheet" type="text/css" href="table.css">
</head>         


<?php
$servername = "localhost";
$username = "root";
$password = "1234";
$dbname = "flight db";
$email = $_POST["city"];
#$city1 = $_POST["city2"];
        

// Create connection
$conn = new mysqli("localhost","root","1234","flight db");
// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
} 

$result1 = mysqli_query($conn, "delete from booking where ticketid='$email';") or die("Query fail :" .mysqli_error());
$result  = mysqli_query($conn, "select * from canceled where ticketid='$email';") or die("Query fail: " .mysqli_error());        
        


$conn->close();
?> 
        <table class="container"><tr><th>TicketId</th><th>FlightID</th><th>fname</th><th>lname</th><th>Date</th><th>seatno</th><th>Email</th></tr>
<?php
if ($result->num_rows > 0) {
    
    // output data of each row
    while($row = $result->fetch_assoc()) {
        
        echo "<h1> Cancelled successfully</h1> <tr><td>" . $row["ticketid"]. "</td><td>" . $row["fid"]. "</td><td> " . $row["fname"]. "</td><td>" . $row["lname"] . "</td><td>" . $row["date"]. "</td><td>" . $row["seatno"]."</td><td>" . $row["email"] . "</td></tr>";
    }
    echo "</table>";
} else {
    echo "<h1>No tickets found</h1>";
}
 ?>       

        </table>        
        <h1></h1>
        <h1>To Book A Seat</h1>
        <a href="query2.html"><h1>click here</h1></a>
        <!--<h2> Please Remember The FlightId</h2>-->
    </body>
</html>
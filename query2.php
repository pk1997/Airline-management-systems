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
$city1 = $_POST["city2"];
        

// Create connection
$conn = new mysqli("localhost","root","1234","flight db");
// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
} 

$result = mysqli_query($conn, "SELECT a1.city, a1.name as origin, flight.fid as FlightId,d_date,
			a2.name as destination, d_time, airline.name as airline, flight.price
	FROM flight, route, airport as a1, airport as a2, airline
	WHERE a1.city = '$city'
    AND a2.city = '$city1'
   
	AND flight.r_id = route.rid
	AND route.d_airport = a1.airport_id
	AND route.arr_airport = a2.airport_id
    AND flight.al_id=airline.alid") or die("Query fail :" .mysqli_error());
        ?>
        <table class="container"><tr><th>city</th><th>origin</th><th>FlightId</th><th>DepDate</th><th>Destination</th><th>Departure Time</th><th>Airline</th><th>price</th></tr>
<?php
if ($result->num_rows > 0) {
    
    // output data of each row
    while($row = $result->fetch_assoc()) {
        echo "<tr><td>" . $row["city"]. "</td><td>" . $row["origin"]. "</td><td> " . $row["FlightId"]. "</td><td>" . $row["d_date"] . "</td><td>" . $row["destination"]. "</td><td>" . $row["d_time"]."</td><td>" . $row["airline"] . "</td><td>" . $row["price"]. "</td></tr>";
    }
    echo "</table>";
} else {
    echo "<h2>No Flights</h2>";
}
        

$conn->close();
?> 
        </table>
        <h1>To Book A Seat</h1>
        <a href="book.html"><h1>click here</h1></a>
        <h2> Please Remember The FlightId</h2>
    </body>
</html>
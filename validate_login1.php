
<!DOCTYPE html>
<html>
<head>
	<title>Validate</title>
	<link rel="stylesheet" href="mystyle.css">
</head>
<body>
<?php

// Grab User submitted information
$username = $_POST["username"];
$pass = $_POST["password"];

// Connect to the database
$con = mysqli_connect("localhost","root","1234","flight db");
// Make sure we connected successfully
if(! $con)
{
    die('Connection Failed'.mysqli_error());
}
 
$result = mysqli_query($con,"SELECT mail, password FROM passenger WHERE mail= '$username'");
$row = mysqli_fetch_array($result);
#$link = new2.html
?>

<!--Login Success-->

<?php if ($row["mail"]==$username && $row["password"]==$pass): ?>
	<div class="login">
		<h1>Welcome!</h1>
		<h2>Start booking your tickets <a href="query2.html" style="color: white"> click here</a></h2>
        <h3><a href="view1.html" style="color: white">View My Bookings</a></h3>
        <h3><a href="cancel.html" style="color: white">cancel ticket</a></h3>
        
	</div>

<!--Login Fail-->
<?php else: ?>
	<div class="login">
		<h1>There seems to be an error! You have entred Incorrect credentials</h1>
		<h2>Try <a href="login.html" style="color: white">login again</a> or <a href="register.html" style="color: white">register here</a></h2>
	</div>
<?php endif; ?>



</body>
</html>
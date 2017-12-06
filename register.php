<html>
<body>
 <head>
<link rel="stylesheet" type="text/css" href="mystyle.css">
</head>
<?php
$con = mysqli_connect("localhost","root","1234","flight db");
if (!$con)
  {
  die('Could not connect: ' . mysqli_error());
  }
 

 
$sql="INSERT INTO passenger (fname, lname, mail, password)
VALUES
('$_POST[fname]','$_POST[lname]','$_POST[mail]','$_POST[password]')";

if (!mysqli_query($con,$sql))
  {
  die('Error: ' . mysqli_error($con));
  }
echo "<h2>registered successfully</h2>";
 
mysqli_close($con)
?>
<h1>To Login</h1>    
<h2><a href="login.html">Click Here</a></h2>    
</body>
</html>
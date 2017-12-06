<html>
<body>

 
<?php
$con = mysqli_connect("localhost","root","1234","flight db");
if (!$con)
  {
  die('Could not connect: ' . mysqli_error());
  }
 $fid=$_POST['password'];
 $lname=$_POST['fname'];
 $fname=$_POST['lname'];    
 
$sql="INSERT INTO booking (fname, lname, email, seatno, fid, date)
VALUES
('$_POST[fname]','$_POST[lname]','$_POST[mail]','$_POST[age]','$_POST[password]','$_POST[date]')";

$result = mysqli_query($con, "CALL update1($fid);") or die("Query fail :" .mysqli_error());

if (!mysqli_query($con,$sql))
  {
  die('Error: ' . mysqli_error($con));
  }
echo "booked successfully";
 
mysqli_close($con)
?>
    <head>
    <title>login</title>
    <link rel="stylesheet" href="mystyle.css">
</head>
    <body>
<div class="login">
	<h1>Enter email id to view ticket</h1>
    <form method="post" action="ticket.php">
    	<input type="email" name="email" id="email" placeholder="email" required="required" />
       <!-- <input type="password" name="password" id="password" placeholder="password" required="required" />-->
        <button type="submit" class="btn btn-primary btn-block btn-large">Download Ticket</button>
    </form>
    <a href="book.html"><h1>Book again</h1></a>
    
</div>
        </body>  </body>
    </html>
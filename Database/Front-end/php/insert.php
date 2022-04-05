<?php
// database connection code
// $con = mysqli_connect('localhost', 'database_user', 'database_password','database');

$con = mysqli_connect('localhost', 'root', '','testforms');

// get the post records
$txtName = $_POST['username'];
$txtEmail = $_POST['email'];
$txtPhone = $_POST['phone'];

// database insert SQL code
$sql = "INSERT INTO `tbltest` (`username`, `email`, `phone`) VALUES ('$txtName', '$txtEmail', '$txtPhone')";

// insert in database 
$rs = mysqli_query($con, $sql);

if($rs)
{
	echo "Contact Records Inserted";
}



//THIS IS ENTIRELY FOR TESTING PURPOSES
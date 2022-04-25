<?php
// database connection code
// $con = mysqli_connect('localhost', 'database_user', 'database_password','database');

$con = mysqli_connect('localhost', 'root', '','Griffin');

// get the post records
$fname = $_POST['fname'];
$sname = $_POST['sname'];
$dob = $_POST['dob'];
$phoneNo = $_POST['phone'];
$email = $_POST['email'];

// database insert SQL code
$sql = "INSERT INTO `Member`(`FirstName`, `Surname`, `DOB`, `PhoneNo`, `Email`) values ('$fname', '$sname', '$dob', '$phoneNo', '$email')";

// insert in database 
if (strlen($phoneNo) >= 13){
	$rs = mysqli_query($con, $sql);//mysqli_query performs queries in a database
	if($rs){
		echo "Member Added Successfully";
	}else{
		echo "Error! Invalid data may have been entered!";
	}
}else{
	echo "Error! Invalid data may have been entered!";
}




//THIS IS ENTIRELY FOR TESTING PURPOSES
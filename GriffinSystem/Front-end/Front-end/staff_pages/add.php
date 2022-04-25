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
$dept = $_POST['deptID'];

// database insert SQL code
$sql = "INSERT INTO `Staff`(`FirstName`, `Surname`, `Email`, `PhoneNumber`, `dob`, `DepartmentID`) values ('$fname', '$sname', '$email', '$phoneNo', '$dob', '$dept')";

// insert in database 
if (strlen($phoneNo) >= 13){
	$rs = mysqli_query($con, $sql);//mysqli_query performs queries in a database
	if($rs){
		echo "Staff Added Successfully";
	}else{
		echo "Error! Invalid data may have been entered!";
	}
}else{
	echo "Error! Invalid data may have been entered!";
}







//THIS IS ENTIRELY FOR TESTING PURPOSES
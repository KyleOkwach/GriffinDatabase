<?php
// database connection code
// $con = mysqli_connect('localhost', 'database_user', 'database_password','database');

$con = mysqli_connect('localhost', 'root', '','Griffin');

// get the post records
$dept = $_POST['deptname'];


// database insert SQL code
$sql = "INSERT INTO `Department`(`DepartmentName`) values ('$dept')";

// insert in database 
$rs = mysqli_query($con, $sql);//mysqli_query performs queries in a database

if($rs)
{
	echo "Department Added Successfully";
}




//THIS IS ENTIRELY FOR TESTING PURPOSES
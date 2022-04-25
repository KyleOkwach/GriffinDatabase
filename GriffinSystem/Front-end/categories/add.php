<?php
// database connection code
// $con = mysqli_connect('localhost', 'database_user', 'database_password','database');

$con = mysqli_connect('localhost', 'root', '','Griffin');

// get the post records
$catname = $_POST['catname'];
$desc = $_POST['description'];


// database insert SQL code
$sql = "INSERT INTO `Category`(`CategoryName`, `Description`) values ('$catname', '$desc')";

// insert in database 
$rs = mysqli_query($con, $sql);//mysqli_query performs queries in a database

if($rs)
{
	echo "Category Added Successfully";
}




//THIS IS ENTIRELY FOR TESTING PURPOSES
<?php
// $con = mysqli_connect('localhost', 'username', 'user password','database');

$con = mysqli_connect('localhost', 'root', '','griffin');//forms a connection to the database

// gets the input posted from the html form
$pid = $_POST['pid'];
$bookID = $_POST['bookid'];
$memberID = $_POST['memberid'];
$dateBorrowed = curdate();
$dateReturned = curdate();

// MySQL code to be inserted
$sql = "INSERT INTO `Returned Books` (`PeriodCode`,`BookID`, `MemberID`, `DateBorrowed`, `DateReturned`) VALUES ('$pid','$bookID', '$memberID', '$dateBorrowed', '$dateReturned')";


// insert in database 
$rs = mysqli_query($con, $sql);

if($rs)
{
	
	echo "Book returned successfully";
}
else{
	echo "Member has an overdue book! $count";
}

function curdate() {
	//Returns the current date
    return date('Y-m-d');
}
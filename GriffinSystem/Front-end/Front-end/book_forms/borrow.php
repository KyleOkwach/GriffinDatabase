<?php
// $con = mysqli_connect('localhost', 'username', 'user password','database');

$con = mysqli_connect('localhost', 'root', '','griffin');//forms a connection to the database
$con2 = mysqli_connect('localhost', 'root', '','griffin');//second connection to check if member has overdue book

// gets the input posted from the html form
$bookID = $_POST['bookid'];
$memberID = $_POST['memberid'];
$dateBorrowed = curdate();
$dateDue = date_due();

// MySQL code to be inserted
$sql = "INSERT INTO `Books Borrowed` (`BookID`, `MemberID`, `DateBorrowed`, `DateDue`) VALUES ('$bookID', '$memberID', '$dateBorrowed', '$dateDue')";
$check = "call has_overdue($memberID)";

// insert in database 
$overdue = mysqli_query($con, $check);
$count = mysqli_num_rows($overdue);

if($count <= 0)
{
	$rs = mysqli_query($con2, $sql);
	echo "Book borrowed successfully";
}
else{
	echo "Member has an overdue book! $count";
}

function curdate() {
	//Returns the current date
    return date('Y-m-d');
}
function date_due() {
    return date('Y-m-d', strtotime(curdate(). ' + 7 days'));
}
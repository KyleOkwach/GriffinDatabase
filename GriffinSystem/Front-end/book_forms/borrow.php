<?php
// $con = mysqli_connect('localhost', 'username', 'user password','database');

$con = mysqli_connect('localhost', 'root', '','griffin');//forms a connection to the database

// gets the input posted from the html form
$bookID = $_POST['bookname'];
$memberID = $_POST['isbn'];
$dateBorrowed = $_POST['author'];
$dateDue = $_POST['publisher'];

// MySQL code to be inserted
$sql = "INSERT INTO `book` (`bookname`, `isbn`, `author`, `publisher`, `dop`, `date added`,`cost`, `donated`, `condition(New)` ,`categoryname`) VALUES ('$bookName', '$ISBN', '$author', '$publisher', '$dop', '$dateAdded','$cost', '$isdonated', '$condition', '$category')";

// insert in database 
$rs = mysqli_query($con, $sql);

if($rs)
{
	echo "Book added successfully";
}

function curdate() {
	//Returns the current date
    return date('Y-m-d');
}
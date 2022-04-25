<?php
//establishing connection between site and database
$con = mysqli_connect('localhost', 'root', '','griffin');

//variables
$bid = $_POST['bid'];



$state = "call check_condition($bid);";//calls a stored procedure
$sql = mysqli_query($con, $state);  
$count = mysqli_affected_rows($con);

//check if connection and input is successful
if ($count > 0){
    echo "The book is in good condition";
} else{
    echo "The book is in poor condition";
}
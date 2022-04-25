<?php
//establishing connection between site and database
$con = mysqli_connect('localhost', 'root', '','griffin');

//variables
$username = $_POST['username'];
$password = $_POST['password'];


$cred_compare = "call pass_check('$username', '$password');";
$query = mysqli_query($con, $cred_compare);  
$count = mysqli_affected_rows($con);

//check if connection and input is successful
if ($count > 0){
    header("Location: ../menu.html");
} else{
    echo '
    <script type="text/javascript">
        alert("Wrong credentials entered. \nClick okay to be directed back..");
        window.location = "../login.html";
    </script>';
    //echo("Login Unsuccessfull");
    //echo(" There is $count matching credential in the system.");
}
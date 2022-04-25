<?php
// $con = mysqli_connect('localhost', 'username', 'user password','database');

$con = mysqli_connect('localhost', 'root', '','griffin');//forms a connection to the database

$staffID = $_POST['staffid'];

// MySQL code to be inserted
$sql = "call staff_card($staffID)";

// insert in database 
$rs = mysqli_query($con, $sql);
$row = mysqli_fetch_array($rs);

if (!is_null($row)){
    //ID page generated
    $surname = $row['Surname'];
    $firstName = $row['FirstName'];
    $department = $row['DepartmentName'];
    $dob = $row['DOB'];

    echo "
    <link rel='stylesheet' type='text/css' href='../report.css'>
    <script src='https://kit.fontawesome.com/e17d9bd247.js' crossorigin='anonymous'></script>
    <div class='staff-container'>
    <center>
        <div class='heading'>
            <h1>GriffLib <i class='fa-brands fa-d-and-d'></i></h1>
            <h2>Staff ID</h2>
        </div>
    </center>
    <hr>
        <div class='content'>
            <div class='text-fields'>
                <div class='row'>
                    StaffID: <u>$staffID</u>
                </div>
                <div class='row'>
                    Name: <u>$firstName $surname</u>
                </div>
                <div class='row'>
                    Department: <u>$department</u>
                </div>
                <div class='row'>
                Date of birth: <u>$dob</u>
            </div>
            </div>
            <img src='../../QR/Generator/qrcodes/staff/S$staffID.png' class='qr-code'>
        </div>
        <br>
    <center><i>Griffin libraries</i></center>
    </div>
    ";
} else if (is_null($row)){
    echo "
    <link rel='stylesheet' type='text/css' href='../report.css'>
    <alert>Member not found in database!</alert>
    ";
}

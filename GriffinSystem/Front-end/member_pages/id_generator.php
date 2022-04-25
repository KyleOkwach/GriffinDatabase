<?php
// $con = mysqli_connect('localhost', 'username', 'user password','database');

$con = mysqli_connect('localhost', 'root', '','griffin');//forms a connection to the database

$memberID = $_POST['memberid'];
$dateIssued = curdate();
$expiryDate = exp_date();

// MySQL code to be inserted
$sql = "call member_card($memberID)";

// insert in database 
$rs = mysqli_query($con, $sql);
$row = mysqli_fetch_array($rs);

if (!is_null($row)){
    //ID page generated
    $surname = $row['Surname'];
    $firstName = $row['FirstName'];

    echo "
    <link rel='stylesheet' type='text/css' href='../report.css'>
    <script src='https://kit.fontawesome.com/e17d9bd247.js' crossorigin='anonymous'></script>
    <div class='container'>
    <center>
        <div class='heading'>
            <h1>GriffLib <i class='fa-brands fa-d-and-d'></i></h1>
            <h2>Member ID</h2>
        </div>
    </center>
    <hr>
        <div class='content'>
            <div class='text-fields'>
                <div class='row'>
                    Member ID: <u>$memberID</u>
                </div>
                <div class='row'>
                    Name: <u>$firstName $surname</u>
                </div>
                <div class='row'>
                    Date issued: <u>$dateIssued</u>
                </div>
                <div class='row'>
                Expiry date: <u>$expiryDate</u>
            </div>
            </div>
            <img src='../../QR/Generator/qrcodes/member/M$memberID.png' class='qr-code'>
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


function curdate() {
	//Returns the current date
    return date('Y-m-d');
}

function exp_date() {
    return date('Y-m-d', strtotime(curdate(). ' + 5 years'));
}
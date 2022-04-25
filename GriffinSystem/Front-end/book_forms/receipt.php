<?php

$con = mysqli_connect('localhost', 'root', '','griffin');

$pid = $_POST['pid'];

$sql = "call borrow_receipt($pid)";

$rs = mysqli_query($con, $sql);

$row = mysqli_fetch_array($rs);

echo "
	<link rel='stylesheet' type='text/css' href='../report.css'>
    <script src='https://kit.fontawesome.com/e17d9bd247.js' crossorigin='anonymous'></script>
	<div class='receipt'>
		<center><h1>GriffLib <i class='fa-brands fa-d-and-d'></i></h1></center>
		<hr>";
	echo	"<p>Period Code: <u>" . htmlspecialchars($row['PeriodCode']) ."</u></p>";
	echo	"<p>Book ID: <u>" . htmlspecialchars($row['BookID']) ."</u></p>";
	echo	"<p>Member ID: <u>" . htmlspecialchars($row['MemberID']) ."</u></p>";
	echo	"<p>Date Borrowed: <u>" . htmlspecialchars($row['DateBorrowed']) ."</u></p>";
	echo	"<p>Date Due: <u>" . htmlspecialchars($row['DateDue']) ."</u></p>";

	echo	"
    <img src='../../QR/Generator/qrcodes/period/P$pid.png' class='qr-code'>
    <hr>
		<i>Griffin Libraries</i>
	</div>
	";
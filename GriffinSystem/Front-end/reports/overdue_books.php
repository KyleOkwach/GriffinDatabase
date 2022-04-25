<?php
// $con = mysqli_connect('localhost', 'username', 'user password','database');

$con = mysqli_connect('localhost', 'root', '','griffin');//forms a connection to the database

// MySQL code to be inserted
$sql = "SELECT * FROM `Overdue Books`";

// insert in database 
$rs = mysqli_query($con, $sql);

echo "<link rel='stylesheet' type='text/css' href='../report.css'>
    <script src='https://kit.fontawesome.com/e17d9bd247.js' crossorigin='anonymous'></script>
    <center><h1>GriffLib <i class='fa-brands fa-d-and-d'></i></h1>
    <hr>
    <h1>Overdue Books Not Returned</h1>
    <table border='1'>
    <tr>
        <th>Period Code</th>
        <th>Book ID</th>
        <th>Member ID</th>
        <th>Date Borrowed</th>
        <th>Date Due</th>
    <tr>";
while($row = mysqli_fetch_array($rs)){   //Creates a loop to loop through results
echo "<tr><td>" . htmlspecialchars($row['PeriodCode']) . "</td><td>" . htmlspecialchars($row['BookID']) . "</td><td>" . htmlspecialchars($row['MemberID']) . "</td><td>" . htmlspecialchars($row['DateBorrowed']) . "</td><td>" . htmlspecialchars($row['DateDue']) .  "</td></tr>";  //$row['index'] the index here is a field name
}
echo "</table></center>"; //Close the table in HTML
echo "<footer></footer>";
<?php
// $con = mysqli_connect('localhost', 'username', 'user password','database');

$con = mysqli_connect('localhost', 'root', '','griffin');//forms a connection to the database

$did = $_POST['did'];
// MySQL code to be inserted
$sql = "call staff_dept_list($did)";

// insert in database 
$rs = mysqli_query($con, $sql);

echo "<link rel='stylesheet' type='text/css' href='../report.css'>
    <script src='https://kit.fontawesome.com/e17d9bd247.js' crossorigin='anonymous'></script>
    <center><h1>GriffLib <i class='fa-brands fa-d-and-d'></i></h1>
    <hr>
    <h1>Staff working in department $did</h1>
    <table border='1'>
    <tr>
        <th>Staff ID</th>
        <th>First Name</th>
        <th>Surname</th>
        <th>Email</th>
        <th>Phone Number</th>
    <tr>";
while($row = mysqli_fetch_array($rs)){   //Creates a loop to loop through results
echo "<tr><td>" . htmlspecialchars($row['StaffID']) . "</td><td>" . htmlspecialchars($row['FirstName']) . "</td><td>" . htmlspecialchars($row['Surname']) . "</td><td>" . htmlspecialchars($row['Email']) . "</td><td>" . htmlspecialchars($row['PhoneNumber']) ."</td></tr>";  //$row['index'] the index here is a field name
}
echo "</table></center>"; //Close the table in HTML
echo "<footer></footer>";
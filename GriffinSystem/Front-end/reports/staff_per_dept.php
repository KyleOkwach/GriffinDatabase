<?php
// $con = mysqli_connect('localhost', 'username', 'user password','database');

$con = mysqli_connect('localhost', 'root', '','griffin');//forms a connection to the database

// MySQL code to be inserted
$sql = "SELECT * FROM staff_per_department";

// insert in database 
$rs = mysqli_query($con, $sql);

echo "<link rel='stylesheet' type='text/css' href='../report.css'>
    <script src='https://kit.fontawesome.com/e17d9bd247.js' crossorigin='anonymous'></script>
    <center><h1>GriffLib <i class='fa-brands fa-d-and-d'></i></h1>
    <hr>
    <h1>Staff working in each department</h1>
    <table border='1'>
    <tr>
        <th>Department ID</th>
        <th>Department Name</th>
        <th>Staff Working</th>
    <tr>";
while($row = mysqli_fetch_array($rs)){   //Creates a loop to loop through results
echo "<tr><td>" . htmlspecialchars($row['DepartmentID']) . "</td><td>" . htmlspecialchars($row['DepartmentName']) . "</td><td>" . htmlspecialchars($row['Staff Working']) . "</td></tr>";  //$row['index'] the index here is a field name
}
echo "</table></center>"; //Close the table in HTML
echo "<footer></footer>";
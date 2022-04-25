<?php
// $con = mysqli_connect('localhost', 'username', 'user password','database');

$con = mysqli_connect('localhost', 'root', '','griffin');//forms a connection to the database

// MySQL code to be inserted
$sql = "SELECT * FROM old_book";

// insert in database 
$rs = mysqli_query($con, $sql);

echo "<link rel='stylesheet' type='text/css' href='../report.css'>
    <script src='https://kit.fontawesome.com/e17d9bd247.js' crossorigin='anonymous'></script>
    <center><h1>GriffLib <i class='fa-brands fa-d-and-d'></i></h1>
    <hr>
    <h1>Books published before 2000</h1>
    <table border='1'>
    <tr>
        <th>Book name</th>
        <th>ISBN number</th>
        <th>Author</th>
        <th>Publisher</th>
        <th>DOP</th>
        <th>Quantity</th>
    <tr>";
while($row = mysqli_fetch_array($rs)){   //Creates a loop to loop through results
echo "<tr><td>" . htmlspecialchars($row['BookName']) . "</td><td>" . htmlspecialchars($row['ISBN']) . "</td><td>" . htmlspecialchars($row['Author']) . "</td><td>" . htmlspecialchars($row['Publisher']) . "</td><td>" . htmlspecialchars($row['DOP']) . "</td><td>" . htmlspecialchars($row['Quantity']) . "</td></tr>";  //$row['index'] the index here is a field name
}
echo "</table></center>"; //Close the table in HTML
echo "<footer></footer>";
<!DOCTYPE html>
<html>
<body>

<?php 

// forms need to be generated here inside the PHP tag.
$server = "localhost";
$username = "root";
$password = "root";
$db = "sakila";

//SELECT first_name, last_name, email, address, city 
// Check connection
$conn = mysqli_connect($server, $username, $password, $db);

// Check connection
if (!$conn) {
	die("Connection failed: " . mysqli_connect_error());
}

// Creating a query
$query = "SELECT * FROM cellwell.t1
JOIN cellwell.t2 USING ()
JOIN cellwell.t3 USING ()
JOIN cellwell.t4 USING ()
JOIN cellwell.t5 USING ()
JOIN ceelwell.t6 USING()";

function facet1() {
	$query += "WHERE condition = " . $temp;
}

function facet2() {
	$query += "WHERE condition = " . $temp;
}

function facet3() {
	$query += "WHERE condition = " . $temp;
}

function facet4() {
	$query += "WHERE condition = " . $temp;
}

function facet5() {
	$query += "WHERE condition = " . $temp;
}

$query += "ORDER BY vendor and name;";


$result = mysqli_query($conn, $query);

if ($result) {   
        echo "Your query was successful";
} else {
        echo "Error: " . $sql . "<br>" . mysqli_error($conn);
}

?>

</body>
</html>
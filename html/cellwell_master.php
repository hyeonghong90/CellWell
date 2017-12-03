<!DOCTYPE html>
<html>
<body>

<?php 

// forms need to be generated here inside the PHP tag.
$server = "localhost";
$username = "root";
$password = "root";
$db = "cell_well";

//SELECT first_name, last_name, email, address, city 
// Check connection
$conn = mysqli_connect($server, $username, $password, $db);

// Check connection
if (!$conn) {
	die("Connection failed: " . mysqli_connect_error());
}

// Creating a query
$query = "SELECT * FROM cell_well.celldata as c1
JOIN cell_well.celldata_has_cellbands c2 ON c1.cellID = c2.cellData_cellID
JOIN cell_well.cellbands as c3 ON c2.cellBands_cellBandID = c3.cellBandID
JOIN cell_well.cellcarriers_has_cellbands c4 ON c3.cellBandID = c4.cellBands_cellBandID
JOIN cell_well.cellcarriers as c5 ON c4.cellCarriers_carrierID = c5.carrierID";

$brand_info = $_POST["brand"];
$carrier_info = $_POST["carrier"];
$display_size = $_POST["display_size"];
$os_info = $_POST["os"];
$resolution_info = $_POST["resolution"];

if (!is_null($brand_info)){
	brand($brand_info);
}
if (!is_null($carrier_info)){
	carrier($carrier_info);
}
if (!is_null($display_size)){
	display($display_size);
}
if (!is_null($os_info)){
	os($os_info);
}
if (!is_null($resolution_info)){
	resolution($resolution_info);
}

function brand($info) {
	$query += "WHERE c1.phoneMaker = " . $info;
}

function carrier($info) {
	$query += "WHERE c5.carrierName = " . $info;
}

function display($info) {
	$query += "WHERE c1.displaySizeInches = " . $info;
}

function os($info) {
	$query += "WHERE c1.os = " . $info;
}

function resolution($info) {
	$query += "WHERE c1.displaySizeInches = " . $info;
}

$query += "ORDER BY c1.phoneMaker and c1.cellName;";

$result = mysqli_query($conn, $query);

if ($result) {   
        echo "Your query was successful";
} else {
        echo "Error: " . $sql . "<br>" . mysqli_error($conn);
}

?>

</body>
</html>
<?php 

// forms need to be generated here inside the PHP tag.
$server = "localhost";
$username = "root";
$password = "root";
$db = "cell_well";

// Check connection
$conn = mysqli_connect($server, $username, $password, $db);

// Check connection
if (!$conn) {
	die("Connection failed: " . mysqli_connect_error());
}

// A function for general queries.
function query_to_db($conn, $sql){
    $result = mysqli_query($conn, $sql);
    if ($result) {   
    	if (mysqli_num_rows($result) > 0){
            echo "<div class='wrapper'>";
            while($row = mysqli_fetch_assoc($result)) {
                foreach ($row as $r){
                    echo "<div class='phone' value='" . $r . "'><h3>" . $r . "</h3></div>";
                } 
            }
            echo "</div>";
    		// echo "Your query was successful";
    	} else {
    		echo "No results found. Try again?";
    	}
    } else {
        echo "Error: " . $sql . "<br>" . mysqli_error($conn);
    }
}

// Creating a query
$query = "SELECT * FROM celldata as c1
JOIN celldata_has_cellbands c2 ON c1.cellID = c2.cellData_cellID
JOIN cellbands as c3 ON c2.cellBands_cellBandID = c3.cellBandID
JOIN cellcarriers_has_cellbands c4 ON c3.cellBandID = c4.cellBands_cellBandID
JOIN cellcarriers as c5 ON c4.cellCarriers_carrierID = c5.carrierID
JOIN pictures as pic ON c1.cellID = pic.cellData_cellID\n";

// $query = "SELECT * FROM celldata as c1\n";

// Adding conditions based on the user query
if (strpos($query, 'WHERE') == false){
	$query = $query . "WHERE ";
}
if (!empty($_POST["brand"])){
	$query = $query . "c1.phoneMaker = '" . $_POST["brand"] . "'\nAND";
}
if (!empty($_POST["carrier"])){
	$query = $query . "c5.carrierName = '" . $_POST["carrier"] . "'\nAND";
}
if (!empty($_POST["display_size"])){
	$query = $query . "c1.displaySizeInches LIKE '" . $_POST["display_size"] . "%'\nAND";
}
if (!empty($_POST["os"])){
	$query = $query . "c1.os = '" . $_POST["os"] . "'\nAND";
}
if (!empty($_POST["resolution"])){
	$query = $query . "c1.displayResPixels LIKE '" . $_POST["resolution"] . "%'\nAND";
}
if (!empty($_POST["user_input"])){
	$query = $query . "c1.cellName LIKE '%" . $_POST["user_input"] . "%'\nAND";
}
if (!empty($_POST["model_name"])){
    $query = $query . "c1.cellName = '" . $_POST["model_name"] . "'\nAND";
}

// removing last "AND"
if (substr($query, -3, 3) == "AND") {
	$query = substr($query, 0, -3);
}

$query = $query . "ORDER BY c1.phoneMaker AND c1.cellName;";
query_to_db($conn, $query);

mysqli_close($conn);

?>
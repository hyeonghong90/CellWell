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
            $cell_info = array();
            echo "<div class='wrapper'>";
            while($row = mysqli_fetch_assoc($result)) {
                foreach ($row as $r) {
                    $key = array_search($r, $row);
                    if (in_array($r, $cell_info) === false) {
                        $cell_info[$key] = array();
                        array_push($cell_info[$key], $r);
                    } else {
                        array_push($cell_info[$key], $cell_info[$key], $r);
                    }
                }               
            }
            echo "<div class='phone' value='" . $row["cellName"] . "'>";
                    foreach ($cell_info as $cell => $value){
                        foreach ($value as $val){
                            echo "<pre>";
                            print_r($cell . ": " . $val);
                            echo "</pre>"; 
                        }
                    }
            echo "</div></div>";
    		// echo "Your query was successful";
    	} else {
    		echo "No results found. Try again?";
    	}
    } else {
        echo "Error: " . $sql . "<br>" . mysqli_error($conn);
    }
}

$model_name = $_POST["model_name"];

// Creating a query
$query = "SELECT cellName, phoneMaker, os, chipset, dimensionsInches, weightOunches, internalMemoryGB, internalRAMGB, displayType, displaySizeInches, displayResPixels, displayRatio, frontCamera, rearCamera, batterySizemAh, removableMemory, 'jack3.5mm', fingerprintScanner, cellBand, carrierName, picture_path
FROM celldata as c1
JOIN celldata_has_cellbands c2 ON c1.cellID = c2.cellData_cellID
JOIN cellbands as c3 ON c2.cellBands_cellBandID = c3.cellBandID
JOIN cellcarriers_has_cellbands c4 ON c3.cellBandID = c4.cellBands_cellBandID
JOIN cellcarriers as c5 ON c4.cellCarriers_carrierID = c5.carrierID
JOIN pictures as pic ON c1.cellID = pic.cellData_cellID
WHERE c1.cellName = '" . $model_name . "' 
ORDER BY c1.cellName;";

query_to_db($conn, $query);

mysqli_close($conn);

?>
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

// A function to get corresponding cellID.
function get_cell_id($conn, $manufacturer_name, $model_name){
	$query = "SELECT cellID 
	FROM cell_well.celldata
	WHERE phoneMaker = '" . $manufacturer_name . "' AND cellName = '" . $model_name . "';";

	$result = mysqli_query($conn, $query);

	if ($result) {   
    	if (mysqli_num_rows($result) > 0){
            while($row = mysqli_fetch_assoc($result)) {
                return $row["cellID"];
            }
    		// echo "Your query was successful";
    	} else {
    		echo "No result...";
    	}
    } else {
        echo "Error: " . $sql . "<br>" . mysqli_error($conn);
    }



	// if (mysqli_num_rows($result) > 0) {
 //    	while($row = mysqli_fetch_assoc($result)) {
 //    		$id = $row["cellID"];
 //    	}
	// 	return $id;
	// }
}

// A function to insert image path.
function insert_img_path($conn, $img_path, $cell_id){
	echo $img_path . "   /   " . $cell_id . "<br>";
	$img_query = "INSERT INTO cell_well.pictures (picture_path, cellData_cellID)
	VALUES ('" . $img_path . "', '" . $cell_id . "');";

	mysqli_query($conn, $img_query);
}

// Code starts here.
// $dir_path = "/var/www/html/img/phone-imgs/";
$dir_path = "C:/git/CellWell/html/img/phone-imgs/";

$files = scandir($dir_path);

foreach ($files as $file){
	if (strlen($file) > 2){
		$phone = explode(".", $file);

		// extract the manufacturer name.
		$manufacturer_name = explode("_", $phone[0])[0];
		// split('[_]', $phone[0])[0];

		// extract the model name.    Google_Google Pixel_1.jpg
		$model_name = explode("_", $phone[0])[1];
		// split('[_]', $phone[0])[1];

		//
		$cell_id_fk = get_cell_id($conn, $manufacturer_name, $model_name);

		// get corresponding image path.
		$img_path = "'img/phone-imgs/" . $file . "'";

		// inserting the path.
		insert_img_path($conn, $img_path, $cell_id_fk);
	}
}

?>
CellWell Developer's Manual
=======

![alt text](https://farm5.staticflickr.com/4551/39045365031_78cc1a8b79_m.jpg "CellWell Logo")

This document explains how to launch the CellWell webpage using various systems, as well as explains the file and code structure used to create it.

## Setting Up:

**Install Local Environment MAMP (for MacOS and Windows users)**<br> <br>
	1.)  *Download:* <br>
	• MAMP & MAMP PRO 4.2.1 (Mac OS X) <br>
 	• MAMP & MAMP PRO 3.3.1 (Windows) <br>
	• https://www.mamp.info/en/downloads/ <br>
	• LAMP [Linux, Apache, MySQL, PHP] (Ubuntu) <br> <br>
	2.)  *Verify:* <br> 
 	• MySQL 5.6.35 <br>
	• PHP 5.6.29, 5.6.30, 7.0.14, 7.0.15 & 7.1.1 <br>
	• Python 2.7.13 <br>
   	• phpMyAdmin 4.6.5.2 <br>
	
	System Directions: 
	- Ensure these versions are running on your MAC OSX, Windows, and Linux systems 
	  to effectively use your PC as a server to test code. 
	- Direct the web server doument root to Cell Well file folder containing all project files.
	
**Install IDE** <br> <br>
	1.) *Install an IDE that supports your code:* <br>
	• Sublime Text <br>
	https://www.sublimetext.com/3 <br>
	• Eclipse <br>	
	• Ultra Edit <br>
	• PyCharm (Python) <br>
	•Jupyter (Python and R) <br>
	•Notepad (?) <br>
	•VI/VIM/NANO (command-line editors) <br>
	
	System Directions: 
	- Use Sublime Text and Command-line editors/terminals for this code.
	
**Database Monitor/Manager** <br><br>
	After mySQL is installed during the MAMP/LAMP installation process, <br>
	1.) *Install MySQL Workbench:* <br>
	https://dev.mysql.com/downloads/workbench/ <br><br>
	Features: <br>
 	• DB dump/import <br>
	• Create/alter/delete/update DB and DB tables <br>
	• Write Queries <br>
	• Generate DB schema <br>
	
	System Directions: 
	- Create new cell well schema and run cellwell_20171213_5.sql script on workbench. 
	
**Software/Libraries Used** <br>
	• JQuery <br>
	• Bootstrap <br>
	
## File Structure: <br> <br>
![alt text](https://farm5.staticflickr.com/4681/38349450854_26ce7c06ee.jpg "File Structure") <br>
	**cellwell_master.php file :** <br>
		- Ensures server is running and database is connected. <br>
		- Query connecting webpage features to aspects of database. <br> <br>
	**css Folder:** <br> 
		- Consits of style-default.css file that contains the code that corresponds to the layout  <br>
	 	  fonts, color, and general styling of the page. <br><br>
	**db Folder:** <br>
		- Consits of MySQL script containing database of all of the featured cell phones. <br><br>
	**img Folder:** <br>
		- Contains all of the images used for webpage buttons and animations. <br>
		- Includes phone-imgs folder that holds all of the images of every phone listen in the database.<br><br>
	**index.html file:** <br>
		- Consits of HTML, JavaScript, and JQuery code implementing all aspects of our webpage. <br><br>
	**image_import Folder:** <br>
		- Contains a get_images.php file that gets the images from phone-imgs folder<br>
		  and assigns them to the phones from database on webpage.<br><br>
	**advanced_search.html:**<br>
		- HTML and JQuery code for advanced search facet of webpage.<br><br>
	**fetch_specs.php** <br>
		- PHP code structured communicate with database for content/data. <br><br>
	**advanced_search.php** <br>
		- PHP written to query through each row of the database.
  
	System Notes:	
	- Every file utilizes other files and folders in the structure to create a code system that can be easily navigated. 
	
## Code Structure and Logic:<br><br>
**cellwell_master.php file :** <br>
		- PHP code establishing a connection between the database and server. <br>
		- A while that loops through the entire database and checks it to the user's general query <br>
		- A query connecting cellbands, carriers, cellIDs, and cellData to several variations of possible user queries. <br> <br>
	**style-default.css:**<br>
		- Structural CSS code designing the layout of webpage from top to bottom including the homepage, advanced search page, and phone display pages. <br> <br>
	**index.html file:** <br>
		- Consits of HTML, JavaScript, and JQuery code implementing all of the quick access tabs to communicate with the database, query the necessary content, and post query results. <br><br>
	**get_images.php**: <br>
		- PHP code that gets the cellID and inserts the corresponding image by its image path, manufacturer name,and model name.   		 <br><br>
	**advanced_search.html:**<br>
		- HTML code that creates an button-styled element list for all of the clickable features the user is able to filter by.   		 <br>
		- The code structure references the style-default.css file to style advanced search buttons into filtration checkboxes. 		<br><br>
	**fetch_specs.php** <br>
		- PHP code structured to use query to fetch specifications from database and display on webpage. <br><br>
	**advanced_search.php** <br>
		- PHP written to query through each row of the database using a loop to display results of user's clickable aspects<br>
		using query conditions. 

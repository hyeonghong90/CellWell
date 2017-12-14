Developer's Manual Cell Well 
=======

![alt text](https://farm5.staticflickr.com/4551/39045365031_78cc1a8b79_m.jpg "Logo Title Text 1")

This document explains how to launch the Cell Well webpage using various systems, as well as explains the file and code structure used to create it.

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
	-Use Sublime Text and Command-line editors/terminals for this code 
	
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
	-Create new cell well schema and run cellwell_20171213_5.sql script on workbench. 
	
**Software/Libraries Used** <br>
	• JQuery <br>
	• Bootstrap <br>
	
## File Structure <br> <br>
![alt text](https://farm5.staticflickr.com/4737/24184158367_8f9d4416be_z.jpg "Logo Title Text 1") <br>
	cellwell_master.php : <br>
		- Ensures server is running and database is connected, Webpage query structure
	

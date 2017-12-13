CREATE DATABASE  IF NOT EXISTS `cell_well` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `cell_well`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: cell_well
-- ------------------------------------------------------
-- Server version	5.6.34-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cellbands`
--

DROP TABLE IF EXISTS `cellbands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cellbands` (
  `cellBandID` int(11) NOT NULL AUTO_INCREMENT,
  `cellBand` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cellBandID`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cellbands`
--

LOCK TABLES `cellbands` WRITE;
/*!40000 ALTER TABLE `cellbands` DISABLE KEYS */;
INSERT INTO `cellbands` VALUES (1,'CDMA BC0 800'),(2,'CDMA BC1 1900'),(3,'CDMA BC10 800'),(4,'GSM 1900'),(5,'GSM 850'),(6,'LTE B12 700'),(7,'LTE B13 700'),(8,'LTE B17 700'),(9,'LTE B2 1900'),(10,'LTE B25 1900'),(11,'LTE B26 850'),(12,'LTE B30 2300'),(13,'LTE B4 1700/2100'),(14,'LTE B41 2500'),(15,'LTE B66 1700/2100'),(16,'LTE B71 600'),(17,'UMTS B2 1900'),(18,'UMTS B4 1700/2100'),(19,'UMTS B5 850');
/*!40000 ALTER TABLE `cellbands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cellcarriers`
--

DROP TABLE IF EXISTS `cellcarriers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cellcarriers` (
  `carrierID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `carrierName` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`carrierID`),
  UNIQUE KEY `carrierID_UNIQUE` (`carrierID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cellcarriers`
--

LOCK TABLES `cellcarriers` WRITE;
/*!40000 ALTER TABLE `cellcarriers` DISABLE KEYS */;
INSERT INTO `cellcarriers` VALUES (1,'AT&T'),(2,'Sprint'),(3,'T-Mobile'),(4,'Verizon');
/*!40000 ALTER TABLE `cellcarriers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cellcarriers_has_cellbands`
--

DROP TABLE IF EXISTS `cellcarriers_has_cellbands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cellcarriers_has_cellbands` (
  `cellCarriers_carrierID` int(10) unsigned NOT NULL,
  `cellBands_cellBandID` int(11) NOT NULL,
  PRIMARY KEY (`cellCarriers_carrierID`,`cellBands_cellBandID`),
  KEY `fk_cellCarriers_has_cellBands_cellBands1_idx` (`cellBands_cellBandID`),
  KEY `fk_cellCarriers_has_cellBands_cellCarriers1_idx` (`cellCarriers_carrierID`),
  CONSTRAINT `fk_cellCarriers_has_cellBands_cellBands1` FOREIGN KEY (`cellBands_cellBandID`) REFERENCES `cellbands` (`cellBandID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_cellCarriers_has_cellBands_cellCarriers1` FOREIGN KEY (`cellCarriers_carrierID`) REFERENCES `cellcarriers` (`carrierID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cellcarriers_has_cellbands`
--

LOCK TABLES `cellcarriers_has_cellbands` WRITE;
/*!40000 ALTER TABLE `cellcarriers_has_cellbands` DISABLE KEYS */;
INSERT INTO `cellcarriers_has_cellbands` VALUES (4,1),(2,2),(4,2),(2,3),(1,4),(3,4),(1,5),(3,6),(4,7),(1,8),(1,9),(3,9),(4,9),(2,10),(2,11),(1,12),(1,13),(3,13),(4,13),(2,14),(3,15),(3,16),(1,17),(3,17),(3,18),(1,19);
/*!40000 ALTER TABLE `cellcarriers_has_cellbands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `celldata`
--

DROP TABLE IF EXISTS `celldata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `celldata` (
  `cellID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cellName` varchar(30) DEFAULT NULL,
  `phoneMaker` varchar(18) DEFAULT NULL,
  `os` varchar(7) DEFAULT NULL,
  `chipset` varchar(35) DEFAULT NULL,
  `dimensionsInches` varchar(18) DEFAULT NULL,
  `weightOunches` decimal(4,2) DEFAULT NULL,
  `internalMemoryGB` varchar(12) DEFAULT NULL,
  `internalRAMGB` varchar(4) DEFAULT NULL,
  `displayType` varchar(150) DEFAULT NULL,
  `displaySizeInches` decimal(2,1) DEFAULT NULL,
  `displayResPixels` varchar(12) DEFAULT NULL,
  `displayRatio` varchar(6) DEFAULT NULL,
  `frontCamera` varchar(200) DEFAULT NULL,
  `rearCamera` varchar(200) DEFAULT NULL,
  `batterySizemAh` int(11) DEFAULT NULL,
  `removableMemory` varchar(21) DEFAULT NULL,
  `jack3.5mm` varchar(3) DEFAULT NULL,
  `fingerprintScanner` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`cellID`),
  UNIQUE KEY `cellID_UNIQUE` (`cellID`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `celldata`
--

LOCK TABLES `celldata` WRITE;
/*!40000 ALTER TABLE `celldata` DISABLE KEYS */;
INSERT INTO `celldata` VALUES (1,'LG V30','LG','Android','Qualcomm MSM8998 Snapdragon 835','5.97 x 2.97 x 0.29',5.57,'64','4','P-OLED capacitive touchscreen',6.0,'1440 x 2880','18:09','5 MP, f/2.2, 1/5\" sensor size, 1.12 um pixel size','Dual 16 MP (f/1.6, OIS, 3-axis, laser & phase detection autofocus) + 13 MP (f/1.9, no AF), LED flash, 1.0 µm pixel size, geo-tagging, touch focus, face detection, HDR, panorama',3300,'microSD, up to 256 ','Yes','Rear'),(2,'LG V30+','LG','Android','Qualcomm MSM8998 Snapdragon 835','5.97 x 2.97 x 0.29',5.57,'128','4','P-OLED capacitive touchscreen',6.0,'1440 x 2880','18:09','5 MP, f/2.2, 1/5\" sensor size, 1.12 um pixel size','Dual 16 MP (f/1.6, OIS, 3-axis, laser & phase detection autofocus) + 13 MP (f/1.9, no AF), LED flash, 1.0 µm pixel size, geo-tagging, touch focus, face detection, HDR, panorama',3300,'microSD, up to 256 ','Yes','Rear'),(3,'LG v20','LG','Android','Qualcomm MSM8996 Snapdragon 820','6.29 x 3.07 x 0.30',6.14,'32, 64 ','4','IPS LCD capacitive touchscreen',5.7,'1440 x 2560','16:09','5 MP, f/1.9','Dual 16 MP (29mm, f/1.8) + 8 MP (12mm, f/2.4), laser autofocus, OIS, dual-LED flash, 1/2.6\" sensor size @ 29mm, 1/3.2\" @ 12mm, geo-tagging, touch focus, face/smile detection, panorama, HDR',3200,'microSD, up to 256 ','Yes','Rear'),(4,'LG G6','LG','Android','Qualcomm MSM8996 Snapdragon 821','5.86 x 2.83 x 0.31',5.75,'32, 64, 128 ','4','IPS LCD capacitive touchscreen',5.7,'1440 x 2880','18:09','5 MP, f/2.2, 1080p','DUal 13 MP (f/1.8, OIS, 3-axis, phase detection AF) + 13 MP (f/2.4, no AF), dual LED flash, 1/3\" sensor size, 1.12 um pixel size, geo-tagging, touch focus, face detection, HDR',3300,'microSD, up to 256 ','Yes','Rear'),(5,'LG Nexus 5X','LG','Android','Qualcomm MSM8992 Snapdragon 808','5.79 x 2.86 x 0.31',4.80,'16,32 ','2','IPS LCD capacitive touchscreen',5.2,'1080 x 1920','16:09','5 MP, f/2.0, 1/4\" sensor size, 1.4 um pixel size, HDR','12.3 MP, f/2.0, 26mm, laser autofocus, dual-LED (dual tone) flash, 1/2.3\" sensor size, 1.55um pixel size, geo-tagging, touch focus, face detection, HDR, panorama',2700,'No','Yes','Rear'),(6,'Huawei Nexus 6P','Huawei','Android','Qualcomm MSM8994 Snapdragon 810','6.27 x 3.06 x 0.29',6.28,'32, 64, 128 ','3','AMOLED capacitive touchscreen',5.7,'1440 x 2560','16:09','8 MP, f/2.4, 1080p ','12.3 MP, f/2.0, laser autofocus, dual-LED (dual tone) flash, 1/2.3\' sensor size, 1.55 um pixel size, geo-tagging, touch focus, face detection, HDR, panorama',3450,'No','Yes','Rear'),(7,'Google Pixel','Google','Android','Qualcomm MSM8996 Snapdragon 821','5.66 x 2.74 x 0.33',5.04,'32, 128 ','4','AMOLED capacitive touchscreen',5.0,'1080 x 1920','16:09','8 MP, f/2.4, 1/32\" sensor size, 1.4 um pixel size, 1080p','12.3 MP, f/2.0, EIS (gyro), phase detection & laser autofocus, 1/2.3\" sensor size, 1.55 um pixel size, geo-tagging, touch focus, face detection, HDR, panorama',2770,'No','Yes','Rear'),(8,'Google Pixel XL','Google','Android','Qualcomm MSM8996 Snapdragon 821','6.09 x 2.98 x 0.33',5.93,'32, 128 ','4','AMOLED capacitive touchscreen',5.5,'1440 x 2560','16:09','8 MP, f/2.4, 1/32\" sensor size, 1.4 um pixel size, 1080p','12.3 MP, f/2.0, EIS (gyro), phase detection & laser autofocus, 1/2.3\" sensor size, 1.55 um pixel size, geo-tagging, touch focus, face detection, HDR, panorama',3450,'No','Yes','Rear'),(9,'Google Pixel 2','Google','Android','Qualcomm MSM8998 Snapdragon 835','5.74 x 2.74 x 0.31',5.04,'64, 128 ','4','AMOLED capacitive touchscreen',5.0,'1080 x 1920','16:09','8 MP, f/2.4, 1/32\" sensor size, 1.4 um pixel size, 1080p','12.2 MP, f/1.8, OIS, phase detection & laser autofocus, dual-LED flash, 1/2.6\" sensor size, 1.4 um pixel size, geo-tagging, touch focus, face detection, HDR, panorama',2700,'No','No','Rear'),(10,'Google Pixel 2 XL','Google','Android','Qualcomm MSM8998 Snapdragon 835','6.22 x 3.02 x 0.31',6.17,'64, 128 ','4','P-OLED capacitive touchscreen',6.0,'1440 x 2880','18:09','8 MP, f/2.4, 1/32\" sensor size, 1.4 um pixel size, 1080p','12.2 MP, f/1.8, OIS, phase detection & laser autofocus, dual-LED flash, 1/2.6\" sensor size, 1.4 um pixel size, geo-tagging, touch focus, face detection, HDR, panorama',3520,'No','No','Rear'),(11,'Apple iPhone X','Apple','iOS','Apple A11 Bionic','5.65 x 2.79 x 0.30',6.14,'64, 256 ','3','Super AMOLED capacitive touchscreen',5.8,'1125 x 2436','19.5:9','7 MP, f/2.2, 1080p@30fps, 720p@240fps, face detection, HDR, panorama','Dual 12 MP, f/1.8 & f/2.4, phase detection autofocus, OIS, 2x optical zoom, quad-LED (dual tone) flash',2716,'No','No','Front'),(12,'Apple iPhone 8 Plus','Apple','iOS','Apple A11 Bionic','6.24 x 3.07 x 0.30',7.13,'64, 256 ','3','LED-backlit IPS LCD, capacitive touchscreen',5.5,'1080 x 1920','16:09','7 MP, f/2.2, 1080p@30fps, 720p@240fps, face detection, HDR, panorama','Dual 12 MP, (28mm, f/1.8, OIS & 56mm, f/2.8), phase detection autofocus, 2x optical zoom, quad-LED (dual tone) flash',2691,'No','No','Front'),(13,'Apple iPhone 8 ','Apple','iOS','Apple A11 Bionic','5.45 x 2.65 x 0.29',5.22,'64, 256 ','2','LED-backlit IPS LCD, capacitive touchscreen',4.7,'750 x 1334','16:09','7 MP, f/2.2, 1080p@30fps, 720p@240fps, face detection, HDR, panorama','12 MP, f/1.8, 28mm, phase detection autofocus, OIS, quad-LED (dual tone) flash',1821,'No','No','Front'),(14,'Apple iPhone 7 Plus','Apple','iOS','Apple A11 Bionic','6.23 x 3.07 x 0.29',6.63,'32, 128, 256','3','LED-backlit IPS LCD, capacitive touchscreen',5.5,'1080 x 1920','16:09','7 MP, f/2.2, 32mm, 1080p@30fps, 720p@240fps, face detection, HDR, panorama','Dual 12 MP, (28mm, f/1.8, OIS & 56mm, f/2.8), phase detection autofocus, 2x optical zoom, quad-LED (dual tone) flash',2900,'No','No','Front'),(15,'Apple iPhone 7','Apple','iOS','Apple A11 Bionic','5.44 x 2.64 x 0.28',4.87,'32, 128, 256','2','LED-backlit IPS LCD, capacitive touchscreen',4.7,'750 x 1334','16:09','7 MP, f/2.2, 32mm, 1080p@30fps, 720p@240fps, face detection, HDR, panorama','12 MP, f/1.8, 28mm, phase detection autofocus, OIS, quad-LED (dual tone) flash',1960,'No','No','Front'),(16,'Lumia 650','Windows','Android','Qualcomm Snapdragon 212','5.59 x 2.79 x 0.27',4.30,'16','1','OLED capacitive touchscreen, 16M colors',5.0,'720 x 1280','16:09','5 MP, f/2.2, 720p video','8 MP, f/2.2, 28mm, autofocus, LED flash',2000,'Yes','Yes','No'),(17,'Lumia 950 XL','Windows','Android','Qualcomm MSM8994 Snapdragon 810','5.98 x 3.09 x 0.32',5.82,'32','3','AMOLED capacitive touchscreen, 16M colors',5.7,'1440 x 2560','16:09','5 MP, f/2.4, 1080p','20 MP, f/1.9, 26mm, Carl Zeiss optics, OIS, autofocus, triple-LED R flash',3349,'Yes','Yes','No'),(18,'Lumia 950 Dual Sim','Windows','Android','Qualcomm MSM8992 Snapdragon 808','5.71 x 2.88 x 0.32',5.29,'32','3','AMOLED capacitive touchscreen, 16M colors',5.2,'	1440 x 2560','16:09','5 MP, f/2.4, 1080p','20 MP, f/1.9, 26mm, Carl Zeiss optics, OIS, autofocus, triple-LED R flash',3000,'Yes','Yes','No'),(19,'Lumia 640 XL Dual Sim','Windows','Android','Qualcomm MSM8226 Snapdragon 400','6.22 x 3.21 x 0.35',6.03,'8','1','IPS LCD capacitive touchscreen, 16M colors',5.7,'720 x 1280','16:09','5 MP, 1080p','13 MP, f/2.0, 28mm, Carl Zeiss optics, autofocus, LED flash',3000,'Yes','Yes','No'),(20,'Lumia 550','Windows','Android','Qualcomm MSM8909 Snapdragon 210','5.36 x 2.67 x 0.39',5.01,'8','1','IPS LCD, capacitive touchscreen, 16M colors',4.7,'720 x 1280','16:09','2 MP, f/2.8, 480p','5 MP, f/2.4, autofocus, LED flash',2100,'Yes','Yes','No'),(21,'Sony Xperia XZ1','Sony','Android','Qualcomm MSM8998 Snapdragon 835','5.83 x 2.89 x 0.29',5.47,'64','4','IPS LCD capacitive touchscreen',5.2,'1080 x 1920','16:09','13 MP, f/2.0, 22mm, 1/3\" sensor size, EIS (gyro), 1080p','19 MP, f/2.0, 25mm, EIS (gyro), predictive phase detection and laser autofocus, LED flash',2700,'No','Yes','Rear'),(22,'Sony Xperia Z3','Sony','Android','Qualcomm MSM8974AC Snapdragon 801','5.75 x 2.83 x 0.29',5.36,'16, 32','3','IPS LCD capacitive touchscreen',5.2,'1080 x 1920','16:09','2.2 MP, f/2.8, 1080p@30fps','20.7 MP, f/2.0, 25mm, autofocus, LED flash',3100,'No','Yes','No'),(23,'Sony Xperia XA1 Plus','Sony','Android','Mediatek MT6757 Helio P20','6.10 x 2.95 x 0.34',6.67,'32','3, 4','IPS LCD capacitive touchscreen',5.5,'1080 x 1920','16:09','8 MP, f/2.0, 23mm, autofocus, 1/4\" sensor size, 1080p','23 MP, f/2.0, 24mm, phase detection autofocus, LED flash',3430,'No','Yes','Rear'),(24,'Sony Xperia Z2','Sony','Android','Qualcomm MSM8974AB Snapdragon 801','5.78 x 2.89 x 0.32',5.75,'16','3','IPS LCD capacitive touchscreen',5.2,'1080 x 1920','16:09','2.2 MP, 1080p@30fps','20.7 MP, f/2.0, autofocus, LED flash',3200,'No','Yes','No'),(25,'Sony T2 Ultra Dual','Sony','Android','Qualcomm MSM8228 Snapdragon 400','6.50 x 3.30 x 0.30',6.03,'8','1','IPS LCD capacitive touchscreen',6.0,'720 x 1280','16:09','1.1 MP, 720p@30fps','13 MP, autofocus, LED flash',3000,'microSD, up to 32 ','Yes','No'),(26,'Nokia 8','Nokia','Android','Qualcomm MSM8998 Snapdragon 835','5.96 x 2.90 x 0.31',5.64,'64, 128','4, 6','IPS LCD capacitive touchscreen',5.3,'1440 x 2560','16:09','13 MP, f/2.0, phase detection autofocus','Dual 13 MP, f/2.0, laser & phase detection autofocus, Carl Zeiss optics, OIS, dual-LED (dual tone) flash',3090,'microSD, up to 256 ','Yes','Front'),(27,'Nokia 7','Nokia','Android','Qualcomm Snapdragon 630','5.56 x 2.81 x 0.31',5.64,'64','4, 6','IPS LCD capacitive touchscreen',5.2,'1080 x 1920','16:09','5 MP, f/2.0, autofocus, 1.4 µm pixel size','16 MP, f/1.8, phase detection autofocus, Carl Zeiss optics, dual-LED (dual tone) flash',3000,'microSD, up to 256 ','Yes','Rear'),(28,'Nokia 6','Nokia','Android','Qualcomm MSM8937 Snapdragon 430','6.06 x 2.98 x 0.31',5.96,'32, 64','3, 4','IPS LCD capacitive touchscreen',6.0,'1080 x 1920','16:09','8 MP, f/2.0, autofocus, 1.12 µm pixel size, 1080p','16 MP, f/2.0, phase detection autofocus, dual-LED (dual tone) flash',3000,'microSD, up to 256 ','Yes','Front'),(29,'Nokia 5','Nokia','Android','Qualcomm MSM8937 Snapdragon 430','5.89 x 2.85 x 0.31',5.64,'16','2, 4','IPS LCD capacitive touchscreen',5.2,'720 x 1280','16:09','8 MP, f/2.0, 1.12 µm pixel size','13 MP, f/2.0, phase detection autofocus, dual-LED (dual tone) flash',3000,'microSD, up to 256 ','Yes','Front'),(30,'Nokia 3','Nokia','Android','Mediatek MT6737','5.65 x 2.81 x 0.33',4.94,'16','2','IPS LCD capacitive touchscreen',5.0,'720 x 1280','16:09','8 MP, f/2.0, autofocus, 720p','8 MP, f/2.0, autofocus, LED flash',2630,'microSD, up to 256 ','Yes','No'),(31,'Samsung Galaxy S8+','Samsung','Android','Qualcomm MSM8998 Snapdragon 835','6.28 x 2.89 x 0.32',6.10,'64, 128','4, 6','Super AMOLED capacitive touchscreen, 16M colors',6.2,'1440 x 2960','18.5:9','8 MP, f/1.7, autofocus, 1440p@30fps, dual video call, Auto HDR','12 MP, f/1.7, 26mm, phase detection autofocus, OIS, LED flash',3500,'microSD, up to 256 ','Yes','Rear'),(32,'Samsung Galaxy S8','Samsung','Android','Qualcomm MSM8998 Snapdragon 835','5.86 x 2.68 x 0.31',5.47,'64','4','Super AMOLED capacitive touchscreen, 16M colors',5.8,'1440 x 2960','18.5:9','8 MP, f/1.7, autofocus, 1440p@30fps, dual video call, Auto HDR','12 MP, f/1.7, 26mm, phase detection autofocus, OIS, LED flash',3000,'microSD, up to 256 ','Yes','Rear'),(33,'Samsung Galaxy S7 edge','Samsung','Android','Qualcomm MSM8996 Snapdragon 820','5.94 x 2.86 x 0.30',5.54,'32','4','Super AMOLED capacitive touchscreen, 16M colors',5.5,'1440 x 2560','16:09','5 MP, f/1.7, 22mm, dual video call, Auto HDR','12 MP, f/1.7, 26mm, phase detection autofocus, OIS, LED flash',3600,'microSD, up to 256 ','Yes','Front'),(34,'Samsung Galaxy S7','Samsung','Android','Qualcomm MSM8996 Snapdragon 820','5.61 x 2.74 x 0.31',5.36,'32','4','Super AMOLED capacitive touchscreen, 16M colors',5.1,'1440 x 2560','16:09','5 MP, f/1.7, 22mm, dual video call, Auto HDR','12 MP, f/1.7, 26mm, phase detection autofocus, OIS, LED flash',3000,'microSD, up to 256 ','Yes','Front'),(35,'Samsung Galaxy S6 edge+','Samsung','Android','Exynos 7420 Octa','6.08 x 2.98 x 0.27',5.40,'32, 64','4','Super AMOLED capacitive touchscreen, 16M colors',5.7,'1440 x 2560','16:09','5 MP, f/1.9, 22mm, 1440p@30fps, dual video call, Auto HDR','16 MP, f/1.9, 28mm, OIS, autofocus, LED flash',3000,'No','Yes','Front'),(36,'Samsung Galaxy S6 edge','Samsung','Android','Exynos 7420 Octa','5.59 x 2.76 x 0.28',4.66,'32, 64, 128','3','Super AMOLED capacitive touchscreen, 16M colors',5.1,'1440 x 2560','16:09','5 MP, f/1.9, 22mm, 1440p@30fps, dual video call, Auto HDR','16 MP, f/1.9, 28mm, OIS, autofocus, LED flash',2600,'No','Yes','Front'),(37,'Samsung Galaxy S6','Samsung','Android','Exynos 7420 Octa','5.65 x 2.78 x 0.27',4.87,'32, 64, 128','3','Super AMOLED capacitive touchscreen, 16M colors',5.1,'1440 x 2560','16:09','5 MP, 1/4.1\" sensor size, 1.34 µm pixel size, f/1.9, 22mm, 1440p@30fps, dual video call, Auto HDR','16 MP, f/1.9, 28mm, OIS, autofocus, LED flash',2550,'No','Yes','Front'),(38,'Samsung Galaxy J7','Samsung','Android','Exynos 7870 Octa','6.00 x 2.94 x 0.31',6.38,'16','3','Super AMOLED capacitive touchscreen, 16M colors',5.5,'1080 x 1920','16:09','13 MP, f/1.9, LED flash, 1080p','13 MP, f/1.7, autofocus, LED flash',3600,'microSD, up to 256 ','Yes','Front'),(39,'Samsung Galaxy J5','Samsung','Android','Exynos 7870 Octa','5.76 x 2.81 x 0.31',5.64,'16','2','Super AMOLED capacitive touchscreen, 16M colors',5.2,'720 x 1280','16:09','13 MP, f/1.9','13 MP, f/1.7, autofocus, LED flash',3000,'microSD, up to 256 ','Yes','Front'),(40,'Samsung Galaxy Note8','Samsung','Android','Qualcomm MSM8998 Snapdragon 835','6.40 x 2.94 x 0.34',6.88,'64, 128, 256','6','Super AMOLED capacitive touchscreen, 16M colors',6.3,'1440 x 2960','18.5:9','8 MP, f/1.7, autofocus, 1/3.6\" sensor size, 1.22 µm pixel size, 1440p@30fps, dual video call, Auto HDR','Dual 12 MP (26mm, f/1.7, PDAF & 52mm, f/2.4, AF), OIS, autofocus, 2x optical zoom, LED flash',3300,'microSD, up to 256 ','Yes','Rear'),(41,'Samsung Galaxy Note5','Samsung','Android','Exynos 7420 Octa','6.03 x 3.00 x 0.30',6.03,'32, 64, 128','4','Super AMOLED capacitive touchscreen, 16M colors',5.7,'1440 x 2560','16:09','5 MP, 1/4.1\" sensor size, 1.34 µm pixel size, f/1.9, 22mm, 1440p@30fps, dual video call, Auto HDR','16 MP, f/1.9, 28mm, OIS, autofocus, LED flash',3000,'No','Yes','Front'),(42,'Tonino Lamborghini 88 Tauri','Tonino Lamborghini','Android','Qualcomm Snapdragon 801','',0.00,'64','3','touchscreen',5.0,'1080 x 1920','','8-megapixel','20-megapixel',3400,'microSD, up to 64 ','',''),(43,'BlackBerry DTEK60','BlackBerry','Android','Qualcomm MSM8996 Snapdragon 820','6.06 x 2.97 x 0.28',5.82,'32','4','AMOLED capacitive touchscreen',5.5,'2560 x 1440','16:09','8 MP, f/2.2, 1080p','21 MP, f/2.0, phase detection autofocus, dual-LED (dual tone) flash',3000,'Yes','Yes','Rear'),(44,'BlackBerry DTEK50','BlackBerry','Android','Qualcomm MSM8996 Snapdragon 617','5.79 x 2.85 x 0.29',4.76,'16','3','AMOLED capacitive touchscreen',5.2,'1920 x 1080','16:09','8 MP, f/2.2, 1080p','13 MP, f/2.0, phase detection autofocus, dual-LED (dual tone) flash',2610,'Yes','Yes','No'),(45,'BlackBerry Keyone','BlackBerry','Android','Qualcomm MSM8953 Snapdragon 625','5.87 x 2.85 x 0.37',6.35,'32, 64','3, 4','IPS LCD capacitive touchscreen, 16M colors',4.5,'1080 x 1620','3:02','8 MP, f/2.2, 1.12 um pixel size, 1080p','12 MP, f/2.0, phase detection autofocus, dual-LED (dual tone) flash',3505,'Yes','Yes','Front'),(46,'HTC U11+','HTC','Android','Qualcomm MSM8998 Snapdragon 835','6.24 x 2.95 x 0.33',6.63,'64, 128','4, 6','Super LCD5 capacitive touchscreen, 16M colors',6.0,'1440 x 2880','16:09','8 MP, f/2.0, 1080p, HDR, panorama','12 MP (f/1.7, 1.4 um, Dual Pixel PDAF), phase detection autofocus, OIS, dual-LED dual-tone flash',3930,'Yes','No','Rear'),(47,'HTC U11','HTC','Android','Qualcomm MSM8953 Snapdragon 835','6.06 x 2.99 x 0.31',5.96,'64, 128','4, 6','Super LCD5 capacitive touchscreen, 16M colors',5.5,'1440 x 2560','16:09','16 MP, f/2.0, 1080p','12 MP, f/1.7, phase detection autofocus, OIS, dual-LED (dual tone) flash',3000,'Yes','No','Front'),(48,'HTC U Ultra','HTC','Android','Qualcomm MSM8996 Snapdragon 821','6.39 x 3.14 x 0.31',6.00,'64, 128','4','Super LCD5 capacitive touchscreen, 16M colors',5.7,'1440 x 2560','16:09','16 MP, 1080p, Auto-HDR','12 MP, f/1.8, 26mm, OIS, laser & phase detection autofocus, dual-LED (dual tone) flash',3000,'Yes','No','Front'),(49,'HTC Bolt','HTC','Android','Qualcomm MSM8996 Snapdragon 810','6.06 x 3.04 x 0.32',6.14,'32','3','Super LCD5 capacitive touchscreen, 16M colors',5.5,'1440 x 2560','16:09','8 MP, f/2.4, 1080p, Auto-HDR','16 MP, f/2.0, PDAF, OIS, face detection, dual-LED (dual tone) flash',3200,'Yes','No','Front'),(50,'Motorola Moto X4','Motorola','Android','Qualcomm Snapdragon 630','5.84 x 2.89 x 0.31',5.75,'32, 64','3, 4','LTPS IPS LCD capacitive touchscreen, 16M colors',5.2,'1080 x 1920','16:09','16 MP, f/2.0, 1.0 um pixel size, 1080p, LED flash','Dual: 12 MP (f/2.0, 1.4 um, PDAF, dual pixel) + 8 MP (f/2.2, 1.12 um, no AF), phase detection autofocus, dual-LED dual-tone flash',3000,'Yes','Yes','Front'),(51,'Motorola Moto G5 Plus','Motorola','Android','Qualcomm MSM8953 Snapdragon 625','5.91 x 2.91 x 0.30',5.47,'32, 64','2, 4','IPS LCD capacitive touchscreen, 16M colors',5.2,'1080 x 1920','16:09','5 MP, f/2.2','12 MP (f/1.7, Dual Pixel PDAF), phase detection autofocus, dual-LED dual-tone flash',3000,'Yes','Yes','Front'),(52,'Motorola Moto G5S Plus','Motorola','Android','Qualcomm MSM8953 Snapdragon 625','6.04 x 3.00 x 0.31',5.93,'32, 64','3, 4','IPS LCD capacitive touchscreen, 16M colors',5.5,'1080 x 1920','16:09','8 MP, f/2.0, LED flash','Dual: 13 MP, f/2.0, autofocus, dual-LED dual-tone flash',3000,'Yes','Yes','Front');
/*!40000 ALTER TABLE `celldata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `celldata_has_cellbands`
--

DROP TABLE IF EXISTS `celldata_has_cellbands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `celldata_has_cellbands` (
  `cellData_cellID` int(10) unsigned NOT NULL,
  `cellBands_cellBandID` int(11) NOT NULL,
  PRIMARY KEY (`cellData_cellID`,`cellBands_cellBandID`),
  KEY `fk_cellData_has_cellBands_cellBands1_idx` (`cellBands_cellBandID`),
  KEY `fk_cellData_has_cellBands_cellData_idx` (`cellData_cellID`),
  CONSTRAINT `fk_cellData_has_cellBands_cellBands1` FOREIGN KEY (`cellBands_cellBandID`) REFERENCES `cellbands` (`cellBandID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_cellData_has_cellBands_cellData` FOREIGN KEY (`cellData_cellID`) REFERENCES `celldata` (`cellID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `celldata_has_cellbands`
--

LOCK TABLES `celldata_has_cellbands` WRITE;
/*!40000 ALTER TABLE `celldata_has_cellbands` DISABLE KEYS */;
/*!40000 ALTER TABLE `celldata_has_cellbands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pictures`
--

DROP TABLE IF EXISTS `pictures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pictures` (
  `picture_ID` int(11) NOT NULL,
  `picture_path` varchar(100) DEFAULT NULL,
  `cellData_cellID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`picture_ID`),
  KEY `fk_pictures_cellData1_idx` (`cellData_cellID`),
  CONSTRAINT `fk_pictures_cellData1` FOREIGN KEY (`cellData_cellID`) REFERENCES `celldata` (`cellID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pictures`
--

LOCK TABLES `pictures` WRITE;
/*!40000 ALTER TABLE `pictures` DISABLE KEYS */;
/*!40000 ALTER TABLE `pictures` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-13 16:15:09

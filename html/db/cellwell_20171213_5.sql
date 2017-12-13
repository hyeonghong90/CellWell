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
INSERT INTO `celldata_has_cellbands` VALUES (5,1),(6,1),(9,1),(10,1),(14,1),(15,1),(27,1),(50,1),(5,2),(6,2),(9,2),(10,2),(14,2),(15,2),(50,2),(5,3),(6,3),(9,3),(10,3),(14,3),(15,3),(27,3),(50,3),(1,4),(2,4),(3,4),(4,4),(5,4),(6,4),(7,4),(8,4),(9,4),(10,4),(11,4),(12,4),(13,4),(14,4),(15,4),(16,4),(17,4),(18,4),(19,4),(20,4),(21,4),(22,4),(23,4),(24,4),(25,4),(26,4),(27,4),(28,4),(29,4),(30,4),(31,4),(32,4),(33,4),(34,4),(35,4),(36,4),(37,4),(38,4),(39,4),(40,4),(41,4),(42,4),(43,4),(44,4),(45,4),(46,4),(47,4),(48,4),(49,4),(50,4),(51,4),(1,5),(2,5),(3,5),(4,5),(5,5),(6,5),(7,5),(8,5),(9,5),(10,5),(11,5),(12,5),(13,5),(14,5),(15,5),(16,5),(17,5),(18,5),(19,5),(20,5),(21,5),(22,5),(23,5),(24,5),(25,5),(26,5),(27,5),(28,5),(29,5),(30,5),(31,5),(32,5),(33,5),(34,5),(35,5),(36,5),(37,5),(38,5),(39,5),(40,5),(41,5),(42,5),(43,5),(44,5),(45,5),(46,5),(47,5),(48,5),(49,5),(50,5),(51,5),(1,6),(2,6),(3,6),(4,6),(5,6),(6,6),(7,6),(8,6),(9,6),(10,6),(11,6),(12,6),(13,6),(14,6),(15,6),(17,6),(18,6),(22,6),(32,6),(33,6),(34,6),(35,6),(36,6),(37,6),(40,6),(41,6),(42,6),(43,6),(45,6),(46,6),(47,6),(48,6),(50,6),(1,7),(2,7),(4,7),(5,7),(6,7),(7,7),(8,7),(9,7),(10,7),(11,7),(12,7),(13,7),(14,7),(15,7),(22,7),(24,7),(32,7),(33,7),(34,7),(40,7),(44,7),(50,7),(1,8),(2,8),(3,8),(4,8),(5,8),(6,8),(7,8),(8,8),(9,8),(10,8),(11,8),(12,8),(13,8),(14,8),(15,8),(17,8),(18,8),(22,8),(24,8),(25,8),(32,8),(33,8),(34,8),(35,8),(36,8),(37,8),(40,8),(41,8),(42,8),(43,8),(44,8),(45,8),(46,8),(47,8),(50,8),(1,9),(2,9),(3,9),(4,9),(5,9),(6,9),(7,9),(8,9),(9,9),(10,9),(11,9),(12,9),(13,9),(14,9),(15,9),(17,9),(18,9),(22,9),(24,9),(25,9),(26,9),(31,9),(32,9),(33,9),(34,9),(35,9),(36,9),(37,9),(40,9),(41,9),(42,9),(43,9),(44,9),(47,9),(48,9),(50,9),(51,9),(5,10),(6,10),(9,10),(10,10),(11,10),(12,10),(13,10),(14,10),(15,10),(32,10),(33,10),(34,10),(40,10),(41,10),(48,10),(3,11),(5,11),(6,11),(7,11),(8,11),(9,11),(10,11),(11,11),(12,11),(13,11),(14,11),(15,11),(32,11),(33,11),(34,11),(35,11),(36,11),(37,11),(40,11),(41,11),(48,11),(51,11),(6,12),(9,12),(10,12),(11,12),(12,12),(13,12),(14,12),(15,12),(34,12),(1,13),(2,13),(3,13),(4,13),(6,13),(7,13),(8,13),(9,13),(10,13),(11,13),(12,13),(13,13),(14,13),(15,13),(17,13),(18,13),(22,13),(24,13),(25,13),(26,13),(31,13),(32,13),(33,13),(34,13),(35,13),(36,13),(37,13),(40,13),(41,13),(42,13),(43,13),(44,13),(45,13),(46,13),(47,13),(48,13),(49,13),(50,13),(3,14),(6,14),(7,14),(8,14),(9,14),(10,14),(11,14),(12,14),(13,14),(14,14),(15,14),(17,14),(26,14),(32,14),(33,14),(34,14),(40,14),(41,14),(42,14),(43,14),(45,14),(46,14),(47,14),(48,14),(49,14),(51,14),(9,15),(10,15),(11,15),(12,15),(13,15),(40,15);
/*!40000 ALTER TABLE `celldata_has_cellbands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pictures`
--

DROP TABLE IF EXISTS `pictures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pictures` (
  `picture_ID` int(11) NOT NULL AUTO_INCREMENT,
  `picture_path` varchar(100) DEFAULT NULL,
  `cellData_cellID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`picture_ID`),
  KEY `fk_pictures_cellData1_idx` (`cellData_cellID`),
  CONSTRAINT `fk_pictures_cellData1` FOREIGN KEY (`cellData_cellID`) REFERENCES `celldata` (`cellID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pictures`
--

LOCK TABLES `pictures` WRITE;
/*!40000 ALTER TABLE `pictures` DISABLE KEYS */;
INSERT INTO `pictures` VALUES (1,'img/phone-imgs/Apple_Apple iPhone 7 Plus.jpg',14),(2,'img/phone-imgs/Apple_Apple iPhone 7.jpg',15),(3,'img/phone-imgs/Apple_Apple iPhone 8 Plus.jpg',12),(4,'img/phone-imgs/Apple_Apple iPhone 8.jpg',13),(5,'img/phone-imgs/Apple_Apple iPhone X.jpg',11),(6,'img/phone-imgs/BlackBerry_BlackBerry DTEK50.jpg',44),(7,'img/phone-imgs/BlackBerry_BlackBerry DTEK60.jpg',43),(8,'img/phone-imgs/BlackBerry_BlackBerry Keyone.jpg',45),(9,'img/phone-imgs/Google_Google Pixel 2 XL.jpg',10),(10,'img/phone-imgs/Google_Google Pixel 2.jpg',9),(11,'img/phone-imgs/Google_Google Pixel XL.jpg',8),(12,'img/phone-imgs/Google_Google Pixel.jpg',7),(13,'img/phone-imgs/HTC_HTC Bolt.jpg',49),(14,'img/phone-imgs/HTC_HTC U Ultra.jpg',48),(15,'img/phone-imgs/HTC_HTC U11+.jpg',46),(16,'img/phone-imgs/HTC_HTC U11.jpg',47),(17,'img/phone-imgs/Huawei_Huawei Nexus 6P.jpg',6),(18,'img/phone-imgs/LG_LG G6.jpg',4),(19,'img/phone-imgs/LG_LG Nexus 5X.jpg',5),(20,'img/phone-imgs/LG_LG V20.jpg',3),(21,'img/phone-imgs/LG_LG V30+.jpg',2),(22,'img/phone-imgs/LG_LG V30.jpg',1),(23,'img/phone-imgs/Motorola_Motorola Moto G5 Plus.jpg',51),(24,'img/phone-imgs/Motorola_Motorola Moto G5s Plus.jpg',52),(25,'img/phone-imgs/Motorola_Motorola Moto X4.jpg',50),(26,'img/phone-imgs/Nokia_Nokia 3.jpg',30),(27,'img/phone-imgs/Nokia_Nokia 5.jpg',29),(28,'img/phone-imgs/Nokia_Nokia 6.jpg',28),(29,'img/phone-imgs/Nokia_Nokia 7.jpg',27),(30,'img/phone-imgs/Nokia_Nokia 8.jpg',26),(31,'img/phone-imgs/Samsung_Samsung Galaxy J5.jpg',39),(32,'img/phone-imgs/Samsung_Samsung Galaxy J7.jpg',38),(33,'img/phone-imgs/Samsung_Samsung Galaxy Note5.jpg',41),(34,'img/phone-imgs/Samsung_Samsung Galaxy Note8.jpg',40),(35,'img/phone-imgs/Samsung_Samsung Galaxy S6 edge+.jpg',35),(36,'img/phone-imgs/Samsung_Samsung Galaxy S6 edge.jpg',36),(37,'img/phone-imgs/Samsung_Samsung Galaxy S6.jpg',37),(38,'img/phone-imgs/Samsung_Samsung Galaxy S7 edge.jpg',33),(39,'img/phone-imgs/Samsung_Samsung Galaxy S7.jpg',34),(40,'img/phone-imgs/Samsung_Samsung Galaxy S8+.jpg',31),(41,'img/phone-imgs/Samsung_Samsung Galaxy S8.jpg',32),(42,'img/phone-imgs/Sony_Sony T2 Ultra Dual.jpg',25),(43,'img/phone-imgs/Sony_Sony Xperia XA1 Plus.jpg',23),(44,'img/phone-imgs/Sony_Sony Xperia XZ1.jpg',21),(45,'img/phone-imgs/Sony_Sony Xperia Z2.jpg',24),(46,'img/phone-imgs/Sony_Sony Xperia Z3.jpg',22),(47,'img/phone-imgs/Windows_Lumia 550.jpg',20),(48,'img/phone-imgs/Windows_Lumia 640 XL Dual Sim.jpg',19),(49,'img/phone-imgs/Windows_Lumia 650.jpg',16),(50,'img/phone-imgs/Windows_Lumia 950 Dual Sim.jpg',18),(51,'img/phone-imgs/Windows_Lumia 950 XL.jpg',17);
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

-- Dump completed on 2017-12-13 17:17:54

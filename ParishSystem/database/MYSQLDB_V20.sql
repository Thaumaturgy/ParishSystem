CREATE DATABASE  IF NOT EXISTS `sad2` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `sad2`;
-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: sad2
-- ------------------------------------------------------
-- Server version	5.7.16-log

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
-- Table structure for table `applicant`
--

DROP TABLE IF EXISTS `applicant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `applicant` (
  `applicantID` int(11) NOT NULL AUTO_INCREMENT,
  `profileID` int(11) NOT NULL,
  `applicationID` int(11) NOT NULL,
  PRIMARY KEY (`applicantID`),
  KEY `applicant_genprof_idx` (`profileID`),
  KEY `applicant_application_idx` (`applicationID`),
  CONSTRAINT `applicant_application` FOREIGN KEY (`applicationID`) REFERENCES `application` (`applicationID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `applicant_genprof` FOREIGN KEY (`profileID`) REFERENCES `generalprofile` (`profileID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `applicant`
--

LOCK TABLES `applicant` WRITE;
/*!40000 ALTER TABLE `applicant` DISABLE KEYS */;
INSERT INTO `applicant` VALUES (9,8,10),(10,9,11),(11,9,15),(12,8,13),(13,9,13),(14,11,14),(15,12,22),(16,13,20),(17,14,21),(34,23,31),(35,24,32),(36,25,33),(37,24,33),(38,26,34),(39,27,34),(40,28,35),(41,29,36),(42,30,37),(43,31,38),(44,32,39),(45,33,40),(46,34,41),(47,35,42),(48,36,43);
/*!40000 ALTER TABLE `applicant` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER Applicant_AI AFTER INSERT 
ON Applicant FOR EACH ROW
BEGIN
	DECLARE tableName TEXT;
    DEClARE operation INT;
    DECLARE newRecord TEXT;
    
	DECLARE person TEXT;
    DECLARE sacramentType TEXT;
    
    SELECT CONCAT_WS(' ', firstName, midName, lastName, suffix), 
    getSacrament(Application.sacramentType) INTO person, sacramentType FROM GeneralProfile NATURAL JOIN Applicant NATURAL JOIN Application
    WHERE GeneralProfile.profileID = NEW.profileID AND Application.applicationID = NEW.applicationID;
    
    SET tableName = 'Applicant';
    SET operation = 1;
    SET newRecord = CONCAT_WS('; ', 
    CONCAT('Name:  ', person), 
    CONCAT('Sacrament Type: ', sacramentType));
    
    INSERT INTO auditlog(tableName, operation, newRecord, userID) VALUES (tableName, operation, newRecord, @userID);

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `application`
--

DROP TABLE IF EXISTS `application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `application` (
  `applicationID` int(11) NOT NULL AUTO_INCREMENT,
  `sacramentType` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `requirements` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`applicationID`),
  KEY `sacType_idx` (`sacramentType`),
  CONSTRAINT `sacType` FOREIGN KEY (`sacramentType`) REFERENCES `itemtype` (`itemTypeID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application`
--

LOCK TABLES `application` WRITE;
/*!40000 ALTER TABLE `application` DISABLE KEYS */;
INSERT INTO `application` VALUES (10,1,2,'111'),(11,1,1,'111'),(12,2,1,'000'),(13,3,3,'000111'),(14,1,1,'000'),(15,2,1,'000'),(16,2,1,'000'),(17,2,1,'000'),(18,2,1,'000'),(19,2,1,'000'),(20,2,2,'000'),(21,1,1,'000'),(22,2,1,'111'),(23,1,1,'000'),(24,1,1,'000'),(25,1,1,'000'),(26,1,1,'000'),(27,2,1,'000'),(28,2,1,'000'),(29,2,1,'111'),(30,2,1,'000'),(31,1,2,'111'),(32,2,1,'000'),(33,3,1,'111111'),(34,3,2,'111111'),(35,1,2,'111'),(36,2,2,'111'),(37,1,2,'111'),(38,1,2,'111'),(39,2,2,'111'),(40,2,2,'111'),(41,2,1,'100'),(42,2,1,'011'),(43,2,1,'000');
/*!40000 ALTER TABLE `application` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER Application_AU AFTER UPDATE
ON Application FOR EACH ROW
BEGIN
	DECLARE tableName TEXT;
    DECLARE operation TEXT;
    DECLARE newRecord TEXT;
	DECLARE oldRecord TEXT;
    
	DECLARE person TEXT;
    DECLARE details TEXT;
    DECLARE numRow INT;
    
	#Retrieve Groom Bride if Marriage, retrieve Person if Baptism or Confirmation
	DECLARE groom TEXT;
	DECLARE bride TEXT;
    
    
    SELECT 
    IF(NEW.requirements = OLD.requirements, '', 'Updated Requirements')
    INTO details 
    FROM GeneralProfile NATURAL JOIN Applicant NATURAL JOIN Application
    WHERE Application.applicationID = NEW.applicationID LIMIT 0,1;

	SET person = getApplicationPersons(New.applicationID);

    SET tableName = 'Application';
    SET operation = 2;
    SET newRecord = CONCAT_WS('; ', 
    CONCAT('Name: ', person), 
    CONCAT('Sacrament Type: ', getSacrament(NEW.sacramentType)), 
    CONCAT('Status: ', getApplicationStatus(NEW.status)));
    
    SET oldRecord = CONCAT_WS('; ', 
    CONCAT('Name: ', person), 
    CONCAT('Sacrament Type: ', getSacrament(OLD.sacramentType)), 
    CONCAT('Status: ', getApplicationStatus(OLD.status)));
    
    INSERT INTO auditlog(tableName, operation, oldRecord, newRecord, details, userID) VALUES ('Application', 2, oldRecord, newRecord, details, @userID);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `auditlog`
--

DROP TABLE IF EXISTS `auditlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auditlog` (
  `auditLogID` int(11) NOT NULL AUTO_INCREMENT,
  `tableName` varchar(100) DEFAULT NULL,
  `operation` int(11) DEFAULT NULL,
  `oldRecord` text,
  `newRecord` text,
  `auditDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `details` varchar(45) DEFAULT NULL,
  `userID` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`auditLogID`)
) ENGINE=InnoDB AUTO_INCREMENT=402 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditlog`
--

LOCK TABLES `auditlog` WRITE;
/*!40000 ALTER TABLE `auditlog` DISABLE KEYS */;
INSERT INTO `auditlog` VALUES (2,'Profile',1,NULL,'First Name = Justin Henry; M.I. = C; Last Name = Lo; Birthdate = 1998-12-16; Residence = Damosa; Birth Place = Davao','2017-09-16 11:17:50',NULL,'3'),(3,'Profile',2,'First Name: Justin Henry; M.I.: C; Last Name: Lo; Birthdate: 1998-12-16; Residence: Damosa; Birth Place: Davao','First Name: Justin Henry; M.I.: C; Last Name: Lu; Birthdate: 1998-12-16; Residence: Damosa; Birth Place: Davao','2017-09-16 11:55:13',NULL,NULL),(4,'Profile',3,'First Name: Justin Henry; M.I.: C; Last Name: Lu; Birthdate: 1998-12-16; Residence: Damosa; Birth Place: Davao',NULL,'2017-09-16 11:55:39',NULL,NULL),(5,'Profile',1,NULL,'First Name: Francis; M.I.: A; Last Name: Robins; Suffix: ; Birthdate: 2017-09-16','2017-09-17 05:29:22',NULL,NULL),(6,'Profile',1,NULL,'First Name: Rachel; M.I.: D; Last Name: Shwartz; Suffix: ; Birthdate: 2017-02-01','2017-09-17 06:12:50',NULL,NULL),(7,'Profile',2,NULL,'First Name: Dinna; M.I.: A; Last Name: Fitzgerald; Suffix: ; Birthdate: 2017-09-10; Residence: Bridgehaven; Birth Place: Poston','2017-09-19 15:17:26',NULL,NULL),(8,'Profile',2,NULL,'First Name: Andrea; M.I.: C; Last Name: Gaultze; Suffix: ; Birthdate: 2017-09-10','2017-09-19 15:21:02',NULL,NULL),(9,'Profile',2,NULL,'First Name: Andrea; M.I.: C; Last Name: Gaultz; Suffix: ; Birthdate: 2017-09-10','2017-09-19 15:21:41',NULL,'2'),(10,'Profile',2,NULL,'First Name: Andreia; M.I.: Q; Last Name: Gaultz; Suffix: ; Birthdate: 2017-09-10','2017-09-19 17:28:02',NULL,NULL),(11,'Profile',2,NULL,'First Name: Rachel; M.I.: D; Last Name: Shwart; Suffix: ; Birthdate: 2017-02-01','2017-09-19 17:37:33',NULL,'2'),(12,'Profile',2,NULL,'First Name: Dinna; M.I.: A; Last Name: Fitzgerald; Suffix: ; Birthdate: 2017-09-10; Residence: Bridgehaven; Birth Place: Poston','2017-09-19 17:52:57',NULL,'2'),(13,'Profile',2,NULL,'First Name: Dinna; M.I.: A; Last Name: Fitzgerald; Suffix: ; Birthdate: 2017-09-10; Residence: Bridgehaven; Birth Place: Poston','2017-09-19 17:53:10',NULL,'2'),(14,'Profile',2,NULL,'First Name: Andrea; M.I.: C; Last Name: Gaultz; Suffix: ; Birthdate: 2017-09-10','2017-09-19 17:53:21',NULL,'2'),(15,'Profile',2,NULL,'First Name: Andreia; M.I.: Q; Last Name: Gaultz; Suffix: ; Birthdate: 2017-09-10','2017-09-19 17:56:15',NULL,'2'),(16,'Profile',2,NULL,'First Name: Andrea; M.I.: C; Last Name: Gaultz; Suffix: ; Birthdate: 2017-09-10','2017-09-19 17:58:23',NULL,'2'),(17,'Profile',2,NULL,'First Name: Andrea; M.I.: C; Last Name: Gaultz; Suffix: ; Birthdate: 2017-09-10','2017-09-19 17:59:04',NULL,'2'),(18,'Profile',2,NULL,'First Name: Andrea; M.I.: C; Last Name: Gaultz; Suffix: ; Birthdate: 2017-09-10','2017-09-19 18:10:00',NULL,'1'),(19,'Profile',2,NULL,'First Name: Andrea; M.I.: C; Last Name: Gaultz; Suffix: ; Birthdate: 2017-09-10','2017-09-19 22:51:10',NULL,'2'),(20,'Profile',2,NULL,'First Name: Dinna; M.I.: A; Last Name: Fitzgerald; Suffix: ; Birthdate: 2017-09-10; Residence: Bridgehaven; Birth Place: Poston','2017-09-19 22:51:35',NULL,'2'),(21,'Profile',2,NULL,'First Name: Dinna; M.I.: A; Last Name: Fitzgerald; Suffix: ; Birthdate: 2017-09-10; Residence: Bridgehaven; Birth Place: Poston','2017-09-19 22:52:01',NULL,'2'),(22,'Profile',2,NULL,'First Name: Andreia; M.I.: Q; Last Name: Gaultz; Suffix: ; Birthdate: 2017-09-10','2017-09-19 22:52:17',NULL,'2'),(23,'Profile',2,NULL,'First Name: Andrea; M.I.: C; Last Name: Gaultz; Suffix: ; Birthdate: 2017-09-10','2017-09-19 23:58:11',NULL,'1'),(24,'Profile',2,NULL,'First Name: Francis; M.I.: A; Last Name: Robins; Suffix: ; Birthdate: 2017-09-16; Residence: Bridgehaven; Birth Place: Greyrock','2017-09-20 09:24:05',NULL,'2'),(25,'Profile',2,NULL,'First Name: Jim; M.I.: C; Last Name: Tang; Suffix: Jr; Birthdate: 2017-09-10; Residence: Bridgehaven; Birth Place: Poston','2017-09-20 09:24:05',NULL,'2'),(26,'Profile',2,NULL,'First Name: Francis; M.I.: A; Last Name: Robins; Suffix: ; Birthdate: 2017-09-16; Residence: Bridgehaven; Birth Place: Poston','2017-09-20 09:40:16',NULL,'2'),(27,'Profile',2,NULL,'First Name: Jim; M.I.: C; Last Name: Tang; Suffix: Jr; Birthdate: 2017-09-10; Residence: Bridgehaven; Birth Place: Poston','2017-09-20 09:40:17',NULL,'2'),(28,'Profile',2,NULL,'First Name: Francis; M.I.: A; Last Name: Robins; Suffix: ; Birthdate: 2017-09-16; Residence: Bridgehaven; Birth Place: Poston','2017-09-20 09:42:03',NULL,'2'),(29,'Profile',2,NULL,'First Name: Jim; M.I.: C; Last Name: Tang; Suffix: Jr; Birthdate: 2017-09-10; Residence: Bridgehaven; Birth Place: Poston','2017-09-20 09:42:03',NULL,'2'),(30,'Profile',2,NULL,'First Name: Francis; M.I.: A; Last Name: Robins; Suffix: ; Birthdate: 2017-09-16; Residence: Bridgehaven; Birth Place: Poston','2017-09-20 09:43:08',NULL,'2'),(31,'Profile',2,NULL,'First Name: Jim; M.I.: C; Last Name: Tang; Suffix: Jr; Birthdate: 2017-09-10; Residence: Bridgehaven; Birth Place: Poston','2017-09-20 09:43:08',NULL,'2'),(32,'Profile',2,NULL,'First Name: Francis; M.I.: A; Last Name: Robins; Suffix: ; Birthdate: 2017-09-16; Residence: Bridgehaven; Birth Place: Poston','2017-09-20 11:33:39',NULL,'2'),(33,'Profile',2,NULL,'First Name: Jim; M.I.: C; Last Name: Tang; Suffix: Jr; Birthdate: 2017-09-10; Residence: Bridgehaven; Birth Place: Poston','2017-09-20 11:33:39',NULL,'2'),(34,'Profile',2,NULL,'First Name: Francis; M.I.: A; Last Name: Robins; Suffix: ; Birthdate: 2017-09-16; Residence: Bridgehaven; Birth Place: Poston','2017-09-20 11:35:52',NULL,'2'),(35,'Profile',2,NULL,'First Name: Jim; M.I.: C; Last Name: Tang; Suffix: Jr; Birthdate: 2017-09-10; Residence: Bridgehaven; Birth Place: Poston','2017-09-20 11:35:52',NULL,'2'),(36,'Profile',2,NULL,'First Name: Francis; M.I.: A; Last Name: Robins; Suffix: ; Birthdate: 2017-09-16; Residence: Bridgehaven; Birth Place: Poston','2017-09-20 11:38:25',NULL,'2'),(37,'Profile',2,NULL,'First Name: Jim; M.I.: C; Last Name: Tang; Suffix: Jr; Birthdate: 2017-09-10; Residence: Bridgehaven; Birth Place: Poston','2017-09-20 11:38:25',NULL,'2'),(38,'Profile',2,NULL,'First Name: Francis; M.I.: A; Last Name: Robins; Suffix: ; Birthdate: 2017-09-16; Residence: Bridgehaven; Birth Place: Poston','2017-09-20 11:41:25',NULL,'2'),(39,'Profile',2,NULL,'First Name: Jim; M.I.: C; Last Name: Tang; Suffix: Jr; Birthdate: 2017-09-10; Residence: Bridgehaven; Birth Place: Poston','2017-09-20 11:41:25',NULL,'2'),(40,'Profile',2,NULL,'First Name: Francis; M.I.: A; Last Name: Robins; Suffix: ; Birthdate: 2017-09-16; Residence: Bridgehaven; Birth Place: Postone','2017-09-20 11:42:47',NULL,'2'),(41,'Profile',2,NULL,'First Name: Jim; M.I.: C; Last Name: Tang; Suffix: Jr; Birthdate: 2017-09-10; Residence: Bridgehaven; Birth Place: Poston','2017-09-20 11:42:47',NULL,'2'),(42,'Profile',2,NULL,'First Name: Francis; M.I.: A; Last Name: Robins; Suffix: ; Birthdate: 2017-09-16; Residence: Bridgehaven; Birth Place: Postone','2017-09-20 13:50:05',NULL,'2'),(43,'Profile',2,NULL,'First Name: Jim; M.I.: C; Last Name: Tang; Suffix: Jr; Birthdate: 2017-09-10; Residence: Bridgehaven; Birth Place: Poston','2017-09-20 13:50:05',NULL,'2'),(44,'Profile',2,NULL,'First Name: Francis; M.I.: A; Last Name: Robins; Suffix: ; Birthdate: 2017-09-16; Residence: Bridgehaven; Birth Place: Postone','2017-09-20 13:53:18',NULL,'2'),(45,'Profile',2,NULL,'First Name: Jim; M.I.: C; Last Name: Tang; Suffix: Jr; Birthdate: 2017-09-10; Residence: Bridgehaven; Birth Place: Poston','2017-09-20 13:53:29',NULL,'2'),(46,'Profile',2,NULL,'First Name: Francis; M.I.: A; Last Name: Robins; Suffix: ; Birthdate: 2017-09-16; Residence: Bridgehaven; Birth Place: Postone','2017-09-20 13:56:35',NULL,'2'),(47,'Profile',2,NULL,'First Name: Jim; M.I.: C; Last Name: Tang; Suffix: Jr; Birthdate: 2017-09-10; Residence: Bridgehaven; Birth Place: Poston','2017-09-20 13:56:42',NULL,'2'),(48,'Profile',2,NULL,'First Name: Jim; M.I.: C; Last Name: Tang; Suffix: Jr; Birthdate: 2017-09-10; Residence: Bridgehaven; Birth Place: Postonia','2017-09-20 14:02:19',NULL,'2'),(49,'Profile',2,NULL,'First Name: Dinna; M.I.: A; Last Name: Fitzgerald; Suffix: ; Birthdate: 2017-09-10; Residence: Bridgehaven; Birth Place: Poston','2017-09-20 14:02:22',NULL,'2'),(50,'Profile',2,NULL,'First Name: Dina; M.I.: A; Last Name: Fitzgerald; Suffix: ; Birthdate: 2017-09-10; Residence: Bridgehaven; Birth Place: Poston','2017-09-20 14:28:24',NULL,'2'),(51,'Profile',2,NULL,'First Name: Dinaa; M.I.: A; Last Name: Fitzgerald; Suffix: ; Birthdate: 2017-09-10; Residence: Bridgehaven; Birth Place: Poston','2017-09-20 14:36:55',NULL,'2'),(52,'Profile',2,NULL,'First Name: Dina; M.I.: Fitzgerald; Last Name: A; Suffix: ; Birthdate: 2017-09-10; Residence: Bridgehaven; Birth Place: Poston','2017-09-20 22:41:47',NULL,'2'),(53,'Profile',2,NULL,'First Name: Dina; M.I.: A; Last Name: Fitzgerald; Suffix: ; Birthdate: 2017-09-10; Residence: Bridgehaven; Birth Place: Poston','2017-09-20 22:41:55',NULL,'2'),(54,'Profile',2,NULL,'First Name: Dinna; M.I.: A; Last Name: Fitzgerald; Suffix: ; Birthdate: 2017-09-10; Residence: Bridgehaven; Birth Place: Poston','2017-09-20 22:44:45',NULL,'2'),(55,'Profile',2,NULL,'First Name: Dina; M.I.: A; Last Name: Fitzgerald; Suffix: ; Birthdate: 2017-09-10; Residence: Bridgehaven; Birth Place: Poston','2017-09-20 22:44:56',NULL,'2'),(56,'Profile',2,NULL,'First Name: Dinaq; M.I.: A; Last Name: Fitzgerald; Suffix: ; Birthdate: 2017-09-10; Residence: Bridgehaven; Birth Place: Poston','2017-09-20 22:52:49',NULL,'2'),(57,'Profile',2,NULL,'First Name: Nina; M.I.: A; Last Name: Fitzgerald; Suffix: ; Birthdate: 2017-09-10; Residence: Bridgehaven; Birth Place: Poston','2017-09-20 22:53:12',NULL,'2'),(58,'Application',2,'Name: Jim C Tang Jr; Sacrament TypeCase not found; Status: Approved','Name: Jim C Tang Jr; Sacrament TypeCase not found; Status: Pending','2017-09-21 06:16:49','',NULL),(59,'Application',2,'Name: Jim C Tang Jr; Sacrament Type: Case not found; Status: Pending','Name: Jim C Tang Jr; Sacrament Type: Case not found; Status: Approved','2017-09-21 06:18:40','',NULL),(60,'Application',2,'Name: Jim C Tang Jr; Sacrament Type: Case not found; Status: Approved','Name: Jim C Tang Jr; Sacrament Type: Case not found; Status: Pending','2017-09-21 06:22:28','',NULL),(61,'Application',2,'Name: Jim C Tang Jr; Sacrament Type: Case not found; Status: Pending','Name: Jim C Tang Jr; Sacrament Type: Case not found; Status: Approved','2017-09-21 06:22:45','',NULL),(62,'Application',2,'Name: Jim C Tang Jr; Sacrament Type: Case not found; Status: Approved','Name: Jim C Tang Jr; Sacrament Type: Case not found; Status: Pending','2017-09-21 06:23:43','',NULL),(63,'Application',2,'Name: Jim C Tang Jr; Sacrament Type: 1; Status: Pending','Name: Jim C Tang Jr; Sacrament Type: 1; Status: Approved','2017-09-21 06:24:47','',NULL),(64,'Application',2,'Name: Jim C Tang Jr; Sacrament Type: Baptism; Status: Approved','Name: Jim C Tang Jr; Sacrament Type: Baptism; Status: Pending','2017-09-21 06:26:03','',NULL),(65,'Application',2,'Name: Nina A Fitzgerald ; Sacrament Type: Baptism; Status: Pending','Name: Nina A Fitzgerald ; Sacrament Type: Baptism; Status: Approved','2017-09-21 06:26:03','',NULL),(66,'Application',2,'Name: Jim C Tang Jr; Sacrament Type: Baptism; Status: Pending','Name: Jim C Tang Jr; Sacrament Type: Baptism; Status: Approved','2017-09-21 06:31:04','',NULL),(67,'Application',2,'Name: Nina A Fitzgerald ; Sacrament Type: Baptism; Status: Approved','Name: Nina A Fitzgerald ; Sacrament Type: Baptism; Status: Pending','2017-09-21 06:32:30','',NULL),(68,'Application',2,'Sacrament Type: Case not found; Status: Approved','Sacrament Type: Case not found; Status: Pending','2017-09-21 06:32:40',NULL,NULL),(69,'Application',2,'Name: Jim C Tang Jr; Sacrament Type: Case not found; Status: Approved','Name: Jim C Tang Jr; Sacrament Type: Case not found; Status: Pending','2017-09-21 08:19:14','Updated Requirements',NULL),(70,'Application',2,'Name: Jim C Tang Jr & Nina A Fitzgerald ; Sacrament Type: Case not found; Status: Pending','Name: Jim C Tang Jr & Nina A Fitzgerald ; Sacrament Type: Case not found; Status: Pending','2017-09-21 08:22:14','Updated Requirements',NULL),(71,'Application',2,'Name: Nina A Fitzgerald ; Sacrament Type: Baptism; Status: Pending','Name: Nina A Fitzgerald ; Sacrament Type: Baptism; Status: Pending','2017-09-21 08:22:46','Updated Requirements',NULL),(72,'Application',2,'Name: Jim C Tang Jr & Nina A Fitzgerald ; Sacrament Type: Case not found; Status: Pending','Name: Jim C Tang Jr & Nina A Fitzgerald ; Sacrament Type: Case not found; Status: Approved','2017-09-21 08:36:44','',NULL),(73,'Application',2,'Name: Jim C Tang Jr & Nina A Fitzgerald ; Sacrament Type: Case not found; Status: Approved','Name: Jim C Tang Jr & Nina A Fitzgerald ; Sacrament Type: Case not found; Status: Approved','2017-09-21 08:39:33','',NULL),(74,'Application',2,'Name: Jim C Tang Jr & Nina A Fitzgerald ; Sacrament Type: Case not found; Status: Approved','Name: Jim C Tang Jr & Nina A Fitzgerald ; Sacrament Type: Case not found; Status: Approved','2017-09-21 08:41:00','Updated Requirements',NULL),(75,'Application',2,'Name: Jim C Tang Jr & Nina A Fitzgerald ; Sacrament Type: 3; Status: Approved','Name: Jim C Tang Jr & Nina A Fitzgerald ; Sacrament Type: 3; Status: Approved','2017-09-21 08:42:17','Updated Requirements',NULL),(76,'Application',2,'Name: Jim C Tang Jr & Nina A Fitzgerald ; Sacrament Type: Case not found; Status: Approved','Name: Jim C Tang Jr & Nina A Fitzgerald ; Sacrament Type: Case not found; Status: Approved','2017-09-21 08:54:07','Updated Requirements',NULL),(77,'Application',2,'Name: Jim C Tang Jr & Nina A Fitzgerald ; Sacrament Type: Case not found; Status: Approved','Name: Jim C Tang Jr & Nina A Fitzgerald ; Sacrament Type: Case not found; Status: Approved','2017-09-21 08:57:09','Updated Requirements',NULL),(78,'Application',2,'Name: Jim C Tang Jr & Nina A Fitzgerald ; Sacrament Type: Case not found 3; Status: Approved','Name: Jim C Tang Jr & Nina A Fitzgerald ; Sacrament Type: Case not found 3; Status: Approved','2017-09-21 08:58:45','Updated Requirements',NULL),(79,'Application',2,'Name: Jim C Tang Jr & Nina A Fitzgerald ; Sacrament Type: Marriage; Status: Approved','Name: Jim C Tang Jr & Nina A Fitzgerald ; Sacrament Type: Marriage; Status: Pending','2017-09-21 09:02:01','',NULL),(80,'Profile',2,NULL,'First Name: Jim; M.I.: C; Last Name: Tang; Suffix: Jr; Birthdate: 2017-09-10; Residence: Bridgehaven; Birth Place: Postonia','2017-09-22 07:23:19',NULL,'2'),(81,'Profile',2,NULL,'First Name: Nina; M.I.: A; Last Name: Fitzgerald; Suffix: ; Birthdate: 2017-09-10; Residence: Bridgehaven; Birth Place: Poston','2017-09-22 07:23:22',NULL,'2'),(82,'Application',2,'Name: Jim C Tang Jr & Nina A Fitzgerald ; Sacrament Type: Marriage; Status: Pending','Name: Jim C Tang Jr & Nina A Fitzgerald ; Sacrament Type: Marriage; Status: Approved','2017-09-22 07:23:27','','2'),(83,'Application',2,'Name: Jim C Tang Jr & Nina A Fitzgerald ; Sacrament Type: Marriage; Status: Approved','Name: Jim C Tang Jr & Nina A Fitzgerald ; Sacrament Type: Marriage; Status: Approved','2017-09-22 07:23:29','','2'),(84,'Profile',2,NULL,'First Name: Jim; M.I.: C; Last Name: Tang; Suffix: Jr; Birthdate: 2017-09-10; Residence: Bridgehaven; Birth Place: Postonia','2017-09-22 07:25:51',NULL,'2'),(85,'Profile',2,NULL,'First Name: Nina; M.I.: A; Last Name: Fitzgerald; Suffix: ; Birthdate: 2017-09-10; Residence: Bridgehaven; Birth Place: Poston','2017-09-22 07:26:01',NULL,'2'),(86,'Application',2,'Name: Jim C Tang Jr & Nina A Fitzgerald ; Sacrament Type: Marriage; Status: Approved','Name: Jim C Tang Jr & Nina A Fitzgerald ; Sacrament Type: Marriage; Status: Approved','2017-09-22 07:26:50','','2'),(87,'Application',2,'Name: Jim C Tang Jr & Nina A Fitzgerald ; Sacrament Type: Marriage; Status: Approved','Name: Jim C Tang Jr & Nina A Fitzgerald ; Sacrament Type: Marriage; Status: Approved','2017-09-22 07:26:51','','2'),(88,'Profile',2,NULL,'First Name: Jim; M.I.: C; Last Name: Tang; Suffix: Jr; Birthdate: 2017-09-10; Residence: Bridgehaven; Birth Place: Postonia','2017-09-22 07:27:40',NULL,'2'),(89,'Profile',2,NULL,'First Name: Nina; M.I.: A; Last Name: Fitzgerald; Suffix: ; Birthdate: 2017-09-10; Residence: Bridgehaven; Birth Place: Poston','2017-09-22 07:27:56',NULL,'2'),(90,'Application',2,'Name: Jim C Tang Jr & Nina A Fitzgerald ; Sacrament Type: Marriage; Status: Approved','Name: Jim C Tang Jr & Nina A Fitzgerald ; Sacrament Type: Marriage; Status: Approved','2017-09-22 07:29:00','','2'),(91,'Application',2,'Name: Jim C Tang Jr & Nina A Fitzgerald ; Sacrament Type: Marriage; Status: Approved','Name: Jim C Tang Jr & Nina A Fitzgerald ; Sacrament Type: Marriage; Status: Approved','2017-09-22 07:29:01','','2'),(92,'Profile',2,NULL,'First Name: Jim; M.I.: C; Last Name: Tang; Suffix: Jr; Birthdate: 2017-09-10; Residence: Bridgehaven; Birth Place: Postonia','2017-09-22 07:33:07',NULL,'2'),(93,'Profile',2,NULL,'First Name: Jim; M.I.: C; Last Name: Tang; Suffix: Jr; Birthdate: 2017-09-10; Residence: Bridgehaven; Birth Place: Postonia','2017-09-22 07:34:06',NULL,'2'),(94,'Profile',2,NULL,'First Name: Nina; M.I.: A; Last Name: Fitzgerald; Suffix: ; Birthdate: 2017-09-10; Residence: Bridgehaven; Birth Place: Poston','2017-09-22 07:34:30',NULL,'2'),(95,'Profile',2,NULL,'First Name: Jim; M.I.: C; Last Name: Tang; Suffix: Jr; Birthdate: 2017-09-10; Residence: Bridgehaven; Birth Place: Postonia','2017-09-22 07:37:53',NULL,'2'),(96,'Profile',2,NULL,'First Name: Nina; M.I.: A; Last Name: Fitzgerald; Suffix: ; Birthdate: 2017-09-10; Residence: Bridgehaven; Birth Place: Poston','2017-09-22 07:38:06',NULL,'2'),(97,'Application',2,'Name: Jim C Tang Jr & Nina A Fitzgerald ; Sacrament Type: Marriage; Status: Approved','Name: Jim C Tang Jr & Nina A Fitzgerald ; Sacrament Type: Marriage; Status: Approved','2017-09-22 07:40:46','','2'),(98,'Application',2,'Name: Jim C Tang Jr & Nina A Fitzgerald ; Sacrament Type: Marriage; Status: Approved','Name: Jim C Tang Jr & Nina A Fitzgerald ; Sacrament Type: Marriage; Status: Approved','2017-09-22 07:40:47','','2'),(99,'Profile',2,NULL,'First Name: Jim; M.I.: C; Last Name: Tang; Suffix: Jr; Birthdate: 2017-09-10; Residence: Bridgehaven; Birth Place: Postonia','2017-09-22 07:41:58',NULL,'2'),(100,'Profile',2,NULL,'First Name: Nina; M.I.: A; Last Name: Fitzgerald; Suffix: ; Birthdate: 2017-09-10; Residence: Bridgehaven; Birth Place: Poston','2017-09-22 07:42:07',NULL,'2'),(101,'Profile',2,NULL,'First Name: Jim; M.I.: C; Last Name: Tang; Suffix: Jr; Birthdate: 2017-09-10; Residence: Bridgehaven; Birth Place: Postonia','2017-09-22 08:07:11',NULL,'2'),(102,'Profile',2,NULL,'First Name: Nina; M.I.: A; Last Name: Fitzgerald; Suffix: ; Birthdate: 2017-09-10; Residence: Bridgehaven; Birth Place: Poston','2017-09-22 08:07:12',NULL,'2'),(103,'Application',2,'Name: Jim C Tang Jr & Nina A Fitzgerald ; Sacrament Type: Marriage; Status: Approved','Name: Jim C Tang Jr & Nina A Fitzgerald ; Sacrament Type: Marriage; Status: Approved','2017-09-22 08:07:33','','2'),(104,'Application',2,'Name: Jim C Tang Jr & Nina A Fitzgerald ; Sacrament Type: Marriage; Status: Approved','Name: Jim C Tang Jr & Nina A Fitzgerald ; Sacrament Type: Marriage; Status: Approved','2017-09-22 08:07:34','','2'),(105,'Profile',2,NULL,'First Name: Rachel; M.I.: D; Last Name: Shwartz; Suffix: ; Birthdate: 2017-02-01','2017-09-22 08:46:07',NULL,'2'),(106,'Application',2,'Name: Rachel D Shwartz ; Sacrament Type: Baptism; Status: Pending','Name: Rachel D Shwartz ; Sacrament Type: Baptism; Status: Pending','2017-09-22 08:46:07','','2'),(107,'Profile',2,NULL,'First Name: Andre; M.I.: Gaultz; Last Name: C; Suffix: ; Birthdate: 2017-09-10','2017-09-22 08:46:17',NULL,'2'),(108,'Application',2,'Name: Andre Gaultz C ; Sacrament Type: Confirmation; Status: Pending','Name: Andre Gaultz C ; Sacrament Type: Confirmation; Status: Pending','2017-09-22 08:46:17','','2'),(109,'Minister',1,NULL,'Name: Joseph A Numire; Birthdate: 1970-10-22; Ministry Type: Archbishop; Status: Active','2017-09-22 09:51:02',NULL,NULL),(110,'Minister',2,NULL,'Name: Joseph A Numirez; Birthdate: 1970-10-22; Ministry Type: Archbishop; Status: Active','2017-09-23 08:48:38',NULL,NULL),(111,'Minister',2,'Name: Joseph A Numirez; Birthdate: 1970-10-22; Ministry Type: Archbishop; Status: Active','Name: Joseph A Numire; Birthdate: 1970-10-22; Ministry Type: Archbishop; Status: Active','2017-09-23 08:49:53',NULL,NULL),(112,'Minister',1,NULL,'Name: Jonathan A Jostar Jr; Birthdate: 1880-11-14; Ministry Type: Priest; Status: Active','2017-09-23 08:52:02',NULL,NULL),(113,'Minister',3,'Name: Jonathan A Jostar Jr; Birthdate: 1880-11-14; Ministry Type: Priest; Status: Active',NULL,'2017-09-23 08:52:28',NULL,NULL),(114,'Item Type',1,NULL,'Item Type: Death Certificate; Book Type: Case not found; Transaction Type: Cash Receipt; Suggested Price: 2500.00; Status: Active','2017-09-23 11:25:02',NULL,NULL),(115,'Item Type',2,'Item Type: Death Certificate; Book Type: Case not found; Transaction Type: Cash Receipt; Suggested Price: 2500.00','Item Type: Death Certificate; Book Type: Case not found; Transaction Type: Cash Receipt; Suggested Price: 2000.00','2017-09-23 19:54:45',NULL,NULL),(116,'Item Type',3,'Item Type: Death Certificate; Book Type: Case not found; Transaction Type: Cash Receipt; Suggested Price: 2000.00',NULL,'2017-09-23 19:57:20',NULL,NULL),(117,'Primary Income',3,NULL,'Source: George; Book Type: Case not found; OR Number: 2; Remarks: George\'s Payment','2017-09-23 21:10:59',NULL,NULL),(118,'Primary Income',3,'Source: George; Book Type: Parish; OR Number: 2; Remarks: George\'s Payment',NULL,'2017-09-23 21:14:22',NULL,NULL),(119,'Primary Income',3,NULL,'Source: George; Book Type: Parish; OR Number: 2; Remarks: Danielle\'s Baptism; Income Time: 2017-09-24 00:00:00','2017-09-23 21:18:35',NULL,NULL),(120,'Primary Income',3,NULL,'Source: Geralt; Book Type: Parish; OR Number: 3; Remarks: Hard Liquor','2017-09-23 21:20:38',NULL,NULL),(121,'Primary Income',3,NULL,'Source: Deralt; Book Type: Parish; OR Number: 4; Remarks: Soft Drink; Income Time: 2017-09-24 00:00:00','2017-09-23 21:21:21',NULL,NULL),(122,'Primary Income',2,NULL,'Source: Deralt; Book Type: Parish; OR Number: 4; Remarks: Hard Liquor; Income Time: 2017-09-24 00:00:00','2017-09-23 21:24:57',NULL,NULL),(123,'Primary Income',2,NULL,'Source: Deralt; Book Type: Parish; OR Number: 4; Remarks: Soft Liquor; Income Time: 2017-09-24 00:00:00','2017-09-23 21:26:25',NULL,NULL),(124,'Primary Income',2,'Source: Deralt; Book Type: Parish; OR Number: 4; Remarks: Soft Liquor; Income Time: 2017-09-24 00:00:00','Source: Deralte; Book Type: Parish; OR Number: 4; Remarks: Booze; Income Time: 2017-09-24 00:00:00','2017-09-23 21:28:00',NULL,NULL),(126,'Primary Income',1,NULL,'OR Number: 1; Payment Amount: 250.00','2017-09-23 21:43:15',NULL,NULL),(127,'Primary Income',1,NULL,'Payment Amount: 250.00','2017-09-23 21:47:51',NULL,NULL),(128,'Primary Income',1,NULL,'Payment Amount: 100.00','2017-09-23 21:55:33',NULL,NULL),(129,'Payment',1,NULL,'Payment Amount: 120.00','2017-09-23 22:00:18',NULL,NULL),(130,'Payment',1,NULL,'OR Number: -1; Payment Amount: 50.00','2017-09-23 22:01:14',NULL,NULL),(131,'Payment',1,NULL,'OR Number: 2; Payment Amount: 50.00','2017-09-24 06:27:26',NULL,NULL),(132,'Cash Release Voucher',3,'Title: SAD Defense; Details: SAD 2 Defense; Start Time: 2017-09-30 13:00:00; End Time: 2017-09-30 14:30:00','Title: SAD 2 Defense; Details: SoftEng Defense; Start Time: 2017-09-30 13:00:00; End Time: 2017-09-30 14:30:00','2017-09-24 06:48:03',NULL,NULL),(133,'Cash Release Voucher',1,NULL,'Title: Ohnana; Details: Whats my name; Start Time: 2017-09-12 10:12:00; End Time: 2017-09-12 11:12:00','2017-09-24 06:49:15',NULL,NULL),(134,'Cash Release Voucher',3,'Title: Ohnana; Details: Whats my name; Start Time: 2017-09-12 10:12:00; End Time: 2017-09-12 11:12:00',NULL,'2017-09-24 06:49:29',NULL,NULL),(135,'Appointment',1,NULL,'Title: Defense Payment; Details: Inquire and pay; Start Time: 2017-09-15 12:34:00; End Time: 2017-09-15 14:34:00; Minister: Boyle A Royce II','2017-09-24 07:01:07',NULL,NULL),(136,'Appointment',2,'Title: Defense Payment; Details: Inquire and pay; Start Time: 2017-09-15 12:34:00; End Time: 2017-09-15 14:34:00; Minister: Boyle A Royce II','Title: Defense Payments; Details: Inquire and Seek advice; Start Time: 2017-09-15 12:50:00; End Time: 2017-09-15 14:34:00; Minister: Joseph A Numire','2017-09-24 07:04:20',NULL,NULL),(137,'Profile',1,NULL,'First Name: Francesca; M.I.: A; Last Name: Sagat; Gender: 2; Birthdate: 1997-08-21; Residence: Woodsford; Birth Place: Bulmary','2017-09-24 08:08:52',NULL,NULL),(138,'Profile',2,NULL,'First Name: France; M.I.: A; Last Name: Sagat; Gender: 1; Birthdate: 1997-08-21; Residence: Woodsford; Birth Place: Bulmary','2017-09-24 08:09:09',NULL,NULL),(139,'Profile',2,'First Name: France; M.I.: A; Last Name: Sagat; Gender: 1; Birthdate: 1997-08-21; Residence: Woodsford; Birth Place: Bulmary','First Name: Frances; M.I.: A; Last Name: Sagat; Gender: 1; Birthdate: 1997-08-21; Residence: Woodsford; Birth Place: Bulmary','2017-09-24 08:10:35',NULL,NULL),(140,'Profile',2,'First Name: Frances; M.I.: A; Last Name: Sagat; Gender: Male; Birthdate: 1997-08-21; Residence: Woodsford; Birth Place: Bulmary','First Name: France; M.I.: A; Last Name: Saggat; Gender: Male; Birthdate: 1997-08-21; Residence: Woodsford; Birth Place: Bulmary','2017-09-24 08:13:01',NULL,NULL),(141,'Cash Release Voucher',1,NULL,'Check Number: 1001; Cash Voucher Number: 101; Name: Cake; Book Type: 1; Cash Release Time: 2017-09-26 00:00:00','2017-09-25 19:10:01',NULL,'3'),(142,'Schedule',1,NULL,'Title: Coding Session; Details: Code for SAD; Start Time: 2017-09-26 09:00:00; End Time: 2017-09-26 12:00:00','2017-09-26 01:12:55',NULL,'2'),(143,'Schedule',2,'Title: Coding Session; Details: Code for SAD; Start Time: 2017-09-26 09:00:00; End Time: 2017-09-26 12:00:00','Title: Coding Session; Details: Code for SAD 2. Defense approaching.; Start Time: 2017-09-26 09:00:00; End Time: 2017-09-26 12:00:00','2017-09-26 01:13:11',NULL,'2'),(144,'Profile',2,'First Name: Andre; M.I.: Gaultz; Last Name: C; Suffix: ; Gender: FEMALE; Birthdate: 2017-09-10','First Name: Andre; M.I.: C; Last Name: Gaultz; Suffix: ; Gender: FEMALE; Birthdate: 2017-09-10','2017-09-26 22:43:37',NULL,'2'),(145,'Application',2,'Name: Andre C Gaultz ; Sacrament Type: Confirmation; Status: Pending','Name: Andre C Gaultz ; Sacrament Type: Confirmation; Status: Pending','2017-09-26 22:43:38','','2'),(146,'Profile',1,NULL,'First Name: Ibrahim; M.I.: G; Last Name: Baumhauer; Suffix: ; Gender: Male; Birthdate: 2001-02-28','2017-09-27 16:55:36',NULL,'2'),(147,'Applicant',1,NULL,'','2017-09-27 16:55:36',NULL,'2'),(148,'Profile',1,NULL,'First Name: Ibrahim; M.I.: G; Last Name: Baumhauer; Suffix: ; Gender: Male; Birthdate: 2000-02-01','2017-09-27 17:00:35',NULL,'2'),(149,'Applicant',1,NULL,'','2017-09-27 17:00:35',NULL,'2'),(150,'Profile',1,NULL,'First Name: ; M.I.: ; Last Name: ; Suffix: ; Gender: Male; Birthdate: 2017-07-16','2017-09-27 20:37:46',NULL,'2'),(151,'Applicant',1,NULL,'','2017-09-27 20:37:47',NULL,'2'),(152,'Profile',1,NULL,'First Name: Beatrice; M.I.: A; Last Name: Solberg; Suffix: ; Gender: FEMALE; Birthdate: 2017-09-26','2017-09-27 20:52:31',NULL,'2'),(153,'Applicant',1,NULL,'','2017-09-27 20:52:31',NULL,'2'),(154,'Applicant',1,NULL,'Name:  Beatrice A Solberg ; Sacrament Type: Case not found','2017-09-27 20:58:06',NULL,NULL),(155,'Applicant',1,NULL,'Name:  Beatrice A Solberg ; Sacrament Type: Case not found','2017-09-27 21:03:13',NULL,NULL),(156,'Applicant',1,NULL,'Name:  Beatrice A Solberg ; Sacrament Type: Baptism','2017-09-27 21:04:55',NULL,NULL),(157,'Application',2,'Name: Beatrice A Solberg ; Sacrament Type: Confirmation; Status: Pending','Name: Beatrice A Solberg ; Sacrament Type: Baptism; Status: Pending','2017-09-27 21:09:23','',NULL),(158,'Applicant',1,NULL,'Name:  Beatrice A Solberg ; Sacrament Type: Baptism','2017-09-27 21:10:02',NULL,NULL),(159,'Application',2,'Sacrament Type: Baptism; Status: Pending','Sacrament Type: Confirmation; Status: Pending','2017-09-27 21:12:02',NULL,NULL),(160,'Applicant',1,NULL,'Name:  Beatrice A Solberg ; Sacrament Type: Case not found','2017-09-27 21:12:07',NULL,NULL),(161,'Applicant',1,NULL,'','2017-09-27 21:15:59',NULL,NULL),(162,'Applicant',1,NULL,'','2017-09-27 21:19:09',NULL,NULL),(163,'Applicant',1,NULL,'','2017-09-27 21:22:04',NULL,NULL),(165,'Applicant',1,NULL,'Name:  Beatrice A Solberg ; Sacrament Type: Confirmation','2017-09-27 21:36:03',NULL,NULL),(166,'Profile',3,NULL,NULL,'2017-09-27 21:45:30',NULL,NULL),(167,'Profile',3,NULL,NULL,'2017-09-27 21:45:30',NULL,NULL),(168,'Profile',3,NULL,NULL,'2017-09-27 21:45:30',NULL,NULL),(169,'Profile',1,NULL,'First Name: Malcolm; M.I.: A; Last Name: Peterson; Suffix: ; Gender: Male; Birthdate: 2017-09-11','2017-09-27 21:47:45',NULL,'2'),(170,'Applicant',1,NULL,'','2017-09-27 21:47:45',NULL,'2'),(171,'Profile',1,NULL,'First Name: Emmett; M.I.: B; Last Name: Mason; Suffix: ; Gender: Male; Birthdate: 2017-09-28','2017-09-27 21:57:05',NULL,'2'),(172,'Applicant',1,NULL,'','2017-09-27 21:57:06',NULL,'2'),(173,'Profile',2,'First Name: Emmett; M.I.: B; Last Name: Mason; Suffix: ; Gender: Male; Birthdate: 2017-09-28','First Name: Emmett; M.I.: Mason; Last Name: B; Suffix: ; Gender: Female; Birthdate: 2017-09-28','2017-09-27 21:57:12',NULL,'2'),(174,'Application',2,'Name: Emmett Mason B ; Sacrament Type: Confirmation; Status: Pending','Name: Emmett Mason B ; Sacrament Type: Confirmation; Status: Pending','2017-09-27 21:57:12','','2'),(175,'Profile',2,'First Name: Emmett; M.I.: Mason; Last Name: B; Suffix: ; Gender: Female; Birthdate: 2017-09-28','First Name: Emmett; M.I.: B; Last Name: Mason; Suffix: ; Gender: Female; Birthdate: 2017-09-28','2017-09-27 21:57:20',NULL,'2'),(176,'Application',2,'Name: Emmett B Mason ; Sacrament Type: Confirmation; Status: Pending','Name: Emmett B Mason ; Sacrament Type: Confirmation; Status: Pending','2017-09-27 21:57:20','Updated Requirements','2'),(177,'Profile',1,NULL,'First Name: Guy; M.I.: J; Last Name: Ingram; Suffix: ; Gender: Male; Birthdate: 2017-09-28','2017-09-27 22:00:27',NULL,'2'),(178,'Applicant',1,NULL,'Name:  Guy J Ingram ; Sacrament Type: Confirmation','2017-09-27 22:00:27',NULL,'2'),(179,'Profile',1,NULL,'First Name: Jun; M.I.: B; Last Name: Seba; Suffix: ; Gender: Male; Birthdate: 1974-02-07','2017-09-28 02:28:39',NULL,'2'),(180,'Applicant',1,NULL,'Name:  Jun B Seba ; Sacrament Type: Baptism','2017-09-28 02:28:40',NULL,'2'),(181,'Profile',1,NULL,'First Name: Jon; M.I.: A; Last Name: Marshall; Suffix: ; Gender: Male; Birthdate: 1975-09-06','2017-09-28 02:30:58',NULL,'2'),(182,'Applicant',1,NULL,'Name:  Jon A Marshall ; Sacrament Type: Confirmation','2017-09-28 02:30:58',NULL,'2'),(183,'Profile',1,NULL,'First Name: Yuki; M.I.: A; Last Name: Kajiura; Suffix: ; Gender: Female; Birthdate: 1965-08-06','2017-09-28 02:39:40',NULL,'2'),(184,'Applicant',1,NULL,'Name:  Yuki A Kajiura ; Sacrament Type: Marriage','2017-09-28 02:39:40',NULL,'2'),(185,'Applicant',1,NULL,'Name:  Jon A Marshall ; Sacrament Type: Marriage','2017-09-28 02:39:40',NULL,'2'),(186,'Profile',2,'First Name: Yuki; M.I.: A; Last Name: Kajiura; Suffix: ; Gender: Female; Birthdate: 1965-08-06','First Name: Yuki; M.I.: A; Last Name: Kajiura; Suffix: ; Gender: Male; Birthdate: 1965-08-06','2017-09-28 02:42:59',NULL,'2'),(187,'Profile',2,'First Name: Jon; M.I.: A; Last Name: Marshall; Suffix: ; Gender: Male; Birthdate: 1975-09-06','First Name: Jon; M.I.: A; Last Name: Marshall; Suffix: ; Gender: Female; Birthdate: 1975-09-06','2017-09-28 02:43:00',NULL,'2'),(188,'Application',2,'Name: Yuki A Kajiura  & Jon A Marshall ; Sacrament Type: Marriage; Status: Pending','Name: Yuki A Kajiura  & Jon A Marshall ; Sacrament Type: Marriage; Status: Pending','2017-09-28 02:43:00','Updated Requirements','2'),(189,'Application',2,'Name: Jim C Tang Jr; Sacrament Type: Baptism; Status: Approved','Name: Jim C Tang Jr; Sacrament Type: Baptism; Status: Final','2017-09-28 02:45:30','',NULL),(190,'Profile',2,'First Name: Jun; M.I.: B; Last Name: Seba; Suffix: ; Gender: Male; Birthdate: 1974-02-07','First Name: Jun; M.I.: B; Last Name: Seba; Suffix: ; Gender: Male; Birthdate: 1974-02-07','2017-09-28 02:46:09',NULL,'2'),(191,'Application',2,'Name: Jun B Seba ; Sacrament Type: Baptism; Status: Pending','Name: Jun B Seba ; Sacrament Type: Baptism; Status: Pending','2017-09-28 02:46:09','Updated Requirements','2'),(192,'Profile',2,'First Name: Jun; M.I.: B; Last Name: Seba; Suffix: ; Gender: Male; Birthdate: 1974-02-07','First Name: Jun; M.I.: B; Last Name: Seba; Suffix: ; Gender: Male; Birthdate: 1974-02-07','2017-09-28 02:53:47',NULL,'2'),(193,'Application',2,'Name: Jun B Seba ; Sacrament Type: Baptism; Status: Pending','Name: Jun B Seba ; Sacrament Type: Baptism; Status: Pending','2017-09-28 02:53:47','','2'),(194,'Profile',2,'First Name: Jun; M.I.: B; Last Name: Seba; Suffix: ; Gender: Male; Birthdate: 1974-02-07','First Name: Jun; M.I.: B; Last Name: Seba; Suffix: ; Gender: Male; Birthdate: 1974-02-07','2017-09-28 02:54:00',NULL,'2'),(195,'Application',2,'Name: Jun B Seba ; Sacrament Type: Baptism; Status: Pending','Name: Jun B Seba ; Sacrament Type: Baptism; Status: Pending','2017-09-28 02:54:00','','2'),(196,'Profile',2,'First Name: Jun; M.I.: B; Last Name: Seba; Suffix: ; Gender: Male; Birthdate: 1974-02-07','First Name: Jun; M.I.: B; Last Name: Seba; Suffix: ; Gender: Male; Birthdate: 1974-02-07','2017-09-28 02:54:07',NULL,'2'),(197,'Application',2,'Name: Jun B Seba ; Sacrament Type: Baptism; Status: Pending','Name: Jun B Seba ; Sacrament Type: Baptism; Status: Pending','2017-09-28 02:54:07','','2'),(198,'Profile',2,'First Name: Jun; M.I.: B; Last Name: Seba; Suffix: ; Gender: Male; Birthdate: 1974-02-07','First Name: Jun; M.I.: B; Last Name: Seba; Suffix: ; Gender: Male; Birthdate: 1974-02-07','2017-09-28 02:54:14',NULL,'2'),(199,'Application',2,'Name: Jun B Seba ; Sacrament Type: Baptism; Status: Pending','Name: Jun B Seba ; Sacrament Type: Baptism; Status: Pending','2017-09-28 02:54:14','','2'),(200,'Profile',2,'First Name: Jun; M.I.: B; Last Name: Seba; Suffix: ; Gender: Male; Birthdate: 1974-02-07','First Name: Jun; M.I.: B; Last Name: Seba; Suffix: ; Gender: Male; Birthdate: 1974-02-07','2017-09-28 02:54:24',NULL,'2'),(201,'Application',2,'Name: Jun B Seba ; Sacrament Type: Baptism; Status: Pending','Name: Jun B Seba ; Sacrament Type: Baptism; Status: Pending','2017-09-28 02:54:24','','2'),(202,'Profile',2,'First Name: Jun; M.I.: B; Last Name: Seba; Suffix: ; Gender: Male; Birthdate: 1974-02-07','First Name: Jun; M.I.: B; Last Name: Seba; Suffix: ; Gender: Male; Birthdate: 1974-02-07','2017-09-28 03:15:27',NULL,'2'),(203,'Application',2,'Name: Jun B Seba ; Sacrament Type: Baptism; Status: Pending','Name: Jun B Seba ; Sacrament Type: Baptism; Status: Pending','2017-09-28 03:15:28','','2'),(204,'Schedule',1,NULL,'Title: RNR; Details: CSSEC RNR; Start Time: 2017-10-14 07:00:00; End Time: 2017-10-16 17:00:00','2017-09-28 03:19:42',NULL,'2'),(205,'Application',2,'Name: Jun B Seba ; Sacrament Type: Baptism; Status: Pending','Name: Jun B Seba ; Sacrament Type: Baptism; Status: Approved','2017-09-28 03:35:15','','2'),(206,'Minister',2,'Name: Joseph A Numire; Birthdate: 1970-10-22; Ministry Type: Archbishop; Status: Active','Name: Joseph A Numire ; Birthdate: 1970-10-22; Ministry Type: Archbishop; Status: Active','2017-09-28 03:43:50',NULL,NULL),(207,'Schedule',2,'Title: SAD 2 Defense; Details: SoftEng Defense; Start Time: 2017-09-30 13:00:00; End Time: 2017-09-30 14:30:00','Title: SAD 2 Defense; Details: SoftEng Defense; Start Time: 2017-09-30 13:30:00; End Time: 2017-09-30 15:00:00','2017-09-28 04:09:58',NULL,'2'),(208,'Application',2,'Name: Jun B Seba ; Sacrament Type: Baptism; Status: Approved','Name: Jun B Seba ; Sacrament Type: Baptism; Status: Approved','2017-09-28 04:10:28','','2'),(209,'Minister',2,'Name: Joseph A Numire ; Birthdate: 1970-10-22; Ministry Type: Archbishop; Status: Active','Name: Joseph A Numirez ; Birthdate: 1970-10-22; Ministry Type: Archbishop; Status: Active','2017-09-28 04:42:44',NULL,'2'),(210,'Item Type',2,'Item Type: Marriage; Book Type: Parish; Transaction Type: Cash Receipt; Suggested Price: 2000.00','Item Type: Marriage; Book Type: Parish; Transaction Type: Cash Receipt; Suggested Price: 2000.00','2017-09-28 04:59:37',NULL,'2'),(211,'Item Type',2,'Item Type: Marriage; Book Type: Parish; Transaction Type: Cash Receipt; Suggested Price: 2000.00','Item Type: Marriage; Book Type: Parish; Transaction Type: Cash Receipt; Suggested Price: 2000.00','2017-09-28 04:59:41',NULL,'2'),(212,'Profile',2,'First Name: Rachel; M.I.: D; Last Name: Shwartz; Suffix: ; Gender: Female; Birthdate: 2017-02-01','First Name: Rachel; M.I.: D; Last Name: Shwartz; Suffix: ; Gender: Female; Birthdate: 2017-02-01','2017-09-28 05:03:42',NULL,'2'),(213,'Application',2,'Name: Rachel D Shwartz ; Sacrament Type: Baptism; Status: Pending','Name: Rachel D Shwartz ; Sacrament Type: Baptism; Status: Pending','2017-09-28 05:03:42','','2'),(214,'Profile',2,'First Name: Yuki; M.I.: A; Last Name: Kajiura; Suffix: ; Gender: Male; Birthdate: 1965-08-06','First Name: Yuki; M.I.: A; Last Name: Kajiura; Suffix: ; Gender: Male; Birthdate: 1965-08-06','2017-09-28 05:28:27',NULL,'2'),(215,'Profile',2,'First Name: Jon; M.I.: A; Last Name: Marshall; Suffix: ; Gender: Female; Birthdate: 1975-09-06','First Name: Jon; M.I.: A; Last Name: Marshall; Suffix: ; Gender: Female; Birthdate: 1975-09-06','2017-09-28 05:28:27',NULL,'2'),(216,'Application',2,'Name: Yuki A Kajiura  & Jon A Marshall ; Sacrament Type: Marriage; Status: Pending','Name: Yuki A Kajiura  & Jon A Marshall ; Sacrament Type: Marriage; Status: Pending','2017-09-28 05:28:27','','2'),(217,'Profile',2,'First Name: Rachel; M.I.: D; Last Name: Shwartz; Suffix: ; Gender: Female; Birthdate: 2017-02-01','First Name: Rachel; M.I.: D; Last Name: Shwartz; Suffix: ; Gender: Female; Birthdate: 2017-02-01','2017-09-28 05:28:54',NULL,'2'),(218,'Application',2,'Name: Rachel D Shwartz ; Sacrament Type: Baptism; Status: Pending','Name: Rachel D Shwartz ; Sacrament Type: Baptism; Status: Pending','2017-09-28 05:28:54','','2'),(219,'Profile',2,'First Name: Nina; M.I.: A; Last Name: Fitzgerald; Suffix: ; Gender: Female; Birthdate: 2017-09-10; Residence: Bridgehaven; Birth Place: Poston','First Name: Niña; M.I.: A; Last Name: Fitzgerald; Suffix: ; Gender: Female; Birthdate: 2017-09-10; Residence: Bridgehaven; Birth Place: Poston','2017-09-28 05:32:29',NULL,'2'),(220,'Application',2,'Name: Niña A Fitzgerald ; Sacrament Type: Baptism; Status: Pending','Name: Niña A Fitzgerald ; Sacrament Type: Baptism; Status: Pending','2017-09-28 05:32:29','','2'),(221,'Profile',2,'First Name: Niña; M.I.: A; Last Name: Fitzgerald; Suffix: ; Gender: Female; Birthdate: 2017-09-10; Residence: Bridgehaven; Birth Place: Poston','First Name: Niña; M.I.: A; Last Name: Fitzgerald; Suffix: ; Gender: Female; Birthdate: 2017-09-10; Residence: Bridgehaven; Birth Place: Poston','2017-09-28 05:32:40',NULL,'2'),(222,'Application',2,'Name: Niña A Fitzgerald ; Sacrament Type: Baptism; Status: Pending','Name: Niña A Fitzgerald ; Sacrament Type: Baptism; Status: Pending','2017-09-28 05:32:40','Updated Requirements','2'),(223,'Primary Income',1,NULL,'Book Type: Parish; OR Number: 5; Remarks: ','2017-09-28 06:01:37',NULL,'2'),(224,'Payment',1,NULL,'OR Number: 5; Payment Amount: 5000.00','2017-09-28 06:01:37',NULL,NULL),(225,'Application',2,'Name: Jun B Seba ; Sacrament Type: Baptism; Status: Approved','Name: Jun B Seba ; Sacrament Type: Baptism; Status: Final','2017-09-28 09:53:18','','2'),(226,'Application',2,'Name: Jun B Seba ; Sacrament Type: Baptism; Status: Final','Name: Jun B Seba ; Sacrament Type: Baptism; Status: Approved','2017-09-28 09:53:32','','2'),(227,'Application',2,'Name: Jun B Seba ; Sacrament Type: Baptism; Status: Approved','Name: Jun B Seba ; Sacrament Type: Baptism; Status: Approved','2017-09-28 09:56:55','','2'),(228,'Profile',2,'First Name: Jim; M.I.: C; Last Name: Tang; Suffix: Jr; Gender: Male; Birthdate: 2017-09-10; Residence: Bridgehaven; Birth Place: Postonia','First Name: Jim; M.I.: C; Last Name: Tang; Suffix: Jr; Gender: Male; Birthdate: 2017-09-10; Residence: Bridgehaven; Birth Place: Postonia','2017-09-28 09:57:05',NULL,'2'),(229,'Profile',2,'First Name: Niña; M.I.: A; Last Name: Fitzgerald; Suffix: ; Gender: Female; Birthdate: 2017-09-10; Residence: Bridgehaven; Birth Place: Poston','First Name: Niña; M.I.: A; Last Name: Fitzgerald; Suffix: ; Gender: Female; Birthdate: 2017-09-10; Residence: Bridgehaven; Birth Place: Poston','2017-09-28 09:57:05',NULL,'2'),(230,'Application',2,'Name: Jim C Tang Jr & Niña A Fitzgerald ; Sacrament Type: Marriage; Status: Approved','Name: Jim C Tang Jr & Niña A Fitzgerald ; Sacrament Type: Marriage; Status: Approved','2017-09-28 09:57:06','','2'),(231,'Application',2,'Name: Jim C Tang Jr & Niña A Fitzgerald ; Sacrament Type: Marriage; Status: Approved','Name: Jim C Tang Jr & Niña A Fitzgerald ; Sacrament Type: Marriage; Status: Approved','2017-09-28 09:57:06','','2'),(232,'Profile',2,'First Name: Jim; M.I.: C; Last Name: Tang; Suffix: Jr; Gender: Male; Birthdate: 2017-09-10; Residence: Bridgehaven; Birth Place: Postonia','First Name: Jim; M.I.: C; Last Name: Tang; Suffix: Jr; Gender: Male; Birthdate: 2017-09-10; Residence: Bridgehaven; Birth Place: Postonia','2017-09-28 09:57:16',NULL,'2'),(233,'Profile',2,'First Name: Niña; M.I.: A; Last Name: Fitzgerald; Suffix: ; Gender: Female; Birthdate: 2017-09-10; Residence: Bridgehaven; Birth Place: Poston','First Name: Niña; M.I.: A; Last Name: Fitzgerald; Suffix: ; Gender: Female; Birthdate: 2017-09-10; Residence: Bridgehaven; Birth Place: Poston','2017-09-28 09:57:16',NULL,'2'),(234,'Application',2,'Name: Jim C Tang Jr & Niña A Fitzgerald ; Sacrament Type: Marriage; Status: Approved','Name: Jim C Tang Jr & Niña A Fitzgerald ; Sacrament Type: Marriage; Status: Approved','2017-09-28 09:57:17','','2'),(235,'Application',2,'Name: Jim C Tang Jr & Niña A Fitzgerald ; Sacrament Type: Marriage; Status: Approved','Name: Jim C Tang Jr & Niña A Fitzgerald ; Sacrament Type: Marriage; Status: Approved','2017-09-28 09:57:17','','2'),(236,'Schedule',3,'Title: Random Event; Details: ; Start Time: 2017-09-12 06:59:00; End Time: 2017-09-12 06:59:00',NULL,'2017-09-28 11:03:29',NULL,'2'),(237,'Item Type',1,NULL,'Item Type: Donation; Book Type: Parish; Transaction Type: Cash Receipt; Suggested Price: 0.00; Status: Active','2017-09-28 20:08:50',NULL,'2'),(238,'Item Type',1,NULL,'Item Type: Parish Card; Book Type: Community; Transaction Type: Cash Receipt; Suggested Price: 50.00; Status: Active','2017-09-28 20:12:05',NULL,'2'),(239,'Profile',1,NULL,'First Name: Christopher; M.I.: C; Last Name: Green; Suffix: ; Gender: Male; Birthdate: 1970-08-15','2017-09-29 01:12:26',NULL,'2'),(240,'Profile',1,NULL,'First Name: Tina; M.I.: M; Last Name: Turner; Suffix: ; Gender: Female; Birthdate: 1969-08-04','2017-09-29 01:12:27',NULL,'2'),(241,'Applicant',1,NULL,'Name:  Christopher C Green ; Sacrament Type: Marriage','2017-09-29 01:12:28',NULL,'2'),(242,'Applicant',1,NULL,'Name:  Tina M Turner ; Sacrament Type: Marriage','2017-09-29 01:12:28',NULL,'2'),(243,'Primary Income',1,NULL,'Book Type: Parish; OR Number: 6; Remarks: ','2017-09-29 01:12:40',NULL,'2'),(244,'Payment',1,NULL,'OR Number: 6; Payment Amount: 2000.00','2017-09-29 01:12:41',NULL,NULL),(245,'Profile',2,'First Name: Christopher; M.I.: C; Last Name: Green; Suffix: ; Gender: Male; Birthdate: 1970-08-15','First Name: Christopher; M.I.: C; Last Name: Green; Suffix: ; Gender: Male; Birthdate: 1970-08-15; Residence: Houston; Birth Place: London','2017-09-29 01:17:34',NULL,'2'),(246,'Profile',2,'First Name: Tina; M.I.: M; Last Name: Turner; Suffix: ; Gender: Female; Birthdate: 1969-08-04','First Name: Tina; M.I.: M; Last Name: Turner; Suffix: ; Gender: Female; Birthdate: 1969-08-04; Residence: Houston; Birth Place: Edinburgh','2017-09-29 01:17:35',NULL,'2'),(247,'Appointment',1,NULL,'Title: Parish Appointment; Details: ; Start Time: 2017-09-30 09:20:00; End Time: 2017-09-30 10:20:00; Minister: Joshua F Lintag ','2017-09-29 01:20:23',NULL,'2'),(248,'Profile',1,NULL,'First Name: Sally; M.I.: K; Last Name: Jackson; Suffix: ; Gender: Male; Birthdate: 2017-09-01','2017-09-29 01:22:24',NULL,'2'),(249,'Applicant',1,NULL,'Name:  Sally K Jackson ; Sacrament Type: Baptism','2017-09-29 01:22:25',NULL,'2'),(250,'Profile',2,'First Name: Sally; M.I.: K; Last Name: Jackson; Suffix: ; Gender: Male; Birthdate: 2017-09-01','First Name: Sally; M.I.: K; Last Name: Jackson; Suffix: ; Gender: Male; Birthdate: 2017-09-01','2017-09-29 01:22:33',NULL,'2'),(251,'Application',2,'Name: Sally K Jackson ; Sacrament Type: Baptism; Status: Pending','Name: Sally K Jackson ; Sacrament Type: Baptism; Status: Pending','2017-09-29 01:22:33','Updated Requirements','2'),(252,'Application',2,'Name: Sally K Jackson ; Sacrament Type: Baptism; Status: Pending','Name: Sally K Jackson ; Sacrament Type: Baptism; Status: Approved','2017-09-29 01:24:06','','2'),(253,'Profile',2,'First Name: Yuki; M.I.: A; Last Name: Kajiura; Suffix: ; Gender: Male; Birthdate: 1965-08-06','First Name: Yuki; M.I.: A; Last Name: Kajiura; Suffix: ; Gender: Male; Birthdate: 1965-08-06','2017-09-29 01:25:06',NULL,'2'),(254,'Profile',2,'First Name: Jon; M.I.: A; Last Name: Marshall; Suffix: ; Gender: Female; Birthdate: 1975-09-06','First Name: Jon; M.I.: A; Last Name: Marshall; Suffix: ; Gender: Female; Birthdate: 1975-09-06','2017-09-29 01:25:06',NULL,'2'),(255,'Application',2,'Name: Yuki A Kajiura  & Jon A Marshall ; Sacrament Type: Marriage; Status: Pending','Name: Yuki A Kajiura  & Jon A Marshall ; Sacrament Type: Marriage; Status: Pending','2017-09-29 01:25:07','','2'),(256,'Profile',1,NULL,'First Name: Scott; M.I.: V; Last Name: Lerner; Suffix: ; Gender: Male; Birthdate: 2000-06-29','2017-09-29 01:27:24',NULL,'2'),(257,'Applicant',1,NULL,'Name:  Scott V Lerner ; Sacrament Type: Confirmation','2017-09-29 01:27:24',NULL,'2'),(258,'Profile',2,'First Name: Scott; M.I.: V; Last Name: Lerner; Suffix: ; Gender: Male; Birthdate: 2000-06-29','First Name: Scott; M.I.: Lerner; Last Name: V; Suffix: ; Gender: Male; Birthdate: 2000-06-29','2017-09-29 01:27:30',NULL,'2'),(259,'Application',2,'Name: Scott Lerner V ; Sacrament Type: Confirmation; Status: Pending','Name: Scott Lerner V ; Sacrament Type: Confirmation; Status: Pending','2017-09-29 01:27:30','Updated Requirements','2'),(260,'Primary Income',1,NULL,'Book Type: Parish; OR Number: 7; Remarks: ','2017-09-29 01:27:37',NULL,'2'),(261,'Payment',1,NULL,'OR Number: 7; Payment Amount: 500.00','2017-09-29 01:27:37',NULL,NULL),(262,'Application',2,'Name: Scott Lerner V ; Sacrament Type: Confirmation; Status: Pending','Name: Scott Lerner V ; Sacrament Type: Confirmation; Status: Approved','2017-09-29 01:29:08','','2'),(263,'Item Type',1,NULL,'Item Type: Certificates; Book Type: Parish; Transaction Type: Cash Receipt; Suggested Price: 100.00; Status: Active; Details: ','2017-09-29 01:32:04',NULL,'2'),(264,'Item Type',1,NULL,'Item Type: Food; Book Type: Community; Transaction Type: Cash Receipt; Suggested Price: 500.00; Status: Active; Details: ','2017-09-29 01:32:17',NULL,'2'),(265,'Profile',2,'First Name: Christopher; M.I.: C; Last Name: Green; Suffix: ; Gender: Male; Birthdate: 1970-08-15; Residence: Houston; Birth Place: London','First Name: Christopher; M.I.: C; Last Name: Green; Suffix: ; Gender: Male; Birthdate: 1970-08-15; Residence: Houston; Birth Place: London','2017-09-29 01:33:19',NULL,'2'),(266,'Profile',2,'First Name: Tina; M.I.: M; Last Name: Turner; Suffix: ; Gender: Female; Birthdate: 1969-08-04; Residence: Houston; Birth Place: Edinburgh','First Name: Tina; M.I.: M; Last Name: Turner; Suffix: ; Gender: Female; Birthdate: 1969-08-04; Residence: Houston; Birth Place: Edinburgh','2017-09-29 01:33:19',NULL,'2'),(267,'Application',2,'Name: Christopher C Green  & Tina M Turner ; Sacrament Type: Marriage; Status: Pending','Name: Christopher C Green  & Tina M Turner ; Sacrament Type: Marriage; Status: Pending','2017-09-29 01:33:19','Updated Requirements','2'),(268,'Profile',2,'First Name: Christopher; M.I.: C; Last Name: Green; Suffix: ; Gender: Male; Birthdate: 1970-08-15; Residence: Houston; Birth Place: London','First Name: Christopher; M.I.: C; Last Name: Green; Suffix: ; Gender: Male; Birthdate: 1970-08-15; Residence: Houston; Birth Place: London','2017-09-29 01:35:07',NULL,'2'),(269,'Profile',2,'First Name: Tina; M.I.: M; Last Name: Turner; Suffix: ; Gender: Female; Birthdate: 1969-08-04; Residence: Houston; Birth Place: Edinburgh','First Name: Tina; M.I.: M; Last Name: Turner; Suffix: ; Gender: Female; Birthdate: 1969-08-04; Residence: Houston; Birth Place: Edinburgh','2017-09-29 01:35:08',NULL,'2'),(270,'Application',2,'Name: Christopher C Green  & Tina M Turner ; Sacrament Type: Marriage; Status: Pending','Name: Christopher C Green  & Tina M Turner ; Sacrament Type: Marriage; Status: Pending','2017-09-29 01:35:08','Updated Requirements','2'),(271,'Profile',2,'First Name: Christopher; M.I.: C; Last Name: Green; Suffix: ; Gender: Male; Birthdate: 1970-08-15; Residence: Houston; Birth Place: London','First Name: Christopher; M.I.: C; Last Name: Green; Suffix: ; Gender: Male; Birthdate: 1970-08-15; Residence: Metropolis; Birth Place: Davao City','2017-09-29 01:38:22',NULL,'2'),(272,'Profile',2,'First Name: Tina; M.I.: M; Last Name: Turner; Suffix: ; Gender: Female; Birthdate: 1969-08-04; Residence: Houston; Birth Place: Edinburgh','First Name: Tina; M.I.: M; Last Name: Turner; Suffix: ; Gender: Female; Birthdate: 1969-08-04; Residence: Metropolis; Birth Place: Davao City','2017-09-29 01:38:23',NULL,'2'),(273,'Profile',1,NULL,'First Name: Patricia; M.I.: F; Last Name: Ford; Suffix: ; Gender: Female; Birthdate: 2010-12-15','2017-09-29 01:42:05',NULL,'2'),(274,'Applicant',1,NULL,'Name:  Patricia F Ford ; Sacrament Type: Baptism','2017-09-29 01:42:06',NULL,'2'),(275,'Primary Income',1,NULL,'Book Type: Parish; OR Number: 8; Remarks: ','2017-09-29 01:42:21',NULL,'2'),(276,'Payment',1,NULL,'OR Number: 8; Payment Amount: 200.00','2017-09-29 01:42:21',NULL,NULL),(277,'Profile',2,'First Name: Patricia; M.I.: F; Last Name: Ford; Suffix: ; Gender: Female; Birthdate: 2010-12-15','First Name: Patricia; M.I.: F; Last Name: Ford; Suffix: ; Gender: Female; Birthdate: 2010-12-15','2017-09-29 01:42:28',NULL,'2'),(278,'Application',2,'Name: Patricia F Ford ; Sacrament Type: Baptism; Status: Pending','Name: Patricia F Ford ; Sacrament Type: Baptism; Status: Pending','2017-09-29 01:42:28','','2'),(279,'Profile',2,'First Name: Patricia; M.I.: F; Last Name: Ford; Suffix: ; Gender: Female; Birthdate: 2010-12-15','First Name: Patricia; M.I.: F; Last Name: Ford; Suffix: ; Gender: Female; Birthdate: 2010-12-15','2017-09-29 01:42:35',NULL,'2'),(280,'Application',2,'Name: Patricia F Ford ; Sacrament Type: Baptism; Status: Pending','Name: Patricia F Ford ; Sacrament Type: Baptism; Status: Pending','2017-09-29 01:42:35','Updated Requirements','2'),(281,'Application',2,'Name: Patricia F Ford ; Sacrament Type: Baptism; Status: Pending','Name: Patricia F Ford ; Sacrament Type: Baptism; Status: Approved','2017-09-29 01:43:58','','2'),(282,'Profile',1,NULL,'First Name: Frank; M.I.: J; Last Name: Perry; Suffix: ; Gender: Male; Birthdate: 2017-09-06','2017-09-29 01:45:52',NULL,'2'),(283,'Applicant',1,NULL,'Name:  Frank J Perry ; Sacrament Type: Baptism','2017-09-29 01:45:52',NULL,'2'),(284,'Primary Income',1,NULL,'Book Type: Parish; OR Number: 9; Remarks: ','2017-09-29 01:46:00',NULL,'2'),(285,'Payment',1,NULL,'OR Number: 9; Payment Amount: 200.00','2017-09-29 01:46:00',NULL,NULL),(286,'Profile',2,'First Name: Frank; M.I.: J; Last Name: Perry; Suffix: ; Gender: Male; Birthdate: 2017-09-06','First Name: Frank; M.I.: J; Last Name: Perry; Suffix: ; Gender: Male; Birthdate: 2017-09-06','2017-09-29 01:46:01',NULL,'2'),(287,'Application',2,'Name: Frank J Perry ; Sacrament Type: Baptism; Status: Pending','Name: Frank J Perry ; Sacrament Type: Baptism; Status: Pending','2017-09-29 01:46:02','Updated Requirements','2'),(288,'Application',2,'Name: Frank J Perry ; Sacrament Type: Baptism; Status: Pending','Name: Frank J Perry ; Sacrament Type: Baptism; Status: Approved','2017-09-29 01:47:12','','2'),(289,'Profile',1,NULL,'First Name: Giuseppe; M.I.: J; Last Name: House; Suffix: ; Gender: Male; Birthdate: 2017-09-07','2017-09-29 01:49:51',NULL,'2'),(290,'Applicant',1,NULL,'Name:  Giuseppe J House ; Sacrament Type: Confirmation','2017-09-29 01:49:51',NULL,'2'),(291,'Primary Income',1,NULL,'Book Type: Parish; OR Number: 10; Remarks: ','2017-09-29 01:49:58',NULL,'2'),(292,'Payment',1,NULL,'OR Number: 10; Payment Amount: 500.00','2017-09-29 01:49:58',NULL,NULL),(293,'Profile',2,'First Name: Giuseppe; M.I.: J; Last Name: House; Suffix: ; Gender: Male; Birthdate: 2017-09-07','First Name: Giuseppe; M.I.: House; Last Name: J; Suffix: ; Gender: Male; Birthdate: 2017-09-07','2017-09-29 01:50:00',NULL,'2'),(294,'Application',2,'Name: Giuseppe House J ; Sacrament Type: Confirmation; Status: Pending','Name: Giuseppe House J ; Sacrament Type: Confirmation; Status: Pending','2017-09-29 01:50:00','Updated Requirements','2'),(295,'Application',2,'Name: Giuseppe House J ; Sacrament Type: Confirmation; Status: Pending','Name: Giuseppe House J ; Sacrament Type: Confirmation; Status: Approved','2017-09-29 01:51:03','','2'),(296,'Profile',1,NULL,'First Name: Tanya; M.I.: C; Last Name: Hernandez; Suffix: ; Gender: Male; Birthdate: 2014-06-19','2017-09-29 01:52:00',NULL,'2'),(297,'Applicant',1,NULL,'Name:  Tanya C Hernandez ; Sacrament Type: Confirmation','2017-09-29 01:52:01',NULL,'2'),(298,'Profile',2,'First Name: Tanya; M.I.: C; Last Name: Hernandez; Suffix: ; Gender: Male; Birthdate: 2014-06-19','First Name: Tanya; M.I.: Hernandez; Last Name: C; Suffix: ; Gender: Male; Birthdate: 2014-06-19','2017-09-29 01:52:08',NULL,'2'),(299,'Application',2,'Name: Tanya Hernandez C ; Sacrament Type: Confirmation; Status: Pending','Name: Tanya Hernandez C ; Sacrament Type: Confirmation; Status: Pending','2017-09-29 01:52:08','Updated Requirements','2'),(300,'Application',2,'Name: Tanya Hernandez C ; Sacrament Type: Confirmation; Status: Pending','Name: Tanya Hernandez C ; Sacrament Type: Confirmation; Status: Approved','2017-09-29 01:53:40','','2'),(301,'Profile',1,NULL,'First Name: Loren; M.I.: C; Last Name: Peebles; Suffix: ; Gender: Female; Birthdate: 1994-06-30','2017-09-29 01:54:02',NULL,'2'),(302,'Applicant',1,NULL,'Name:  Loren C Peebles ; Sacrament Type: Confirmation','2017-09-29 01:54:02',NULL,'2'),(303,'Profile',2,'First Name: Loren; M.I.: C; Last Name: Peebles; Suffix: ; Gender: Female; Birthdate: 1994-06-30','First Name: Loren; M.I.: Peebles; Last Name: C; Suffix: ; Gender: Female; Birthdate: 1994-06-30','2017-09-29 01:54:10',NULL,'2'),(304,'Application',2,'Name: Loren Peebles C ; Sacrament Type: Confirmation; Status: Pending','Name: Loren Peebles C ; Sacrament Type: Confirmation; Status: Pending','2017-09-29 01:54:11','Updated Requirements','2'),(305,'Primary Income',1,NULL,'Book Type: Parish; OR Number: 11; Remarks: awaiting requirements','2017-09-29 01:54:23',NULL,'2'),(306,'Payment',1,NULL,'OR Number: 11; Payment Amount: 250.00','2017-09-29 01:54:24',NULL,NULL),(307,'Profile',2,'First Name: Loren; M.I.: Peebles; Last Name: C; Suffix: ; Gender: Female; Birthdate: 1994-06-30','First Name: Loren; M.I.: C; Last Name: Peebles; Suffix: ; Gender: Female; Birthdate: 1994-06-30','2017-09-29 01:54:39',NULL,'2'),(308,'Application',2,'Name: Loren C Peebles ; Sacrament Type: Confirmation; Status: Pending','Name: Loren C Peebles ; Sacrament Type: Confirmation; Status: Pending','2017-09-29 01:54:39','','2'),(309,'Profile',1,NULL,'First Name: Sherry; M.I.: I; Last Name: Hunter; Suffix: ; Gender: Male; Birthdate: 2003-11-27','2017-09-29 01:55:27',NULL,'2'),(310,'Applicant',1,NULL,'Name:  Sherry I Hunter ; Sacrament Type: Confirmation','2017-09-29 01:55:28',NULL,'2'),(311,'Profile',2,'First Name: Sherry; M.I.: I; Last Name: Hunter; Suffix: ; Gender: Male; Birthdate: 2003-11-27','First Name: Sherry; M.I.: Hunter; Last Name: I; Suffix: ; Gender: Male; Birthdate: 2003-11-27','2017-09-29 01:55:36',NULL,'2'),(312,'Application',2,'Name: Sherry Hunter I ; Sacrament Type: Confirmation; Status: Pending','Name: Sherry Hunter I ; Sacrament Type: Confirmation; Status: Pending','2017-09-29 01:55:36','','2'),(313,'Profile',2,'First Name: Sherry; M.I.: Hunter; Last Name: I; Suffix: ; Gender: Male; Birthdate: 2003-11-27','First Name: Sherry; M.I.: I; Last Name: Hunter; Suffix: ; Gender: Male; Birthdate: 2003-11-27','2017-09-29 01:55:43',NULL,'2'),(314,'Application',2,'Name: Sherry I Hunter ; Sacrament Type: Confirmation; Status: Pending','Name: Sherry I Hunter ; Sacrament Type: Confirmation; Status: Pending','2017-09-29 01:55:43','Updated Requirements','2'),(315,'Profile',1,NULL,'First Name: Sandra; M.I.: E; Last Name: Fairbanks; Suffix: ; Gender: Male; Birthdate: 2010-06-07','2017-09-29 01:56:11',NULL,'2'),(316,'Applicant',1,NULL,'Name:  Sandra E Fairbanks ; Sacrament Type: Confirmation','2017-09-29 01:56:11',NULL,'2'),(317,'Profile',2,'First Name: Dewey; M.I.: L; Last Name: Sia; Suffix: ; Gender: Male; Birthdate: 1998-09-26','First Name: Dewey; M.I.: L; Last Name: Sia; Suffix: ; Gender: Male; Birthdate: 1998-09-26; Residence: Crown Point; Birth Place: Miami','2017-09-29 01:59:42',NULL,NULL),(318,'Profile',2,'First Name: Andreia; M.I.: Q; Last Name: Gaultz; Suffix: ; Gender: Female; Birthdate: 2017-09-10','First Name: Andreia; M.I.: Q; Last Name: Gaultz; Suffix: ; Gender: Female; Birthdate: 2017-09-10; Residence: Missoula; Birth Place: Garden City','2017-09-29 01:59:42',NULL,NULL),(319,'Profile',2,'First Name: Andre; M.I.: C; Last Name: Gaultz; Suffix: ; Gender: Female; Birthdate: 2017-09-10','First Name: Andre; M.I.: C; Last Name: Gaultz; Suffix: ; Gender: Female; Birthdate: 2017-09-10; Residence: Seattle; Birth Place: Concord','2017-09-29 01:59:42',NULL,NULL),(320,'Profile',2,'First Name: Rachel; M.I.: D; Last Name: Shwartz; Suffix: ; Gender: Female; Birthdate: 2017-02-01','First Name: Rachel; M.I.: D; Last Name: Shwartz; Suffix: ; Gender: Female; Birthdate: 2017-02-01; Residence: Davao; Birth Place: Davao','2017-09-29 01:59:42',NULL,NULL),(321,'Profile',2,'First Name: Beatrice; M.I.: A; Last Name: Solberg; Suffix: ; Gender: Female; Birthdate: 2017-09-26','First Name: Beatrice; M.I.: A; Last Name: Solberg; Suffix: ; Gender: Female; Birthdate: 2017-09-26; Residence: Jackson; Birth Place: Bridgeport','2017-09-29 01:59:42',NULL,NULL),(322,'Profile',2,'First Name: Malcolm; M.I.: A; Last Name: Peterson; Suffix: ; Gender: Male; Birthdate: 2017-09-11','First Name: Malcolm; M.I.: A; Last Name: Peterson; Suffix: ; Gender: Male; Birthdate: 2017-09-11; Residence: Mount Pleasant; Birth Place: Ashton','2017-09-29 01:59:42',NULL,NULL),(323,'Profile',2,'First Name: Emmett; M.I.: B; Last Name: Mason; Suffix: ; Gender: Female; Birthdate: 2017-09-28','First Name: Emmett; M.I.: B; Last Name: Mason; Suffix: ; Gender: Female; Birthdate: 2017-09-28; Residence: Boston; Birth Place: Odessa','2017-09-29 01:59:42',NULL,NULL),(324,'Profile',2,'First Name: Guy; M.I.: J; Last Name: Ingram; Suffix: ; Gender: Male; Birthdate: 2017-09-28','First Name: Guy; M.I.: J; Last Name: Ingram; Suffix: ; Gender: Male; Birthdate: 2017-09-28; Residence: Davao; Birth Place: Gensan','2017-09-29 01:59:42',NULL,NULL),(325,'Profile',2,'First Name: Jun; M.I.: B; Last Name: Seba; Suffix: ; Gender: Male; Birthdate: 1974-02-07','First Name: Jun; M.I.: B; Last Name: Seba; Suffix: ; Gender: Male; Birthdate: 1974-02-07; Residence: Cebu; Birth Place: Manila','2017-09-29 01:59:42',NULL,NULL),(326,'Primary Income',1,NULL,'Source: Vicky Palmer; Book Type: Community; OR Number: 1; Remarks: ; Income Time: 2017-09-29 10:10:20','2017-09-29 02:10:20',NULL,'2'),(327,'Primary Income',1,NULL,'Source: Doris Askew; Book Type: Parish; OR Number: 12; Remarks: ; Income Time: 2017-09-29 10:17:42','2017-09-29 02:17:43',NULL,'2'),(328,'Primary Income',1,NULL,'Source: ; Book Type: Parish; OR Number: 13; Remarks: ; Income Time: 2017-09-29 10:18:43','2017-09-29 02:18:43',NULL,'2'),(329,'Minister',1,NULL,'Name: Bernard B Spencer ; Birthdate: 2017-09-29; Ministry Type: Priest; Status: Active','2017-09-29 10:42:33',NULL,'2'),(330,'Minister',2,'Name: Bernard B Spencer ; Birthdate: 2017-09-29; Ministry Type: Priest; Status: Active','Name: Bernardo B Spencer ; Birthdate: 2017-09-29; Ministry Type: Priest; Status: Active','2017-09-29 10:42:38',NULL,'2'),(331,'Profile',2,'First Name: Christopher; M.I.: C; Last Name: Green; Suffix: ; Gender: Male; Birthdate: 1970-08-15; Residence: Metropolis; Birth Place: Davao City','First Name: Christopher; M.I.: C; Last Name: Green; Suffix: ; Gender: Male; Birthdate: 1970-08-15; Residence: Metropolis; Birth Place: Davao City','2017-09-29 10:46:41',NULL,'2'),(332,'Profile',2,'First Name: Tina; M.I.: M; Last Name: Turner; Suffix: ; Gender: Female; Birthdate: 1969-08-04; Residence: Metropolis; Birth Place: Davao City','First Name: Tina; M.I.: M; Last Name: Turner; Suffix: ; Gender: Female; Birthdate: 1969-08-04; Residence: Metropolis; Birth Place: Davao City','2017-09-29 10:46:41',NULL,'2'),(333,'Application',2,'Name: Christopher C Green  & Tina M Turner ; Sacrament Type: Marriage; Status: Pending','Name: Christopher C Green  & Tina M Turner ; Sacrament Type: Marriage; Status: Pending','2017-09-29 10:46:41','','2'),(334,'Profile',2,'First Name: Christopher; M.I.: C; Last Name: Green; Suffix: ; Gender: Male; Birthdate: 1970-08-15; Residence: Metropolis; Birth Place: Davao City','First Name: Christopher; M.I.: C; Last Name: Green; Suffix: ; Gender: Male; Birthdate: 1970-08-15; Residence: Metropolis; Birth Place: Davao City','2017-09-29 10:48:39',NULL,'2'),(335,'Profile',2,'First Name: Tina; M.I.: M; Last Name: Turner; Suffix: ; Gender: Female; Birthdate: 1969-08-04; Residence: Metropolis; Birth Place: Davao City','First Name: Tina; M.I.: M; Last Name: Turner; Suffix: ; Gender: Female; Birthdate: 1969-08-04; Residence: Metropolis; Birth Place: Davao City','2017-09-29 10:48:39',NULL,'2'),(336,'Application',2,'Name: Christopher C Green  & Tina M Turner ; Sacrament Type: Marriage; Status: Pending','Name: Christopher C Green  & Tina M Turner ; Sacrament Type: Marriage; Status: Pending','2017-09-29 10:48:39','','2'),(337,'Profile',2,'First Name: Christopher; M.I.: C; Last Name: Green; Suffix: ; Gender: Male; Birthdate: 1970-08-15; Residence: Metropolis; Birth Place: Davao City','First Name: Christopher; M.I.: C; Last Name: Green; Suffix: ; Gender: Male; Birthdate: 1970-08-15; Residence: Wheatmeadow; Birth Place: Valbush','2017-09-29 19:42:30',NULL,'2'),(338,'Profile',2,'First Name: Tina; M.I.: M; Last Name: Turner; Suffix: ; Gender: Female; Birthdate: 1969-08-04; Residence: Metropolis; Birth Place: Davao City','First Name: Tina; M.I.: M; Last Name: Turner; Suffix: ; Gender: Female; Birthdate: 1969-08-04; Residence: Faircoast; Birth Place: Morbank','2017-09-29 19:42:30',NULL,'2'),(339,'Profile',2,'First Name: Christopher; M.I.: C; Last Name: Green; Suffix: ; Gender: Male; Birthdate: 1970-08-15; Residence: Wheatmeadow; Birth Place: Valbush','First Name: Christopher; M.I.: C; Last Name: Green; Suffix: ; Gender: Male; Birthdate: 1970-08-15; Residence: Fogtown; Birth Place: Butterhollow','2017-09-29 19:58:18',NULL,'2'),(340,'Profile',2,'First Name: Tina; M.I.: M; Last Name: Turner; Suffix: ; Gender: Female; Birthdate: 1969-08-04; Residence: Faircoast; Birth Place: Morbank','First Name: Tina; M.I.: M; Last Name: Turner; Suffix: ; Gender: Female; Birthdate: 1969-08-04; Residence: Summerbush; Birth Place: Southedge','2017-09-29 19:58:18',NULL,'2'),(341,'Profile',2,'First Name: Christopher; M.I.: C; Last Name: Green; Suffix: ; Gender: Male; Birthdate: 1970-08-15; Residence: Fogtown; Birth Place: Butterhollow','First Name: Christopher; M.I.: C; Last Name: Green; Suffix: ; Gender: Male; Birthdate: 1970-08-15; Residence: Snownesse; Birth Place: Summerbush','2017-09-29 20:05:47',NULL,'2'),(342,'Profile',2,'First Name: Tina; M.I.: M; Last Name: Turner; Suffix: ; Gender: Female; Birthdate: 1969-08-04; Residence: Summerbush; Birth Place: Southedge','First Name: Tina; M.I.: M; Last Name: Turner; Suffix: ; Gender: Female; Birthdate: 1969-08-04; Residence: Moorwynne; Birth Place: Oakhollow','2017-09-29 20:05:47',NULL,'2'),(343,'Application',2,'Name: Christopher C Green  & Tina M Turner ; Sacrament Type: Marriage; Status: Pending','Name: Christopher C Green  & Tina M Turner ; Sacrament Type: Marriage; Status: Approved','2017-09-29 20:05:48','','2'),(344,'Application',2,'Name: Christopher C Green  & Tina M Turner ; Sacrament Type: Marriage; Status: Approved','Name: Christopher C Green  & Tina M Turner ; Sacrament Type: Marriage; Status: Approved','2017-09-29 20:05:48','','2'),(345,'Application',2,'Name: Christopher C Green  & Tina M Turner ; Sacrament Type: Marriage; Status: Approved','Name: Christopher C Green  & Tina M Turner ; Sacrament Type: Marriage; Status: Pending','2017-09-29 20:07:12','',NULL),(346,'Profile',2,'First Name: Christopher; M.I.: C; Last Name: Green; Suffix: ; Gender: Male; Birthdate: 1970-08-15; Residence: Snownesse; Birth Place: Summerbush','First Name: Christopher; M.I.: C; Last Name: Green; Suffix: ; Gender: Male; Birthdate: 1970-08-15; Residence: Merribourne; Birth Place: Mistford','2017-09-29 20:20:12',NULL,'2'),(347,'Profile',2,'First Name: Tina; M.I.: M; Last Name: Turner; Suffix: ; Gender: Female; Birthdate: 1969-08-04; Residence: Moorwynne; Birth Place: Oakhollow','First Name: Tina; M.I.: M; Last Name: Turner; Suffix: ; Gender: Female; Birthdate: 1969-08-04; Residence: Goldshaw; Birth Place: Fogtown','2017-09-29 20:20:12',NULL,'2'),(348,'Application',2,'Name: Christopher C Green  & Tina M Turner ; Sacrament Type: Marriage; Status: Pending','Name: Christopher C Green  & Tina M Turner ; Sacrament Type: Marriage; Status: Approved','2017-09-29 20:20:13','','2'),(349,'Application',2,'Name: Christopher C Green  & Tina M Turner ; Sacrament Type: Marriage; Status: Approved','Name: Christopher C Green  & Tina M Turner ; Sacrament Type: Marriage; Status: Approved','2017-09-29 20:20:13','','2'),(350,'Application',2,'Name: Christopher C Green  & Tina M Turner ; Sacrament Type: Marriage; Status: Approved','Name: Christopher C Green  & Tina M Turner ; Sacrament Type: Marriage; Status: Pending','2017-09-29 20:23:57','',NULL),(351,'Profile',2,'First Name: Christopher; M.I.: C; Last Name: Green; Suffix: ; Gender: Male; Birthdate: 1970-08-15; Residence: Merribourne; Birth Place: Mistford','First Name: Christopher; M.I.: C; Last Name: Green; Suffix: ; Gender: Male; Birthdate: 1970-08-15; Residence: Rockford; Birth Place: Wildstone','2017-09-29 20:26:12',NULL,'2'),(352,'Profile',2,'First Name: Tina; M.I.: M; Last Name: Turner; Suffix: ; Gender: Female; Birthdate: 1969-08-04; Residence: Goldshaw; Birth Place: Fogtown','First Name: Tina; M.I.: M; Last Name: Turner; Suffix: ; Gender: Female; Birthdate: 1969-08-04; Residence: Southedge; Birth Place: Merribourne','2017-09-29 20:26:12',NULL,'2'),(353,'Application',2,'Name: Christopher C Green  & Tina M Turner ; Sacrament Type: Marriage; Status: Pending','Name: Christopher C Green  & Tina M Turner ; Sacrament Type: Marriage; Status: Approved','2017-09-29 20:26:13','','2'),(354,'Application',2,'Name: Christopher C Green  & Tina M Turner ; Sacrament Type: Marriage; Status: Approved','Name: Christopher C Green  & Tina M Turner ; Sacrament Type: Marriage; Status: Approved','2017-09-29 20:26:13','','2'),(355,'Application',2,'Name: Jim C Tang Jr; Sacrament Type: Baptism; Status: Final','Name: Jim C Tang Jr; Sacrament Type: Baptism; Status: Approved','2017-09-29 20:35:02','','2'),(356,'Appointment',2,'Title: Parish Appointment; Details: ; Start Time: 2017-09-30 09:20:00; End Time: 2017-09-30 10:20:00; Minister: Joshua F Lintag ','Title: Parish Appointment; Details: Previous minister unavailable. Changed minister.; Start Time: 2017-09-30 08:20:00; End Time: 2017-09-30 09:20:00; Minister: Joseph A Numirez ','2017-09-29 20:37:38',NULL,'2'),(357,'Profile',2,'First Name: Scott; M.I.: Lerner; Last Name: V; Suffix: ; Gender: Male; Birthdate: 2000-06-29','First Name: Scott; M.I.: V; Last Name: Lerner; Suffix: ; Gender: Male; Birthdate: 2000-06-29','2017-09-29 20:38:24',NULL,NULL),(358,'Profile',2,'First Name: Giuseppe; M.I.: House; Last Name: J; Suffix: ; Gender: Male; Birthdate: 2017-09-07','First Name: Giuseppe; M.I.: J; Last Name: House; Suffix: ; Gender: Male; Birthdate: 2017-09-07','2017-09-29 20:38:24',NULL,NULL),(359,'Profile',2,'First Name: Tanya; M.I.: Hernandez; Last Name: C; Suffix: ; Gender: Male; Birthdate: 2014-06-19','First Name: Tanya; M.I.: C; Last Name: Hernandez; Suffix: ; Gender: Male; Birthdate: 2014-06-19','2017-09-29 20:38:24',NULL,NULL),(360,'Application',2,'Name: Jim C Tang Jr; Sacrament Type: Baptism; Status: Approved','Name: Jim C Tang Jr; Sacrament Type: Baptism; Status: Approved','2017-09-29 21:04:34','','2'),(361,'Schedule',1,NULL,'Title: a; Details: ; Start Time: 2017-09-30 05:18:00; End Time: 2017-09-30 05:18:00','2017-09-29 21:19:08',NULL,'2'),(362,'Schedule',3,'Title: a; Details: ; Start Time: 2017-09-30 05:18:00; End Time: 2017-09-30 05:18:00',NULL,'2017-09-29 21:19:14',NULL,'2'),(363,'Schedule',1,NULL,'Title: qweq; Details: qwe; Start Time: 2017-09-30 05:20:00; End Time: 2017-09-30 05:20:00','2017-09-29 21:21:03',NULL,'2'),(364,'Schedule',3,'Title: qweq; Details: qwe; Start Time: 2017-09-30 05:20:00; End Time: 2017-09-30 05:20:00',NULL,'2017-09-29 21:21:06',NULL,'2'),(365,'Primary Income',1,NULL,'Source: ; Book Type: Parish; OR Number: 14; Remarks: ; Income Time: 2017-09-30 09:32:46','2017-09-30 01:32:46',NULL,'2'),(366,'Payment',1,NULL,'OR Number: 14; Payment Amount: 100.00','2017-09-30 01:32:46',NULL,NULL),(367,'Primary Income',1,NULL,'Source: ; Book Type: Parish; OR Number: 15; Remarks: ; Income Time: 2017-09-30 09:40:06','2017-09-30 01:40:06',NULL,'2'),(368,'Payment',1,NULL,'OR Number: 15; Payment Amount: 200.00','2017-09-30 01:40:06',NULL,NULL),(369,'Primary Income',1,NULL,'Source: ; Book Type: Parish; OR Number: 16; Remarks: ; Income Time: 2017-09-30 09:41:06','2017-09-30 01:41:06',NULL,'2'),(370,'Payment',1,NULL,'OR Number: 16; Payment Amount: 200.00','2017-09-30 01:41:06',NULL,NULL),(371,'Primary Income',1,NULL,'Source: ; Book Type: Parish; OR Number: 17; Remarks: ; Income Time: 2017-09-30 09:41:44','2017-09-30 01:41:44',NULL,'2'),(372,'Payment',1,NULL,'OR Number: 17; Payment Amount: 250.00','2017-09-30 01:41:44',NULL,NULL),(373,'Payment',1,NULL,'OR Number: 17; Payment Amount: 380.00','2017-09-30 01:41:44',NULL,NULL),(374,'Primary Income',1,NULL,'Source: ; Book Type: Parish; OR Number: 18; Remarks: ; Income Time: 2017-09-30 09:47:02','2017-09-30 01:47:02',NULL,'2'),(375,'Payment',1,NULL,'OR Number: 18; Payment Amount: 150.00','2017-09-30 01:47:02',NULL,NULL),(376,'Primary Income',1,NULL,'Source: ; Book Type: Parish; OR Number: 19; Remarks: ; Income Time: 2017-09-30 09:52:00','2017-09-30 01:52:00',NULL,'2'),(377,'Payment',1,NULL,'OR Number: 19; Payment Amount: 200.00','2017-09-30 01:52:00',NULL,NULL),(378,'Primary Income',1,NULL,'Source: ; Book Type: Parish; OR Number: 20; Remarks: ; Income Time: 2017-09-30 09:53:48','2017-09-30 01:53:48',NULL,'2'),(379,'Payment',1,NULL,'OR Number: 20; Payment Amount: 300.00','2017-09-30 01:53:48',NULL,NULL),(380,'Primary Income',1,NULL,'Source: ; Book Type: Parish; OR Number: 21; Remarks: ; Income Time: 2017-09-30 09:55:09','2017-09-30 01:55:09',NULL,'2'),(381,'Primary Income',1,NULL,'Source: ; Book Type: Parish; OR Number: 22; Remarks: ; Income Time: 2017-09-30 09:56:09','2017-09-30 01:56:09',NULL,'2'),(382,'Primary Income',1,NULL,'Source: ; Book Type: Parish; OR Number: 23; Remarks: ; Income Time: 2017-09-30 09:56:18','2017-09-30 01:56:18',NULL,'2'),(383,'Primary Income',1,NULL,'Source: ; Book Type: Parish; OR Number: 24; Remarks: ; Income Time: 2017-09-30 10:00:28','2017-09-30 02:00:28',NULL,'2'),(384,'Payment',1,NULL,'OR Number: 24; Payment Amount: 500.00','2017-09-30 02:00:28',NULL,NULL),(385,'Primary Income',1,NULL,'Source: Ricky; Book Type: Parish; OR Number: 25; Remarks: Feeding program; Income Time: 2017-09-30 10:01:25','2017-09-30 02:01:25',NULL,'2'),(386,'Item Type',2,'Item Type: Donation; Book Type: Parish; Transaction Type: Cash Receipt; Suggested Price: 0.00','Item Type: Donation; Book Type: Community; Transaction Type: Cash Receipt; Suggested Price: 0.00; Status: ActiveDetails: ','2017-09-30 02:03:30',NULL,'2'),(387,'Item Type',2,'Item Type: Donation; Book Type: Community; Transaction Type: Cash Receipt; Suggested Price: 0.00; Status: ActiveDetails: ','Item Type: Donation; Book Type: Parish; Transaction Type: Cash Receipt; Suggested Price: 0.00; Status: ActiveDetails: ','2017-09-30 02:03:49',NULL,'2'),(388,'Item Type',1,NULL,'Item Type: Office Supplies; Book Type: Parish; Transaction Type: Cash Disbursement; Suggested Price: 0.00; Status: Active; Details: ','2017-09-30 02:04:22',NULL,'2'),(389,'Item Type',1,NULL,'Item Type: Electricity ; Book Type: Parish; Transaction Type: Cash Disbursement; Suggested Price: 0.00; Status: Active; Details: ','2017-09-30 02:04:44',NULL,'2'),(390,'Item Type',1,NULL,'Item Type: Water; Book Type: Parish; Transaction Type: Cash Disbursement; Suggested Price: 0.00; Status: Active; Details: ','2017-09-30 02:04:52',NULL,'2'),(391,'Item Type',1,NULL,'Item Type: Food; Book Type: Parish; Transaction Type: Cash Disbursement; Suggested Price: 0.00; Status: Active; Details: ','2017-09-30 02:05:05',NULL,'2'),(392,'Item Type',1,NULL,'Item Type: GKK; Book Type: Parish; Transaction Type: Cash Disbursement; Suggested Price: 0.00; Status: Active; Details: ','2017-09-30 02:05:27',NULL,'2'),(393,'Item Type',1,NULL,'Item Type: Gasoline; Book Type: Parish; Transaction Type: Cash Disbursement; Suggested Price: 100.00; Status: Active; Details: ','2017-09-30 02:06:46',NULL,'2'),(394,'Primary Income',1,NULL,'Source: ; Book Type: Community; OR Number: 2; Remarks: ; Income Time: 2017-09-30 10:17:41','2017-09-30 02:17:41',NULL,'2'),(395,'Cash Release Voucher',1,NULL,'Check Number: 1002; Cash Voucher Number: 102; Name: ; Book Type: 1; Cash Release Time: 2017-09-30 10:18:07','2017-09-30 02:18:07',NULL,'2'),(396,'Cash Release Voucher',1,NULL,'Check Number: 1003; Cash Voucher Number: 103; Name: ; Book Type: 1; Cash Release Time: 2017-09-30 10:23:51','2017-09-30 02:23:51',NULL,'2'),(397,'Cash Release Voucher',1,NULL,'Check Number: 1004; Cash Voucher Number: 104; Name: ; Book Type: 1; Cash Release Time: 2017-09-30 11:10:59','2017-09-30 03:11:00',NULL,'2'),(398,'Cash Release Item',1,NULL,'Release Amount 100.00','2017-09-30 03:11:00',NULL,'2'),(399,'Profile',2,'First Name: Rachel; M.I.: D; Last Name: Shwartz; Suffix: ; Gender: Female; Birthdate: 2017-02-01; Residence: Davao; Birth Place: Davao','First Name: Rachelle; M.I.: D; Last Name: Shwartz; Suffix: ; Gender: Female; Birthdate: 2017-02-01; Residence: Davao; Birth Place: Davao','2017-09-30 03:29:27',NULL,'2'),(400,'Application',2,'Name: Rachelle D Shwartz ; Sacrament Type: Baptism; Status: Pending','Name: Rachelle D Shwartz ; Sacrament Type: Baptism; Status: Pending','2017-09-30 03:29:27','','2'),(401,'Application',2,'Name: Jim C Tang Jr & Niña A Fitzgerald ; Sacrament Type: Marriage; Status: Approved','Name: Jim C Tang Jr & Niña A Fitzgerald ; Sacrament Type: Marriage; Status: Final','2017-09-30 03:30:27','','2');
/*!40000 ALTER TABLE `auditlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `baptism`
--

DROP TABLE IF EXISTS `baptism`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `baptism` (
  `baptismID` int(11) NOT NULL AUTO_INCREMENT,
  `applicationID` int(11) NOT NULL,
  `ministerID` int(11) DEFAULT NULL,
  `recordNumber` varchar(45) DEFAULT NULL,
  `pageNumber` varchar(45) DEFAULT NULL,
  `registryNumber` varchar(45) DEFAULT NULL,
  `baptismDate` date DEFAULT NULL,
  `remarks` text,
  `legitimacy` int(11) DEFAULT NULL,
  PRIMARY KEY (`baptismID`),
  KEY `baptism_app_idx` (`applicationID`),
  KEY `baptism_minister_idx` (`ministerID`),
  CONSTRAINT `baptism_app` FOREIGN KEY (`applicationID`) REFERENCES `application` (`applicationID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `baptism_minister` FOREIGN KEY (`ministerID`) REFERENCES `minister` (`ministerID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `baptism`
--

LOCK TABLES `baptism` WRITE;
/*!40000 ALTER TABLE `baptism` DISABLE KEYS */;
INSERT INTO `baptism` VALUES (2,10,3,'110','55','336','2017-09-30','',2),(3,31,5,'12','35','2017','2017-09-28','',1),(4,35,3,NULL,NULL,NULL,'2017-09-30','',1),(5,37,4,NULL,NULL,NULL,'2017-09-29','',1),(6,38,5,NULL,NULL,NULL,'2017-09-29','',1);
/*!40000 ALTER TABLE `baptism` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bloodclaimant`
--

DROP TABLE IF EXISTS `bloodclaimant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bloodclaimant` (
  `bloodclaimantID` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` text,
  `midname` text,
  `lastname` text,
  `suffix` text,
  PRIMARY KEY (`bloodclaimantID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bloodclaimant`
--

LOCK TABLES `bloodclaimant` WRITE;
/*!40000 ALTER TABLE `bloodclaimant` DISABLE KEYS */;
INSERT INTO `bloodclaimant` VALUES (1,'Quiroz','T','Thomas ','');
/*!40000 ALTER TABLE `bloodclaimant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blooddonation`
--

DROP TABLE IF EXISTS `blooddonation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blooddonation` (
  `bloodDonationID` int(11) NOT NULL AUTO_INCREMENT,
  `profileID` int(11) NOT NULL,
  `bloodDonationEventID` int(11) NOT NULL,
  `donationID` int(11) NOT NULL,
  `bloodclaimant` int(11) DEFAULT NULL,
  PRIMARY KEY (`bloodDonationID`),
  KEY `fk_blooddonation_blooddonationevent1_idx` (`bloodDonationEventID`),
  KEY `fk_donor_idx` (`profileID`),
  KEY `fk_claimant_idx` (`bloodclaimant`),
  CONSTRAINT `fk_blooddonation_blooddonationevent1` FOREIGN KEY (`bloodDonationEventID`) REFERENCES `blooddonationevent` (`bloodDonationEventID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_claimant` FOREIGN KEY (`bloodclaimant`) REFERENCES `bloodclaimant` (`bloodclaimantID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_donor` FOREIGN KEY (`profileID`) REFERENCES `blooddonor` (`blooddonorID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blooddonation`
--

LOCK TABLES `blooddonation` WRITE;
/*!40000 ALTER TABLE `blooddonation` DISABLE KEYS */;
INSERT INTO `blooddonation` VALUES (1,1,1,1,NULL),(2,1,2,2,1),(3,1,3,3,NULL),(4,1,4,4,NULL),(5,2,1,5,NULL),(6,2,6,6,NULL),(7,3,4,7,NULL),(8,3,6,8,NULL),(9,3,7,9,NULL),(10,4,4,10,NULL),(11,4,2,11,NULL);
/*!40000 ALTER TABLE `blooddonation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blooddonationevent`
--

DROP TABLE IF EXISTS `blooddonationevent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blooddonationevent` (
  `bloodDonationEventID` int(11) NOT NULL AUTO_INCREMENT,
  `eventName` text,
  `startDateTime` datetime DEFAULT NULL,
  `endDateTime` datetime DEFAULT NULL,
  `eventVenue` text,
  `eventDetails` text,
  PRIMARY KEY (`bloodDonationEventID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blooddonationevent`
--

LOCK TABLES `blooddonationevent` WRITE;
/*!40000 ALTER TABLE `blooddonationevent` DISABLE KEYS */;
INSERT INTO `blooddonationevent` VALUES (1,'RED CROSS BLOOD DONATION EVENT','2017-09-29 10:00:19','2017-09-30 10:00:19','Toril, Davao City',''),(2,'Our Lady of Assumption Blood Donation Charity','2017-11-08 10:00:43','2017-11-10 10:00:43','Our Lady of Assumption Parish, Davao City',''),(3,'Davao Doctor\'s Hospital Blood Charity','2017-09-30 10:01:18','2017-09-30 10:01:18','Davao Doctor\'s Hospital',''),(4,'Ateneo De Davao Blood Donation Event','2018-02-10 10:01:49','2018-02-12 10:01:49','Ateneo De Davao Jacinto Campus',''),(5,'San Pedro Hospital Blood Donation ','2018-02-28 10:02:24','2018-03-01 10:02:24','San Pedro College',''),(6,'Acosta Clinic Blood Donaation','2017-12-13 10:03:16','2017-12-13 10:03:16','Acosta Clinic, Toril',''),(7,'Red Cross Blood Donation Charity 2018','2018-01-04 10:03:46','2018-01-05 10:03:46','Red Cross Building, Davao City',''),(9,'Blood Donation Camp 2013','2017-10-03 14:00:00','2017-10-03 17:00:00','Rotary Club of Indirapuram','Blood Donation Camp on 3 October 2017 at 2pm Organised by the Rotary Club of Indirapuram Parivar.');
/*!40000 ALTER TABLE `blooddonationevent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blooddonor`
--

DROP TABLE IF EXISTS `blooddonor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blooddonor` (
  `blooddonorID` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` text,
  `midname` text,
  `lastname` text,
  `suffix` varchar(45) DEFAULT NULL,
  `bloodtype` int(11) DEFAULT NULL,
  `address` text,
  `contactnumber` text,
  PRIMARY KEY (`blooddonorID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blooddonor`
--

LOCK TABLES `blooddonor` WRITE;
/*!40000 ALTER TABLE `blooddonor` DISABLE KEYS */;
INSERT INTO `blooddonor` VALUES (1,'Tang','C','Jim','',3,'Santa Ana, Davao City','9394525880'),(2,'Bridges','A','Heather','',1,'New York City','9261837212'),(3,'Deborah ','G','Smith','',5,'Boston','9672818412'),(4,'Scott ','C','Daniels','',4,'Lyndhurst','8828172263');
/*!40000 ALTER TABLE `blooddonor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cashreleaseitem`
--

DROP TABLE IF EXISTS `cashreleaseitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cashreleaseitem` (
  `cashReleaseID` int(11) NOT NULL AUTO_INCREMENT,
  `CashReleaseVoucherID` int(11) NOT NULL,
  `cashReleaseTypeID` int(11) NOT NULL,
  `releaseAmount` decimal(10,2) NOT NULL,
  PRIMARY KEY (`cashReleaseID`),
  KEY `a_idx` (`cashReleaseTypeID`),
  KEY `b_idx` (`CashReleaseVoucherID`),
  CONSTRAINT `a` FOREIGN KEY (`cashReleaseTypeID`) REFERENCES `itemtype` (`itemTypeID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `b` FOREIGN KEY (`CashReleaseVoucherID`) REFERENCES `cashreleasevoucher` (`CashReleaseVoucherID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cashreleaseitem`
--

LOCK TABLES `cashreleaseitem` WRITE;
/*!40000 ALTER TABLE `cashreleaseitem` DISABLE KEYS */;
INSERT INTO `cashreleaseitem` VALUES (1,1,2,2500.00),(9,4,9,100.00);
/*!40000 ALTER TABLE `cashreleaseitem` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER CashReleaseItem_AI AFTER INSERT
ON CashReleaseItem FOR EACH ROW
BEGIN
	DECLARE tableName TEXT;
    DECLARE operation INT;
    DECLARE newRecord TEXT;
    
    DECLARE CVnum INT;
    
    SET tableName = 'Cash Release Item';
    SET operation = 1;
    
    SELECT CVnum INTO CVnum FROM CashReleaseItem NATURAL JOIN CashReleaseVoucher WHERE CashReleaseVoucher.CashReleaseVoucherID = NEW.CashReleaseVoucherID; 
    SET newRecord =  CONCAT_WS('; ',
	CONCAT('Check Voucher Number: ', CVnum),
    CONCAT('Release Amount ', NEW.releaseAmount));
    
    INSERT INTO auditlog(tableName, operation, newRecord, userID) VALUES (tableName, operation, newRecord, @userID);

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `cashreleasevoucher`
--

DROP TABLE IF EXISTS `cashreleasevoucher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cashreleasevoucher` (
  `CashReleaseVoucherID` int(11) NOT NULL AUTO_INCREMENT,
  `cashReleaseDateTime` datetime NOT NULL,
  `remark` varchar(45) DEFAULT NULL,
  `checkNum` int(11) NOT NULL,
  `CVnum` int(11) NOT NULL,
  `bookType` int(11) NOT NULL,
  `name` text,
  PRIMARY KEY (`CashReleaseVoucherID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cashreleasevoucher`
--

LOCK TABLES `cashreleasevoucher` WRITE;
/*!40000 ALTER TABLE `cashreleasevoucher` DISABLE KEYS */;
INSERT INTO `cashreleasevoucher` VALUES (1,'2017-09-26 00:00:00','Nothing much',1001,101,1,'Cake'),(2,'2017-09-30 10:18:07','',1002,102,1,''),(3,'2017-09-30 10:23:51','',1003,103,1,''),(4,'2017-09-30 11:10:59','',1004,104,1,'');
/*!40000 ALTER TABLE `cashreleasevoucher` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER CashReleaseVoucher_AI AFTER INSERT
ON CashReleaseVoucher FOR EACH ROW
BEGIN
	DECLARE tableName TEXT;
    DECLARE operation INT;
    DECLARE newRecord TEXT;
    
    
    SET tableName = 'Cash Release Voucher';
    SET operation = 1;
    SET newRecord = CONCAT_WS('; ',
	CONCAT('Check Number: ', NEW.checkNum),
    CONCAT('Cash Voucher Number: ', NEW.CVnum),
    CONCAT('Name: ', NEW.name),
    CONCAT('Book Type: ', NEW.bookType),
    CONCAT('Cash Release Time: ', NEW.cashReleaseDateTime));
    
    INSERT INTO auditlog(tableName, operation, newRecord, userID) VALUES (tableName, operation, newRecord, @userID);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `confirmation`
--

DROP TABLE IF EXISTS `confirmation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `confirmation` (
  `confirmationID` int(11) NOT NULL AUTO_INCREMENT,
  `applicationID` int(11) NOT NULL,
  `ministerID` int(11) DEFAULT NULL,
  `recordNumber` varchar(45) DEFAULT NULL,
  `pageNumber` varchar(45) DEFAULT NULL,
  `registryNumber` varchar(45) DEFAULT NULL,
  `confirmationDate` date DEFAULT NULL,
  `remarks` text,
  PRIMARY KEY (`confirmationID`),
  KEY `confirmation_app_idx` (`applicationID`),
  KEY `confirmation_minister_idx` (`ministerID`),
  CONSTRAINT `confirmation_app` FOREIGN KEY (`applicationID`) REFERENCES `application` (`applicationID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `confirmation_minister` FOREIGN KEY (`ministerID`) REFERENCES `minister` (`ministerID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `confirmation`
--

LOCK TABLES `confirmation` WRITE;
/*!40000 ALTER TABLE `confirmation` DISABLE KEYS */;
INSERT INTO `confirmation` VALUES (1,12,3,NULL,NULL,NULL,'2017-09-09',''),(2,20,3,NULL,NULL,NULL,'2017-09-20',''),(3,36,3,NULL,NULL,NULL,'2017-09-29',''),(4,39,3,NULL,NULL,NULL,'2017-10-09',''),(5,40,5,NULL,NULL,NULL,'2017-09-12','');
/*!40000 ALTER TABLE `confirmation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `generalprofile`
--

DROP TABLE IF EXISTS `generalprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `generalprofile` (
  `profileID` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` text,
  `midName` text,
  `lastName` text,
  `suffix` varchar(5) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `gender` int(11) DEFAULT NULL,
  `birthplace` text,
  `residence` text,
  PRIMARY KEY (`profileID`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `generalprofile`
--

LOCK TABLES `generalprofile` WRITE;
/*!40000 ALTER TABLE `generalprofile` DISABLE KEYS */;
INSERT INTO `generalprofile` VALUES (7,'Dewey','L','Sia','','1998-09-26',1,'Miami','Crown Point'),(8,'Jim','C','Tang','Jr','2017-09-10',1,'Postonia','Bridgehaven'),(9,'Niña','A','Fitzgerald','','2017-09-10',2,'Poston','Bridgehaven'),(11,'Andreia','Q','Gaultz','','2017-09-10',2,'Garden City','Missoula'),(12,'Andre','C','Gaultz','','2017-09-10',2,'Concord','Seattle'),(13,'Francis','A','Robins','','2017-09-16',1,'Postone','Bridgehaven'),(14,'Rachelle','D','Shwartz','','2017-02-01',2,'Davao','Davao'),(15,'France','A','Saggat',NULL,'1997-08-21',1,'Bulmary','Woodsford'),(19,'Beatrice','A','Solberg','','2017-09-26',2,'Bridgeport','Jackson'),(20,'Malcolm','A','Peterson','','2017-09-11',1,'Ashton','Mount Pleasant'),(21,'Emmett','B','Mason','','2017-09-28',2,'Odessa','Boston'),(22,'Guy','J','Ingram','','2017-09-28',1,'Gensan','Davao'),(23,'Jun','B','Seba','','1974-02-07',1,'Manila','Cebu'),(24,'Jon','A','Marshall','','1975-09-06',2,NULL,NULL),(25,'Yuki','A','Kajiura','','1965-08-06',1,NULL,NULL),(26,'Christopher','C','Green','','1970-08-15',1,'Wildstone','Rockford'),(27,'Tina','M','Turner','','1969-08-04',2,'Merribourne','Southedge'),(28,'Sally','K','Jackson','','2017-09-01',1,NULL,NULL),(29,'Scott','V','Lerner','','2000-06-29',1,NULL,NULL),(30,'Patricia','F','Ford','','2010-12-15',2,NULL,NULL),(31,'Frank','J','Perry','','2017-09-06',1,NULL,NULL),(32,'Giuseppe','J','House','','2017-09-07',1,NULL,NULL),(33,'Tanya','C','Hernandez','','2014-06-19',1,NULL,NULL),(34,'Loren','C','Peebles','','1994-06-30',2,NULL,NULL),(35,'Sherry','I','Hunter','','2003-11-27',1,NULL,NULL),(36,'Sandra','E','Fairbanks','','2010-06-07',1,NULL,NULL);
/*!40000 ALTER TABLE `generalprofile` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER GeneralProfile_BI
BEFORE INSERT ON GeneralProfile FOR EACH ROW
BEGIN
	
    DECLARE tableName VARCHAR(100);
    DECLARE operation INT;
    DECLARE newRecord TEXT;
    
    SET tableName = 'Profile';
    SET operation = 1;
    SET newRecord =  
    CONCAT_WS('; ', 
    CONCAT('First Name: ', NEW.firstName), 
    CONCAT('M.I.: ', NEW.midName), 
    CONCAT('Last Name: ', NEW.lastName), 
    CONCAT('Suffix: ', NEW.suffix), 
    CONCAT('Gender: ', getGender(NEW.gender)),
    CONCAT('Birthdate: ', NEW.birthDate),
    CONCAT('Residence: ', NEW.residence),
    CONCAT('Birth Place: ', NEW.birthplace));
    
    INSERT INTO auditlog(tableName, operation, newRecord, userID) VALUES (tableName, operation, newRecord, @userID);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER GeneralProfile_AU AFTER UPDATE 
ON GeneralProfile FOR EACH ROW
BEGIN
	DECLARE tableName VARCHAR(100);
    DECLARE operation INT;
    DECLARE oldRecord TEXT;
    DECLARE newRecord TEXT;
    
    SET tableName = 'Profile';
    SET operation = 2;
    SET newRecord =  
    CONCAT_WS('; ', 
    CONCAT('First Name: ', NEW.firstName), 
    CONCAT('M.I.: ', NEW.midName), 
    CONCAT('Last Name: ', NEW.lastName), 
    CONCAT('Suffix: ', NEW.suffix),
    CONCAT('Gender: ', getGender(NEW.gender)),
    CONCAT('Birthdate: ', NEW.birthDate),
    CONCAT('Residence: ', NEW.residence),
    CONCAT('Birth Place: ', NEW.birthplace));
    
    SET oldRecord = 
    CONCAT_WS('; ', 
    CONCAT('First Name: ', OLD.firstName), 
    CONCAT('M.I.: ', OLD.midName), 
    CONCAT('Last Name: ', OLD.lastName), 
    CONCAT('Suffix: ', OLD.suffix), 
    CONCAT('Gender: ', getGender(OLD.gender)),
    CONCAT('Birthdate: ', OLD.birthDate),
    CONCAT('Residence: ', OLD.residence),
    CONCAT('Birth Place: ', OLD.birthplace));
    
    INSERT INTO auditlog(tableName, operation, newRecord, oldRecord, userID) VALUES (tableName, operation, newRecord, oldRecord, @userID);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER GeneralProfile_BD BEFORE DELETE
ON GeneralProfile FOR EACH ROW
BEGIN
	DECLARE tableName VARCHAR(100);
    DECLARE operation INT;
    DECLARE oldRecord TEXT;
    
    SET tableName = 'Profile';
    SET operation = 3;
    SET oldRecord = 
    CONCAT_WS('; ', 
    CONCAT('First Name: ', OLD.firstName), 
    CONCAT('M.I.: ', OLD.midName), 
    CONCAT('Last Name: ', OLD.lastName), 
    CONCAT('Suffix: ', OLD.suffix), 
    CONCAT('Gender: ', getGender(OLD.gender)),
    CONCAT('Birthdate: ', OLD.birthDate),
    CONCAT('Residence: ', OLD.residence),
    CONCAT('Birth Place: ', OLD.birthplace));
    
    INSERT INTO auditlog(tableName, operation, newRecord, userID) VALUES (tableName, operation, newRecord, @userID);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item` (
  `itemID` int(11) NOT NULL AUTO_INCREMENT,
  `itemTypeID` int(11) NOT NULL,
  `primaryIncomeID` int(11) NOT NULL,
  `price` decimal(15,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  PRIMARY KEY (`itemID`),
  UNIQUE KEY `itemID_UNIQUE` (`itemID`),
  KEY `item_itemType_idx` (`itemTypeID`),
  KEY `item_primaryIncome_idx` (`primaryIncomeID`),
  CONSTRAINT `item_itemType` FOREIGN KEY (`itemTypeID`) REFERENCES `itemtype` (`itemTypeID`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `item_primaryIncome` FOREIGN KEY (`primaryIncomeID`) REFERENCES `primaryincome` (`primaryIncomeID`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (1,5,13,50.00,1),(2,4,14,1000.00,1),(3,4,14,500.00,1),(4,4,15,2000000.00,1),(5,4,23,1000.00,1),(6,4,24,100.00,1),(7,4,24,200.00,1),(8,6,25,100.00,2),(9,4,27,500.00,1),(10,5,28,50.00,1),(11,5,28,50.00,1);
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itemtype`
--

DROP TABLE IF EXISTS `itemtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `itemtype` (
  `itemTypeID` int(11) NOT NULL AUTO_INCREMENT,
  `itemType` text NOT NULL,
  `bookType` int(11) NOT NULL,
  `suggestedPrice` decimal(15,2) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `details` text,
  `cashreceipt_cashdisbursment` int(11) DEFAULT NULL,
  PRIMARY KEY (`itemTypeID`),
  UNIQUE KEY `itemTypeID_UNIQUE` (`itemTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itemtype`
--

LOCK TABLES `itemtype` WRITE;
/*!40000 ALTER TABLE `itemtype` DISABLE KEYS */;
INSERT INTO `itemtype` VALUES (1,'Baptism',1,200.00,1,NULL,1),(2,'Confirmation',1,500.00,1,NULL,1),(3,'Marriage',1,2000.00,1,NULL,1),(4,'Donation',1,0.00,1,'',1),(5,'Parish Card',2,50.00,1,NULL,1),(6,'Certificates',1,100.00,1,'',1),(7,'Food',2,500.00,1,'',1),(8,'Office Supplies',1,0.00,1,'',2),(9,'Electricity ',1,0.00,1,'',2),(10,'Water',1,0.00,1,'',2),(11,'Food',1,0.00,1,'',2),(12,'GKK',1,0.00,1,'',2),(13,'Gasoline',1,100.00,1,'',2);
/*!40000 ALTER TABLE `itemtype` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER ItemType_BI BEFORE INSERT 
ON ItemType FOR EACH ROW
BEGIN
	DECLARE tableName TEXT;
    DECLARE operation INT;
    DECLARE newRecord TEXT;
    
    
    SET tableName = 'Item Type';
    SET operation = 1;
    SET newRecord = CONCAT_WS('; ',
	CONCAT('Item Type: ', NEW.ItemType),
    CONCAT('Book Type: ', getBookType(NEW.bookType)),
    CONCAT('Transaction Type: ', getTransactionType(NEW.cashreceipt_cashdisbursment)),
    CONCAT('Suggested Price: ', NEW.suggestedPrice),
    CONCAT('Status: ', getStatus(NEW.status)),
	CONCAT('Details: ', NEW.details));
    
    INSERT INTO auditlog(tableName, operation, newRecord, userID) VALUES (tableName, operation, newRecord, @userID);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER ItemType_AU AFTER UPDATE
ON ItemType FOR EACH ROW
BEGIN
	DECLARE tableName TEXT;
    DECLARE operation INT;
    DECLARE newRecord TEXT;
    DECLARE oldRecord TEXT;
    
    
    SET tableName = 'Item Type';
    SET operation = 2;
    
    SET oldRecord = CONCAT_WS('; ',
	CONCAT('Item Type: ', OLD.ItemType),
    CONCAT('Book Type: ', getBookType(OLD.bookType)),
    CONCAT('Transaction Type: ', getTransactionType(OLD.cashreceipt_cashdisbursment)),
    CONCAT('Suggested Price: ', OLD.suggestedPrice),
    CONCAT('Status: ', getStatus(OLD.status),
	CONCAT('Details: ', OLD.details)));
    
    SET newRecord = CONCAT_WS('; ',
	CONCAT('Item Type: ', NEW.ItemType),
    CONCAT('Book Type: ', getBookType(NEW.bookType)),
    CONCAT('Transaction Type: ', getTransactionType(NEW.cashreceipt_cashdisbursment)),
    CONCAT('Suggested Price: ', NEW.suggestedPrice),
    CONCAT('Status: ', getStatus(NEW.status),
	CONCAT('Details: ', NEW.details)));
    
    
    
    INSERT INTO auditlog(tableName, operation, oldRecord, newRecord, userID) VALUES (tableName, operation, oldRecord, newRecord, @userID);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER ItemType_AD AFTER DELETE
ON ItemType FOR EACH ROW
BEGIN
	DECLARE tableName TEXT;
    DECLARE operation INT;
    DECLARE oldRecord TEXT;
    
    
    SET tableName = 'Item Type';
    SET operation = 3;
    
    SET oldRecord = CONCAT_WS('; ',
	CONCAT('Item Type: ', OLD.ItemType),
    CONCAT('Book Type: ', getBookType(OLD.bookType)),
    CONCAT('Transaction Type: ', getTransactionType(OLD.cashreceipt_cashdisbursment)),
    CONCAT('Suggested Price: ', OLD.suggestedPrice),
    CONCAT('Status: ', getStatus(OLD.status),
	CONCAT('Details: ', OLD.details)));
    
    INSERT INTO auditlog(tableName, operation, oldRecord) VALUES (tableName, operation, oldRecord);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `marriage`
--

DROP TABLE IF EXISTS `marriage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `marriage` (
  `marriageID` int(11) NOT NULL AUTO_INCREMENT,
  `applicationID` int(11) NOT NULL,
  `ministerID` int(11) DEFAULT NULL,
  `recordNumber` varchar(45) DEFAULT NULL,
  `pageNumber` varchar(4) DEFAULT NULL,
  `registryNumber` varchar(45) DEFAULT NULL,
  `licenseDate` date DEFAULT NULL,
  `marriageDate` date DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `remarks` text,
  `civilStatusGroom` int(11) DEFAULT NULL,
  `civilStatusBride` int(11) DEFAULT NULL,
  PRIMARY KEY (`marriageID`),
  KEY `marriage_minister_idx` (`ministerID`),
  KEY `marraige_application_idx` (`applicationID`),
  CONSTRAINT `marraige_application` FOREIGN KEY (`applicationID`) REFERENCES `application` (`applicationID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `marriage_minister` FOREIGN KEY (`ministerID`) REFERENCES `minister` (`ministerID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marriage`
--

LOCK TABLES `marriage` WRITE;
/*!40000 ALTER TABLE `marriage` DISABLE KEYS */;
INSERT INTO `marriage` VALUES (1,13,3,'2017','3','78','2017-09-09','2017-09-09',NULL,'',1,1),(2,34,6,NULL,NULL,NULL,'2017-09-30','2017-09-30',1,'',1,1);
/*!40000 ALTER TABLE `marriage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `minister`
--

DROP TABLE IF EXISTS `minister`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `minister` (
  `ministerID` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` text,
  `midName` text,
  `lastName` text,
  `suffix` varchar(10) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `ministryType` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `licenseNumber` text,
  `expirationDate` date DEFAULT NULL,
  PRIMARY KEY (`ministerID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `minister`
--

LOCK TABLES `minister` WRITE;
/*!40000 ALTER TABLE `minister` DISABLE KEYS */;
INSERT INTO `minister` VALUES (3,'Boyle','A','Royce','II','1960-01-02',2,1,NULL,NULL),(4,'Joshua','F','Lintag','','2017-09-12',1,1,NULL,NULL),(5,'Joseph','A','Numirez','','1970-10-22',3,1,NULL,NULL),(6,'Bernardo','B','Spencer','','2017-09-29',1,1,NULL,NULL);
/*!40000 ALTER TABLE `minister` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER Minister_BI BEFORE INSERT 
ON Minister FOR EACH ROW
BEGIN
	DECLARE tableName TEXT;
    DECLARE operation INT;
    DECLARE newRecord TEXT;
    DECLARE person TEXT;
    
    SET tableName = 'Minister';
    SET operation = 1;
    SET person = CONCAT_WS(' ', NEW.firstName, NEW.midName, NEW.lastName, NEW.suffix);
    SET newRecord = CONCAT_WS('; ',
	CONCAT('Name: ', person),
    CONCAT('Birthdate: ', NEW.birthdate),
    CONCAT('Ministry Type: ', getMinistryType(NEW.ministryType)),
    CONCAT('Status: ', getStatus(NEW.status)),
    CONCAT('License Number: ', NEW.licenseNumber));
    
    INSERT INTO auditlog(tableName, operation, newRecord, userID) VALUES (tableName, operation, newRecord, @userID);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER Minister_AU AFTER UPDATE 
ON Minister FOR EACH ROW
BEGIN
	DECLARE tableName TEXT;
    DECLARE operation INT;
    DECLARE newRecord TEXT;
    DECLARE oldRecord TEXT;
    DECLARE person TEXT;
    
    SET tableName = 'Minister';
    SET operation = 2;
    SET person = CONCAT_WS(' ', OLD.firstName, OLD.midName, OLD.lastName, OLD.suffix);
    
	SET oldRecord = CONCAT_WS('; ',
	CONCAT('Name: ', person),
    CONCAT('Birthdate: ', OLD.birthdate),
    CONCAT('Ministry Type: ', getMinistryType(OLD.ministryType)),
    CONCAT('Status: ', getStatus(OLD.status)),
    CONCAT('License Number: ', OLD.licenseNumber));
    
    SET person = CONCAT_WS(' ', NEW.firstName, NEW.midName, NEW.lastName, NEW.suffix);
    SET newRecord = CONCAT_WS('; ',
	CONCAT('Name: ', person),
    CONCAT('Birthdate: ', NEW.birthdate),
    CONCAT('Ministry Type: ', getMinistryType(NEW.ministryType)),
    CONCAT('Status: ', getStatus(NEW.status)),
    CONCAT('License Number: ', NEW.licenseNumber));
    
    
    INSERT INTO auditlog(tableName, operation, oldRecord, newRecord, userID) VALUES (tableName, operation, oldRecord, newRecord, @userID);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER Minister_AD AFTER DELETE 
ON Minister FOR EACH ROW
BEGIN
	DECLARE tableName TEXT;
    DECLARE operation INT;
    DECLARE oldRecord TEXT;
    DECLARE person TEXT;
    
    SET tableName = 'Minister';
    SET operation = 3;
    SET person = CONCAT_WS(' ', OLD.firstName, OLD.midName, OLD.lastName, OLD.suffix);
    
	SET oldRecord = CONCAT_WS('; ',
	CONCAT('Name: ', person),
    CONCAT('Birthdate: ', OLD.birthdate),
    CONCAT('Ministry Type: ', getMinistryType(OLD.ministryType)),
    CONCAT('Status: ', getStatus(OLD.status)),
    CONCAT('License Number: ', OLD.licenseNumber));
    
    
    INSERT INTO auditlog(tableName, operation, oldRecord, userID) VALUES (tableName, operation, oldRecord, @userID);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `ministerschedule`
--

DROP TABLE IF EXISTS `ministerschedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ministerschedule` (
  `ministerScheduleID` int(11) NOT NULL AUTO_INCREMENT,
  `ministerID` int(11) DEFAULT NULL,
  `title` text,
  `details` text,
  `startDateTime` datetime DEFAULT NULL,
  `endDateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`ministerScheduleID`),
  KEY `ministerschedule_minister_idx` (`ministerID`),
  CONSTRAINT `ministerschedule_minister` FOREIGN KEY (`ministerID`) REFERENCES `minister` (`ministerID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ministerschedule`
--

LOCK TABLES `ministerschedule` WRITE;
/*!40000 ALTER TABLE `ministerschedule` DISABLE KEYS */;
INSERT INTO `ministerschedule` VALUES (1,4,'SAD Meeting','Discuss about SAD.','2017-09-14 12:34:00','2017-09-14 13:34:00'),(2,5,'Defense Payments','Inquire and Seek advice','2017-09-15 12:50:00','2017-09-15 14:34:00'),(3,5,'Parish Appointment','Previous minister unavailable. Changed minister.','2017-09-30 08:20:00','2017-09-30 09:20:00');
/*!40000 ALTER TABLE `ministerschedule` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER MinisterSchedule_AI AFTER INSERT
ON MinisterSchedule FOR EACH ROW
BEGIN
	DECLARE tableName TEXT;
    DECLARE operation INT;
    DECLARE newRecord TEXT;
    DECLARE minister TEXT;
    
    
    SET tableName = 'Appointment';
    SET operation = 1;
    
    SET newRecord = CONCAT_WS('; ',
	CONCAT('Title: ', NEW.title),
    CONCAT('Details: ', NEW.details),
    CONCAT('Start Time: ', NEW.startDateTime),
    CONCAT('End Time: ', NEW.endDateTime),
    CONCAT('Minister: ', getMinister(NEW.ministerID)));
    
    INSERT INTO auditlog(tableName, operation, newRecord, userID) VALUES (tableName, operation, newRecord, @userID);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER MinisterSchedule_AU AFTER UPDATE
ON MinisterSchedule FOR EACH ROW
BEGIN
	DECLARE tableName TEXT;
    DECLARE operation INT;
    DECLARE oldRecord TEXT;
    DECLARE newRecord TEXT;
    DECLARE minister TEXT;
    
    
    SET tableName = 'Appointment';
    SET operation = 2;
    
    SET oldRecord = CONCAT_WS('; ',
	CONCAT('Title: ', OLD.title),
    CONCAT('Details: ', OLD.details),
    CONCAT('Start Time: ', OLD.startDateTime),
    CONCAT('End Time: ', OLD.endDateTime),
    CONCAT('Minister: ', getMinister(OLD.ministerID)));
    
    SET newRecord = CONCAT_WS('; ',
	CONCAT('Title: ', NEW.title),
    CONCAT('Details: ', NEW.details),
    CONCAT('Start Time: ', NEW.startDateTime),
    CONCAT('End Time: ', NEW.endDateTime),
    CONCAT('Minister: ', getMinister(NEW.ministerID)));
    
    INSERT INTO auditlog(tableName, operation, oldRecord, newRecord, userID) VALUES (tableName, operation, oldRecord, newRecord, @userID);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER MinisterSchedule_AD AFTER DELETE
ON MinisterSchedule FOR EACH ROW
BEGIN
	DECLARE tableName TEXT;
    DECLARE operation INT;
    DECLARE oldRecord TEXT;
    DECLARE minister TEXT;
    
    
    SET tableName = 'Appointment';
    SET operation = 3;
    
    SET oldRecord = CONCAT_WS('; ',
	CONCAT('Title: ', OLD.title),
    CONCAT('Details: ', OLD.details),
    CONCAT('Start Time: ', OLD.startDateTime),
    CONCAT('End Time: ', OLD.endDateTime),
    CONCAT('Minister: ', getMinister(OLD.ministerID)));
    
    INSERT INTO auditlog(tableName, operation, oldRecord, userID) VALUES (tableName, operation, oldRecord, @userID);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `parent`
--

DROP TABLE IF EXISTS `parent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parent` (
  `parentID` int(11) NOT NULL AUTO_INCREMENT,
  `profileID` int(11) DEFAULT NULL,
  `firstName` text,
  `midName` text,
  `lastName` text,
  `suffix` varchar(5) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `gender` int(11) DEFAULT NULL,
  `birthplace` text,
  `residence` text,
  PRIMARY KEY (`parentID`),
  KEY `parent_genprof_idx` (`profileID`),
  CONSTRAINT `parent_genprof` FOREIGN KEY (`profileID`) REFERENCES `generalprofile` (`profileID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parent`
--

LOCK TABLES `parent` WRITE;
/*!40000 ALTER TABLE `parent` DISABLE KEYS */;
INSERT INTO `parent` VALUES (3,8,'Jumallia','Q','Aine','',NULL,1,'Vladasia',NULL),(4,8,'Sheryl','E','Sedder','',NULL,2,'Vladasia',NULL),(5,9,'Sherylle','E','Seder','',NULL,1,'Coldstone',NULL),(6,9,'Sherylle','E','Sedderin','',NULL,2,'Addasia',NULL),(8,13,'Sherylle','E','Sedderin','',NULL,2,'Nelliston',NULL),(9,13,'Sherylle','E','Seder','',NULL,1,'Carlstone',NULL),(10,23,'Yvonne','E','Gomez','',NULL,2,'Springlea',NULL),(11,23,'Bret','E','Ellis','',NULL,1,'Pinelyn',NULL),(13,28,'Cynthia','K','Khun','',NULL,2,'2013 Rocket Drive',NULL),(14,28,'David ','D','Moulton','',NULL,1,'300 Atha Drive',NULL),(15,29,'Sharon ','L','Deckard','',NULL,2,'3595 Marion Street',NULL),(16,29,'Gary ','M','Wang','',NULL,1,'630 Matthews Street',NULL),(17,30,'Bessie ','J','Kramer','',NULL,2,'Southfield',NULL),(18,30,'George ','M','Sadler','',NULL,1,'Everett',NULL),(19,31,'Glena','M','Shearer','',NULL,2,'Madisonville',NULL),(20,31,'Gary','M','Wang','Jr',NULL,1,'Kent',NULL),(21,32,'Renee ','W','Noel','',NULL,2,'New York',NULL),(22,32,'Howard ','D','Lopez','',NULL,1,'Nashville',NULL),(23,33,'Zola','A','Aaron','',NULL,2,'Memphis',NULL),(24,33,'Allen ','M','Johanson','',NULL,1,'Louisville',NULL),(26,26,'Ralph','R','Franklin','Jr',NULL,1,'',NULL),(27,26,'Cynthia','A','Moore','',NULL,2,'',NULL),(28,27,'Keith','A','Cooper','',NULL,1,'',NULL),(29,27,'Ida','R','Robertson','',NULL,2,'',NULL);
/*!40000 ALTER TABLE `parent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment` (
  `paymentID` int(11) NOT NULL AUTO_INCREMENT,
  `sacramentIncomeID` int(11) NOT NULL,
  `primaryIncomeID` int(11) NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  PRIMARY KEY (`paymentID`),
  KEY `payment_sacramentIncome_idx` (`sacramentIncomeID`),
  KEY `payment_primaryIncome_idx` (`primaryIncomeID`),
  CONSTRAINT `payment_primaryIncome` FOREIGN KEY (`primaryIncomeID`) REFERENCES `primaryincome` (`primaryIncomeID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `payment_sacramentIncome` FOREIGN KEY (`sacramentIncomeID`) REFERENCES `sacramentincome` (`sacramentIncomeID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (1,10,1,200.00),(5,12,4,120.00),(7,11,3,50.00),(8,27,6,5000.00),(9,28,7,2000.00),(10,30,8,500.00),(11,31,9,200.00),(12,32,10,200.00),(13,33,11,500.00),(14,35,12,250.00),(15,17,16,100.00),(16,25,17,200.00),(17,14,18,200.00),(18,35,19,250.00),(19,12,19,380.00),(20,11,20,150.00),(21,29,21,200.00),(22,14,22,300.00),(23,34,26,500.00);
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER Payment_AI AFTER INSERT
ON Payment FOR EACH ROW
BEGIN
	DECLARE tableName TEXT;
    DECLARE operation INT;
    DECLARE newRecord TEXT;
    DECLARE _ORnum INT;
    
    SELECT ORnum INTO _ORnum FROM primaryincome NATURAL JOIN payment WHERE paymentID = NEW.paymentID;
    
    SET tableName = 'Payment';
    SET operation = 1;
    SET newRecord = CONCAT_WS('; ',
	CONCAT('OR Number: ', _ORnum),
    CONCAT('Payment Amount: ', NEW.amount));
    
    INSERT INTO auditlog(tableName, operation, newRecord) VALUES (tableName, operation, newRecord);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `primaryincome`
--

DROP TABLE IF EXISTS `primaryincome`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `primaryincome` (
  `primaryIncomeID` int(11) NOT NULL AUTO_INCREMENT,
  `sourceName` text,
  `bookType` text NOT NULL,
  `ORnum` int(11) NOT NULL,
  `remarks` varchar(45) NOT NULL,
  `primaryIncomeDateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`primaryIncomeID`),
  UNIQUE KEY `itemID_UNIQUE` (`primaryIncomeID`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `primaryincome`
--

LOCK TABLES `primaryincome` WRITE;
/*!40000 ALTER TABLE `primaryincome` DISABLE KEYS */;
INSERT INTO `primaryincome` VALUES (1,NULL,'1',1,'',NULL),(3,'George','1',2,'Danielle\'s Baptism','2017-09-24 00:00:00'),(4,'Geralt','1',3,'Hard Liquor',NULL),(5,'Deralte','1',4,'Booze','2017-09-24 00:00:00'),(6,NULL,'1',5,'',NULL),(7,NULL,'1',6,'',NULL),(8,NULL,'1',7,'',NULL),(9,NULL,'1',8,'',NULL),(10,NULL,'1',9,'',NULL),(11,NULL,'1',10,'',NULL),(12,NULL,'1',11,'awaiting requirements',NULL),(13,'Vicky Palmer','2',1,'','2017-09-29 10:10:20'),(14,'Doris Askew','1',12,'','2017-09-29 10:17:42'),(15,'','1',13,'','2017-09-29 10:18:43'),(16,'','1',14,'','2017-09-30 09:32:46'),(17,'','1',15,'','2017-09-30 09:40:06'),(18,'','1',16,'','2017-09-30 09:41:06'),(19,'','1',17,'','2017-09-30 09:41:44'),(20,'','1',18,'','2017-09-30 09:47:02'),(21,'','1',19,'','2017-09-30 09:52:00'),(22,'','1',20,'','2017-09-30 09:53:48'),(23,'','1',21,'','2017-09-30 09:55:09'),(24,'','1',22,'','2017-09-30 09:56:09'),(25,'','1',23,'','2017-09-30 09:56:18'),(26,'','1',24,'','2017-09-30 10:00:28'),(27,'Ricky','1',25,'Feeding program','2017-09-30 10:01:25'),(28,'','2',2,'','2017-09-30 10:17:41');
/*!40000 ALTER TABLE `primaryincome` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER PrimaryIncome_BI BEFORE INSERT
ON PrimaryIncome FOR EACH ROW
BEGIN
	DECLARE tableName TEXT;
    DECLARE operation INT;
    DECLARE newRecord TEXT;
    
    
    SET tableName = 'Primary Income';
    SET operation = 1;
    SET newRecord = CONCAT_WS('; ',
	CONCAT('Source: ', NEW.sourceName),
    CONCAT('Book Type: ', getBookType(NEW.bookType)),
    CONCAT('OR Number: ', NEW.ORnum),
    CONCAT('Remarks: ', NEW.remarks),
    CONCAT('Income Time: ', NEW.primaryIncomeDateTime));
    
    INSERT INTO auditlog(tableName, operation, newRecord, userID) VALUES (tableName, operation, newRecord, @userID);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER PrimaryIncome_AU AFTER UPDATE
ON PrimaryIncome FOR EACH ROW
BEGIN
	DECLARE tableName TEXT;
    DECLARE operation INT;
    DECLARE oldRecord TEXT;
    DECLARE newRecord TEXT;
    
    
    SET tableName = 'Primary Income';
    SET operation = 2;
    SET oldRecord = CONCAT_WS('; ',
	CONCAT('Source: ', OLD.sourceName),
    CONCAT('Book Type: ', getBookType(OLD.bookType)),
    CONCAT('OR Number: ', OLD.ORnum),
    CONCAT('Remarks: ', OLD.remarks),
    CONCAT('Income Time: ', OLD.primaryIncomeDateTime));
    
    SET newRecord = CONCAT_WS('; ',
	CONCAT('Source: ', NEW.sourceName),
    CONCAT('Book Type: ', getBookType(NEW.bookType)),
    CONCAT('OR Number: ', NEW.ORnum),
    CONCAT('Remarks: ', NEW.remarks),
    CONCAT('Income Time: ', NEW.primaryIncomeDateTime));
    
    INSERT INTO auditlog(tableName, operation, oldRecord, newRecord, userID) VALUES (tableName, operation, oldRecord, newRecord, @userID);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER PrimaryIncome_AD AFTER DELETE
ON PrimaryIncome FOR EACH ROW
BEGIN
	DECLARE tableName TEXT;
    DECLARE operation INT;
    DECLARE oldRecord TEXT;
    
    
    SET tableName = 'Primary Income';
    SET operation = 3;
    SET oldRecord = CONCAT_WS('; ',
	CONCAT('Source: ', OLD.sourceName),
    CONCAT('Book Type: ', getBookType(OLD.bookType)),
    CONCAT('OR Number: ', OLD.ORnum),
    CONCAT('Remarks: ', OLD.remarks),
    CONCAT('Income Time: ', OLD.primaryIncomeDateTime));
    
    INSERT INTO auditlog(tableName, operation, oldRecord, userID) VALUES (tableName, operation, oldRecord, @userID);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `sacramentincome`
--

DROP TABLE IF EXISTS `sacramentincome`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sacramentincome` (
  `sacramentIncomeID` int(11) NOT NULL AUTO_INCREMENT,
  `applicationID` int(11) NOT NULL,
  `price` double DEFAULT NULL,
  `remarks` text,
  PRIMARY KEY (`sacramentIncomeID`),
  KEY `sacramentIncome_application_idx` (`applicationID`),
  CONSTRAINT `sacramentIncome_application` FOREIGN KEY (`applicationID`) REFERENCES `application` (`applicationID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sacramentincome`
--

LOCK TABLES `sacramentincome` WRITE;
/*!40000 ALTER TABLE `sacramentincome` DISABLE KEYS */;
INSERT INTO `sacramentincome` VALUES (10,10,200,''),(11,11,200,''),(12,15,500,''),(13,13,2000,''),(14,14,500,'New Parish Member'),(15,22,100,''),(16,20,100,''),(17,21,100,''),(18,23,0,''),(19,24,0,''),(20,25,0,''),(21,26,0,'New born'),(22,28,500,'New born baby'),(23,29,500,''),(24,30,500,''),(25,31,200,'Japanese record producer, DJ, composer and arranger who recorded under the stage name Nujabes'),(26,32,800,'American hip hop producer and rapper from Cincinnati, Ohio'),(27,33,20000,'Couple\'s donation went toward their wedding.'),(28,34,2000,''),(29,35,200,''),(30,36,500,''),(31,37,200,''),(32,38,200,''),(33,39,500,''),(34,40,500,''),(35,41,500,''),(36,42,500,'awaiting requirements'),(37,43,500,'');
/*!40000 ALTER TABLE `sacramentincome` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule`
--

DROP TABLE IF EXISTS `schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schedule` (
  `scheduleID` int(11) NOT NULL AUTO_INCREMENT,
  `title` text,
  `details` text,
  `startDateTime` datetime DEFAULT NULL,
  `endDateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`scheduleID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule`
--

LOCK TABLES `schedule` WRITE;
/*!40000 ALTER TABLE `schedule` DISABLE KEYS */;
INSERT INTO `schedule` VALUES (2,'Meeting','','2017-09-12 10:12:00','2017-09-12 11:12:00'),(3,'SAD 2 Defense','SoftEng Defense','2017-09-30 13:30:00','2017-09-30 15:00:00'),(4,'Coding Session','Code for SAD 2. Defense approaching.','2017-09-26 09:00:00','2017-09-26 12:00:00'),(5,'RNR','CSSEC RNR','2017-10-14 07:00:00','2017-10-16 17:00:00');
/*!40000 ALTER TABLE `schedule` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER Schedule_AI AFTER INSERT
ON Schedule FOR EACH ROW
BEGIN
	DECLARE tableName TEXT;
    DECLARE operation INT;
    DECLARE newRecord TEXT;
    
    SET tableName = 'Schedule';
    SET operation = 1;
    SET newRecord = CONCAT_WS('; ',
	CONCAT('Title: ', NEW.title),
    CONCAT('Details: ', NEW.details),
    CONCAT('Start Time: ', NEW.startDateTime),
    CONCAT('End Time: ', NEW.endDateTime));
    
    INSERT INTO auditlog(tableName, operation, newRecord, userID) VALUES (tableName, operation, newRecord, @userID);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER Schedule_AU AFTER UPDATE
ON Schedule FOR EACH ROW
BEGIN
	DECLARE tableName TEXT;
    DECLARE operation INT;
    DECLARE oldRecord TEXT;
    DECLARE newRecord TEXT;
    
    SET tableName = 'Schedule';
    SET operation = 2;
    SET oldRecord = CONCAT_WS('; ',
	CONCAT('Title: ', OLD.title),
    CONCAT('Details: ', OLD.details),
    CONCAT('Start Time: ', OLD.startDateTime),
    CONCAT('End Time: ', OLD.endDateTime));
    
    SET newRecord = CONCAT_WS('; ',
	CONCAT('Title: ', NEW.title),
    CONCAT('Details: ', NEW.details),
    CONCAT('Start Time: ', NEW.startDateTime),
    CONCAT('End Time: ', NEW.endDateTime));
    
    INSERT INTO auditlog(tableName, operation, oldRecord, newRecord, userID) VALUES (tableName, operation, oldRecord, newRecord, @userID);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER Schedule_AD AFTER DELETE
ON Schedule FOR EACH ROW
BEGIN
	DECLARE tableName TEXT;
    DECLARE operation INT;
    DECLARE oldRecord TEXT;
    
    SET tableName = 'Schedule';
    SET operation = 3;
    SET oldRecord = CONCAT_WS('; ',
	CONCAT('Title: ', OLD.title),
    CONCAT('Details: ', OLD.details),
    CONCAT('Start Time: ', OLD.startDateTime),
    CONCAT('End Time: ', OLD.endDateTime));
    
    INSERT INTO auditlog(tableName, operation, oldRecord, userID) VALUES (tableName, operation, oldRecord, @userID);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `sponsor`
--

DROP TABLE IF EXISTS `sponsor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sponsor` (
  `sponsorID` int(11) NOT NULL AUTO_INCREMENT,
  `applicationID` int(11) DEFAULT NULL,
  `firstname` text,
  `midname` text,
  `lastname` text,
  `suffix` varchar(5) DEFAULT NULL,
  `gender` int(11) DEFAULT NULL,
  `residence` text,
  PRIMARY KEY (`sponsorID`),
  KEY `ApplicationID_idx` (`applicationID`),
  CONSTRAINT `ApplicationID` FOREIGN KEY (`applicationID`) REFERENCES `application` (`applicationID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sponsor`
--

LOCK TABLES `sponsor` WRITE;
/*!40000 ALTER TABLE `sponsor` DISABLE KEYS */;
INSERT INTO `sponsor` VALUES (1,12,'Coretta','S','Sircy','',2,'Bathasia'),(2,12,'Augustus','E','Outman','Jr',1,'Quinnia'),(3,10,'Sergione','V','Negron','II',1,'Whittingham'),(4,10,'Sergione','V','Negron','II',1,'Whittingham'),(5,13,'Keith','C','Bambor','',1,'Northcoast'),(6,13,'Wen','A','Glasgow','',1,'Fallholt'),(7,20,'Clint','A','Reynolds','',1,'Old York'),(8,20,'Clint','A','Reynolds','',1,'Old York'),(9,31,'William','Y','Lambert','',1,'Coldbank'),(10,31,'William','Y','Lambert','',1,'Coldbank'),(11,35,'Claudia ','C','Shearer','',2,'3577 Moonlight Drive'),(12,35,'Scott ','V','Lerner','',1,'3217 Harvest Lane'),(13,36,'Kathy ','T','Bryant','',2,'Eagle Street'),(14,36,'Kent ','J','Curry','',1,'Coffman Alley'),(15,37,'Cora ','C','Demaria','',2,'Neshkoro'),(16,37,'Henry ','S','Blagg','',1,'Bayside'),(17,38,'Cindy ','R','Hoggan','',2,'Waltham'),(18,38,'George ','T','Rhoades','',1,'Monroe'),(19,39,'Laura ','W','Farmer','',2,'Grand Island'),(20,39,'Marlon','T','Threatt','',1,'Grand Island'),(21,40,'Priscilla ','H','Gonzalez','',2,'Malibu'),(22,40,'Ernest','A','Pearson','',1,'Toledo'),(27,34,'Tanya','A','Jennings','',2,'Fogtown'),(28,34,'Derrick','B','Graham','',1,'Jancoast');
/*!40000 ALTER TABLE `sponsor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `userID` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` text,
  `midname` text,
  `lastname` text,
  `suffix` varchar(45) DEFAULT NULL,
  `username` varchar(45) NOT NULL,
  `pass` longtext NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `addedBy` int(11) DEFAULT NULL,
  `privileges` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`userID`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Dewey','L','Sia','','dewey','zthOONfeQxq9lrQyFyeYRV2AWnSocr863+anja9YwpBBwDQ9',1,-1,'4'),(2,'Keating','A','John','','john','giclmh/nLTS6TsHaGQKLNI4wpyZBsvxzmnaCCgXWf1Eh3SgQ',1,-1,'4'),(4,'Holly','M','Blue','','hollyblue','QOxAMZON/XI9fEypGyIJtR7ccouMZwdxoCbAa5f+I8q8oa7F',1,2,'2'),(5,'Sheila','B','Sheng','','ateneo98','ZS+GM83s2EFkLupDe0pMtP1PJCToo4NPCggHthyxgXVuOUHv',1,2,'1');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'sad2'
--

--
-- Dumping routines for database 'sad2'
--
/*!50003 DROP FUNCTION IF EXISTS `getApplicationPersons` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getApplicationPersons`(applicationID INT) RETURNS text CHARSET utf8
BEGIN
	DECLARE person TEXT;
    DECLARE numRow INT;
    
    DECLARE groom TEXT;
    DECLARE bride TEXT;
    
    SELECT COUNT(*) INTO numRow FROM Application NATURAL JOIN Applicant WHERE application.applicationID = applicationID; 
    
    IF numRow = 2 THEN 
        SELECT CONCAT_WS(' ', firstName, midName, lastName, suffix) INTO groom FROM GeneralProfile NATURAL JOIN Applicant NATURAL JOIN Application where application.applicationID = applicationID ORDER BY gender LIMIT 0,1;
        SELECT CONCAT_WS(' ', firstName, midName, lastName, suffix) INTO bride FROM GeneralProfile NATURAL JOIN Applicant NATURAL JOIN Application where application.applicationID = applicationID ORDER BY gender LIMIT 1,1;
		
        SET person = CONCAT_WS(' & ', groom, bride);
    ELSE
		SELECT CONCAT_WS(' ', firstName, midName, lastName, suffix) INTO person FROM GeneralProfile NATURAL JOIN Applicant NATURAL JOIN Application where application.applicationID = applicationID LIMIT 0,1;
    END IF;
    
    RETURN person;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getApplicationStatus` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getApplicationStatus`(applicationStatus INT) RETURNS text CHARSET utf8
BEGIN
	DECLARE applicationStat TEXT;
    
    SET applicationStat =
    CASE 
		WHEN applicationStatus = 1 THEN 'Pending'
		WHEN applicationStatus = 2 THEN 'Approved'
		WHEN applicationStatus = 3 THEN 'Final'
		WHEN applicationStatus = 4 THEN 'Revoked'
		ELSE 'Case not found'
    END;
    
    RETURN applicationStat;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getBookType` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getBookType`(bookType INT) RETURNS text CHARSET utf8
BEGIN
	DECLARE book TEXT;
    
    SET book =
    CASE 
		WHEN bookType = 1 THEN 'Parish'
		WHEN bookType = 2 THEN 'Community'
		WHEN bookType = 3 THEN 'Postulancy'
		ELSE 'Case not found'
    END;
    
    RETURN book;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getGender` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getGender`(gender INT) RETURNS text CHARSET utf8
BEGIN
	DECLARE g TEXT;
    SET g =
    CASE
		WHEN gender = 1 THEN 'Male'
        WHEN gender = 2 THEN 'Female'
		ELSE 'Case not found'
	END;
    RETURN g;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getGeneralProfile` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getGeneralProfile`(profileID INT) RETURNS text CHARSET utf8
BEGIN
	DECLARE name TEXT;
    SELECT CONCAT_WS(' ', firstName, midName, lastName, suffix) INTO name FROM GeneralProfile WHERE GeneralProfile.profileID = profileID;
    RETURN name;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getMinister` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getMinister`(ministerID INT) RETURNS text CHARSET utf8
BEGIN
	DECLARE name TEXT;
    SELECT CONCAT_WS(' ', firstName, midName, lastName, suffix) INTO name FROM Minister WHERE Minister.ministerID = ministerID;
    
    RETURN name;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getMinistryType` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getMinistryType`(ministryType INT) RETURNS text CHARSET utf8
BEGIN
	DECLARE ministry TEXT;
    
    SET ministry =
    CASE 
		WHEN ministryType = 1 THEN 'Priest'
		WHEN ministryType = 2 THEN 'Monsignor'
		WHEN ministryType = 3 THEN 'Archbishop'
		ELSE 'Case not found'
    END;
    
    RETURN ministry;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getSacrament` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getSacrament`(sacramentType INT) RETURNS text CHARSET utf8
BEGIN
	DECLARE sacrament TEXT;
    
    SET sacrament = 
	CASE 
		WHEN sacramentType = 1 THEN 'Baptism'
		WHEN sacramentType = 2 THEN 'Confirmation'
		WHEN sacramentType = 3 THEN 'Marriage'
		ELSE 'Case not found'
	END;
    
    RETURN sacrament;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getStatus` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getStatus`(status INT) RETURNS text CHARSET utf8
BEGIN
	DECLARE stat TEXT;
    
    SET stat =
    CASE 
		WHEN status = 1 THEN 'Active'
		WHEN status = 2 THEN 'Inactive'
		ELSE 'Case not found'
    END;
    
    RETURN stat;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getTransactionType` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getTransactionType`(transactionType INT) RETURNS text CHARSET utf8
BEGIN
	DECLARE transaction TEXT;
    
    SET transaction =
    CASE 
		WHEN transactionType = 1 THEN 'Cash Receipt'
		WHEN transactionType = 2 THEN 'Cash Disbursement'
		ELSE 'Case not found'
    END;
    
    RETURN transaction;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-09-30 11:48:18

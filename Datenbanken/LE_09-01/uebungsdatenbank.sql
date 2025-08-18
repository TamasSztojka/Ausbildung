CREATE DATABASE  IF NOT EXISTS `uebungsdatenbank` /*!40100 DEFAULT CHARACTER SET latin1 COLLATE latin1_german1_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `uebungsdatenbank`;
-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: uebungsdatenbank
-- ------------------------------------------------------
-- Server version	8.0.43

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `abteilung`
--

DROP TABLE IF EXISTS `abteilung`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `abteilung` (
  `abteilungid` int NOT NULL,
  `abteilunguebergeordnet` int DEFAULT NULL,
  `abteilung` varchar(120) COLLATE latin1_german1_ci DEFAULT NULL,
  `kostenstelle` varchar(120) COLLATE latin1_german1_ci DEFAULT NULL,
  PRIMARY KEY (`abteilungid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abteilung`
--

LOCK TABLES `abteilung` WRITE;
/*!40000 ALTER TABLE `abteilung` DISABLE KEYS */;
INSERT INTO `abteilung` VALUES (1,7,'Einkauf','x57g'),(2,7,'Vertrieb','x68g'),(3,6,'Controlling','x82g'),(4,7,'Verkauf','x92g'),(5,6,'Personal','x92g'),(6,8,'Unternehmensentwicklung','5ag7'),(7,8,'operations','zu87'),(8,NULL,'Unternehmensleitung','bh89');
/*!40000 ALTER TABLE `abteilung` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `abwesendheit`
--

DROP TABLE IF EXISTS `abwesendheit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `abwesendheit` (
  `abwesendheitid` int NOT NULL,
  `abwesendvon` date DEFAULT NULL,
  `abwesendbis` date DEFAULT NULL,
  `abwesendgrund` varchar(200) COLLATE latin1_german1_ci DEFAULT NULL,
  `mitarbeiterid` int DEFAULT NULL,
  PRIMARY KEY (`abwesendheitid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abwesendheit`
--

LOCK TABLES `abwesendheit` WRITE;
/*!40000 ALTER TABLE `abwesendheit` DISABLE KEYS */;
/*!40000 ALTER TABLE `abwesendheit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `anforderung_intern`
--

DROP TABLE IF EXISTS `anforderung_intern`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `anforderung_intern` (
  `anforderungnr` int NOT NULL,
  `datum` date NOT NULL,
  `kostenstelle_key` int DEFAULT NULL,
  PRIMARY KEY (`anforderungnr`),
  KEY `kostenstelle_FK` (`kostenstelle_key`),
  CONSTRAINT `kostenstelle_FK` FOREIGN KEY (`kostenstelle_key`) REFERENCES `kunde_intern` (`kostenstelle`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `anforderung_intern`
--

LOCK TABLES `anforderung_intern` WRITE;
/*!40000 ALTER TABLE `anforderung_intern` DISABLE KEYS */;
INSERT INTO `anforderung_intern` VALUES (1,'2000-08-01',1),(2,'2000-08-01',1),(3,'2000-08-01',1),(4,'2000-08-01',1),(5,'2000-08-01',4),(6,'2000-08-01',4),(7,'2000-08-01',4),(8,'2000-08-01',4),(9,'2000-08-01',NULL),(10,'2000-08-01',NULL),(11,'2000-08-01',NULL);
/*!40000 ALTER TABLE `anforderung_intern` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `anforderung_intern_d`
--

DROP TABLE IF EXISTS `anforderung_intern_d`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `anforderung_intern_d` (
  `anforderungnr` int NOT NULL,
  `datum` date NOT NULL,
  `kostenstelle_key` int DEFAULT NULL,
  PRIMARY KEY (`anforderungnr`),
  KEY `kostenstelle_FK2` (`kostenstelle_key`),
  CONSTRAINT `kostenstelle_FK2` FOREIGN KEY (`kostenstelle_key`) REFERENCES `kunde_intern_d` (`kostenstelle`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `anforderung_intern_d`
--

LOCK TABLES `anforderung_intern_d` WRITE;
/*!40000 ALTER TABLE `anforderung_intern_d` DISABLE KEYS */;
INSERT INTO `anforderung_intern_d` VALUES (1,'2000-08-01',1),(2,'2000-08-01',1),(3,'2000-08-01',1),(4,'2000-08-01',1),(5,'2000-08-01',4),(6,'2000-08-01',4),(7,'2000-08-01',4),(8,'2000-08-01',4);
/*!40000 ALTER TABLE `anforderung_intern_d` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `anforderung_intern_neu`
--

DROP TABLE IF EXISTS `anforderung_intern_neu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `anforderung_intern_neu` (
  `anforderungnr` int NOT NULL,
  `datum` date NOT NULL,
  `sammelanforderung` int DEFAULT NULL,
  PRIMARY KEY (`anforderungnr`),
  KEY `sammelanforderung` (`sammelanforderung`),
  CONSTRAINT `sammelanforderung` FOREIGN KEY (`sammelanforderung`) REFERENCES `anforderung_intern_neu` (`anforderungnr`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `anforderung_intern_neu`
--

LOCK TABLES `anforderung_intern_neu` WRITE;
/*!40000 ALTER TABLE `anforderung_intern_neu` DISABLE KEYS */;
INSERT INTO `anforderung_intern_neu` VALUES (1,'2014-10-05',NULL),(2,'2014-10-05',1),(3,'2014-10-05',1),(4,'2014-10-05',1),(5,'2014-10-05',1),(6,'2014-05-01',NULL),(7,'2014-05-01',6),(8,'2014-05-01',6),(9,'2014-05-01',6),(10,'2014-05-01',6),(11,'2014-05-01',6),(12,'2014-07-20',NULL),(13,'2014-07-20',12),(14,'2014-07-20',12),(15,'2014-07-20',12),(16,'2014-04-18',NULL),(17,'2014-04-18',16),(18,'2014-04-18',16),(19,'2014-04-18',16);
/*!40000 ALTER TABLE `anforderung_intern_neu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `anforderung_material`
--

DROP TABLE IF EXISTS `anforderung_material`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `anforderung_material` (
  `anforderungnr_key` int DEFAULT NULL,
  `materialnr_key` int DEFAULT NULL,
  KEY `anforderungnr_FK` (`anforderungnr_key`),
  KEY `materialnr_FK` (`materialnr_key`),
  CONSTRAINT `anforderungnr_FK` FOREIGN KEY (`anforderungnr_key`) REFERENCES `anforderung_intern` (`anforderungnr`),
  CONSTRAINT `materialnr_FK` FOREIGN KEY (`materialnr_key`) REFERENCES `material_intern` (`materialnr`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `anforderung_material`
--

LOCK TABLES `anforderung_material` WRITE;
/*!40000 ALTER TABLE `anforderung_material` DISABLE KEYS */;
INSERT INTO `anforderung_material` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,1),(1,2),(2,3),(3,4),(4,5),(5,6),(6,7),(7,1),(8,2);
/*!40000 ALTER TABLE `anforderung_material` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `anrede`
--

DROP TABLE IF EXISTS `anrede`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `anrede` (
  `geschlecht` char(1) COLLATE latin1_german1_ci NOT NULL,
  `anrede` varchar(4) COLLATE latin1_german1_ci DEFAULT NULL,
  PRIMARY KEY (`geschlecht`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `anrede`
--

LOCK TABLES `anrede` WRITE;
/*!40000 ALTER TABLE `anrede` DISABLE KEYS */;
INSERT INTO `anrede` VALUES ('m','Herr'),('w','Frau');
/*!40000 ALTER TABLE `anrede` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `anschrift`
--

DROP TABLE IF EXISTS `anschrift`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `anschrift` (
  `anschriftid` int NOT NULL,
  `strasse` varchar(120) COLLATE latin1_german1_ci DEFAULT NULL,
  `hausnummer` varchar(5) COLLATE latin1_german1_ci DEFAULT NULL,
  `ort` varchar(120) COLLATE latin1_german1_ci DEFAULT NULL,
  `plz` int DEFAULT NULL,
  `fk_kundeid` int DEFAULT NULL,
  PRIMARY KEY (`anschriftid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `anschrift`
--

LOCK TABLES `anschrift` WRITE;
/*!40000 ALTER TABLE `anschrift` DISABLE KEYS */;
INSERT INTO `anschrift` VALUES (1,'Mondstraße','8','Köln',50000,1),(2,'Saturnstraße','10','Koblenz',50100,1),(3,'Venusstraße','5','Bonn',50200,1),(4,'Marsstraße','7','Düsseldorf',50150,2),(5,'Saturnstraße','3','Aachen',50158,2),(6,'Uranusstraße','6','Hamburg',12000,2),(7,'Plutostraße','1','Bremen',50222,3),(8,'Merkurstraße','8','Bonn',50150,3),(9,'Jupiterstraße','6','Düsseldorf',50266,3);
/*!40000 ALTER TABLE `anschrift` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `arbeitszeit`
--

DROP TABLE IF EXISTS `arbeitszeit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `arbeitszeit` (
  `arbeitszeitid` int NOT NULL AUTO_INCREMENT,
  `arbeitstag` date DEFAULT NULL,
  `jahr` int DEFAULT NULL,
  `monat` int DEFAULT NULL,
  `tag` int DEFAULT NULL,
  `kommen` time DEFAULT NULL,
  `gehen` time DEFAULT NULL,
  `anzahlstunden` int DEFAULT NULL,
  `mitarbeiterid` int DEFAULT NULL,
  PRIMARY KEY (`arbeitszeitid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `arbeitszeit`
--

LOCK TABLES `arbeitszeit` WRITE;
/*!40000 ALTER TABLE `arbeitszeit` DISABLE KEYS */;
/*!40000 ALTER TABLE `arbeitszeit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `arbeitszeit_auszug`
--

DROP TABLE IF EXISTS `arbeitszeit_auszug`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `arbeitszeit_auszug` (
  `arbeitszeitid` int NOT NULL AUTO_INCREMENT,
  `arbeitstag` date DEFAULT NULL,
  `jahr` int DEFAULT NULL,
  `monat` int DEFAULT NULL,
  `tag` int DEFAULT NULL,
  `kommen` time DEFAULT NULL,
  `gehen` time DEFAULT NULL,
  `anzahlstunden` int DEFAULT NULL,
  `mitarbeiterid` int DEFAULT NULL,
  PRIMARY KEY (`arbeitszeitid`)
) ENGINE=InnoDB AUTO_INCREMENT=289 DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `arbeitszeit_auszug`
--

LOCK TABLES `arbeitszeit_auszug` WRITE;
/*!40000 ALTER TABLE `arbeitszeit_auszug` DISABLE KEYS */;
INSERT INTO `arbeitszeit_auszug` VALUES (1,'2012-07-02',2012,7,2,'08:00:00','16:00:00',8,6),(2,'2012-07-02',2012,7,2,'08:00:00','16:00:00',8,8),(3,'2012-07-03',2012,7,3,'08:00:00','16:00:00',8,6),(4,'2012-07-03',2012,7,3,'08:00:00','16:00:00',8,8),(5,'2012-07-04',2012,7,4,'08:00:00','16:00:00',8,6),(6,'2012-07-04',2012,7,4,'08:00:00','16:00:00',8,8),(7,'2012-07-05',2012,7,5,'08:00:00','16:00:00',8,6),(8,'2012-07-05',2012,7,5,'08:00:00','16:00:00',8,8),(9,'2012-07-06',2012,7,6,'08:00:00','16:00:00',8,6),(10,'2012-07-06',2012,7,6,'08:00:00','16:00:00',8,8),(11,'2012-07-09',2012,7,9,'08:00:00','16:00:00',8,6),(12,'2012-07-09',2012,7,9,'08:00:00','16:00:00',8,8),(13,'2012-07-10',2012,7,10,'08:00:00','16:00:00',8,6),(14,'2012-07-10',2012,7,10,'08:00:00','16:00:00',8,8),(15,'2012-07-11',2012,7,11,'08:00:00','16:00:00',8,6),(16,'2012-07-11',2012,7,11,'08:00:00','16:00:00',8,8),(17,'2012-07-12',2012,7,12,'08:00:00','16:00:00',8,6),(18,'2012-07-12',2012,7,12,'08:00:00','16:00:00',8,8),(19,'2012-07-13',2012,7,13,'08:00:00','16:00:00',8,6),(20,'2012-07-13',2012,7,13,'08:00:00','16:00:00',8,8),(21,'2012-07-16',2012,7,16,'08:00:00','16:00:00',8,6),(22,'2012-07-16',2012,7,16,'08:00:00','16:00:00',8,8),(23,'2012-07-17',2012,7,17,'08:00:00','16:00:00',8,6),(24,'2012-07-17',2012,7,17,'08:00:00','16:00:00',8,8),(25,'2012-07-18',2012,7,18,'08:00:00','16:00:00',8,6),(26,'2012-07-18',2012,7,18,'08:00:00','16:00:00',8,8),(27,'2012-07-19',2012,7,19,'08:00:00','16:00:00',8,6),(28,'2012-07-19',2012,7,19,'08:00:00','16:00:00',8,8),(29,'2012-07-20',2012,7,20,'08:00:00','16:00:00',8,6),(30,'2012-07-20',2012,7,20,'08:00:00','16:00:00',8,8),(31,'2012-07-23',2012,7,23,'08:00:00','16:00:00',8,6),(32,'2012-07-23',2012,7,23,'08:00:00','16:00:00',8,8),(33,'2012-07-24',2012,7,24,'08:00:00','16:00:00',8,6),(34,'2012-07-24',2012,7,24,'08:00:00','16:00:00',8,8),(35,'2012-07-25',2012,7,25,'08:00:00','16:00:00',8,6),(36,'2012-07-25',2012,7,25,'08:00:00','16:00:00',8,8),(37,'2012-07-26',2012,7,26,'08:00:00','16:00:00',8,6),(38,'2012-07-26',2012,7,26,'08:00:00','16:00:00',8,8),(39,'2012-07-27',2012,7,27,'08:00:00','16:00:00',8,6),(40,'2012-07-27',2012,7,27,'08:00:00','16:00:00',8,8),(41,'2012-07-30',2012,7,30,'08:00:00','16:00:00',8,6),(42,'2012-07-30',2012,7,30,'08:00:00','16:00:00',8,8),(43,'2012-07-31',2012,7,31,'08:00:00','16:00:00',8,6),(44,'2012-07-31',2012,7,31,'08:00:00','16:00:00',8,8),(45,'2013-03-01',2013,3,1,'08:00:00','16:00:00',8,6),(46,'2013-03-01',2013,3,1,'08:00:00','16:00:00',8,8),(47,'2013-03-04',2013,3,4,'08:00:00','16:00:00',8,6),(48,'2013-03-04',2013,3,4,'08:00:00','16:00:00',8,8),(49,'2013-03-05',2013,3,5,'08:00:00','16:00:00',8,6),(50,'2013-03-05',2013,3,5,'08:00:00','16:00:00',8,8),(51,'2013-03-06',2013,3,6,'08:00:00','16:00:00',8,6),(52,'2013-03-06',2013,3,6,'08:00:00','16:00:00',8,8),(53,'2013-03-07',2013,3,7,'08:00:00','16:00:00',8,6),(54,'2013-03-07',2013,3,7,'08:00:00','16:00:00',8,8),(55,'2013-03-08',2013,3,8,'08:00:00','16:00:00',8,6),(56,'2013-03-08',2013,3,8,'08:00:00','16:00:00',8,8),(57,'2013-03-11',2013,3,11,'08:00:00','16:00:00',8,6),(58,'2013-03-11',2013,3,11,'08:00:00','16:00:00',8,8),(59,'2013-03-12',2013,3,12,'08:00:00','16:00:00',8,6),(60,'2013-03-12',2013,3,12,'08:00:00','16:00:00',8,8),(61,'2013-03-13',2013,3,13,'08:00:00','16:00:00',8,6),(62,'2013-03-13',2013,3,13,'08:00:00','16:00:00',8,8),(63,'2013-03-14',2013,3,14,'08:00:00','16:00:00',8,6),(64,'2013-03-14',2013,3,14,'08:00:00','16:00:00',8,8),(65,'2013-03-15',2013,3,15,'08:00:00','16:00:00',8,6),(66,'2013-03-15',2013,3,15,'08:00:00','16:00:00',8,8),(67,'2013-03-18',2013,3,18,'08:00:00','16:00:00',8,6),(68,'2013-03-18',2013,3,18,'08:00:00','16:00:00',8,8),(69,'2013-03-19',2013,3,19,'08:00:00','16:00:00',8,6),(70,'2013-03-19',2013,3,19,'08:00:00','16:00:00',8,8),(71,'2013-03-20',2013,3,20,'08:00:00','16:00:00',8,6),(72,'2013-03-20',2013,3,20,'08:00:00','16:00:00',8,8),(73,'2013-03-21',2013,3,21,'08:00:00','16:00:00',8,6),(74,'2013-03-21',2013,3,21,'08:00:00','16:00:00',8,8),(75,'2013-03-22',2013,3,22,'08:00:00','16:00:00',8,6),(76,'2013-03-22',2013,3,22,'08:00:00','16:00:00',8,8),(77,'2013-03-25',2013,3,25,'08:00:00','16:00:00',8,6),(78,'2013-03-25',2013,3,25,'08:00:00','16:00:00',8,8),(79,'2013-03-26',2013,3,26,'08:00:00','16:00:00',8,6),(80,'2013-03-26',2013,3,26,'08:00:00','16:00:00',8,8),(81,'2013-03-27',2013,3,27,'08:00:00','16:00:00',8,6),(82,'2013-03-27',2013,3,27,'08:00:00','16:00:00',8,8),(83,'2013-03-28',2013,3,28,'08:00:00','16:00:00',8,6),(84,'2013-03-28',2013,3,28,'08:00:00','16:00:00',8,8),(85,'2013-03-29',2013,3,29,'08:00:00','16:00:00',8,6),(86,'2013-03-29',2013,3,29,'08:00:00','16:00:00',8,8),(87,'2013-08-01',2013,8,1,'08:00:00','16:00:00',8,6),(88,'2013-08-01',2013,8,1,'08:00:00','16:00:00',8,8),(89,'2013-08-02',2013,8,2,'08:00:00','16:00:00',8,6),(90,'2013-08-02',2013,8,2,'08:00:00','16:00:00',8,8),(91,'2013-08-05',2013,8,5,'08:00:00','16:00:00',8,6),(92,'2013-08-05',2013,8,5,'08:00:00','16:00:00',8,8),(93,'2013-08-06',2013,8,6,'08:00:00','16:00:00',8,6),(94,'2013-08-06',2013,8,6,'08:00:00','16:00:00',8,8),(95,'2013-08-07',2013,8,7,'08:00:00','16:00:00',8,6),(96,'2013-08-07',2013,8,7,'08:00:00','16:00:00',8,8),(97,'2013-08-08',2013,8,8,'08:00:00','16:00:00',8,6),(98,'2013-08-08',2013,8,8,'08:00:00','16:00:00',8,8),(99,'2013-08-09',2013,8,9,'08:00:00','16:00:00',8,6),(100,'2013-08-09',2013,8,9,'08:00:00','16:00:00',8,8),(101,'2013-08-12',2013,8,12,'08:00:00','16:00:00',8,6),(102,'2013-08-12',2013,8,12,'08:00:00','16:00:00',8,8),(103,'2013-08-13',2013,8,13,'08:00:00','16:00:00',8,6),(104,'2013-08-13',2013,8,13,'08:00:00','16:00:00',8,8),(105,'2013-08-14',2013,8,14,'08:00:00','16:00:00',8,6),(106,'2013-08-14',2013,8,14,'08:00:00','16:00:00',8,8),(107,'2013-08-15',2013,8,15,'08:00:00','16:00:00',8,6),(108,'2013-08-15',2013,8,15,'08:00:00','16:00:00',8,8),(109,'2013-08-16',2013,8,16,'08:00:00','16:00:00',8,6),(110,'2013-08-16',2013,8,16,'08:00:00','16:00:00',8,8),(111,'2013-08-19',2013,8,19,'08:00:00','16:00:00',8,6),(112,'2013-08-19',2013,8,19,'08:00:00','16:00:00',8,8),(113,'2013-08-20',2013,8,20,'08:00:00','16:00:00',8,6),(114,'2013-08-20',2013,8,20,'08:00:00','16:00:00',8,8),(115,'2013-08-21',2013,8,21,'08:00:00','16:00:00',8,6),(116,'2013-08-21',2013,8,21,'08:00:00','16:00:00',8,8),(117,'2013-08-22',2013,8,22,'08:00:00','16:00:00',8,6),(118,'2013-08-22',2013,8,22,'08:00:00','16:00:00',8,8),(119,'2013-08-23',2013,8,23,'08:00:00','16:00:00',8,6),(120,'2013-08-23',2013,8,23,'08:00:00','16:00:00',8,8),(121,'2013-08-26',2013,8,26,'08:00:00','16:00:00',8,6),(122,'2013-08-26',2013,8,26,'08:00:00','16:00:00',8,8),(123,'2013-08-27',2013,8,27,'08:00:00','16:00:00',8,6),(124,'2013-08-27',2013,8,27,'08:00:00','16:00:00',8,8),(125,'2013-08-28',2013,8,28,'08:00:00','16:00:00',8,6),(126,'2013-08-28',2013,8,28,'08:00:00','16:00:00',8,8),(127,'2013-08-29',2013,8,29,'08:00:00','16:00:00',8,6),(128,'2013-08-29',2013,8,29,'08:00:00','16:00:00',8,8),(129,'2013-08-30',2013,8,30,'08:00:00','16:00:00',8,6),(130,'2013-08-30',2013,8,30,'08:00:00','16:00:00',8,8),(131,'2012-08-01',2012,8,1,'08:00:00','16:00:00',8,1),(132,'2012-08-01',2012,8,1,'08:00:00','16:00:00',8,3),(133,'2012-08-02',2012,8,2,'08:00:00','16:00:00',8,1),(134,'2012-08-02',2012,8,2,'08:00:00','16:00:00',8,3),(135,'2012-08-03',2012,8,3,'08:00:00','16:00:00',8,1),(136,'2012-08-03',2012,8,3,'08:00:00','16:00:00',8,3),(137,'2012-08-06',2012,8,6,'08:00:00','16:00:00',8,1),(138,'2012-08-06',2012,8,6,'08:00:00','16:00:00',8,3),(139,'2012-08-07',2012,8,7,'08:00:00','16:00:00',8,1),(140,'2012-08-07',2012,8,7,'08:00:00','16:00:00',8,3),(141,'2012-08-08',2012,8,8,'08:00:00','16:00:00',8,1),(142,'2012-08-08',2012,8,8,'08:00:00','16:00:00',8,3),(143,'2012-08-09',2012,8,9,'08:00:00','16:00:00',8,1),(144,'2012-08-09',2012,8,9,'08:00:00','16:00:00',8,3),(145,'2012-08-10',2012,8,10,'08:00:00','16:00:00',8,1),(146,'2012-08-10',2012,8,10,'08:00:00','16:00:00',8,3),(147,'2012-08-13',2012,8,13,'08:00:00','16:00:00',8,1),(148,'2012-08-13',2012,8,13,'08:00:00','16:00:00',8,3),(149,'2012-08-14',2012,8,14,'08:00:00','16:00:00',8,1),(150,'2012-08-14',2012,8,14,'08:00:00','16:00:00',8,3),(151,'2012-08-15',2012,8,15,'08:00:00','16:00:00',8,1),(152,'2012-08-15',2012,8,15,'08:00:00','16:00:00',8,3),(153,'2012-08-16',2012,8,16,'08:00:00','16:00:00',8,1),(154,'2012-08-16',2012,8,16,'08:00:00','16:00:00',8,3),(155,'2012-08-17',2012,8,17,'08:00:00','16:00:00',8,1),(156,'2012-08-17',2012,8,17,'08:00:00','16:00:00',8,3),(157,'2012-08-20',2012,8,20,'08:00:00','16:00:00',8,1),(158,'2012-08-20',2012,8,20,'08:00:00','16:00:00',8,3),(159,'2012-08-21',2012,8,21,'08:00:00','16:00:00',8,1),(160,'2012-08-21',2012,8,21,'08:00:00','16:00:00',8,3),(161,'2012-08-22',2012,8,22,'08:00:00','16:00:00',8,1),(162,'2012-08-22',2012,8,22,'08:00:00','16:00:00',8,3),(163,'2012-08-23',2012,8,23,'08:00:00','16:00:00',8,1),(164,'2012-08-23',2012,8,23,'08:00:00','16:00:00',8,3),(165,'2012-08-24',2012,8,24,'08:00:00','16:00:00',8,1),(166,'2012-08-24',2012,8,24,'08:00:00','16:00:00',8,3),(167,'2012-08-27',2012,8,27,'08:00:00','16:00:00',8,1),(168,'2012-08-27',2012,8,27,'08:00:00','16:00:00',8,3),(169,'2012-08-28',2012,8,28,'08:00:00','16:00:00',8,1),(170,'2012-08-28',2012,8,28,'08:00:00','16:00:00',8,3),(171,'2012-08-29',2012,8,29,'08:00:00','16:00:00',8,1),(172,'2012-08-29',2012,8,29,'08:00:00','16:00:00',8,3),(173,'2012-08-30',2012,8,30,'08:00:00','16:00:00',8,1),(174,'2012-08-30',2012,8,30,'08:00:00','16:00:00',8,3),(175,'2012-08-31',2012,8,31,'08:00:00','16:00:00',8,1),(176,'2012-08-31',2012,8,31,'08:00:00','16:00:00',8,3),(177,'2013-01-01',2013,1,1,'08:00:00','16:00:00',8,1),(178,'2013-01-01',2013,1,1,'08:00:00','16:00:00',8,3),(179,'2013-01-02',2013,1,2,'08:00:00','16:00:00',8,1),(180,'2013-01-02',2013,1,2,'08:00:00','16:00:00',8,3),(181,'2013-01-03',2013,1,3,'08:00:00','16:00:00',8,1),(182,'2013-01-03',2013,1,3,'08:00:00','16:00:00',8,3),(183,'2013-01-04',2013,1,4,'08:00:00','16:00:00',8,1),(184,'2013-01-04',2013,1,4,'08:00:00','16:00:00',8,3),(185,'2013-01-07',2013,1,7,'08:00:00','16:00:00',8,1),(186,'2013-01-07',2013,1,7,'08:00:00','16:00:00',8,3),(187,'2013-01-08',2013,1,8,'08:00:00','16:00:00',8,1),(188,'2013-01-08',2013,1,8,'08:00:00','16:00:00',8,3),(189,'2013-01-09',2013,1,9,'08:00:00','16:00:00',8,1),(190,'2013-01-09',2013,1,9,'08:00:00','16:00:00',8,3),(191,'2013-01-10',2013,1,10,'08:00:00','16:00:00',8,1),(192,'2013-01-10',2013,1,10,'08:00:00','16:00:00',8,3),(193,'2013-01-11',2013,1,11,'08:00:00','16:00:00',8,1),(194,'2013-01-11',2013,1,11,'08:00:00','16:00:00',8,3),(195,'2013-01-14',2013,1,14,'08:00:00','16:00:00',8,1),(196,'2013-01-14',2013,1,14,'08:00:00','16:00:00',8,3),(197,'2013-01-15',2013,1,15,'08:00:00','16:00:00',8,1),(198,'2013-01-15',2013,1,15,'08:00:00','16:00:00',8,3),(199,'2013-01-16',2013,1,16,'08:00:00','16:00:00',8,1),(200,'2013-01-16',2013,1,16,'08:00:00','16:00:00',8,3),(201,'2013-01-17',2013,1,17,'08:00:00','16:00:00',8,1),(202,'2013-01-17',2013,1,17,'08:00:00','16:00:00',8,3),(203,'2013-01-18',2013,1,18,'08:00:00','16:00:00',8,1),(204,'2013-01-18',2013,1,18,'08:00:00','16:00:00',8,3),(205,'2013-01-21',2013,1,21,'08:00:00','16:00:00',8,1),(206,'2013-01-21',2013,1,21,'08:00:00','16:00:00',8,3),(207,'2013-01-22',2013,1,22,'08:00:00','16:00:00',8,1),(208,'2013-01-22',2013,1,22,'08:00:00','16:00:00',8,3),(209,'2013-01-23',2013,1,23,'08:00:00','16:00:00',8,1),(210,'2013-01-23',2013,1,23,'08:00:00','16:00:00',8,3),(211,'2013-01-24',2013,1,24,'08:00:00','16:00:00',8,1),(212,'2013-01-24',2013,1,24,'08:00:00','16:00:00',8,3),(213,'2013-01-25',2013,1,25,'08:00:00','16:00:00',8,1),(214,'2013-01-25',2013,1,25,'08:00:00','16:00:00',8,3),(215,'2013-01-28',2013,1,28,'08:00:00','16:00:00',8,1),(216,'2013-01-28',2013,1,28,'08:00:00','16:00:00',8,3),(217,'2013-01-29',2013,1,29,'08:00:00','16:00:00',8,1),(218,'2013-01-29',2013,1,29,'08:00:00','16:00:00',8,3),(219,'2013-01-30',2013,1,30,'08:00:00','16:00:00',8,1),(220,'2013-01-30',2013,1,30,'08:00:00','16:00:00',8,3),(221,'2013-01-31',2013,1,31,'08:00:00','16:00:00',8,1),(222,'2013-01-31',2013,1,31,'08:00:00','16:00:00',8,3),(223,'2012-12-03',2012,12,3,'08:00:00','16:00:00',0,19),(224,'2012-12-04',2012,12,4,'08:00:00','16:00:00',0,19),(225,'2012-12-05',2012,12,5,'08:00:00','16:00:00',0,19),(226,'2012-12-06',2012,12,6,'08:00:00','16:00:00',0,19),(227,'2012-12-07',2012,12,7,'08:00:00','16:00:00',0,19),(228,'2012-12-10',2012,12,10,'08:00:00','16:00:00',0,19),(229,'2012-12-11',2012,12,11,'08:00:00','16:00:00',0,19),(230,'2012-12-12',2012,12,12,'08:00:00','16:00:00',0,19),(231,'2012-12-13',2012,12,13,'08:00:00','16:00:00',0,19),(232,'2012-12-14',2012,12,14,'08:00:00','16:00:00',0,19),(233,'2012-12-17',2012,12,17,'08:00:00','16:00:00',0,19),(234,'2012-12-18',2012,12,18,'08:00:00','16:00:00',0,19),(235,'2012-12-19',2012,12,19,'08:00:00','16:00:00',0,19),(236,'2012-12-20',2012,12,20,'08:00:00','16:00:00',0,19),(237,'2012-12-21',2012,12,21,'08:00:00','16:00:00',0,19),(238,'2012-12-24',2012,12,24,'08:00:00','16:00:00',0,19),(239,'2012-12-25',2012,12,25,'08:00:00','16:00:00',0,19),(240,'2012-12-26',2012,12,26,'08:00:00','16:00:00',0,19),(241,'2012-12-27',2012,12,27,'08:00:00','16:00:00',0,19),(242,'2012-12-28',2012,12,28,'08:00:00','16:00:00',0,19),(243,'2012-12-31',2012,12,31,'08:00:00','16:00:00',0,19),(244,'2013-01-01',2013,1,1,'08:00:00','16:00:00',0,19),(245,'2013-01-02',2013,1,2,'08:00:00','16:00:00',0,19),(246,'2013-01-03',2013,1,3,'08:00:00','16:00:00',0,19),(247,'2013-01-04',2013,1,4,'08:00:00','16:00:00',0,19),(248,'2013-01-07',2013,1,7,'08:00:00','16:00:00',0,19),(249,'2013-01-08',2013,1,8,'08:00:00','16:00:00',0,19),(250,'2013-01-09',2013,1,9,'08:00:00','16:00:00',0,19),(251,'2013-01-10',2013,1,10,'08:00:00','16:00:00',0,19),(252,'2013-01-11',2013,1,11,'08:00:00','16:00:00',0,19),(253,'2013-01-14',2013,1,14,'08:00:00','16:00:00',0,19),(254,'2013-01-15',2013,1,15,'08:00:00','16:00:00',0,19),(255,'2013-01-16',2013,1,16,'08:00:00','16:00:00',0,19),(256,'2013-01-17',2013,1,17,'08:00:00','16:00:00',0,19),(257,'2013-01-18',2013,1,18,'08:00:00','16:00:00',0,19),(258,'2013-01-21',2013,1,21,'08:00:00','16:00:00',0,19),(259,'2013-01-22',2013,1,22,'08:00:00','16:00:00',0,19),(260,'2013-01-23',2013,1,23,'08:00:00','16:00:00',0,19),(261,'2013-01-24',2013,1,24,'08:00:00','16:00:00',0,19),(262,'2013-01-25',2013,1,25,'08:00:00','16:00:00',0,19),(263,'2013-01-28',2013,1,28,'08:00:00','16:00:00',0,19),(264,'2013-01-29',2013,1,29,'08:00:00','16:00:00',0,19),(265,'2013-01-30',2013,1,30,'08:00:00','16:00:00',0,19),(266,'2013-01-31',2013,1,31,'08:00:00','16:00:00',0,19),(267,'2013-12-02',2013,12,2,'08:00:00','16:00:00',0,19),(268,'2013-12-03',2013,12,3,'08:00:00','16:00:00',0,19),(269,'2013-12-04',2013,12,4,'08:00:00','16:00:00',0,19),(270,'2013-12-05',2013,12,5,'08:00:00','16:00:00',0,19),(271,'2013-12-06',2013,12,6,'08:00:00','16:00:00',0,19),(272,'2013-12-09',2013,12,9,'08:00:00','16:00:00',0,19),(273,'2013-12-10',2013,12,10,'08:00:00','16:00:00',0,19),(274,'2013-12-11',2013,12,11,'08:00:00','16:00:00',0,19),(275,'2013-12-12',2013,12,12,'08:00:00','16:00:00',0,19),(276,'2013-12-13',2013,12,13,'08:00:00','16:00:00',0,19),(277,'2013-12-16',2013,12,16,'08:00:00','16:00:00',0,19),(278,'2013-12-17',2013,12,17,'08:00:00','16:00:00',0,19),(279,'2013-12-18',2013,12,18,'08:00:00','16:00:00',0,19),(280,'2013-12-19',2013,12,19,'08:00:00','16:00:00',0,19),(281,'2013-12-20',2013,12,20,'08:00:00','16:00:00',0,19),(282,'2013-12-23',2013,12,23,'08:00:00','16:00:00',0,19),(283,'2013-12-24',2013,12,24,'08:00:00','16:00:00',0,19),(284,'2013-12-25',2013,12,25,'08:00:00','16:00:00',0,19),(285,'2013-12-26',2013,12,26,'08:00:00','16:00:00',0,19),(286,'2013-12-27',2013,12,27,'08:00:00','16:00:00',0,19),(287,'2013-12-30',2013,12,30,'08:00:00','16:00:00',0,19),(288,'2013-12-31',2013,12,31,'08:00:00','16:00:00',0,19);
/*!40000 ALTER TABLE `arbeitszeit_auszug` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artikel2`
--

DROP TABLE IF EXISTS `artikel2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artikel2` (
  `artikelid` int NOT NULL,
  `artikelbezeichnung` varchar(300) COLLATE latin1_german1_ci DEFAULT NULL,
  `geschmack` varchar(1000) COLLATE latin1_german1_ci DEFAULT NULL,
  PRIMARY KEY (`artikelid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artikel2`
--

LOCK TABLES `artikel2` WRITE;
/*!40000 ALTER TABLE `artikel2` DISABLE KEYS */;
INSERT INTO `artikel2` VALUES (1,'        Frucht Color Tux Pinguine ','Extrem fruchtig                                '),(2,'           Süsse Fruchtgummi Pinguine               ','       Sehr süssee Pinguine'),(3,'Lakritz Pinguine','Schmeckt sehr intensiv nach Lakritz'),(4,'Pinguinschnecken                   ','               Fruchtig und süß mit Rollerlebnis'),(5,'         Saure Pinguin Tux Stäbchen      ','Sauer und bissfest			');
/*!40000 ALTER TABLE `artikel2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artikel3`
--

DROP TABLE IF EXISTS `artikel3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artikel3` (
  `artikelid` int NOT NULL,
  `artikelbezeichnung` varchar(300) COLLATE latin1_german1_ci DEFAULT NULL,
  `geschmack` varchar(1000) COLLATE latin1_german1_ci DEFAULT NULL,
  PRIMARY KEY (`artikelid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artikel3`
--

LOCK TABLES `artikel3` WRITE;
/*!40000 ALTER TABLE `artikel3` DISABLE KEYS */;
INSERT INTO `artikel3` VALUES (1,'Frucht Color Tux Pinguine','Extrem fruchtig'),(2,'Süsse Fruchtgummi Pinguine','Sehr süße Pinguine'),(3,'Lakritz Pinguine','Schmeckt sehr intensiv nach Lakritz'),(4,'Pinguinschnecken','Fruchtig und süß mit Rollerlebnis'),(5,'Saure Pinguin Tux Stäbchen','Sauer und bissfest');
/*!40000 ALTER TABLE `artikel3` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artikelaktuell`
--

DROP TABLE IF EXISTS `artikelaktuell`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artikelaktuell` (
  `artikelid` int NOT NULL,
  `bezeichnung` varchar(150) COLLATE latin1_german1_ci DEFAULT NULL,
  `hoehe` decimal(8,2) NOT NULL,
  `breite` decimal(8,2) NOT NULL,
  `tiefe` decimal(8,2) DEFAULT NULL,
  `gewicht` decimal(8,2) NOT NULL,
  `preis` decimal(8,2) NOT NULL,
  `status` varchar(300) COLLATE latin1_german1_ci DEFAULT NULL,
  PRIMARY KEY (`artikelid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artikelaktuell`
--

LOCK TABLES `artikelaktuell` WRITE;
/*!40000 ALTER TABLE `artikelaktuell` DISABLE KEYS */;
INSERT INTO `artikelaktuell` VALUES (1,'Schraube 5',4.00,4.00,10.00,8.00,0.10,''),(2,'Schraube 3',2.00,2.00,3.00,2.00,0.05,''),(3,'Schraube 4',7.00,7.00,4.00,10.00,1.00,'');
/*!40000 ALTER TABLE `artikelaktuell` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artikelarchiv`
--

DROP TABLE IF EXISTS `artikelarchiv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artikelarchiv` (
  `artikelid` int NOT NULL,
  `artikelbezeichnung` varchar(300) COLLATE latin1_german1_ci DEFAULT NULL,
  `geschmack` varchar(1000) COLLATE latin1_german1_ci DEFAULT NULL,
  PRIMARY KEY (`artikelid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artikelarchiv`
--

LOCK TABLES `artikelarchiv` WRITE;
/*!40000 ALTER TABLE `artikelarchiv` DISABLE KEYS */;
INSERT INTO `artikelarchiv` VALUES (1,'Frucht Color Tux Pinguine','Extrem fruchtig'),(2,'Süsse Fruchtgummi Pinguine','Sehr süße Pinguine'),(3,'Lakritz Pinguine','Schmeckt sehr intensiv nach Lakritz'),(4,'Pinguinschnecken','Fruchtig und süß mit Rollerlebnis'),(5,'Saure Pinguin Tux Stäbchen','Sauer und bissfest'),(6,'Eisbären Fruchtgummi','Sehr erfrischend fruchtig'),(7,'Robben Ingwer Lakritz ','Laktitzgeschmack mit einem Hauch Ingwer'),(8,'Wahlrossschnecken','Süß und sauer'),(9,'Rentierdrops','Kernig sauer'),(10,'Polarhasen Flummi','Extrem salzig');
/*!40000 ALTER TABLE `artikelarchiv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artikelinfo`
--

DROP TABLE IF EXISTS `artikelinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artikelinfo` (
  `artikelid` int NOT NULL,
  `bezeichnung` varchar(300) COLLATE latin1_german1_ci NOT NULL,
  `hoehe` decimal(8,2) NOT NULL,
  `breite` decimal(8,2) NOT NULL,
  `tiefe` int DEFAULT NULL,
  `gewicht` decimal(8,2) NOT NULL,
  `preis` decimal(10,2) DEFAULT '0.00',
  PRIMARY KEY (`artikelid`),
  UNIQUE KEY `bezeichnung` (`bezeichnung`),
  CONSTRAINT `check_preis` CHECK ((`preis` < 1000))
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artikelinfo`
--

LOCK TABLES `artikelinfo` WRITE;
/*!40000 ALTER TABLE `artikelinfo` DISABLE KEYS */;
INSERT INTO `artikelinfo` VALUES (1,'Schraube 5',4.00,4.00,10,8.00,0.10),(2,'Schraube 3',2.00,2.00,3,2.00,0.05),(3,'Schraube 4',7.00,7.00,4,10.00,1.00);
/*!40000 ALTER TABLE `artikelinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ausbilder_alt`
--

DROP TABLE IF EXISTS `ausbilder_alt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ausbilder_alt` (
  `id` int NOT NULL,
  `name` varchar(30) COLLATE latin1_german1_ci DEFAULT NULL,
  `vorname` varchar(30) COLLATE latin1_german1_ci DEFAULT NULL,
  `gebdatum` date DEFAULT NULL,
  `idauszubildender` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idauszubildender_FK` (`idauszubildender`),
  CONSTRAINT `idauszubildender_FK` FOREIGN KEY (`idauszubildender`) REFERENCES `auszubildender_alt` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ausbilder_alt`
--

LOCK TABLES `ausbilder_alt` WRITE;
/*!40000 ALTER TABLE `ausbilder_alt` DISABLE KEYS */;
INSERT INTO `ausbilder_alt` VALUES (1,'Meier','Heinz','1968-05-02',3),(2,'Meier','Heinz','1968-05-02',2),(3,'Meier','Heinz','1968-05-02',4),(4,'Hirsch','Thomas','1969-01-11',1),(5,'Hirsch','Thomas','1969-01-11',5);
/*!40000 ALTER TABLE `ausbilder_alt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auszubildender_alt`
--

DROP TABLE IF EXISTS `auszubildender_alt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auszubildender_alt` (
  `id` int NOT NULL,
  `name` varchar(120) COLLATE latin1_german1_ci DEFAULT NULL,
  `vorname` varchar(120) COLLATE latin1_german1_ci DEFAULT NULL,
  `gebdatum` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auszubildender_alt`
--

LOCK TABLES `auszubildender_alt` WRITE;
/*!40000 ALTER TABLE `auszubildender_alt` DISABLE KEYS */;
INSERT INTO `auszubildender_alt` VALUES (1,'Meier','Jörg','1970-05-03'),(2,'Birkenbaum','Ralf','1985-07-20'),(3,'Stern','Vladimir','1997-05-01'),(4,'Sonnenschein','Max','1999-07-08'),(5,'Mondschein','Karim','1969-08-01');
/*!40000 ALTER TABLE `auszubildender_alt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auszubildender_c`
--

DROP TABLE IF EXISTS `auszubildender_c`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auszubildender_c` (
  `id` int NOT NULL,
  `name` varchar(120) COLLATE latin1_german1_ci DEFAULT NULL,
  `vorname` varchar(120) COLLATE latin1_german1_ci DEFAULT NULL,
  `gebdatum` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auszubildender_c`
--

LOCK TABLES `auszubildender_c` WRITE;
/*!40000 ALTER TABLE `auszubildender_c` DISABLE KEYS */;
INSERT INTO `auszubildender_c` VALUES (1,'Meier','Jörg','1970-05-03'),(2,'Birkenbaum','Ralf','1985-07-20'),(3,'Stern','Vladimir','1997-05-01'),(4,'Sonnenschein','Max','1999-07-08'),(5,'Mondschein','Karim','1969-08-01');
/*!40000 ALTER TABLE `auszubildender_c` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auszubildender_d`
--

DROP TABLE IF EXISTS `auszubildender_d`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auszubildender_d` (
  `id` int NOT NULL,
  `name` varchar(120) COLLATE latin1_german1_ci DEFAULT NULL,
  `vorname` varchar(120) COLLATE latin1_german1_ci DEFAULT NULL,
  `gebdatum` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auszubildender_d`
--

LOCK TABLES `auszubildender_d` WRITE;
/*!40000 ALTER TABLE `auszubildender_d` DISABLE KEYS */;
INSERT INTO `auszubildender_d` VALUES (1,'Meier','Jörg','1970-05-03'),(2,'Birkenbaum','Ralf','1985-07-20'),(3,'Stern','Vladimir','1997-05-01'),(4,'Sonnenschein','Max','1999-07-08'),(5,'Mondschein','Karim','1969-08-01');
/*!40000 ALTER TABLE `auszubildender_d` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bonus`
--

DROP TABLE IF EXISTS `bonus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bonus` (
  `bonusid` int NOT NULL,
  `bonuszahlung` decimal(10,2) DEFAULT NULL,
  `mitarbeiterid` int DEFAULT NULL,
  `auszahlungsdatum` date DEFAULT NULL,
  PRIMARY KEY (`bonusid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bonus`
--

LOCK TABLES `bonus` WRITE;
/*!40000 ALTER TABLE `bonus` DISABLE KEYS */;
INSERT INTO `bonus` VALUES (1,5000.00,1,'2012-08-01'),(2,7000.00,8,'2012-01-01'),(3,4000.00,12,'2012-02-01'),(4,12000.00,26,'2012-03-01'),(5,8000.00,30,'2012-04-01'),(6,15000.00,38,'2012-09-01'),(7,9000.00,40,'2012-12-01'),(8,3000.00,45,'2012-08-01'),(9,6000.00,44,'2012-01-01'),(10,1800.00,1,'2012-02-01'),(11,3800.00,8,'2012-03-01'),(12,4500.00,12,'2012-03-01'),(13,8900.00,26,'2012-09-01'),(14,2500.00,30,'2012-12-01'),(15,6800.00,38,'2012-08-01'),(16,7200.00,40,'2012-01-01'),(17,6800.00,44,'2012-02-01'),(18,4300.00,45,'2012-03-01'),(19,1000.00,1,'2012-04-01'),(21,1800.00,8,'2012-09-01'),(22,6700.00,12,'2012-12-01'),(23,18000.00,26,'2012-08-01'),(24,4200.00,30,'2012-01-01'),(25,4100.00,38,'2012-02-01'),(26,5700.00,40,'2012-04-01'),(27,4300.00,44,'2012-04-01'),(28,6980.00,45,'2012-09-01'),(29,8000.00,1,'2012-12-01'),(30,3000.00,8,'2012-08-01'),(31,4440.00,12,'2012-01-01'),(32,5800.00,26,'2012-02-01'),(33,1200.00,30,'2012-03-01'),(34,8980.00,38,'2012-04-01'),(35,9800.00,40,'2012-09-01'),(36,4670.00,44,'2012-12-01'),(37,7800.00,45,'2012-08-01'),(38,2000.00,1,'2012-01-01'),(39,1600.00,8,'2012-02-01'),(40,2500.00,12,'2012-03-01'),(41,3200.00,26,'2012-04-01'),(42,1600.00,30,'2012-09-01'),(43,15000.00,38,'2012-12-01'),(44,15000.00,40,'2012-08-01'),(45,7100.00,44,'2012-01-01'),(46,8500.00,45,'2012-02-01'),(47,9000.00,1,'2012-03-01'),(48,1200.00,8,'2012-04-01'),(49,2500.00,12,'2012-09-01'),(50,5500.00,26,'2012-12-01'),(51,6800.00,30,'2012-08-01'),(52,7100.00,38,'2012-01-01'),(53,3300.00,40,'2012-02-01'),(54,2300.00,44,'2012-03-01'),(55,6800.00,45,'2012-04-01'),(56,11700.00,1,'2012-09-01'),(57,14800.00,8,'2012-12-01'),(58,17800.00,12,'2012-08-01'),(59,20000.00,26,'2012-01-01'),(60,3400.00,30,'2012-02-01'),(61,30000000.00,23,'2013-08-01'),(62,45000000.00,10,'2013-02-01'),(63,10000.00,NULL,'2012-05-12'),(64,5000.00,NULL,'2014-06-20'),(65,20000.00,NULL,'2015-04-18'),(66,25000.00,NULL,'2012-11-06'),(67,18000.00,NULL,'2013-01-23'),(68,NULL,10,'2014-10-11'),(69,NULL,10,'2011-03-11'),(70,NULL,10,'2012-02-20'),(71,2000000.00,10,'2013-04-10');
/*!40000 ALTER TABLE `bonus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dsgvo`
--

DROP TABLE IF EXISTS `dsgvo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dsgvo` (
  `dsgvoid` int NOT NULL,
  `firma` varchar(120) COLLATE latin1_german1_ci DEFAULT NULL,
  `status` varchar(20) COLLATE latin1_german1_ci DEFAULT NULL,
  PRIMARY KEY (`dsgvoid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dsgvo`
--

LOCK TABLES `dsgvo` WRITE;
/*!40000 ALTER TABLE `dsgvo` DISABLE KEYS */;
INSERT INTO `dsgvo` VALUES (1,'Schrauben Meier GmbH',NULL),(2,'Schrauben Peter GmbH',NULL),(3,'Schrauben Klein GmbH',NULL);
/*!40000 ALTER TABLE `dsgvo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eltern_1`
--

DROP TABLE IF EXISTS `eltern_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eltern_1` (
  `id` int NOT NULL,
  `name` varchar(120) COLLATE latin1_german1_ci DEFAULT NULL,
  `vorname` varchar(120) COLLATE latin1_german1_ci DEFAULT NULL,
  `gebdatum` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eltern_1`
--

LOCK TABLES `eltern_1` WRITE;
/*!40000 ALTER TABLE `eltern_1` DISABLE KEYS */;
INSERT INTO `eltern_1` VALUES (1,'Meier','Jörg','1970-05-03'),(2,'Birkenbaum','Ralf','1985-07-20'),(3,'Stern','Vladimir','1997-05-01'),(4,'Sonnenschein','Max','1999-07-08'),(5,'Mondschein','Karim','1969-08-01');
/*!40000 ALTER TABLE `eltern_1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hardware`
--

DROP TABLE IF EXISTS `hardware`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hardware` (
  `hardwareid` int NOT NULL,
  `hardwarebezeichnung` varchar(400) COLLATE latin1_german1_ci DEFAULT NULL,
  `name` varchar(120) COLLATE latin1_german1_ci DEFAULT NULL,
  `vorname` varchar(120) COLLATE latin1_german1_ci DEFAULT NULL,
  PRIMARY KEY (`hardwareid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hardware`
--

LOCK TABLES `hardware` WRITE;
/*!40000 ALTER TABLE `hardware` DISABLE KEYS */;
INSERT INTO `hardware` VALUES (1,'Drucker','Lempe','Dirk'),(2,'PC','Lempe','Dirk'),(3,'Notebook','Lempe','Dirk'),(4,'Drucker','Müller','Ralf'),(5,'PC','Müller','Ralf');
/*!40000 ALTER TABLE `hardware` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hardwarearchiv`
--

DROP TABLE IF EXISTS `hardwarearchiv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hardwarearchiv` (
  `hardwareid` int NOT NULL,
  `hardwarebezeichnung` varchar(400) COLLATE latin1_german1_ci DEFAULT NULL,
  `name` varchar(120) COLLATE latin1_german1_ci DEFAULT NULL,
  `vorname` varchar(120) COLLATE latin1_german1_ci DEFAULT NULL,
  PRIMARY KEY (`hardwareid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hardwarearchiv`
--

LOCK TABLES `hardwarearchiv` WRITE;
/*!40000 ALTER TABLE `hardwarearchiv` DISABLE KEYS */;
INSERT INTO `hardwarearchiv` VALUES (1,'Drucker','Lempe','Dirk'),(2,'PC','Lempe','Dirk'),(3,'Notebook','Lempe','Dirk'),(4,'Drucker','Müller','Ralf'),(5,'PC','Müller','Ralf'),(6,'Notebook','Müller','Ralf');
/*!40000 ALTER TABLE `hardwarearchiv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `infokunde`
--

DROP TABLE IF EXISTS `infokunde`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `infokunde` (
  `infoid` int NOT NULL,
  `informationkunde` varchar(120) COLLATE latin1_german1_ci DEFAULT NULL,
  `firma` varchar(120) COLLATE latin1_german1_ci DEFAULT NULL,
  `informationkunde2` varchar(120) COLLATE latin1_german1_ci DEFAULT NULL,
  `bewertung` tinyint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `infokunde`
--

LOCK TABLES `infokunde` WRITE;
/*!40000 ALTER TABLE `infokunde` DISABLE KEYS */;
INSERT INTO `infokunde` VALUES (1,'Sehr guter Kunde!','Schrauben Meier GmbH','Sehr guter Kunde!',5),(2,'Guter Kunde!','Schrauben Peter GmbH','Guter Kunde!',4),(3,'Nicht so guter Kunde!','Schrauben Klein GmbH','Nicht so guter Kunde!',1);
/*!40000 ALTER TABLE `infokunde` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kind_1`
--

DROP TABLE IF EXISTS `kind_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kind_1` (
  `idadresse` int NOT NULL,
  `strasse` varchar(120) COLLATE latin1_german1_ci DEFAULT NULL,
  `hausnummer` varchar(120) COLLATE latin1_german1_ci DEFAULT NULL,
  `plz` int DEFAULT NULL,
  `ort` varchar(120) COLLATE latin1_german1_ci DEFAULT NULL,
  `auszubildenderid` int DEFAULT NULL,
  PRIMARY KEY (`idadresse`),
  KEY `auszubildenderid_FK4` (`auszubildenderid`),
  CONSTRAINT `auszubildenderid_FK4` FOREIGN KEY (`auszubildenderid`) REFERENCES `eltern_1` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kind_1`
--

LOCK TABLES `kind_1` WRITE;
/*!40000 ALTER TABLE `kind_1` DISABLE KEYS */;
INSERT INTO `kind_1` VALUES (1,'Plutostraße','8A',50000,'Bonn',1),(2,'Marsstraße','757C',50000,'Köln',2),(3,'Mondstraße','3',50000,'Bonn',NULL),(4,'Mondstraße','3',50000,'Bonn',3),(5,'Sonnestraße','8',50000,'Bonn',5),(6,'Sternstraße','54',51000,'Köln',4),(7,'Komentenweg','33',50000,'Bonn',5);
/*!40000 ALTER TABLE `kind_1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kontakt`
--

DROP TABLE IF EXISTS `kontakt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kontakt` (
  `kontaktid` int NOT NULL,
  `festnetz` varchar(30) COLLATE latin1_german1_ci DEFAULT NULL,
  `mobilnetz` varchar(30) COLLATE latin1_german1_ci DEFAULT NULL,
  `email` varchar(300) COLLATE latin1_german1_ci DEFAULT NULL,
  `fax` varchar(30) COLLATE latin1_german1_ci DEFAULT NULL,
  `mitarbeiterid` int DEFAULT NULL,
  PRIMARY KEY (`kontaktid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kontakt`
--

LOCK TABLES `kontakt` WRITE;
/*!40000 ALTER TABLE `kontakt` DISABLE KEYS */;
INSERT INTO `kontakt` VALUES (1,'0123/8888888888888','01234/0000000000','ralfmueller@rumpsteakserver.appetit',NULL,NULL),(2,'0123/1111111111','4566/0000000000000000','petraschneider@kalbshaxenserver.appetit',NULL,2),(3,'0123/77777777777777','01234/4444444444444','thomasklein@forellenserver.appetit',NULL,NULL),(4,'8977/9999999999999','2345/55555555555555','utelang@bohnenserver.appetit',NULL,4),(5,'0123/222222222222222','7890/111111111111111','frankeisenhof@lammrueckenserver.appetit',NULL,NULL),(6,'2345/33333333333333','3456/666666666666','anjalupin@heilbuttserver.appetit',NULL,6),(7,'3456/22222222222222','4567/7777777777777','dirklempe@spargelserver.appetit',NULL,NULL),(8,'3456/11111111111111','2345/99999999999999','irismueller@kotelettserver.appetit',NULL,8),(9,'4567/666666666666666','7891/222222222222222','heinzludiwig@karpfenserver.appetit',NULL,NULL),(10,'5678/333333333333333','6789/22222222222222','simoneklarfeld@fenchelserver.appetit',NULL,10),(11,'1234/999999999999','2345/444444444444','wernerschmidt@kalbsschulterserver.appetit',NULL,NULL),(12,'2345/11111111111111','3456/222222222222','dorisfunke@schollenserver.apettit',NULL,12),(13,'4567/99999999999','5678/333333333333','reinhardnolte@kürbissserver.appetit',NULL,NULL),(14,'6789/1111111111111','7891/555555555555','stefaniejule@lammkronenserver.appetit',NULL,14),(15,'9123/4444444444444','6789/33333333333','hanspeterson@makrelenserver.appetit',NULL,NULL),(16,'5678/77777777777','7890/55555555555','ingesebastiansen@tomatenserver.appetit',NULL,16),(17,'0123/333333333333','2345/6666666666666','peterhaier@lammsteakserver.appetit',NULL,NULL),(18,'4567/33333333333','7890/1111111111111','ilsesteinmacher@heringserver.appetit',NULL,18),(19,'3456/888888888888','6789/333333333333','georgueberall@paprikaserver.appetit',NULL,NULL),(20,'4567/3333333333','8901/555555555555','baerbelklein@gansserver.appetit',NULL,20),(21,'012345/888888888888','45677/3333333333333','rolfstein@schellfischserver.appetit',NULL,NULL),(22,'2345/111111111111','3456/000000000000','veragross@auberginenserver.appetit',NULL,22),(23,'2345/000000000000','00000/999999999999','andreasfunke@entenserver.appetit',NULL,NULL),(24,'11111/555555555555','2222222/77777777777','sabineengels@zanderserver.appetit',NULL,24),(25,'1234/33333333333','2345/888888888888','sebastianpaulus@zucchiniserver.appetit',NULL,NULL),(26,'6789/11111111111','7890/77777777777','elkewinscheidt@rehrückenserver.appetit',NULL,26),(27,'9012/11111111111111','012345/8888888888','siegmarblume@sardellenserver.appetit',NULL,NULL),(28,'2345/1111111111111','3456/6666666666','tanjamay@kaninchenkeulenserver.appetit',NULL,28),(29,'3456/44444444444444','4567/8888888888','olivergelz@welsserver@appetit',NULL,NULL),(30,'6789/22222222222','7890/3333333333333','tinalorenz@chicoreeserver.appetit',NULL,30),(31,'8901/333333333333','1234/1111111111111','timmaier@kürbisserver.appetit',NULL,NULL),(32,'2345/222222222222','123456/7777777777','elisewinter@rumpsteakserver.appetit',NULL,32),(33,'45678/66666666666','56789/2222222222222','wernersommer@heilbuttserver@appetit',NULL,NULL),(34,'123456/88888888888','23456/333333333333333','elviratrost@paprikaserver.appetit',NULL,NULL),(35,'34567/7777777777','345678/6666666666666','martinfriedrichs@cayenneserver.appetit',NULL,35),(36,'23456/666666666666','012345/55555555555','carmenludowig@serranoserver@appetit',NULL,36),(37,'67890/444444444444','890123/55555555','ingoserenius@hirschserver.appetit',NULL,NULL),(38,'90123/55555555555555','67890/333333333333','lisamay@hirschserver.appetit',NULL,38),(39,'456789/333333333333','901234/22222222222222','udosonnenfeld@zwibelserver.appetit',NULL,NULL),(40,'789012/44444444444','456789/55555555555','herbertkanis@rehserver.appetit',NULL,40),(41,'23456/22222222222222222','56789/1111111111111','corneliasantus@thunfischserver.appetit',NULL,NULL),(42,'56789/2222222222','7890123/4444444444444','michaeloberscheidt@gurkenserver.appetit',NULL,42),(43,'9012345/333333333333333','123456/6666666666666','klausdorsten@fenchelserver.appetit',NULL,NULL),(44,'111111111/777777777777','55555/44444444444','herbertbuecher@hirschserver.appetit',NULL,44),(45,'4444444444/88888888','000000/11111111','marlenesternental@delphinserver.appetit',NULL,NULL),(46,'00000000/11111111','77777/999999999','hansheinrich@forellenserver.appetit',NULL,46);
/*!40000 ALTER TABLE `kontakt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `konto`
--

DROP TABLE IF EXISTS `konto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `konto` (
  `kontoid` int NOT NULL,
  `kontonummer` varchar(120) COLLATE latin1_german1_ci DEFAULT NULL,
  `bankid` int DEFAULT NULL,
  PRIMARY KEY (`kontoid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `konto`
--

LOCK TABLES `konto` WRITE;
/*!40000 ALTER TABLE `konto` DISABLE KEYS */;
INSERT INTO `konto` VALUES (1,'a00000000000',55),(2,'b00000000000',110),(3,'c00000000000',1555),(4,'d00000000000',5468),(5,'e00000000000',10455),(6,'f00000000000',15455),(7,'g00000000000',16456),(8,'h00000000000',17546),(9,'i00000000000',18321),(10,'j00000000000',11020),(11,'k00000000000',12713),(12,'l00000000000',11111),(13,'m00000000000',11112),(14,'n00000000000',12424),(15,'o00000000000',12154),(16,'p00000000000',14732),(17,'q00000000000',15554),(18,'r00000000000',17231),(19,'s00000000000',17444),(20,'t00000000000',3332),(21,'u00000000000',987),(22,'v00000000000',1256),(23,'w00000000000',1378),(24,'x00000000000',1813),(25,'y00000000000',1645),(26,'z00000000000',14387),(27,'A00000000000',982),(28,'B00000000000',6532),(29,'C00000000000',7812),(30,'D00000000000',3210),(31,'E00000000000',16329),(32,'F00000000000',256),(33,'G00000000000',512),(34,'H00000000000',1024),(35,'I00000000000',2048),(36,'J00000000000',4096),(37,'K00000000000',7832),(38,'L00000000000',155),(39,'M00000000000',6325),(40,'N00000000000',9523),(41,'O00000000000',5428),(42,'P00000000000',4582),(43,'Q00000000000',3214),(44,'R00000000000',3218),(45,'S00000000000',1412),(46,'T00000000000',800);
/*!40000 ALTER TABLE `konto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `krankenkasse`
--

DROP TABLE IF EXISTS `krankenkasse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `krankenkasse` (
  `krankenkassenid` smallint NOT NULL,
  `krankenkasse` varchar(200) COLLATE latin1_german1_ci DEFAULT NULL,
  `beitragssatz` decimal(4,2) DEFAULT NULL,
  PRIMARY KEY (`krankenkassenid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `krankenkasse`
--

LOCK TABLES `krankenkasse` WRITE;
/*!40000 ALTER TABLE `krankenkasse` DISABLE KEYS */;
INSERT INTO `krankenkasse` VALUES (1,'AOK Baden-Württemberg',15.50),(2,'AOK Bayern',15.50),(3,'AOK Bremen/Bremerhaven',15.50),(4,'AOK Hessen',15.50),(5,'AOK Niedersachsen',15.50),(6,'AOK Nordost',15.50),(7,'AOK Nordwest',15.50),(8,'AOK PLUS',15.50),(9,'AOK Rheinland-Pfalz/Saarland',15.50),(10,'AOK Rheinland/Hamburg',15.50),(11,'AOK Sachsen-Anhalt',15.50),(12,'BARMER GEK',15.50),(13,'DAK Gesundheit',15.50),(14,'HEK - Hanseatische Krankenkasse',15.50),(15,'hkk Krankenkasse',15.50),(16,'KKH-Allianz',15.50),(17,'Knappschaft',15.50),(18,'Techniker Krankenkasse - TK',15.50),(19,'BIG direkt gesund',15.50),(20,'IKK Brandenburg und Berlin',15.50),(21,'IKK classic',15.50),(22,'IKK gesund plus',15.50),(23,'IKK Nord',15.50),(24,'IKK Südwest',15.50),(25,'Actimonda Krankenkasse',15.50),(26,'atlas BKK ahlmann',15.50),(27,'Audi BKK',15.50),(28,'BAHN-BKK',15.50),(29,'BERGISCHE Krankenkasse',15.50),(30,'Bertelsmann BKK',15.50),(31,'BKK A.T.U.',15.50),(32,'BKK Achenbach Buschhütten',15.50),(33,'BKK advita',15.50),(34,'BKK Aesculap',15.50),(35,'BKK Akzo Nobel Bayern',15.50),(36,'BKK AXEL SPRINGER - jezt: DAK Gesundheit',15.50),(37,'BKK B. Braun',15.50),(38,'BKK Basell',15.50),(39,'BKK Beiersdorf AG',15.50),(40,'BKK BJB',15.50),(41,'BKK BMW',15.50),(42,'BKK BPW Wiehl',15.50),(43,'BKK Braun-Gillette',15.50),(44,'BKK Demag Krauss-Maffei',15.50),(45,'BKK der SIEMAG',15.50),(46,'BKK der Thüringer Energieversorgung',15.50),(47,'BKK Diakonie',15.50),(48,'BKK Ernst & Young',15.50),(49,'BKK ESSANELLE',15.50),(50,'BKK EUREGIO',15.50),(51,'BKK EWE',15.50),(52,'BKK exklusiv',15.50),(53,'BKK Faber-Castell & Partner',15.50),(54,'BKK firmus',15.50),(55,'BKK Freudenberg',15.50),(56,'mhplus Krankenkasse',15.50);
/*!40000 ALTER TABLE `krankenkasse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kreditinstitut`
--

DROP TABLE IF EXISTS `kreditinstitut`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kreditinstitut` (
  `bankid` int NOT NULL,
  `bankleitzahl` int DEFAULT NULL,
  `bezeichnung` varchar(120) COLLATE latin1_german1_ci DEFAULT NULL,
  `plz` int DEFAULT NULL,
  `ort` varchar(120) COLLATE latin1_german1_ci DEFAULT NULL,
  PRIMARY KEY (`bankid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kreditinstitut`
--

LOCK TABLES `kreditinstitut` WRITE;
/*!40000 ALTER TABLE `kreditinstitut` DISABLE KEYS */;
/*!40000 ALTER TABLE `kreditinstitut` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kreditinstitut_auszug`
--

DROP TABLE IF EXISTS `kreditinstitut_auszug`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kreditinstitut_auszug` (
  `bankid` int NOT NULL,
  `bankleitzahl` int DEFAULT NULL,
  `bezeichnung` varchar(120) CHARACTER SET latin1 COLLATE latin1_german1_ci DEFAULT NULL,
  `plz` int DEFAULT NULL,
  `ort` varchar(120) CHARACTER SET latin1 COLLATE latin1_german1_ci DEFAULT NULL,
  PRIMARY KEY (`bankid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kreditinstitut_auszug`
--

LOCK TABLES `kreditinstitut_auszug` WRITE;
/*!40000 ALTER TABLE `kreditinstitut_auszug` DISABLE KEYS */;
INSERT INTO `kreditinstitut_auszug` VALUES (1,10000000,'Bundesbank',10591,'Berlin'),(2,10010010,'Postbank',10916,'Berlin'),(3,10010111,'SEB',10789,'Berlin'),(4,10010222,'The Royal Bank of Scotland, Niederlassung Deutschland',10105,'Berlin'),(11,10020890,'UniCredit Bank - HypoVereinsbank',10896,'Berlin'),(12,10020890,'UniCredit Bank - HypoVereinsbank',14532,'Kleinmachnow'),(13,10020890,'UniCredit Bank - HypoVereinsbank',16515,'Oranienburg'),(14,10020890,'UniCredit Bank - HypoVereinsbank',14776,'Brandenburg an der Havel'),(15,10020890,'UniCredit Bank - HypoVereinsbank',15711,'Königs Wusterhausen'),(16,10020890,'UniCredit Bank - HypoVereinsbank',15517,'Fürstenwalde /Spree'),(44,10070000,'Deutsche Bank Fil Berlin',10883,'Berlin'),(45,10070000,'Deutsche Bank Fil Berlin Gf P2',10883,'Berlin'),(108,10090603,'apoBank',10593,'Berlin'),(109,10090603,'apoBank',19061,'Schwerin, Meckl'),(110,10090603,'apoBank',1099,'Dresden'),(111,10090603,'apoBank',4129,'Leipzig'),(112,10090603,'apoBank',9111,'Chemnitz, Sachs'),(113,10090603,'apoBank',99084,'Erfurt'),(114,10090603,'apoBank',39104,'Magdeburg'),(115,10090603,'apoBank',14467,'Potsdam'),(116,10090603,'apoBank',18057,'Rostock'),(133,12030000,'Deutsche Kreditbank Berlin',10117,'Berlin'),(134,12030000,'Deutsche Kreditbank',9111,'Chemnitz, Sachs'),(135,12030000,'Deutsche Kreditbank',4109,'Leipzig'),(136,12030000,'Deutsche Kreditbank',1069,'Dresden'),(137,12030000,'Deutsche Kreditbank',98527,'Suhl'),(138,12030000,'Deutsche Kreditbank',7545,'Gera'),(139,12030000,'Deutsche Kreditbank',99084,'Erfurt'),(140,12030000,'Deutsche Kreditbank',6122,'Halle (Saale)'),(141,12030000,'Deutsche Kreditbank',39104,'Magdeburg'),(142,12030000,'Deutsche Kreditbank',3046,'Cottbus'),(143,12030000,'Deutsche Kreditbank',15230,'Frankfurt (Oder)'),(144,12030000,'Deutsche Kreditbank',14471,'Potsdam'),(145,12030000,'Deutsche Kreditbank',17034,'Neubrandenburg, Meckl'),(146,12030000,'Deutsche Kreditbank',19053,'Schwerin, Meckl'),(147,12030000,'Deutsche Kreditbank',18057,'Rostock'),(148,12030000,'Deutsche Kreditbank (Gf P2)',10117,'Berlin'),(5333,44040060,'Commerzbank CC',44137,'Dortmund'),(5334,44040061,'Commerzbank CC',44137,'Dortmund'),(5373,44130000,'HKB Bank',60311,'Frankfurt am Main'),(5441,45030000,'HKB Bank',60311,'Frankfurt am Main'),(5442,45030000,'Handel und Kredit Bankhaus Altena',58095,'Hagen, Westf'),(9913,60069670,'Raiffeisenbank Ehingen-Hochsträß',89143,'Blaubeuren'),(9914,60069670,'Raiffeisenbank Ehingen-Hochsträß',89134,'Blaustein, Württ'),(9915,60069670,'Raiffeisenbank Ehingen-Hochsträß',89155,'Erbach, Donau'),(9916,60069670,'Raiffeisenbank Ehingen-Hochsträß (Gf P2)',89143,'Blaubeuren'),(9997,60069971,'Raiffeisenbank Ehingen-Hochsträß',89610,'Oberdischingen'),(9998,60069971,'Raiffeisenbank Ehingen-Hochsträß',89155,'Erbach, Donau');
/*!40000 ALTER TABLE `kreditinstitut_auszug` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kreditinstitutneu`
--

DROP TABLE IF EXISTS `kreditinstitutneu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kreditinstitutneu` (
  `id` int NOT NULL AUTO_INCREMENT,
  `bankid` int DEFAULT NULL,
  `bankleitzahl` int DEFAULT NULL,
  `bezeichnung` varchar(120) COLLATE latin1_german1_ci DEFAULT NULL,
  `plz` int DEFAULT NULL,
  `ort` varchar(120) COLLATE latin1_german1_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kreditinstitutneu`
--

LOCK TABLES `kreditinstitutneu` WRITE;
/*!40000 ALTER TABLE `kreditinstitutneu` DISABLE KEYS */;
/*!40000 ALTER TABLE `kreditinstitutneu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kunde_intern`
--

DROP TABLE IF EXISTS `kunde_intern`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kunde_intern` (
  `kostenstelle` int NOT NULL,
  `abteilung` varchar(30) COLLATE latin1_german1_ci NOT NULL,
  PRIMARY KEY (`kostenstelle`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kunde_intern`
--

LOCK TABLES `kunde_intern` WRITE;
/*!40000 ALTER TABLE `kunde_intern` DISABLE KEYS */;
INSERT INTO `kunde_intern` VALUES (1,'Produktion Sechskant 15mm'),(2,'Produktion Inbusschraube 8mm'),(3,'Instandsetzung Elektrik'),(4,'Instandsetzung Pneumatik'),(5,'Einkauf'),(6,'Controlling'),(7,'Qualitätsmanagment');
/*!40000 ALTER TABLE `kunde_intern` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kunde_intern_d`
--

DROP TABLE IF EXISTS `kunde_intern_d`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kunde_intern_d` (
  `kostenstelle` int NOT NULL,
  `abteilung` varchar(30) COLLATE latin1_german1_ci NOT NULL,
  PRIMARY KEY (`kostenstelle`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kunde_intern_d`
--

LOCK TABLES `kunde_intern_d` WRITE;
/*!40000 ALTER TABLE `kunde_intern_d` DISABLE KEYS */;
INSERT INTO `kunde_intern_d` VALUES (1,'Produktion Sechskant 15mm'),(2,'Produktion Imbusschraube 8mm'),(3,'Instandsetzung Elektrik'),(4,'Instandsetzung Pneumatik'),(5,'Einkauf'),(6,'Controlling'),(7,'Qualitätsmanagment');
/*!40000 ALTER TABLE `kunde_intern_d` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `material_intern`
--

DROP TABLE IF EXISTS `material_intern`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `material_intern` (
  `materialnr` int NOT NULL,
  `materialbezeichnung` varchar(120) COLLATE latin1_german1_ci NOT NULL,
  `preis` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`materialnr`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `material_intern`
--

LOCK TABLES `material_intern` WRITE;
/*!40000 ALTER TABLE `material_intern` DISABLE KEYS */;
INSERT INTO `material_intern` VALUES (1,'Öl 20L',20.50),(2,'Schraubenzieher',5.50),(3,'Voltmessgerät',80.50),(4,'Luftdruckmessgerät',120.70),(5,'Rohling Imbusschraube 100',70.50),(6,'Rohling Sechskant 100',20.90),(7,'Seitenschneider',15.00);
/*!40000 ALTER TABLE `material_intern` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mengea`
--

DROP TABLE IF EXISTS `mengea`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mengea` (
  `elementid` tinyint NOT NULL,
  `element` tinyint DEFAULT NULL,
  PRIMARY KEY (`elementid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mengea`
--

LOCK TABLES `mengea` WRITE;
/*!40000 ALTER TABLE `mengea` DISABLE KEYS */;
INSERT INTO `mengea` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,8);
/*!40000 ALTER TABLE `mengea` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mengeb`
--

DROP TABLE IF EXISTS `mengeb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mengeb` (
  `elementid` tinyint NOT NULL,
  `element` tinyint DEFAULT NULL,
  PRIMARY KEY (`elementid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mengeb`
--

LOCK TABLES `mengeb` WRITE;
/*!40000 ALTER TABLE `mengeb` DISABLE KEYS */;
INSERT INTO `mengeb` VALUES (1,2),(2,5),(3,6),(4,7),(5,8),(6,9),(7,10);
/*!40000 ALTER TABLE `mengeb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mitarbeiter`
--

DROP TABLE IF EXISTS `mitarbeiter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mitarbeiter` (
  `mitarbeiterid` int NOT NULL,
  `name` varchar(30) COLLATE latin1_german1_ci DEFAULT NULL,
  `vorname` varchar(30) COLLATE latin1_german1_ci DEFAULT NULL,
  `gebdatum` date DEFAULT NULL,
  `eintrittsdatum` date DEFAULT NULL,
  `austrittsdatum` date DEFAULT NULL,
  `austrittsgrund` varchar(30) COLLATE latin1_german1_ci DEFAULT NULL,
  `strasse` varchar(40) COLLATE latin1_german1_ci DEFAULT NULL,
  `hausnummer` varchar(10) COLLATE latin1_german1_ci DEFAULT NULL,
  `ort` varchar(120) COLLATE latin1_german1_ci DEFAULT NULL,
  `plz` int DEFAULT NULL,
  `festnetz` varchar(30) COLLATE latin1_german1_ci DEFAULT NULL,
  `mobilnetz` varchar(30) COLLATE latin1_german1_ci DEFAULT NULL,
  `email` varchar(300) COLLATE latin1_german1_ci DEFAULT NULL,
  `umsatz` decimal(10,2) DEFAULT NULL,
  `bonus` decimal(10,2) DEFAULT NULL,
  `geschlecht` char(1) COLLATE latin1_german1_ci DEFAULT NULL,
  `abteilung` varchar(120) COLLATE latin1_german1_ci DEFAULT NULL,
  `krankenversicherung` varchar(120) COLLATE latin1_german1_ci DEFAULT NULL,
  `verheiratet` char(4) COLLATE latin1_german1_ci DEFAULT NULL,
  `anzahlkinder` smallint DEFAULT NULL,
  `stundenlohn` decimal(5,2) DEFAULT NULL,
  `ueberstunden` smallint DEFAULT NULL,
  `stundenpromonat` smallint DEFAULT NULL,
  `urlaubstage` smallint DEFAULT NULL,
  `urlaubgenommen` smallint DEFAULT NULL,
  `steuerklasse` varchar(40) COLLATE latin1_german1_ci DEFAULT NULL,
  `bankinstitut` varchar(120) COLLATE latin1_german1_ci DEFAULT NULL,
  `bankleitzahl` int DEFAULT NULL,
  `kontonummer` int DEFAULT NULL,
  `monatslohn` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`mitarbeiterid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mitarbeiter`
--

LOCK TABLES `mitarbeiter` WRITE;
/*!40000 ALTER TABLE `mitarbeiter` DISABLE KEYS */;
INSERT INTO `mitarbeiter` VALUES (1,'Müller','Ralf','1970-12-20','1990-01-13',NULL,NULL,'Mondstraße','13a','Salzhausen',50000,'0123/8888888888888','01234/0000000000','ralfmueller@rumpsteakserver.appetit',NULL,500.00,'m','Einkauf','AOK Köln','ja',4,20.80,3,160,30,20,'3','Stadtsparkasse Köln',37050198,0,4000.00),(2,'Schneider','Petra','1965-03-07','1995-08-27','2000-07-31','ruhestand','Sonnenstraße','189','Pfefferstadt',70000,'0123/1111111111','4566/0000000000000000','petraschneider@kalbshaxenserver.appetit',NULL,500.00,'w','Einkauf','MH Plus Bonn','ja',3,28.50,-7,180,30,20,'3','Stadtsparkasse Köln',37050198,0,4000.00),(3,'Klein','Thomas','1970-12-20','1990-01-13',NULL,NULL,'Mondstraße','13a','Salzhausen',50000,'0123/77777777777777','01234/4444444444444','thomasklein@forellenserver.appetit',NULL,500.00,'m','Einkauf','AOK Köln','ja',4,20.80,-5,165,30,28,'3','Stadtsparkasse Köln',37050198,0,4000.00),(4,'Lang','Ute','1985-07-19','2005-06-07',NULL,NULL,'Marsstraße','789a','Zuckerhausen',50000,'8977/9999999999999','2345/55555555555555','utelang@bohnenserver.appetit',NULL,280.50,'w','Einkauf','AOK Köln','nein',0,20.00,2,170,30,25,'1','Stadtsparkasse Köln',37050198,0,2800.00),(5,'Eisenhof','Frank','1962-05-15','1982-07-08','1995-05-31','ruhestand','Jupiterstraße','270','Nelkendorf',50000,'0123/222222222222222','7890/111111111111111','frankeisenhof@lammrueckenserver.appetit',NULL,888.00,'m','Einkauf','AOK Köln','ja',4,20.80,-12,165,30,20,'3','Stadtsparkasse Köln',37050198,0,1750.00),(6,'Lupin','Anja','1967-03-07','1998-02-17',NULL,NULL,'Saturnweg','1','Koreanderstadt',50000,'2345/33333333333333','3456/666666666666','anjalupin@heilbuttserver.appetit',NULL,2000.00,'w','Einkauf','AOK Köln','nein',2,98.85,15,200,30,20,'2','Stadtsparkasse Köln',37050198,0,6125.00),(7,'Lempe','Dirk','1987-02-18','2000-07-21','2002-01-31','veränderung','Venusweg','100','Currystadt',70000,'3456/22222222222222','4567/7777777777777','dirklempe@spargelserver.appetit',NULL,1800.00,'m','Personal','MH Plus Bonn','ja',2,67.00,-18,160,30,26,'1','Stadtsparkasse Köln',37050198,0,3800.00),(8,'Müller','Iris','1953-08-22','1970-03-15',NULL,NULL,'Merkurweg','770','Anisstadt',70000,'3456/11111111111111','2345/99999999999999','irismueller@kotelettserver.appetit',NULL,7800.00,'w','Personal','MH Plus Bonn','ja',2,125.00,80,210,30,25,'3','Stadtsparkasse Köln',37050198,0,7000.00),(9,'Ludiwig','Heinz','1955-09-27','1978-07-18','1995-02-05','ruhestand','Uranus','27c','Zimtdorf',70000,'4567/666666666666666','7891/222222222222222','heinzludiwig@karpfenserver.appetit',NULL,127.45,'m','Personal','MH Plus Bonn','ja',1,18.50,-21,165,30,30,'3','Stadtsparkasse Köln',37050198,0,1300.00),(10,'Klarfeld','Simone','1968-08-17','1989-04-15','1997-01-31','veränderung','Neptunweg','67','Muskatdorf',70000,'5678/333333333333333','6789/22222222222222','simoneklarfeld@fenchelserver.appetit',NULL,4000.00,'w','Personal','MH Plus Bonn','ja',1,35.00,-18,180,30,20,'3','Stadtsparkasse Köln',37050198,0,5000.00),(11,'Schmidt','Werner','1948-05-31','1970-03-01','1975-03-31','ruhestand','Erdweg','300','Bärlauchstadt',70000,'1234/999999999999','2345/444444444444','wernerschmidt@kalbsschulterserver.appetit',NULL,800.00,'m','Personal','MH Plus Bonn','nein',0,40.00,3,175,30,30,'1','Stadtsparkasse Köln',37050198,0,5500.00),(12,'Funke','Doris','1954-09-03','1980-05-01',NULL,NULL,'Spiralstraße','75','Ingwerdorf',70000,'2345/11111111111111','3456/222222222222','dorisfunke@schollenserver.apettit',NULL,2000.00,'w','Personal','MH Plus Bonn','nein',0,55.00,-17,160,30,28,'1','Stadtsparkasse Köln',37050198,0,7000.00),(13,'Nolte','Reinhard','1984-01-31','2005-01-01','2008-05-07',NULL,'Sombrerostraße','34z','Gewürznelkenstadt',80000,'4567/99999999999','5678/333333333333','reinhardnolte@kürbissserver.appetit',355000.80,1700.00,'m','Vertrieb','MH Plus Bonn','ja',2,34.00,-8,176,15,10,'3','Stadtsparkasse Köln',37050198,0,5000.00),(14,'Jule','Stefanie','1954-06-18','1975-01-05','1985-04-20','ruhestand','Black Eye Galaxistraße','189','Kardamondorf',80000,'6789/1111111111111','7891/555555555555','stefaniejule@lammkronenserver.appetit',700000.00,10000.00,'w','Vertrieb','MH Plus Bonn','ja',1,120.00,21,160,30,22,'3','Stadtsparkasse Köln',37050198,0,6000.00),(15,'Petersen','Hans','1989-02-27','2011-03-08',NULL,NULL,'Centaurusstraße','20','Safrandorf',80000,'9123/4444444444444','6789/33333333333','hanspeterson@makrelenserver.appetit',156000.00,1200.00,'m','Vertrieb','MH Plus Bonn','nein',0,45.00,4,167,30,22,'1','Stadtsparkasse Köln',37050198,0,5600.00),(16,'Sebastiansen','Inge','1958-04-22','1985-01-01','2010-09-30','ruhestand','Doradusstraße','150a','Vanillestadt',90000,'5678/77777777777','7890/55555555555','ingesebastiansen@tomatenserver.appetit',570000.00,2500.00,'w','Vertrieb','MH Plus Bonn','ja',3,55.00,-2,180,15,10,'3','Stadtsparkasse Köln',37050198,0,4000.00),(17,'Haier','Peter','1960-05-11','1984-09-07','2011-07-31','abfindungsprogramm','Galax Cluster Straße','444','Zitronenstadt',90000,'0123/333333333333','2345/6666666666666','peterhaier@lammsteakserver.appetit',347000.89,1800.00,'m','Vertrieb','Barmer GEK','nein',0,67.00,-9,170,30,23,'3','Stadtsparkasse Köln',37050198,0,7000.00),(18,'Steinmacher','Ilse','1961-07-31','1978-05-22',NULL,NULL,'Supernovastraße','346','Paprikapulverdorf',90000,'4567/33333333333','7890/1111111111111','ilsesteinmacher@heringserver.appetit',700898.03,4000.00,'w','Vertrieb','Barmer GEK','ja',1,70.00,10,160,30,23,'3','Stadtsparkasse Köln',37050198,0,6000.00),(19,'Überall','Georg','1968-03-15','1996-10-22',NULL,NULL,'Quasarstraße','456','Kurkumadorf',90000,'3456/888888888888','6789/333333333333','georgueberall@paprikaserver.appetit',678000.54,3000.00,'m','Vertrieb','Barmer GEK','nein',0,50.80,-8,168,30,24,'1','Stadtsparkasse Köln',37050198,0,4000.00),(20,'Klein','Bärbel','1967-07-18','1996-06-19',NULL,NULL,'Challangerstraße','987','Nelkendorf',90000,'4567/3333333333','8901/555555555555','baerbelklein@gansserver.appetit',234000.00,1200.00,'w','Vertrieb','Barmer GEK','nein',0,50.00,3,180,30,27,'1','Stadtsparkasse Köln',37050198,0,7000.00),(21,'Stein','Rolf','1923-03-12','1980-08-12','1985-01-31','ruhestand','Columbiastraße','57','ChiliHofen',90000,'012345/888888888888','45677/3333333333333','rolfstein@schellfischserver.appetit',NULL,3000.00,'m','Controlling','BKK Pfalz','ja',2,50.80,2,170,30,24,'3','Stadtsparkasse Köln',37050198,0,5000.00),(22,'Groß','Vera','1977-08-14','2000-07-01','2005-03-31','veränderung','Atlantisstraße','783','Birnendorf',90000,'2345/111111111111','3456/000000000000','veragross@auberginenserver.appetit',NULL,1500.00,'w','Controlling','Techniker Krankenkasse - TK','ja',1,50.00,-10,160,30,19,'3','Stadtsparkasse Köln',37050198,0,5000.00),(23,'Funke','Andreas','1965-07-17','1985-02-14',NULL,NULL,'Lunarstraße','111','Zuckerstadt',10000,'2345/000000000000','00000/999999999999','andreasfunke@entenserver.appetit',NULL,2300.00,'m','Controlling','BKK Faber-Castell & Partner','ja',2,85.00,12,180,30,30,'3','Stadtsparkasse Köln',37050198,0,6000.00),(24,'Engels','Sabine','1970-08-27','1991-05-01',NULL,NULL,'Appollostraße','176','Avocadodorf',10000,'11111/555555555555','2222222/77777777777','sabineengels@zanderserver.appetit',NULL,10000.00,'w','Controlling','AOK Nordwest','ja',1,120.00,-5,180,30,21,'3','Stadtsparkasse Köln',37050198,0,10000.00),(25,'Paulus','Sebastian','1955-02-18','1985-01-01','1992-04-25','ruhestand','Curiositystraße','361','Limmetenstadt',10000,'1234/33333333333','2345/888888888888','sebastianpaulus@zucchiniserver.appetit',NULL,5000.00,'m','Controlling','IKK gesund plus','nein',1,80.00,2,165,30,25,'1','Stadtsparkasse Köln',37050198,0,10000.00),(26,'Winscheidt','Elke','1955-03-24','1978-09-01',NULL,NULL,'Spiritweg','98','Pinienstadt',10000,'6789/11111111111','7890/77777777777','elkewinscheidt@rehrückenserver.appetit',NULL,8000.00,'w','Controlling',' IKK gesund plus','ja',1,70.00,5,200,30,27,'3','Stadtsparkasse Köln',37050198,0,10000.00),(27,'Blume','Siegmar','1961-01-15','1982-02-12','2010-01-31','ruhestand','Opportunity Straße','8','Aceto Balsamico Stadt',10000,'9012/11111111111111','012345/8888888888','siegmarblume@sardellenserver.appetit',NULL,10000.00,'m','Controlling','IKK gesund plus','ja',2,120.00,-4,190,30,22,'3','Stadtsparkasse Köln',37050198,0,10000.00),(28,'Mey','Tanja','1971-09-20','1995-08-23','1997-03-31','veränderung','Phoenix Weg','24','Parmesan Dorf',10000,'2345/1111111111111','3456/6666666666','tanjamay@kaninchenkeulenserver.appetit',NULL,8000.00,'w','Controlling','IKK gesund plus','nein',0,110.00,10,160,30,29,'1','Stadtsparkasse Köln',37050198,0,8000.00),(29,'Gelz','Oliver','1978-07-11','2002-08-01',NULL,NULL,'Arianestraße','75','Schallotten Dorf',10000,'3456/44444444444444','4567/8888888888','olivergelz@welsserver@appetit',NULL,7500.00,'m','Controlling','IKK gesund plus','ja',1,89.00,12,160,30,22,'3','Stadtsparkasse Köln',37050198,0,5000.00),(30,'Lorenz','Tina','1980-08-22','2005-05-11',NULL,NULL,'ISS Weg','176','Mascarpone Dorf',10000,'6789/22222222222','7890/3333333333333','tinalorenz@chicoreeserver.appetit',NULL,500.00,'w','Controlling','IKK gesund plus','ja',2,50.00,-7,160,30,22,'3','Stadtsparkasse Köln',37050198,0,5000.00),(31,'Maier','Tim','1963-04-05','1979-12-01',NULL,NULL,'Euklid Weg','7','Meersalz Stadt',10000,'8901/333333333333','1234/1111111111111','timmaier@kürbisserver.appetit',80000.00,500.00,'m','Verkauf','IKK gesund plus','ja',1,60.00,3,165,30,30,'3','Stadtsparkasse Köln',37050198,0,6000.00),(32,'Winter','Elise','1956-07-12','1986-04-01',NULL,NULL,'Mir Straße','198','Lorber Village',20000,'2345/222222222222','123456/7777777777','elisewinter@rumpsteakserver.appetit',120000.00,800.00,'w','Verkauf','IKK gesund plus','ja',2,80.00,2,170,30,26,'3','Stadtsparkasse Köln',37050198,0,8000.00),(33,'Sommer','Werner','1965-10-25','1988-06-01',NULL,NULL,'Titan Weg','7','Broccoli Dorf',20000,'45678/66666666666','56789/2222222222222','wernersommer@heilbuttserver@appetit',170000.00,1200.00,'m','Verkauf','IKK gesund plus','ja',1,120.00,15,180,15,8,'3','Stadtsparkasse Köln',37050198,0,9000.00),(34,'Trost','Elvira','1968-04-11','1990-08-10',NULL,NULL,'Dione Straße','133','Dijon Village',20000,'123456/88888888888','23456/333333333333333','elviratrost@paprikaserver.appetit',123300.00,1234.00,'w','Verkauf','IKK gesund plus','ja',2,90.00,3,160,30,25,'3','Stadtsparkasse Köln',37050198,0,5000.00),(35,'Friedrichs','Martin','1954-05-15','1985-07-11',NULL,NULL,'Epimetheus Weg','9','Walnußöl Village',20000,'34567/7777777777','345678/6666666666666','martinfriedrichs@cayenneserver.appetit',333000.00,2000.00,'m','Verkauf','IKK gesund plus','ja',5,110.00,4,160,30,14,'3','Stadtsparkasse Köln',37050198,0,5000.00),(36,'Ludowig','Carmen','1975-07-05','1996-07-18',NULL,NULL,'Iapetus Straße','48','Pinienkernöl Village',20000,'23456/666666666666','012345/55555555555','carmenludowig@serranoserver@appetit',500000.00,3000.00,'w','Verkauf','IKK gesund plus','ja',7,120.00,10,80,30,25,'3','Stadtsparkasse Köln',37050198,0,1200.00),(37,'Serenius','Ingo','1950-11-09','1972-04-11','2011-05-31','ruhestand','Rhea Weg','10','Sherry Essig Village',20000,'67890/444444444444','890123/55555555','ingoserenius@hirschserver.appetit',230000.00,2000.00,'m','Verkauf','IKK gesund plus','nein',7,120.00,-14,80,15,10,'1','Stadtsparkasse Köln',37050198,0,1300.00),(38,'Mey','Lisa','1980-05-31','2005-11-22',NULL,NULL,'Enceladus Weg','18a','Zuckererbsen Village',20000,'90123/55555555555555','67890/333333333333','lisamay@hirschserver.appetit',1000000.00,50000.00,'w','Verkauf','IKK gesund plus','nein',0,230.00,-5,170,30,26,'1','Stadtsparkasse Köln',37050198,0,6000.00),(39,'Sonnenfeld','Udo','1976-07-25','1998-06-12',NULL,NULL,'Rosetta Straße','5','Soja Village',30000,'456789/333333333333','901234/22222222222222','udosonnenfeld@zwibelserver.appetit',650000.00,4000.00,'m','Verkauf','IKK gesund plus','ja',5,120.00,10,50,30,22,'3','Stadtsparkasse Köln',37050198,0,5000.00),(40,'Kanis','Herbert','1965-10-11','1984-10-15',NULL,NULL,'Sofiaweg','9','Apfelessig Village',30000,'789012/44444444444','456789/55555555555','herbertkanis@rehserver.appetit',500000.00,2800.00,'m','Verkauf','IKK gesund plus','ja',2,98.00,2,160,30,18,'3','Stadtsparkasse Köln',37050198,0,4000.00),(41,'Santus','Cornelia','1968-12-11','1992-05-22',NULL,NULL,'Justin Straße','15','Rettich Stadt',30000,'23456/22222222222222222','56789/1111111111111','corneliasantus@thunfischserver.appetit',700000.00,3000.00,'w','Verkauf','IKK gesund plus','ja',3,95.00,-13,165,30,28,'3','Stadtsparkasse Köln',37050198,0,5000.00),(42,'Oberscheidt','Michael','1967-02-08','1984-07-31',NULL,NULL,'Sojus Weg','20','Tabasco Dorf',30000,'56789/2222222222','7890123/4444444444444','michaeloberscheidt@gurkenserver.appetit',150000.00,200000.00,'m','Verkauf','IKK gesund plus','nein',0,80.00,-5,120,15,7,'3','Stadtsparkasse Köln',37050198,0,1800.00),(43,'Dorsten','Klaus','1970-07-17','1997-04-21',NULL,NULL,'Marsgesicht Straße','16','Piment Dorf',30000,'9012345/333333333333333','123456/6666666666666','klausdorsten@fenchelserver.appetit',600000.00,1200.00,'m','Verkauf','IKK gesund plus','nein',3,90.00,2,160,30,27,'3','Stadtsparkasse Köln',37050198,0,1800.00),(44,'Bücher','Herbert','1951-10-05','1978-01-01',NULL,NULL,'Kosmonauten Weg','27a','Trauben Dorf',50000,'111111111/777777777777','55555/44444444444','herbertbuecher@hirschserver.appetit',1200000.80,2000.00,'m','Verkauf','MH Plus','nein',1,120.00,48,160,30,27,'10','Stadtsparkasse Köln',37050198,0,5000.00),(45,'Sternental','Marlene','1950-02-18','1972-09-28',NULL,NULL,'Weltstraße','97','Orangen City',70000,'4444444444/88888888','000000/11111111','marlenesternental@delphinserver.appetit',600000.00,10000.00,'w','Verkauf','IKK gesund plus','ja',3,105.00,5,180,30,30,'3','Stadtsparkasse Köln',37050198,0,7500.00),(46,'Heinrich','Hans','1953-05-28','1971-03-30',NULL,NULL,'Geltstraße','65','Haselnuß City',40000,'00000000/11111111','77777/999999999','hansheinrich@forellenserver.appetit',1200000.80,5000.00,'m','Verkauf','MH Plus','ja',2,130.00,10,160,15,8,'3','Stadtsparkasse Köln',37050198,0,6000.00),(47,'Blume','Tanja','1970-05-25','1982-03-30','2010-02-15','ruhestand','Opportunity Straße','8','Aceto Balsamico Stadt',10000,'9012/11111111111111','012345/8888888888','siegmarblume@sardellenserver.appetit',NULL,10000.00,'m','Controlling','IKK gesund plus','ja',2,120.00,-4,190,30,22,'3','Stadtsparkasse Köln',37050198,0,10000.00),(48,'Bücher','Ilse','1955-01-11','1975-06-07',NULL,NULL,'Kosmonauten Weg','27a','Trauben Dorf',50000,'111111111/777777777777','55555/44444444444','herbertbuecher@hirschserver.appetit',80000.80,3000.00,'m','Verkauf','MH Plus','nein',1,140.00,48,160,30,27,'10','Stadtsparkasse Köln',37050198,0,5000.00),(49,'Dorsten','Stephanie','1968-10-21','1995-06-19',NULL,NULL,'Marsgesicht Straße','16','Piment Dorf',30000,'9012345/333333333333333','123456/6666666666666','klausdorsten@fenchelserver.appetit',600000.00,1200.00,'m','Verkauf','IKK gesund plus','nein',3,90.00,2,160,30,27,'3','Stadtsparkasse Köln',37050198,0,1800.00),(50,'Eisenhof','Linda','1958-07-15','1970-08-07','2010-11-01','ruhestand','Jupiterstraße','270','Nelkendorf',50000,'0123/222222222222222','7890/111111111111111','frankeisenhof@lammrueckenserver.appetit',NULL,888.00,'m','Einkauf','AOK Köln','ja',4,20.80,-12,165,30,20,'3','Stadtsparkasse Köln',37050198,0,1750.00);
/*!40000 ALTER TABLE `mitarbeiter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mitarbeiter2`
--

DROP TABLE IF EXISTS `mitarbeiter2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mitarbeiter2` (
  `mitarbeiterid` int NOT NULL,
  `name` varchar(30) COLLATE latin1_german1_ci DEFAULT NULL,
  `vorname` varchar(30) COLLATE latin1_german1_ci DEFAULT NULL,
  `gebdatum` date DEFAULT NULL,
  `abteilungid` int DEFAULT NULL,
  `vorgesetzterid` int DEFAULT NULL,
  `steuerklasseid` smallint DEFAULT NULL,
  `krankenkassenid` int DEFAULT NULL,
  `kontoid` int DEFAULT NULL,
  `eintrittsdatum` date DEFAULT NULL,
  `austrittsdatum` date DEFAULT NULL,
  `austrittsgrund` varchar(30) COLLATE latin1_german1_ci DEFAULT NULL,
  PRIMARY KEY (`mitarbeiterid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mitarbeiter2`
--

LOCK TABLES `mitarbeiter2` WRITE;
/*!40000 ALTER TABLE `mitarbeiter2` DISABLE KEYS */;
INSERT INTO `mitarbeiter2` VALUES (1,'Müller','Ralf','1970-12-20',1,19,3,3,1,'1990-01-13',NULL,NULL),(2,'Schneider','Petra','1965-03-07',1,1,NULL,NULL,2,'1995-08-27','2000-07-31','ruhestand'),(3,'Klein','Thomas','1970-12-20',1,1,3,10,3,'1990-01-13',NULL,NULL),(4,'Lang','Ute','1985-07-19',1,1,1,NULL,4,'2005-06-07',NULL,NULL),(5,'Eisenhof','Frank','1962-05-15',1,1,NULL,11,5,'1982-07-08','1995-05-31','ruhestand'),(6,'Lupin','Anja','1967-03-07',1,1,2,NULL,6,'1998-02-17',NULL,NULL),(7,'Lempe','Dirk','1987-02-18',5,8,NULL,33,7,'2000-07-21','2002-01-31','veränderung'),(8,'Müller','Iris','1953-08-22',5,19,3,NULL,8,'1970-03-15',NULL,NULL),(9,'Ludwig','Heinz','1955-09-27',5,8,NULL,NULL,NULL,'1978-07-18','1995-02-05','ruhestand'),(10,'Klarfeld','Simone','1968-08-17',5,8,NULL,NULL,10,'1989-04-15','1997-01-31','veränderung'),(11,'Schmidt','Werner','1948-05-31',5,8,NULL,33,11,'1970-03-01','1975-03-31','ruhestand'),(12,'Funke','Doris','1954-09-03',5,8,1,27,NULL,'1980-05-01',NULL,NULL),(13,'Nolte','Reinhard','1984-01-31',2,18,NULL,NULL,13,'2005-01-01','2008-05-07',NULL),(14,'Jule','Stefanie','1954-06-18',2,18,NULL,8,14,'1975-01-05','1985-04-20','ruhestand'),(15,'Engels','Karl','1989-02-27',2,18,1,NULL,15,'2011-03-08',NULL,NULL),(16,'Franke','Elisabeth','1958-04-22',2,19,NULL,17,16,'1985-01-01','2010-09-30','ruhestand'),(17,'Petersen','Hans','1960-05-11',2,18,NULL,NULL,17,'1984-09-07','2011-07-31','abfindungsprogramm'),(18,'Sebastiansen','Inge','1961-07-31',2,18,3,23,18,'1978-05-22',NULL,NULL),(19,'Heier','Peter','1968-03-15',2,NULL,1,NULL,19,'1996-10-22',NULL,NULL),(20,'Steinmacher','Ilse','1967-07-18',2,19,1,NULL,20,'1996-06-19',NULL,NULL),(21,'Überall','Georg','1923-03-12',3,23,NULL,29,21,'1980-08-12','1985-01-31','ruhestand'),(22,'Klein','Bärbel','1977-08-14',3,23,NULL,NULL,NULL,'2000-07-01','2005-03-31','veränderung'),(23,'Stein','Rolf','1965-07-17',3,19,3,33,23,'1985-02-14',NULL,NULL),(24,'Groß','Vera','1970-08-27',3,23,3,NULL,24,'1991-05-01',NULL,NULL),(25,'Funke','Andreas','1955-02-18',3,23,NULL,38,25,'1985-01-01','1992-04-25','ruhestand'),(26,'Engels','Sabine','1955-03-24',3,23,3,NULL,NULL,'1978-09-01',NULL,NULL),(27,'Paulus','Sebastian','1961-01-15',3,23,NULL,42,27,'1982-02-12','2010-01-31','ruhestand'),(28,'Winscheidt','Elke','1971-09-20',3,23,NULL,NULL,28,'1995-08-23','1997-03-31','veränderung'),(29,'Blume','Siegmar','1978-07-11',3,23,3,46,29,'2002-08-01',NULL,NULL),(30,'Mey','Tanja','1980-08-22',3,23,3,NULL,30,'2005-05-11',NULL,NULL),(31,'Gelz','Oliver','1963-04-05',4,46,3,50,31,'1979-12-01',NULL,NULL),(32,'Lorenz','Tina','1956-07-12',4,46,3,NULL,32,'1986-04-01',NULL,NULL),(33,'Maier','Tim','1965-10-25',4,46,3,47,33,'1988-06-01',NULL,NULL),(34,'Winter','Elise','1968-04-11',4,46,3,NULL,34,'1990-08-10',NULL,NULL),(35,'Obendorf','Karl','1954-05-15',4,46,3,43,35,'1985-07-11',NULL,NULL),(36,'Sommer','Werner','1975-07-05',4,46,3,NULL,36,'1996-07-18',NULL,NULL),(37,'Trost','Elvira','1950-11-09',4,46,NULL,39,37,'1972-04-11','2011-05-31','ruhestand'),(38,'Friedrichs','Martin','1980-05-31',4,46,1,NULL,38,'2005-11-22',NULL,NULL),(39,'Ludowig','Carmen','1976-07-25',4,46,3,35,39,'1998-06-12',NULL,NULL),(40,'Serenius','Ingo','1965-10-11',4,46,3,NULL,40,'1984-10-15',NULL,NULL),(41,'Mey','Lisa','1968-12-11',4,46,3,31,41,'1992-05-22',NULL,NULL),(42,'Sonnenfeld','Udo','1967-02-08',4,46,1,NULL,42,'1984-07-31',NULL,NULL),(43,'Kanis','Herbert','1970-07-17',4,46,2,27,43,'1997-04-21',NULL,NULL),(44,'Santus','Cornelia','1951-10-05',4,46,2,NULL,44,'1978-01-01',NULL,NULL),(45,'Oberscheidt','Michael','1950-02-18',4,46,3,23,45,'1972-09-28',NULL,NULL),(46,'Dorsten','Klaus','1953-05-28',4,19,3,NULL,46,'1971-03-30',NULL,NULL);
/*!40000 ALTER TABLE `mitarbeiter2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mitarbeiterdoppelt`
--

DROP TABLE IF EXISTS `mitarbeiterdoppelt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mitarbeiterdoppelt` (
  `name` varchar(30) COLLATE latin1_german1_ci DEFAULT NULL,
  `vorname` varchar(30) COLLATE latin1_german1_ci DEFAULT NULL,
  `strasse` varchar(30) COLLATE latin1_german1_ci DEFAULT NULL,
  `hausnummer` varchar(10) COLLATE latin1_german1_ci DEFAULT NULL,
  `ort` varchar(120) COLLATE latin1_german1_ci DEFAULT NULL,
  `plz` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mitarbeiterdoppelt`
--

LOCK TABLES `mitarbeiterdoppelt` WRITE;
/*!40000 ALTER TABLE `mitarbeiterdoppelt` DISABLE KEYS */;
INSERT INTO `mitarbeiterdoppelt` VALUES ('Müller','Ralf','Mondstraße','13a','Salzhausen',50000),('Müller','Ralf','Mondstraße','13a','Salzhausen',50000),('Müller','Ralf','Mondstraße','13a','Salzhausen',50000),('Müller','Ralf','Starbust Galay M82 Weg','220','Frühlingszwiebelhausen',70000),('Müller','Ralf','Centaurus A Straße','177','Champingin Stadt',40000),('Schneider','Petra','Sonnenstraße','189','Pfefferstadt',70000),('Schneider','Petra','Sonnenstraße','189','Pfefferstadt',70000),('Schneider','Petra','Sonnenstraße','189','Pfefferstadt',70000),('Schneider','Petra','Perseusstraße','345','Cranberrie Dorf',23000),('Schneider','Petra','Hydrastraße','652','Erdnusölhausen',70000),('Klein','Thomas','Merkurweg','770','Anisstadt',70000),('Klein','Thomas','Merkurweg','770','Anisstadt',70000),('Klein','Thomas','Merkurweg','770','Anisstadt',70000),('Klein','Thomas','Polarsternstraße','77','Emmentaler Stadt',40000),('Klein','Thomas','Aquilastraße','76','Apfelvillage',45000),('Lang','Ute','Supernovastraße','346','Paprikapulverdorf',90000),('Lang','Ute','Supernovastraße','346','Paprikapulverdorf',90000),('Lang','Ute','Supernovastraße','346','Paprikapulverdorf',90000),('Lang','Ute','Perseusweg','33a','Melonenvillage',30000),('Lang','Ute','Piscesstraße','44','Liebstöckeldorf',20000),('Eisenhof','Frank','Quasarstraße','456','Kurkumadorf',90000),('Eisenhof','Frank','Quasarstraße','456','Kurkumadorf',90000),('Eisenhof','Frank','Quasarstraße','456','Kurkumadorf',90000),('Eisenhof','Frank','Columbastraße','56','Meerrettichvillage',40000),('Eisenhof','Frank','Cygnusweg','73','Orangendorf',80000),('Lupin','Anja','Lunarstraße','111','Zuckerstadt',10000),('Lupin','Anja','Lunarstraße','111','Zuckerstadt',10000),('Lupin','Anja','Lunarstraße','111','Zuckerstadt',10000),('Lupin','Anja','Eridanusweg','48','Austernvillage',50000),('Lupin','Anja','Carinastraße','65','Lorbeervillage',40000),('Lempe','Dirk','Appollostraße','176','Avocadodorf',10000),('Lempe','Dirk','Appollostraße','176','Avocadodorf',10000),('Lempe','Dirk','Appollostraße','176','Avocadodorf',10000),('Lempe','Dirk','Herculesweg','4a','Wallnusdorf',20000),('Lempe','Dirk','Aquilaweg','67','Weizendorf',40000),('Müller','Iris','Curiositystraße','361','Limmetenstadt',10000),('Müller','Iris','Curiositystraße','361','Limmetenstadt',10000),('Müller','Iris','Curiositystraße','361','Limmetenstadt',10000),('Müller','Iris','Pictorstraße','456','Lollorossostadt',30000),('Müller','Iris','Lynxweg','77','Garnelenvillage',70000),('Ludwig','Heinz','Spiritweg','98','Pinienstadt',10000),('Ludwig','Heinz','Spiritweg','98','Pinienstadt',10000),('Ludwig','Heinz','Spiritweg','98','Pinienstadt',10000),('Ludwig','Heinz','Andromedastraße','66','Erdbeerstadt',40000),('Ludwig','Heinz','Taurusstraße','35','Rosmarinvillage',70000),('Klarfeld','Simone','Arianestraße','75','Schallotten Dorf',10000),('Klarfeld','Simone','Arianestraße','75','Schallotten Dorf',10000),('Klarfeld','Simone','Arianestraße','75','Schallotten Dorf',10000),('Klarfeld','Simone','Dracoweg','44','Aritschockenvillage',70000),('Klarfeld','Simone','Sculptorstraße','67','Mangoldvillage',40000),('Schmidt','Werner','ISS Weg','176','Mascarpone Dorf',10000),('Schmidt','Werner','ISS Weg','176','Mascarpone Dorf',10000),('Schmidt','Werner','ISS Weg','176','Mascarpone Dorf',10000),('Schmidt','Werner','Delphinusplatz','8a','Shiiatakedorf',46000),('Schmidt','Werner','Pavostraße','46','Muskatvillage',47000),('Piaff','Edit','Euklid Weg','7','Meersalz Stadt',10000),('Piaff','Edit','Euklid Weg','7','Meersalz Stadt',10000),('Piaff','Edit','Euklid Weg','7','Meersalz Stadt',10000),('Piaff','Edit','Geministraße','560','Blätterteigvillage',10000),('Piaff','Edit','Perseusweg','47','Bugundervillage',10000),('Funke','Doris','Mir Straße','198','Lorber Village',20000),('Funke','Doris','Mir Straße','198','Lorber Village',20000),('Funke','Doris','Mir Straße','198','Lorber Village',20000),('Funke','Doris','Doradoweg','7','Pesto Dorf',40000),('Funke','Doris','Lupusweg','20','Mozzarellavillage',66000);
/*!40000 ALTER TABLE `mitarbeiterdoppelt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mitarbeitergleich`
--

DROP TABLE IF EXISTS `mitarbeitergleich`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mitarbeitergleich` (
  `name` varchar(30) COLLATE latin1_german1_ci DEFAULT NULL,
  `vorname` varchar(30) COLLATE latin1_german1_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mitarbeitergleich`
--

LOCK TABLES `mitarbeitergleich` WRITE;
/*!40000 ALTER TABLE `mitarbeitergleich` DISABLE KEYS */;
INSERT INTO `mitarbeitergleich` VALUES ('Müller','Ralf'),('Müller','Ralf'),('Müller','Ralf'),('Klein','Thomas'),('Klein','Thomas'),('Klein','Thomas');
/*!40000 ALTER TABLE `mitarbeitergleich` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `mitarbeiterkrankenkasse`
--

DROP TABLE IF EXISTS `mitarbeiterkrankenkasse`;
/*!50001 DROP VIEW IF EXISTS `mitarbeiterkrankenkasse`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `mitarbeiterkrankenkasse` AS SELECT 
 1 AS `mitarbeiterid`,
 1 AS `name`,
 1 AS `vorname`,
 1 AS `krankenkasse`,
 1 AS `beitragssatz`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `niederlassungbelgien`
--

DROP TABLE IF EXISTS `niederlassungbelgien`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `niederlassungbelgien` (
  `mitarbeiterid` int NOT NULL,
  `name` varchar(30) COLLATE latin1_german1_ci DEFAULT NULL,
  `vorname` varchar(30) COLLATE latin1_german1_ci DEFAULT NULL,
  `status` varchar(30) COLLATE latin1_german1_ci DEFAULT NULL,
  PRIMARY KEY (`mitarbeiterid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `niederlassungbelgien`
--

LOCK TABLES `niederlassungbelgien` WRITE;
/*!40000 ALTER TABLE `niederlassungbelgien` DISABLE KEYS */;
INSERT INTO `niederlassungbelgien` VALUES (1,'Klein','Thomas','aktiv'),(2,'Eisenhof','Frank','inaktiv'),(3,'Lang','Ute','inaktiv'),(4,'Lempe','Dirk','aktiv'),(5,'Müller','Iris','inaktiv'),(6,'Ludiwig','Heinz','aktiv');
/*!40000 ALTER TABLE `niederlassungbelgien` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `niederlassungholland`
--

DROP TABLE IF EXISTS `niederlassungholland`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `niederlassungholland` (
  `mitarbeiterid` int NOT NULL,
  `name` varchar(30) COLLATE latin1_german1_ci DEFAULT NULL,
  `vorname` varchar(30) COLLATE latin1_german1_ci DEFAULT NULL,
  `status` varchar(30) COLLATE latin1_german1_ci DEFAULT NULL,
  PRIMARY KEY (`mitarbeiterid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `niederlassungholland`
--

LOCK TABLES `niederlassungholland` WRITE;
/*!40000 ALTER TABLE `niederlassungholland` DISABLE KEYS */;
INSERT INTO `niederlassungholland` VALUES (1,'Müller','Ralf','aktiv'),(2,'Klein','Thomas','inaktiv'),(3,'Lang','Ute','aktiv'),(4,'Eisenhof','Frank','aktiv'),(5,'Schneider','Petra','inaktiv'),(6,'Lupin','Anja','aktiv');
/*!40000 ALTER TABLE `niederlassungholland` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `niederlassungschweiz`
--

DROP TABLE IF EXISTS `niederlassungschweiz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `niederlassungschweiz` (
  `mitarbeiterid` int NOT NULL,
  `name` varchar(30) COLLATE latin1_german1_ci DEFAULT NULL,
  `vorname` varchar(30) COLLATE latin1_german1_ci DEFAULT NULL,
  `status` varchar(30) COLLATE latin1_german1_ci DEFAULT NULL,
  PRIMARY KEY (`mitarbeiterid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `niederlassungschweiz`
--

LOCK TABLES `niederlassungschweiz` WRITE;
/*!40000 ALTER TABLE `niederlassungschweiz` DISABLE KEYS */;
INSERT INTO `niederlassungschweiz` VALUES (1,'Müller','Iris','aktiv'),(2,'Ludiwig','Heinz','inaktiv'),(3,'Lempe','Dirk','inaktiv'),(4,'Klarfeld','Simone','aktiv'),(5,'Schmidt','Wernder','aktiv'),(6,'Funke','Doris','inaktiv'),(7,'Lupin','Anja','inaktiv');
/*!40000 ALTER TABLE `niederlassungschweiz` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personalhierarchie`
--

DROP TABLE IF EXISTS `personalhierarchie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personalhierarchie` (
  `mitarbeiterid` int NOT NULL,
  `name` varchar(30) COLLATE latin1_german1_ci DEFAULT NULL,
  `vorname` varchar(30) COLLATE latin1_german1_ci DEFAULT NULL,
  `vorgesetzterid` int DEFAULT NULL,
  PRIMARY KEY (`mitarbeiterid`),
  KEY `vorgesetzteridFK` (`vorgesetzterid`),
  CONSTRAINT `vorgesetzteridFK` FOREIGN KEY (`vorgesetzterid`) REFERENCES `personalhierarchie` (`mitarbeiterid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personalhierarchie`
--

LOCK TABLES `personalhierarchie` WRITE;
/*!40000 ALTER TABLE `personalhierarchie` DISABLE KEYS */;
INSERT INTO `personalhierarchie` VALUES (1,'Müller','Ralf',19),(2,'Schneider','Petra',1),(3,'Klein','Thomas',1),(4,'Lang','Ute',1),(5,'Eisenhof','Frank',1),(6,'Lupin','Anja',1),(7,'Lempe','Dirk',8),(8,'Müller','Iris',19),(9,'Ludwig','Heinz',8),(10,'Klarfeld','Simone',8),(11,'Schmidt','Werner',8),(12,'Funke','Doris',8),(13,'Nolte','Reinhard',18),(14,'Jule','Stefanie',18),(15,'Engels','Karl',18),(16,'Franke','Elisabeth',19),(17,'Petersen','Hans',18),(18,'Sebastiansen','Inge',19),(19,'Heier','Peter',NULL),(20,'Steinmacher','Ilse',19),(21,'Überall','Georg',23),(22,'Klein','Bärbel',23),(23,'Stein','Rolf',19),(24,'Groß','Vera',23),(25,'Funke','Andreas',23),(26,'Engels','Sabine',23),(27,'Paulus','Sebastian',23),(28,'Winscheidt','Elke',23),(29,'Blume','Siegmar',23),(30,'Mey','Tanja',23),(31,'Gelz','Oliver',46),(32,'Lorenz','Tina',46),(33,'Maier','Tim',46),(34,'Winter','Elise',46),(35,'Obendorf','Karl',46),(36,'Sommer','Werner',46),(37,'Trost','Elvira',46),(38,'Friedrichs','Martin',46),(39,'Ludowig','Carmen',46),(40,'Serenius','Ingo',46),(41,'Mey','Lisa',46),(42,'Sonnenfeld','Udo',46),(43,'Kanis','Herbert',46),(44,'Santus','Cornelia',46),(45,'Oberscheidt','Michael',46),(46,'Dorsten','Klaus',19),(47,'Meier','Jörg',53),(48,'Birkenbaum','Ralf',53),(49,'Stern','Vladimir',53),(50,'Sonnenschein','Max',53),(51,'Mondschein','Karim',53),(52,'Meier','Heinz',53),(53,'Hirsch','Thomas',19);
/*!40000 ALTER TABLE `personalhierarchie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `positionartikel`
--

DROP TABLE IF EXISTS `positionartikel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `positionartikel` (
  `positionid` int NOT NULL,
  `menge` int DEFAULT NULL,
  `einheit` char(10) COLLATE latin1_german1_ci DEFAULT NULL,
  `fk_artikelinfo_artikelid` int DEFAULT NULL,
  `artikelid` int DEFAULT NULL,
  PRIMARY KEY (`positionid`),
  KEY `foreign_key` (`artikelid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `positionartikel`
--

LOCK TABLES `positionartikel` WRITE;
/*!40000 ALTER TABLE `positionartikel` DISABLE KEYS */;
INSERT INTO `positionartikel` VALUES (1,5,'Stck',1,NULL),(2,20,'Stck',1,NULL),(3,4,'Stck',2,NULL),(4,30,'Stck',2,NULL),(5,11,'Stck',3,NULL),(6,7,'Stck',3,NULL);
/*!40000 ALTER TABLE `positionartikel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `premiumkunde`
--

DROP TABLE IF EXISTS `premiumkunde`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `premiumkunde` (
  `kundeid` int NOT NULL,
  `firma` varchar(120) COLLATE latin1_german1_ci DEFAULT NULL,
  `gewerblich` tinyint DEFAULT NULL,
  `premiumstatus` tinyint DEFAULT NULL,
  PRIMARY KEY (`kundeid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `premiumkunde`
--

LOCK TABLES `premiumkunde` WRITE;
/*!40000 ALTER TABLE `premiumkunde` DISABLE KEYS */;
INSERT INTO `premiumkunde` VALUES (1,'Schrauben Karl',1,6),(2,'Schrauben Meier',1,4),(3,'Schrauben Peters',1,1);
/*!40000 ALTER TABLE `premiumkunde` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produkt`
--

DROP TABLE IF EXISTS `produkt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produkt` (
  `artikelid` int NOT NULL,
  `artikelbezeichnung` varchar(300) COLLATE latin1_german1_ci DEFAULT NULL,
  `preis` decimal(8,2) DEFAULT NULL,
  `kategorie` varchar(200) COLLATE latin1_german1_ci DEFAULT NULL,
  `legierung` varchar(300) COLLATE latin1_german1_ci DEFAULT NULL,
  PRIMARY KEY (`artikelid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produkt`
--

LOCK TABLES `produkt` WRITE;
/*!40000 ALTER TABLE `produkt` DISABLE KEYS */;
INSERT INTO `produkt` VALUES (1,'Schraube 1',2.56,'Schrauben','Zink/Eisen'),(2,'Schraube 2',2.30,'Schrauben','Kupfer/Eisen'),(3,'Schraube 3',2.21,'Schrauben','Nickel/Eisen'),(4,'Schraube 4',2.11,'Schrauben','Gold/Eisen'),(5,'Schraube 5',1.50,'Schrauben','Silber/Eisen');
/*!40000 ALTER TABLE `produkt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produktarchiv`
--

DROP TABLE IF EXISTS `produktarchiv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produktarchiv` (
  `artikelid` int NOT NULL,
  `artikelbezeichnung` varchar(300) COLLATE latin1_german1_ci DEFAULT NULL,
  `preis` decimal(8,2) DEFAULT NULL,
  `kategorie` varchar(200) COLLATE latin1_german1_ci DEFAULT NULL,
  `legierung` varchar(300) COLLATE latin1_german1_ci DEFAULT NULL,
  PRIMARY KEY (`artikelid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produktarchiv`
--

LOCK TABLES `produktarchiv` WRITE;
/*!40000 ALTER TABLE `produktarchiv` DISABLE KEYS */;
INSERT INTO `produktarchiv` VALUES (100,'Schraube A',2.56,'Schrauben','Zink/Eisen'),(101,'Schraube 2',2.30,'Schrauben','Kupfer/Eisen'),(102,'Schraube B',2.21,'Schrauben','Nickel/Eisen'),(103,'Schraube 4',2.11,'Schrauben','Gold/Eisen'),(104,'Schraube C',1.50,'Schrauben','Silber/Eisen');
/*!40000 ALTER TABLE `produktarchiv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produktgleich`
--

DROP TABLE IF EXISTS `produktgleich`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produktgleich` (
  `produkt` varchar(30) COLLATE latin1_german1_ci DEFAULT NULL,
  `beschreibung` varchar(30) COLLATE latin1_german1_ci DEFAULT NULL,
  `marktbewertung` tinyint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produktgleich`
--

LOCK TABLES `produktgleich` WRITE;
/*!40000 ALTER TABLE `produktgleich` DISABLE KEYS */;
INSERT INTO `produktgleich` VALUES ('Schraube 1','3x20',1),('Schraube 1','3x20',1),('Schraube 1','3x20',2),('Schraube 2','5x30',2),('Schraube 2','5x30',2),('Schraube 2','5x30',2);
/*!40000 ALTER TABLE `produktgleich` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produktleerzeichen`
--

DROP TABLE IF EXISTS `produktleerzeichen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produktleerzeichen` (
  `artikelid` int NOT NULL,
  `artikelbezeichnung` varchar(300) COLLATE latin1_german1_ci DEFAULT NULL,
  `preis` decimal(8,2) DEFAULT NULL,
  `kategorie` varchar(200) COLLATE latin1_german1_ci DEFAULT NULL,
  `legierung` varchar(300) COLLATE latin1_german1_ci DEFAULT NULL,
  PRIMARY KEY (`artikelid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produktleerzeichen`
--

LOCK TABLES `produktleerzeichen` WRITE;
/*!40000 ALTER TABLE `produktleerzeichen` DISABLE KEYS */;
INSERT INTO `produktleerzeichen` VALUES (1,'      Schraube 1',2.56,'Schrauben','      Zink/Eisen    '),(2,'Schraube 2        ',2.30,'Schrauben','    Kupfer/Eisen'),(3,'      Schraube 3      ',2.21,'Schrauben','Nickel/Eisen    '),(4,'	Schraube 4',2.11,'Schrauben','    Gold/Eisen'),(5,'	Schraube 5	',1.50,'Schrauben','    Silber/Eisen    ');
/*!40000 ALTER TABLE `produktleerzeichen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qualglobal`
--

DROP TABLE IF EXISTS `qualglobal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qualglobal` (
  `qid` int NOT NULL,
  `bezeichnung` varchar(500) COLLATE latin1_german1_ci DEFAULT NULL,
  `kuerzel` varchar(4) COLLATE latin1_german1_ci DEFAULT NULL,
  `kategorie` varchar(200) COLLATE latin1_german1_ci DEFAULT NULL,
  PRIMARY KEY (`qid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qualglobal`
--

LOCK TABLES `qualglobal` WRITE;
/*!40000 ALTER TABLE `qualglobal` DISABLE KEYS */;
INSERT INTO `qualglobal` VALUES (1,'Datenbankprogrammierung','DBE','Informatik'),(2,'Second Level Helpdesk','SLS','Informatik'),(3,'First Level Helpdesk','FLH','Informatik'),(4,'SAP Help Desk','SHD','Office'),(5,'Excel','EXC','Office'),(6,'Word','WOR','Office'),(7,'Power Point','POW','Office');
/*!40000 ALTER TABLE `qualglobal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qualglobalarchiv`
--

DROP TABLE IF EXISTS `qualglobalarchiv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qualglobalarchiv` (
  `qid` int NOT NULL,
  `bezeichnung` varchar(500) COLLATE latin1_german1_ci DEFAULT NULL,
  `kuerzel` varchar(4) COLLATE latin1_german1_ci DEFAULT NULL,
  `kategorie` varchar(200) COLLATE latin1_german1_ci DEFAULT NULL,
  PRIMARY KEY (`qid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qualglobalarchiv`
--

LOCK TABLES `qualglobalarchiv` WRITE;
/*!40000 ALTER TABLE `qualglobalarchiv` DISABLE KEYS */;
/*!40000 ALTER TABLE `qualglobalarchiv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qualifikationen`
--

DROP TABLE IF EXISTS `qualifikationen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qualifikationen` (
  `qid` int NOT NULL AUTO_INCREMENT,
  `bezeichnung` varchar(500) COLLATE latin1_german1_ci DEFAULT NULL,
  `kuerzel` varchar(4) COLLATE latin1_german1_ci DEFAULT NULL,
  `kategorie` varchar(200) COLLATE latin1_german1_ci DEFAULT NULL,
  PRIMARY KEY (`qid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qualifikationen`
--

LOCK TABLES `qualifikationen` WRITE;
/*!40000 ALTER TABLE `qualifikationen` DISABLE KEYS */;
INSERT INTO `qualifikationen` VALUES (1,'SQL','ITE','Informatik'),(2,'Sys-Admin','ADA','Support'),(3,'Projektleitung',NULL,NULL),(4,'Projektleitung',NULL,NULL);
/*!40000 ALTER TABLE `qualifikationen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sachpraemie`
--

DROP TABLE IF EXISTS `sachpraemie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sachpraemie` (
  `praemieid` int NOT NULL,
  `praemie` varchar(300) COLLATE latin1_german1_ci DEFAULT NULL,
  `grund` varchar(40) COLLATE latin1_german1_ci DEFAULT NULL,
  `preis` decimal(5,2) DEFAULT NULL,
  `mitarbeiterid` int DEFAULT NULL,
  PRIMARY KEY (`praemieid`),
  KEY `foreign_key` (`mitarbeiterid`),
  CONSTRAINT `foreign_key` FOREIGN KEY (`mitarbeiterid`) REFERENCES `mitarbeiter` (`mitarbeiterid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sachpraemie`
--

LOCK TABLES `sachpraemie` WRITE;
/*!40000 ALTER TABLE `sachpraemie` DISABLE KEYS */;
INSERT INTO `sachpraemie` VALUES (1,'Goldende Uhr Typ 1','40 Jahre',500.00,5),(2,'Goldende Uhr Typ 2','30 Jahre',300.00,5),(3,'Goldende Uhr Typ 3','20 Jahre',200.00,5),(4,'Goldende Uhr Typ 1','40 Jahre',500.00,10),(5,'Goldende Uhr Typ 2','30 Jahre',300.00,10),(6,'Goldende Uhr Typ 3','20 Jahre',200.00,10),(7,'Goldende Uhr Typ 4','10 Jahre',178.00,8),(8,'Goldende Uhr Typ 4','10 Jahre',178.00,8),(9,'Goldende Uhr Typ 3','5 Jahre',200.00,11);
/*!40000 ALTER TABLE `sachpraemie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `steuerklasse`
--

DROP TABLE IF EXISTS `steuerklasse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `steuerklasse` (
  `steuerklasseid` smallint NOT NULL,
  `steuerklasse` varchar(60) COLLATE latin1_german1_ci DEFAULT NULL,
  `steuerklassezahl` varchar(1) COLLATE latin1_german1_ci DEFAULT NULL,
  `infosteuerklasse` varchar(3000) COLLATE latin1_german1_ci DEFAULT NULL,
  PRIMARY KEY (`steuerklasseid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `steuerklasse`
--

LOCK TABLES `steuerklasse` WRITE;
/*!40000 ALTER TABLE `steuerklasse` DISABLE KEYS */;
INSERT INTO `steuerklasse` VALUES (1,'Steuerklasse 1','1','Ledig, oder in einer Lebensgemeinschaft'),(2,'Steuerklasse 2','2','Alleinerziehend'),(3,'Steuerklasse 3','3','Verheiratet, ein Ehepartner ist nicht berufstätig'),(4,'Steuerklasse 4','4','Verheiratet, beide Ehepartner sind berufstätig'),(5,'Steuerklasse 5','5','Verheiratet, beide Ehepartner sind berufstätig, es wurden die Steuerklassen 3 und 5 gewählt'),(6,'Steuerklasse 6','6','Der Arbeitnehmer ist führ mehrere Arbeitgeber tätig');
/*!40000 ALTER TABLE `steuerklasse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `umsatz`
--

DROP TABLE IF EXISTS `umsatz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `umsatz` (
  `quartal` smallint NOT NULL,
  `umsatz` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`quartal`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `umsatz`
--

LOCK TABLES `umsatz` WRITE;
/*!40000 ALTER TABLE `umsatz` DISABLE KEYS */;
INSERT INTO `umsatz` VALUES (1,5455000.23),(2,12678000.50),(3,2160000.83),(4,17566000.78);
/*!40000 ALTER TABLE `umsatz` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `umsatz2`
--

DROP TABLE IF EXISTS `umsatz2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `umsatz2` (
  `jahr` int NOT NULL,
  `quartal` int NOT NULL,
  `monat` int NOT NULL,
  `umsatz` decimal(12,2) DEFAULT NULL,
  PRIMARY KEY (`jahr`,`quartal`,`monat`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `umsatz2`
--

LOCK TABLES `umsatz2` WRITE;
/*!40000 ALTER TABLE `umsatz2` DISABLE KEYS */;
INSERT INTO `umsatz2` VALUES (2000,1,1,200000.00),(2000,1,2,340000.00),(2000,1,3,500000.00),(2000,2,4,60000000.00),(2000,2,5,450000.00),(2000,2,6,80000000.00),(2000,3,7,430000.00),(2000,3,8,200000.00),(2000,3,9,6890000.00),(2000,4,10,4500.00),(2000,4,11,6000000.00),(2000,4,12,8500000.00);
/*!40000 ALTER TABLE `umsatz2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `umsatzausgaben`
--

DROP TABLE IF EXISTS `umsatzausgaben`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `umsatzausgaben` (
  `id` int NOT NULL,
  `jahr` int DEFAULT NULL,
  `q1` decimal(15,3) DEFAULT NULL,
  `q2` decimal(15,3) DEFAULT NULL,
  `q3` decimal(15,3) DEFAULT NULL,
  `q4` decimal(15,3) DEFAULT NULL,
  `miete` decimal(10,3) DEFAULT NULL,
  `nebkosten` decimal(10,3) DEFAULT NULL,
  `personal` decimal(10,3) DEFAULT NULL,
  `invest` decimal(10,3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `umsatzausgaben`
--

LOCK TABLES `umsatzausgaben` WRITE;
/*!40000 ALTER TABLE `umsatzausgaben` DISABLE KEYS */;
INSERT INTO `umsatzausgaben` VALUES (1,2000,223000.890,148217.210,210000.530,267832.640,400000.000,100000.000,500000.000,5000000.000),(2,2001,275000.110,150716.440,222893.210,199054.210,400500.000,122000.000,550000.000,500000.000),(3,2002,298000.340,210898.210,318055.440,320780.940,401600.000,130000.000,600000.000,800000.000),(4,2003,270456.320,201888.340,343567.210,301298.890,4025000.000,140000.000,650000.000,900000.000);
/*!40000 ALTER TABLE `umsatzausgaben` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `urlaub`
--

DROP TABLE IF EXISTS `urlaub`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `urlaub` (
  `urlaubid` int NOT NULL,
  `urlaubstage` smallint DEFAULT NULL,
  `urlaubgenommen` smallint DEFAULT NULL,
  `mitarbeiterid` int DEFAULT NULL,
  PRIMARY KEY (`urlaubid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `urlaub`
--

LOCK TABLES `urlaub` WRITE;
/*!40000 ALTER TABLE `urlaub` DISABLE KEYS */;
INSERT INTO `urlaub` VALUES (1,40,15,1),(2,40,20,2),(3,40,28,3),(4,40,2,4),(5,40,14,5),(6,40,20,6),(7,40,26,7),(8,40,25,8),(9,40,30,9),(10,40,11,10),(11,40,39,11),(12,40,28,12),(13,40,32,13),(14,40,32,14),(15,40,32,15),(16,40,36,16),(17,40,23,17),(18,40,23,18),(19,40,24,19),(20,40,12,20),(21,40,24,21),(22,40,25,22),(23,40,32,23),(24,40,21,24),(25,40,25,25),(26,40,27,26),(27,40,22,27),(28,40,29,28),(29,40,22,29),(30,40,22,30),(31,40,40,31),(32,40,36,32),(33,40,22,33),(34,40,35,34),(35,40,14,35),(36,40,18,36),(37,40,22,37),(38,40,36,38),(39,40,22,39),(40,40,18,40),(41,40,28,41),(42,40,15,42),(43,40,37,43),(44,40,37,44),(45,43,40,45),(46,20,40,46);
/*!40000 ALTER TABLE `urlaub` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wohnort_c`
--

DROP TABLE IF EXISTS `wohnort_c`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wohnort_c` (
  `idadresse` int NOT NULL,
  `strasse` varchar(120) COLLATE latin1_german1_ci DEFAULT NULL,
  `hausnummer` varchar(120) COLLATE latin1_german1_ci DEFAULT NULL,
  `plz` int DEFAULT NULL,
  `ort` varchar(120) COLLATE latin1_german1_ci DEFAULT NULL,
  `auszubildenderid` int DEFAULT NULL,
  PRIMARY KEY (`idadresse`),
  KEY `auszubildenderid_FK2` (`auszubildenderid`),
  CONSTRAINT `auszubildenderid_FK2` FOREIGN KEY (`auszubildenderid`) REFERENCES `auszubildender_c` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wohnort_c`
--

LOCK TABLES `wohnort_c` WRITE;
/*!40000 ALTER TABLE `wohnort_c` DISABLE KEYS */;
INSERT INTO `wohnort_c` VALUES (1,'Plutostraße','8A',50000,'Bonn',1),(2,'Marsstraße','757C',50000,'Köln',2),(3,'Mondstraße','3',50000,'Bonn',NULL),(4,'Mondstraße','3',50000,'Bonn',3),(5,'Sonnestraße','8',50000,'Bonn',5),(6,'Sternstraße','54',51000,'Köln',4),(7,'Komentenweg','33',50000,'Bonn',5);
/*!40000 ALTER TABLE `wohnort_c` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wohnort_d`
--

DROP TABLE IF EXISTS `wohnort_d`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wohnort_d` (
  `idadresse` int NOT NULL,
  `strasse` varchar(120) COLLATE latin1_german1_ci DEFAULT NULL,
  `hausnummer` varchar(120) COLLATE latin1_german1_ci DEFAULT NULL,
  `plz` int DEFAULT NULL,
  `ort` varchar(120) COLLATE latin1_german1_ci DEFAULT NULL,
  `auszubildenderid` int DEFAULT NULL,
  PRIMARY KEY (`idadresse`),
  KEY `auszubildenderid_FK3` (`auszubildenderid`),
  CONSTRAINT `auszubildenderid_FK3` FOREIGN KEY (`auszubildenderid`) REFERENCES `auszubildender_d` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wohnort_d`
--

LOCK TABLES `wohnort_d` WRITE;
/*!40000 ALTER TABLE `wohnort_d` DISABLE KEYS */;
INSERT INTO `wohnort_d` VALUES (1,'Plutostraße','8A',50000,'Bonn',1),(2,'Marsstraße','757C',50000,'Köln',2),(3,'Mondstraße','3',50000,'Bonn',NULL),(4,'Mondstraße','3',50000,'Bonn',3),(5,'Sonnestraße','8',50000,'Bonn',5),(6,'Sternstraße','54',51000,'Köln',4),(7,'Komentenweg','33',50000,'Bonn',5);
/*!40000 ALTER TABLE `wohnort_d` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zutaten`
--

DROP TABLE IF EXISTS `zutaten`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zutaten` (
  `zutatenid` int NOT NULL,
  `zutat` varchar(300) COLLATE latin1_german1_ci DEFAULT NULL,
  PRIMARY KEY (`zutatenid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zutaten`
--

LOCK TABLES `zutaten` WRITE;
/*!40000 ALTER TABLE `zutaten` DISABLE KEYS */;
INSERT INTO `zutaten` VALUES (1,'Zitronensaft'),(2,'Honig'),(3,'Apfelsirup'),(4,'Orangensirup'),(5,'Waldmeistersirup'),(6,'Kirschsirup'),(7,'Wasser'),(8,'Gelatine'),(9,'Speisestärke');
/*!40000 ALTER TABLE `zutaten` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zutatenarchiv`
--

DROP TABLE IF EXISTS `zutatenarchiv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zutatenarchiv` (
  `zutatenid` int NOT NULL,
  `zutat` varchar(300) COLLATE latin1_german1_ci DEFAULT NULL,
  PRIMARY KEY (`zutatenid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zutatenarchiv`
--

LOCK TABLES `zutatenarchiv` WRITE;
/*!40000 ALTER TABLE `zutatenarchiv` DISABLE KEYS */;
INSERT INTO `zutatenarchiv` VALUES (5,'Waldmeistersirup'),(6,'Kirschsirup'),(7,'Wasser'),(8,'Gelatine'),(9,'Speisestärke'),(20,'Senfsirup'),(21,'Pfeffersirup'),(33,'Kohlrabisirup'),(41,'Grühnkohlsirup'),(53,'Sauerkrautsirup'),(65,'Blumenkohlsirup'),(70,'Wirsingsirup'),(82,'Rotkohlsirup'),(91,'Weißkohlsirup');
/*!40000 ALTER TABLE `zutatenarchiv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `mitarbeiterkrankenkasse`
--

/*!50001 DROP VIEW IF EXISTS `mitarbeiterkrankenkasse`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `mitarbeiterkrankenkasse` AS select `m`.`mitarbeiterid` AS `mitarbeiterid`,`m`.`name` AS `name`,`m`.`vorname` AS `vorname`,`k`.`krankenkasse` AS `krankenkasse`,`k`.`beitragssatz` AS `beitragssatz` from (`mitarbeiter2` `m` join `krankenkasse` `k` on((`m`.`krankenkassenid` = `k`.`krankenkassenid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-08-18 12:29:07

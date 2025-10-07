-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: cddatenbank
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
-- Table structure for table `cd`
--

DROP TABLE IF EXISTS `cd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cd` (
  `CDNr` int NOT NULL AUTO_INCREMENT,
  `CDName` varchar(100) NOT NULL,
  `InterpretNr` int DEFAULT NULL,
  `Musikrichtung` int DEFAULT NULL,
  PRIMARY KEY (`CDNr`),
  KEY `InterpretNr` (`InterpretNr`),
  KEY `Musikrichtung` (`Musikrichtung`),
  CONSTRAINT `cd_ibfk_1` FOREIGN KEY (`InterpretNr`) REFERENCES `interpreten` (`InterpretID`),
  CONSTRAINT `cd_ibfk_2` FOREIGN KEY (`Musikrichtung`) REFERENCES `musikrichtung` (`MRID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cd`
--

LOCK TABLES `cd` WRITE;
/*!40000 ALTER TABLE `cd` DISABLE KEYS */;
INSERT INTO `cd` VALUES (1,'Greatest Hits',1,1),(2,'25',2,2),(3,'Master of Puppets',3,3);
/*!40000 ALTER TABLE `cd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interpreten`
--

DROP TABLE IF EXISTS `interpreten`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `interpreten` (
  `InterpretID` int NOT NULL AUTO_INCREMENT,
  `Interpret` varchar(100) NOT NULL,
  PRIMARY KEY (`InterpretID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interpreten`
--

LOCK TABLES `interpreten` WRITE;
/*!40000 ALTER TABLE `interpreten` DISABLE KEYS */;
INSERT INTO `interpreten` VALUES (1,'Queen'),(2,'Adele'),(3,'Metallica');
/*!40000 ALTER TABLE `interpreten` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `musikrichtung`
--

DROP TABLE IF EXISTS `musikrichtung`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `musikrichtung` (
  `MRID` int NOT NULL AUTO_INCREMENT,
  `Musikrichtung` varchar(50) NOT NULL,
  PRIMARY KEY (`MRID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `musikrichtung`
--

LOCK TABLES `musikrichtung` WRITE;
/*!40000 ALTER TABLE `musikrichtung` DISABLE KEYS */;
INSERT INTO `musikrichtung` VALUES (1,'Rock'),(2,'Pop'),(3,'Metal');
/*!40000 ALTER TABLE `musikrichtung` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `titel`
--

DROP TABLE IF EXISTS `titel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `titel` (
  `TitelNr` int NOT NULL AUTO_INCREMENT,
  `Titel` varchar(100) NOT NULL,
  `CDNr` int DEFAULT NULL,
  `IntNr` int DEFAULT NULL,
  `Beurteilung` decimal(2,1) DEFAULT NULL,
  PRIMARY KEY (`TitelNr`),
  KEY `CDNr` (`CDNr`),
  KEY `IntNr` (`IntNr`),
  CONSTRAINT `titel_ibfk_1` FOREIGN KEY (`CDNr`) REFERENCES `cd` (`CDNr`),
  CONSTRAINT `titel_ibfk_2` FOREIGN KEY (`IntNr`) REFERENCES `interpreten` (`InterpretID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `titel`
--

LOCK TABLES `titel` WRITE;
/*!40000 ALTER TABLE `titel` DISABLE KEYS */;
INSERT INTO `titel` VALUES (1,'Bohemian Rhapsody',1,1,5.0),(2,'Another One Bites The Dust',1,1,4.5),(3,'Hello',2,2,4.8),(4,'Battery',3,3,4.7);
/*!40000 ALTER TABLE `titel` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-10-06 10:18:44

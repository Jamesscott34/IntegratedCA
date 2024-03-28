-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: management
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students` (
  `StudentID` int NOT NULL AUTO_INCREMENT,
  `StudentName` varchar(255) NOT NULL,
  `ProgrammeID` int NOT NULL,
  PRIMARY KEY (`StudentID`),
  KEY `ProgrammeID` (`ProgrammeID`),
  CONSTRAINT `students_ibfk_1` FOREIGN KEY (`ProgrammeID`) REFERENCES `programmes` (`ProgrammeID`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (1,'Alice Smith',1),(2,'Bob Johnson',1),(3,'Charlie Brown',2),(4,'Diana Wilson',2),(5,'Emma Davis',3),(6,'Frank Martinez',3),(7,'Grace Taylor',4),(8,'Henry Anderson',4),(9,'Isabella Thomas',5),(10,'Jack Garcia',5),(11,'Katherine Martinez',6),(12,'Liam Robinson',6),(13,'Mia Clark',7),(14,'Noah Lee',7),(15,'Olivia Hernandez',8),(16,'Patrick Lewis',8),(17,'Quinn Walker',9),(18,'Ryan Hall',9),(19,'Sophia Perez',10),(20,'Thomas Moore',10),(21,'Uma King',11),(22,'Victor Green',11),(23,'Willow Adams',12),(24,'Xavier Mitchell',12),(25,'Yara Hill',13),(26,'Zachary Turner',13),(27,'Abigail Carter',14),(28,'Benjamin Baker',14),(29,'Charlotte White',15),(30,'Daniel Young',15),(31,'Ella Rodriguez',16),(32,'Finn Foster',16),(33,'Gabriella Sanchez',17),(34,'Henry Nguyen',17),(35,'Isaac Rivera',18),(36,'Jasmine Cox',18),(37,'Kai Stewart',19),(38,'Lily Brooks',19),(39,'Matthew Ramirez',20),(40,'Natalie Reed',20),(41,'Oliver Scott',21),(42,'Penelope Ward',21),(43,'Quincy Martinez',22),(44,'Riley Brown',22),(45,'Sophie Evans',23),(46,'Theodore Perez',23),(47,'Uma Roberts',24),(48,'Vincent Baker',24),(49,'Willa Torres',25),(50,'Xavier Wright',25);
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-28 20:24:21

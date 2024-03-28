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
-- Table structure for table `programmes`
--

DROP TABLE IF EXISTS `programmes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `programmes` (
  `ProgrammeID` int NOT NULL AUTO_INCREMENT,
  `ProgrammeName` varchar(255) NOT NULL,
  PRIMARY KEY (`ProgrammeID`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `programmes`
--

LOCK TABLES `programmes` WRITE;
/*!40000 ALTER TABLE `programmes` DISABLE KEYS */;
INSERT INTO `programmes` VALUES (1,'Computer Science'),(2,'Mechanical Engineering'),(3,'Electrical Engineering'),(4,'Civil Engineering'),(5,'Chemical Engineering'),(6,'Physics'),(7,'Mathematics'),(8,'Biology'),(9,'Chemistry'),(10,'Psychology'),(11,'Economics'),(12,'Business Administration'),(13,'English Literature'),(14,'History'),(15,'Sociology'),(16,'Political Science'),(17,'Art History'),(18,'Music'),(19,'Film Studies'),(20,'Environmental Science'),(21,'Geology'),(22,'Philosophy'),(23,'Anthropology'),(24,'Architecture'),(25,'Nursing'),(26,'Medicine'),(27,'Dentistry'),(28,'Veterinary Science'),(29,'Law'),(30,'Education'),(31,'Linguistics'),(32,'Communication'),(33,'Information Technology'),(34,'Graphic Design'),(35,'Fashion Design'),(36,'Culinary Arts'),(37,'Hospitality Management'),(38,'Agriculture'),(39,'Forestry'),(40,'Urban Planning'),(41,'Public Health'),(42,'International Relations'),(43,'Finance'),(44,'Marketing'),(45,'Human Resources'),(46,'Nutrition'),(47,'Physics'),(48,'Statistics');
/*!40000 ALTER TABLE `programmes` ENABLE KEYS */;
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

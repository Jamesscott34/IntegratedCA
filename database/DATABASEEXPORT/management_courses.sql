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
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courses` (
  `CourseID` int NOT NULL AUTO_INCREMENT,
  `CourseName` varchar(255) NOT NULL,
  `ProgrammeID` int NOT NULL,
  `LecturerID` int NOT NULL,
  `Room` varchar(50) NOT NULL,
  PRIMARY KEY (`CourseID`),
  KEY `ProgrammeID` (`ProgrammeID`),
  KEY `LecturerID` (`LecturerID`),
  CONSTRAINT `courses_ibfk_1` FOREIGN KEY (`ProgrammeID`) REFERENCES `programmes` (`ProgrammeID`),
  CONSTRAINT `courses_ibfk_2` FOREIGN KEY (`LecturerID`) REFERENCES `lecturer` (`Lecturer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES (1,'Introduction to Programming',1,1,'Room 101'),(2,'Data Structures and Algorithms',1,2,'Room 102'),(3,'Database Management Systems',1,3,'Room 103'),(4,'Computer Networks',1,4,'Room 104'),(5,'Software Engineering',1,5,'Room 105'),(6,'Introduction to Mechanical Engineering',2,6,'Room 201'),(7,'Thermodynamics',2,7,'Room 202'),(8,'Fluid Mechanics',2,8,'Room 203'),(9,'Introduction to Electrical Engineering',3,9,'Room 204'),(10,'Circuit Theory',3,10,'Room 205'),(11,'Digital Electronics',3,11,'Room 206'),(12,'Power Systems',3,12,'Room 207'),(13,'Control Systems',3,13,'Room 208'),(14,'Introduction to Civil Engineering',4,14,'Room 209'),(15,'Structural Analysis',4,15,'Room 210'),(16,'Geotechnical Engineering',4,16,'Room 211'),(17,'Transportation Engineering',4,17,'Room 212'),(18,'Environmental Engineering',4,18,'Room 213'),(19,'Introduction to Chemical Engineering',5,19,'Room 214'),(20,'Chemical Reaction Engineering',5,20,'Room 215'),(21,'Process Control',5,21,'Room 216'),(22,'Heat Transfer',5,22,'Room 217'),(23,'Mass Transfer',5,23,'Room 218'),(24,'Introduction to Physics',6,24,'Room 219'),(25,'Classical Mechanics',6,25,'Room 220'),(26,'Quantum Mechanics',6,26,'Room 221'),(27,'Thermal Physics',6,27,'Room 222'),(28,'Electromagnetism',6,28,'Room 223'),(29,'Introduction to Mathematics',7,29,'Room 224'),(30,'Calculus',7,30,'Room 225'),(31,'Linear Algebra',7,31,'Room 226'),(32,'Probability Theory',7,32,'Room 227'),(33,'Discrete Mathematics',7,33,'Room 228'),(34,'Introduction to Biology',8,34,'Room 229'),(35,'Cell Biology',8,35,'Room 230'),(36,'Genetics',8,36,'Room 231'),(37,'Ecology',8,37,'Room 232'),(38,'Evolutionary Biology',8,38,'Room 233'),(39,'Introduction to Chemistry',9,39,'Room 234'),(40,'Organic Chemistry',9,40,'Room 235'),(41,'Inorganic Chemistry',9,41,'Room 236'),(42,'Physical Chemistry',9,42,'Room 237'),(43,'Analytical Chemistry',9,43,'Room 238'),(44,'Introduction to Psychology',10,44,'Room 239'),(45,'Developmental Psychology',10,45,'Room 240');
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-28 20:24:22

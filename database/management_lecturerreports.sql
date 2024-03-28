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
-- Table structure for table `lecturerreports`
--

DROP TABLE IF EXISTS `lecturerreports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lecturerreports` (
  `LecturerreportsID` int NOT NULL AUTO_INCREMENT,
  `LecturerID` int DEFAULT NULL,
  `CourseID` int DEFAULT NULL,
  `StudentID` int DEFAULT NULL,
  `EnrollmentID` int DEFAULT NULL,
  `Grade` decimal(4,2) DEFAULT NULL,
  `LecturerFeedbackText` text,
  `Room` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`LecturerreportsID`),
  KEY `LecturerID` (`LecturerID`),
  KEY `CourseID` (`CourseID`),
  KEY `StudentID` (`StudentID`),
  KEY `EnrollmentID` (`EnrollmentID`),
  CONSTRAINT `lecturerreports_ibfk_1` FOREIGN KEY (`LecturerID`) REFERENCES `lecturer` (`Lecturer_id`),
  CONSTRAINT `lecturerreports_ibfk_2` FOREIGN KEY (`CourseID`) REFERENCES `courses` (`CourseID`),
  CONSTRAINT `lecturerreports_ibfk_3` FOREIGN KEY (`StudentID`) REFERENCES `students` (`StudentID`),
  CONSTRAINT `lecturerreports_ibfk_4` FOREIGN KEY (`EnrollmentID`) REFERENCES `enrollments` (`EnrollmentID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lecturerreports`
--

LOCK TABLES `lecturerreports` WRITE;
/*!40000 ALTER TABLE `lecturerreports` DISABLE KEYS */;
INSERT INTO `lecturerreports` VALUES (1,1,1,1,1,90.00,'Excellent student','Room101'),(2,2,2,2,2,85.00,'Hardworking and dedicated','Room201'),(3,3,3,3,3,88.00,'Active participation in class discussions','Room301');
/*!40000 ALTER TABLE `lecturerreports` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-28 18:06:31

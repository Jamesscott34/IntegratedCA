-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: collegemanagementsystem
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
  `Programme` varchar(255) NOT NULL,
  PRIMARY KEY (`StudentID`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (1,'Alice','Computer Science'),(2,'Bob','Computer Science'),(3,'Charlie','Computer Science'),(4,'David','Computer Science'),(5,'Emma','Computer Science'),(6,'Frank','Computer Science'),(7,'Grace','Computer Science'),(8,'Henry','Computer Science'),(9,'Ivy','Computer Science'),(10,'Jack','Computer Science'),(11,'Katie','Computer Science'),(12,'Liam','Computer Science'),(13,'Mia','Computer Science'),(14,'Noah','Computer Science'),(15,'Olivia','Computer Science'),(16,'Sophia','Computer Science'),(17,'William','Computer Science'),(18,'Ava','Computer Science'),(19,'Ethan','Computer Science'),(20,'Amelia','Computer Science'),(21,'James','Computer Science'),(22,'Isabella','Computer Science'),(23,'Alexander','Computer Science'),(24,'Abigail','Computer Science'),(25,'Michael','Computer Science'),(26,'Emily','Computer Science'),(27,'Benjamin','Computer Science'),(28,'Charlotte','Computer Science'),(29,'Daniel','Computer Science'),(30,'Harper','Computer Science'),(31,'Matthew','Computer Science'),(32,'Ella','Computer Science'),(33,'Jackson','Computer Science'),(34,'Scarlett','Computer Science'),(35,'Lucas','Computer Science'),(36,'Avery','Computer Science'),(37,'Logan','Computer Science'),(38,'Mila','Computer Science'),(39,'Oliver','Computer Science'),(40,'Lily','Computer Science'),(41,'Elijah','Computer Science'),(42,'Aria','Computer Science'),(43,'Jacob','Computer Science'),(44,'Sofia','Computer Science'),(45,'Sebastian','Computer Science'),(46,'Luna','Computer Science'),(47,'Carter','Computer Science'),(48,'Chloe','Computer Science'),(49,'Wyatt','Computer Science'),(50,'Layla','Computer Science');
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

-- Dump completed on 2024-03-17 23:46:54

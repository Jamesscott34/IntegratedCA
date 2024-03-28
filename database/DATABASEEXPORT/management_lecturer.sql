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
-- Table structure for table `lecturer`
--

DROP TABLE IF EXISTS `lecturer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lecturer` (
  `Lecturer_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `role` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Lecturer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lecturer`
--

LOCK TABLES `lecturer` WRITE;
/*!40000 ALTER TABLE `lecturer` DISABLE KEYS */;
INSERT INTO `lecturer` VALUES (1,'JohnSmith','password1','Lecturer'),(2,'SarahJohnson','password2','Lecturer'),(3,'MichaelWilliams','password3','Lecturer'),(4,'EmilyJones','password4','Lecturer'),(5,'DanielBrown','password5','Lecturer'),(6,'JessicaDavis','password6','Lecturer'),(7,'MatthewMiller','password7','Lecturer'),(8,'AshleyWilson','password8','Lecturer'),(9,'ChristopherMoore','password9','Lecturer'),(10,'AmandaTaylor','password10','Lecturer'),(11,'DavidAnderson','password11','Lecturer'),(12,'SamanthaThomas','password12','Lecturer'),(13,'JamesJackson','password13','Lecturer'),(14,'ElizabethWhite','password14','Lecturer'),(15,'JoshuaHarris','password15','Lecturer'),(16,'LaurenMartin','password16','Lecturer'),(17,'AndrewThompson','password17','Lecturer'),(18,'RachelGarcia','password18','Lecturer'),(19,'NicholasMartinez','password19','Lecturer'),(20,'MeganRobinson','password20','Lecturer'),(21,'RyanClark','password21','Lecturer'),(22,'KimberlyLewis','password22','Lecturer'),(23,'BrandonLee','password23','Lecturer'),(24,'StephanieHall','password24','Lecturer'),(25,'JustinYoung','password25','Lecturer'),(26,'BrittanyAllen','password26','Lecturer'),(27,'KevinKing','password27','Lecturer'),(28,'TaylorScott','password28','Lecturer'),(29,'BenjaminGreen','password29','Lecturer'),(30,'HaleyCarter','password30','Lecturer'),(31,'AlexanderHill','password31','Lecturer'),(32,'OliviaAdams','password32','Lecturer'),(33,'JonathanTurner','password33','Lecturer'),(34,'KaylaWright','password34','Lecturer'),(35,'ZacharyPhillips','password35','Lecturer'),(36,'VictoriaTorres','password36','Lecturer'),(37,'PatrickNguyen','password37','Lecturer'),(38,'NataliePerez','password38','Lecturer'),(39,'JacobReyes','password39','Lecturer'),(40,'NicoleEvans','password40','Lecturer'),(41,'SamuelStewart','password41','Lecturer'),(42,'DanielleMurphy','password42','Lecturer'),(43,'TylerRivera','password43','Lecturer'),(44,'EricaCook','password44','Lecturer'),(45,'WilliamBailey','password45','Lecturer'),(46,'ShannonReed','password46','Lecturer'),(47,'BrianWard','password47','Lecturer'),(48,'MorganBell','password48','Lecturer'),(49,'TimothySanchez','password49','Lecturer'),(50,'LisaPrice','password50','Lecturer');
/*!40000 ALTER TABLE `lecturer` ENABLE KEYS */;
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

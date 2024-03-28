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
-- Table structure for table `office`
--

DROP TABLE IF EXISTS `office`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `office` (
  `Office_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `role` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Office_id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `office`
--

LOCK TABLES `office` WRITE;
/*!40000 ALTER TABLE `office` DISABLE KEYS */;
INSERT INTO `office` VALUES (1,'AliceJohnson','password1','Office'),(2,'PeterSmith','password2','Office'),(3,'RachelWong','password3','Office'),(4,'MichaelBrown','password4','Office'),(5,'JenniferDavis','password5','Office'),(6,'AlexMiller','password6','Office'),(7,'EmilyWilson','password7','Office'),(8,'ChristopherLee','password8','Office'),(9,'SarahGarcia','password9','Office'),(10,'DavidTaylor','password10','Office'),(11,'JessicaMartinez','password11','Office'),(12,'DanielThompson','password12','Office'),(13,'LaurenHernandez','password13','Office'),(14,'MatthewClark','password14','Office'),(15,'AshleyLopez','password15','Office'),(16,'AndrewHill','password16','Office'),(17,'AmandaYoung','password17','Office'),(18,'JamesPerez','password18','Office'),(19,'OliviaLewis','password19','Office'),(20,'JoshuaNguyen','password20','Office'),(21,'SamanthaKing','password21','Office'),(22,'RyanScott','password22','Office'),(23,'ElizabethGreen','password23','Office'),(24,'NicholasHall','password24','Office'),(25,'TaylorAdams','password25','Office'),(26,'BenjaminThomas','password26','Office'),(27,'MeganWhite','password27','Office'),(28,'KevinRodriguez','password28','Office'),(29,'KimberlyMartinez','password29','Office'),(30,'BrandonLopez','password30','Office'),(31,'StephanieCook','password31','Office'),(32,'JonathanRivera','password32','Office'),(33,'KaylaMitchell','password33','Office'),(34,'ZacharyCarter','password34','Office'),(35,'VictoriaRoberts','password35','Office'),(36,'PatrickRamirez','password36','Office'),(37,'NatalieRussell','password37','Office'),(38,'JacobHughes','password38','Office'),(39,'NicoleSanders','password39','Office'),(40,'SamuelMorales','password40','Office');
/*!40000 ALTER TABLE `office` ENABLE KEYS */;
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

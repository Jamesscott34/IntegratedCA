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
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courses` (
  `CourseID` int NOT NULL AUTO_INCREMENT,
  `CourseName` varchar(255) NOT NULL,
  `Programme` varchar(255) NOT NULL,
  `Lecturer` varchar(255) NOT NULL,
  `Room` varchar(50) NOT NULL,
  PRIMARY KEY (`CourseID`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES (1,'Mathematics 101','Mathematics','lecturer1','Room A101'),(2,'Physics 101','Physics','lecturer2','Room B102'),(3,'Biology 101','Biology','lecturer3','Room C103'),(4,'Chemistry 101','Chemistry','lecturer4','Room D104'),(5,'Computer Science 101','Computer Science','lecturer5','Room E105'),(6,'Literature 101','Literature','lecturer6','Room F106'),(7,'History 101','History','lecturer7','Room G107'),(8,'Economics 101','Economics','lecturer8','Room H108'),(9,'Psychology 101','Psychology','lecturer9','Room I109'),(10,'Sociology 101','Sociology','lecturer10','Room J110'),(11,'Mathematics 102','Mathematics','lecturer1','Room A111'),(12,'Physics 102','Physics','lecturer2','Room B112'),(13,'Biology 102','Biology','lecturer3','Room C113'),(14,'Chemistry 102','Chemistry','lecturer4','Room D114'),(15,'Computer Science 102','Computer Science','lecturer5','Room E115'),(16,'Literature 102','Literature','lecturer6','Room F116'),(17,'History 102','History','lecturer7','Room G117'),(18,'Economics 102','Economics','lecturer8','Room H118'),(19,'Psychology 102','Psychology','lecturer9','Room I119'),(20,'Sociology 102','Sociology','lecturer10','Room J120'),(21,'Mathematics 110','Mathematics','lecturer1','Room A201'),(22,'Physics 110','Physics','lecturer2','Room B202'),(23,'Biology 110','Biology','lecturer3','Room C203'),(24,'Chemistry 110','Chemistry','lecturer4','Room D204'),(25,'Computer Science 110','Computer Science','lecturer5','Room E205'),(26,'Literature 110','Literature','lecturer6','Room F206'),(27,'History 110','History','lecturer7','Room G207'),(28,'Economics 110','Economics','lecturer8','Room H208'),(29,'Psychology 110','Psychology','lecturer9','Room I209'),(30,'Introduction to Programming','Computer Science','lecturer11','Room A101'),(31,'Data Structures and Algorithms','Computer Science','lecturer12','Room B102'),(32,'Object-Oriented Programming','Computer Science','lecturer13','Room C103'),(33,'Web Development','Computer Science','lecturer14','Room D104'),(34,'Database Management','Computer Science','lecturer15','Room E105'),(35,'Software Engineering','Computer Science','lecturer16','Room F106'),(36,'Computer Networks','Computer Science','lecturer17','Room G107'),(37,'Operating Systems','Computer Science','lecturer18','Room H108'),(38,'Artificial Intelligence','Computer Science','lecturer19','Room I109'),(39,'Cybersecurity','Computer Science','lecturer20','Room J110'),(40,'Python Programming','Computer Science','lecturer21','Room A111'),(41,'Java Programming','Computer Science','lecturer22','Room B112'),(42,'C++ Programming','Computer Science','lecturer23','Room C113'),(43,'JavaScript Programming','Computer Science','lecturer24','Room D114'),(44,'Ruby Programming','Computer Science','lecturer25','Room E115'),(45,'PHP Programming','Computer Science','lecturer26','Room F116'),(46,'Swift Programming','Computer Science','lecturer27','Room G117'),(47,'Kotlin Programming','Computer Science','lecturer28','Room H118'),(48,'R Programming','Computer Science','lecturer29','Room I119'),(49,'Go Programming','Computer Science','lecturer30','Room J120'),(50,'Scala Programming','Computer Science','lecturer31','Room A121'),(51,'Rust Programming','Computer Science','lecturer32','Room B122'),(52,'TypeScript Programming','Computer Science','lecturer33','Room C123'),(53,'Haskell Programming','Computer Science','lecturer34','Room D124'),(54,'Perl Programming','Computer Science','lecturer35','Room E125'),(55,'Lua Programming','Computer Science','lecturer36','Room F126'),(56,'Dart Programming','Computer Science','lecturer37','Room G127'),(57,'Matlab Programming','Computer Science','lecturer38','Room H128'),(58,'Clojure Programming','Computer Science','lecturer39','Room I129'),(59,'Julia Programming','Computer Science','lecturer40','Room J130'),(60,'Python Programming','Computer Science','lecturer22','Room A131'),(61,'Java Programming','Computer Science','lecturer32','Room B132'),(62,'C++ Programming','Computer Science','lecturer33','Room C133'),(63,'JavaScript Programming','Computer Science','lecturer24','Room D134'),(64,'Ruby Programming','Computer Science','lecturer5','Room E135'),(65,'PHP Programming','Computer Science','lecturer6','Room F136'),(66,'Swift Programming','Computer Science','lecturer7','Room G137'),(67,'Kotlin Programming','Computer Science','lecturer8','Room H138'),(68,'R Programming','Computer Science','lecturer4','Room I139'),(69,'Go Programming','Computer Science','lecturer40','Room J140'),(70,'Sociology 110','Sociology','lecturer10','Room J210');
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

-- Dump completed on 2024-03-17 23:46:54

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
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedback` (
  `FeedbackID` int NOT NULL AUTO_INCREMENT,
  `StudentID` int DEFAULT NULL,
  `CourseID` int DEFAULT NULL,
  `FeedbackText` text,
  PRIMARY KEY (`FeedbackID`),
  KEY `StudentID` (`StudentID`),
  KEY `CourseID` (`CourseID`),
  CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`StudentID`) REFERENCES `students` (`StudentID`),
  CONSTRAINT `feedback_ibfk_2` FOREIGN KEY (`CourseID`) REFERENCES `courses` (`CourseID`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
INSERT INTO `feedback` VALUES (1,1,1,'The course was well-structured and informative.'),(2,2,2,'The lecturer explained complex concepts clearly.'),(3,3,3,'I enjoyed the hands-on labs in this course.'),(4,4,4,'The course material was challenging but rewarding.'),(5,5,5,'I appreciated the practical applications covered in the course.'),(6,6,6,'The group projects helped me improve my teamwork skills.'),(7,7,7,'The course content was relevant to my field of study.'),(8,8,8,'The lecturer provided helpful feedback on assignments.'),(9,9,9,'I found the guest lectures insightful.'),(10,10,10,'The course encouraged critical thinking and problem-solving.'),(11,11,11,'The course introduced me to programming concepts effectively.'),(12,12,12,'I gained a deep understanding of data structures and algorithms.'),(13,13,13,'Object-oriented programming was taught in a clear and concise manner.'),(14,14,14,'The web development projects were engaging and practical.'),(15,15,15,'The database management assignments were challenging but valuable.'),(16,16,16,'Software engineering principles were well-covered in this course.'),(17,17,17,'I learned a lot about computer networks and their applications.'),(18,18,18,'Operating systems concepts were explained thoroughly.'),(19,19,19,'The artificial intelligence lectures were fascinating.'),(20,20,20,'Cybersecurity topics were presented in an engaging way.'),(21,21,21,'Python programming language is versatile and easy to learn.'),(22,22,22,'Java programming language is widely used and practical.'),(23,23,23,'C++ offers strong performance and control.'),(24,24,24,'JavaScript is essential for web development.'),(25,25,25,'Ruby programming language is elegant and enjoyable.'),(26,26,26,'PHP is great for web development.'),(27,27,27,'Swift programming language is ideal for iOS app development.'),(28,28,28,'Kotlin programming language is modern and concise.'),(29,29,29,'R programming language is excellent for data analysis.'),(30,30,30,'Go programming language is efficient and easy to use.'),(31,31,31,'Scala programming language assignments were interesting.'),(32,32,32,'I enjoyed learning Rust programming language.'),(33,33,33,'TypeScript made front-end development much more manageable.'),(34,34,34,'Haskell was a challenging but rewarding language to learn.'),(35,35,35,'Perl programming offered unique insights into scripting.'),(36,36,36,'Lua programming was fun and versatile.'),(37,37,37,'Dart programming language is great for building mobile apps.'),(38,38,38,'Matlab helped me gain insights into data analysis.'),(39,39,39,'Clojure provided a fresh perspective on functional programming.'),(40,40,40,'Julia programming language is powerful for scientific computing.'),(41,41,41,'Python programming language is versatile and easy to learn.'),(42,42,42,'Java programming language is widely used and practical.'),(43,43,43,'C++ offers strong performance and control.'),(44,44,44,'JavaScript is essential for web development.'),(45,45,45,'Ruby programming language is elegant and enjoyable.'),(46,46,46,'PHP is great for web development.'),(47,47,47,'Swift programming language is ideal for iOS app development.'),(48,48,48,'Kotlin programming language is modern and concise.'),(49,49,49,'R programming language is excellent for data analysis.'),(50,50,50,'Go programming language is efficient and easy to use.');
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-17 23:46:52

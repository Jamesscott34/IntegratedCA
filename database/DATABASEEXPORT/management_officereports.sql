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
-- Table structure for table `officereports`
--

DROP TABLE IF EXISTS `officereports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `officereports` (
  `OfficereportID` int NOT NULL AUTO_INCREMENT,
  `OfficeID` int DEFAULT NULL,
  `StudentID` int DEFAULT NULL,
  `CourseID` int DEFAULT NULL,
  `StudentFeedbackText` text,
  `Room` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`OfficereportID`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `officereports`
--

LOCK TABLES `officereports` WRITE;
/*!40000 ALTER TABLE `officereports` DISABLE KEYS */;
INSERT INTO `officereports` VALUES (1,1,1,1,'Great lecturer, very helpful','Room 101'),(2,2,2,2,'Enjoyed the course content','Room 102'),(3,3,3,3,'Well-organized lectures and materials','Room 103'),(4,4,4,4,'The instructor was knowledgeable and engaging','Room 104'),(5,5,5,5,'The course material was presented clearly','Room 105'),(6,6,6,6,'Excellent support from the teaching staff','Room 201'),(7,7,7,7,'Interactive classes made learning enjoyable','Room 202'),(8,8,8,8,'The course exceeded my expectations','Room 203'),(9,9,9,9,'The lecturer was responsive to questions','Room 204'),(10,10,10,10,'Practical examples helped understanding','Room 205'),(11,11,11,11,'The course structure was well-designed','Room 206'),(12,12,12,12,'Interesting assignments challenged me','Room 207'),(13,13,13,13,'The course covered relevant topics','Room 208'),(14,14,14,14,'The lecturer provided valuable insights','Room 209'),(15,15,15,15,'I would recommend this course to others','Room 210'),(16,16,16,16,'Engaging discussions in class','Room 211'),(17,17,17,17,'The course materials were comprehensive','Room 212'),(18,18,18,18,'Clear explanations made concepts easy to grasp','Room 213'),(19,19,19,19,'The course was well-paced','Room 214'),(20,20,20,20,'The instructor was approachable and supportive','Room 215'),(21,21,21,21,'Enjoyed collaborating with classmates','Room 216'),(22,22,22,22,'Interactive learning activities were helpful','Room 217'),(23,23,23,23,'The course provided valuable practical skills','Room 218'),(24,24,24,24,'The instructor provided timely feedback','Room 219'),(25,25,25,25,'The course improved my understanding of the subject','Room 220'),(26,26,26,26,'The course materials were well-organized','Room 221'),(27,27,27,27,'The instructor was enthusiastic and passionate','Room 222'),(28,28,28,28,'The course challenged me to think critically','Room 223'),(29,29,29,29,'The instructor created a supportive learning environment','Room 224'),(30,30,30,30,'The course content was relevant to real-world applications','Room 225'),(31,31,31,31,'Enjoyed the hands-on learning experiences','Room 226'),(32,32,32,32,'The course provided valuable industry insights','Room 227'),(33,33,33,33,'The instructor was knowledgeable and approachable','Room 228'),(34,34,34,34,'The course helped me develop new skills','Room 229'),(35,35,35,35,'The instructor encouraged participation and discussion','Room 230'),(36,36,36,36,'The course assignments were engaging and challenging','Room 231'),(37,37,37,37,'The course content was up-to-date and relevant','Room 232'),(38,38,38,38,'The instructor provided helpful resources','Room 233'),(39,39,39,39,'The course improved my problem-solving abilities','Room 234'),(40,40,40,40,'The instructor was effective at explaining complex concepts','Room 235'),(41,41,41,41,'The course was well-structured and organized','Room 236'),(42,42,42,42,'The instructor was responsive to student needs','Room 237'),(43,43,43,43,'The course provided opportunities for practical application','Room 238'),(44,44,44,44,'The instructor was supportive and encouraging','Room 239'),(45,45,45,45,'The course content was engaging and informative','Room 240');
/*!40000 ALTER TABLE `officereports` ENABLE KEYS */;
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

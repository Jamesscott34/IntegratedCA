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
-- Table structure for table `studentfeedback`
--

DROP TABLE IF EXISTS `studentfeedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `studentfeedback` (
  `StudentFeedbackID` int NOT NULL AUTO_INCREMENT,
  `StudentID` int DEFAULT NULL,
  `CourseID` int DEFAULT NULL,
  `FeedbackText` text,
  PRIMARY KEY (`StudentFeedbackID`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studentfeedback`
--

LOCK TABLES `studentfeedback` WRITE;
/*!40000 ALTER TABLE `studentfeedback` DISABLE KEYS */;
INSERT INTO `studentfeedback` VALUES (1,1,1,'Great lecturer, very helpful'),(2,2,2,'Enjoyed the course content'),(3,3,3,'Well-organized lectures and materials'),(4,4,4,'The instructor was knowledgeable and engaging'),(5,5,5,'The course material was presented clearly'),(6,6,6,'Excellent support from the teaching staff'),(7,7,7,'Interactive classes made learning enjoyable'),(8,8,8,'The course exceeded my expectations'),(9,9,9,'The lecturer was responsive to questions'),(10,10,10,'Practical examples helped understanding'),(11,11,11,'The course structure was well-designed'),(12,12,12,'Interesting assignments challenged me'),(13,13,13,'The course covered relevant topics'),(14,14,14,'The lecturer provided valuable insights'),(15,15,15,'I would recommend this course to others'),(16,16,16,'Engaging discussions in class'),(17,17,17,'The course materials were comprehensive'),(18,18,18,'Clear explanations made concepts easy to grasp'),(19,19,19,'The course was well-paced'),(20,20,20,'The instructor was approachable and supportive'),(21,21,21,'Enjoyed collaborating with classmates'),(22,22,22,'Interactive learning activities were helpful'),(23,23,23,'The course provided valuable practical skills'),(24,24,24,'The instructor provided timely feedback'),(25,25,25,'The course improved my understanding of the subject'),(26,26,26,'The course materials were well-organized'),(27,27,27,'The instructor was enthusiastic and passionate'),(28,28,28,'The course challenged me to think critically'),(29,29,29,'The instructor created a supportive learning environment'),(30,30,30,'The course content was relevant to real-world applications'),(31,31,31,'Enjoyed the hands-on learning experiences'),(32,32,32,'The course provided valuable industry insights'),(33,33,33,'The instructor was knowledgeable and approachable'),(34,34,34,'The course helped me develop new skills'),(35,35,35,'The instructor encouraged participation and discussion'),(36,36,36,'The course assignments were engaging and challenging'),(37,37,37,'The course content was up-to-date and relevant'),(38,38,38,'The instructor provided helpful resources'),(39,39,39,'The course improved my problem-solving abilities'),(40,40,40,'The instructor was effective at explaining complex concepts'),(41,41,41,'The course was well-structured and organized'),(42,42,42,'The instructor was responsive to student needs'),(43,43,43,'The course provided opportunities for practical application'),(44,44,44,'The instructor was supportive and encouraging'),(45,45,45,'The course content was engaging and informative'),(46,46,46,'The instructor provided clear instructions'),(47,47,47,'The course enhanced my understanding of the subject matter'),(48,48,48,'The instructor provided helpful feedback on assignments'),(49,49,49,'The course challenged me to think creatively'),(50,50,50,'The instructor fostered a collaborative learning environment');
/*!40000 ALTER TABLE `studentfeedback` ENABLE KEYS */;
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

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
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `UserID` int NOT NULL AUTO_INCREMENT,
  `Username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=163 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Admin','Java','Admin'),(2,'lecturer1','password1','lecturer'),(3,'lecturer2','password2','lecturer'),(4,'lecturer3','password3','lecturer'),(5,'lecturer4','password4','lecturer'),(6,'lecturer5','password5','lecturer'),(7,'lecturer6','password6','lecturer'),(8,'lecturer7','password7','lecturer'),(9,'lecturer8','password8','lecturer'),(10,'lecturer9','password9','lecturer'),(11,'lecturer10','password10','lecturer'),(12,'lecturer11','password11','lecturer'),(13,'lecturer12','password12','lecturer'),(14,'lecturer13','password13','lecturer'),(15,'lecturer14','password14','lecturer'),(16,'lecturer15','password15','lecturer'),(17,'lecturer16','password16','lecturer'),(18,'lecturer17','password17','lecturer'),(19,'lecturer18','password18','lecturer'),(20,'lecturer19','password19','lecturer'),(21,'lecturer20','password20','lecturer'),(22,'lecturer21','password21','lecturer'),(23,'lecturer22','password22','lecturer'),(24,'lecturer23','password23','lecturer'),(25,'lecturer24','password24','lecturer'),(26,'lecturer25','password25','lecturer'),(27,'lecturer26','password26','lecturer'),(28,'lecturer27','password27','lecturer'),(29,'lecturer28','password28','lecturer'),(30,'lecturer29','password29','lecturer'),(31,'lecturer30','password30','lecturer'),(32,'lecturer31','password31','lecturer'),(33,'lecturer32','password32','lecturer'),(34,'lecturer33','password33','lecturer'),(35,'lecturer34','password34','lecturer'),(36,'lecturer35','password35','lecturer'),(37,'lecturer36','password36','lecturer'),(38,'lecturer37','password37','lecturer'),(39,'lecturer38','password38','lecturer'),(40,'lecturer39','password39','lecturer'),(41,'lecturer40','password40','lecturer'),(42,'office1','password1','office'),(43,'office2','password2','office'),(44,'office3','password3','office'),(45,'office4','password4','office'),(46,'office5','password5','office'),(47,'office6','password6','office'),(48,'office7','password7','office'),(49,'office8','password8','office'),(50,'office9','password9','office'),(51,'office10','password10','office'),(52,'office11','password11','office'),(53,'office12','password12','office'),(54,'office13','password13','office'),(55,'office14','password14','office'),(56,'office15','password15','office'),(57,'office16','password16','office'),(58,'office17','password17','office'),(59,'office18','password18','office'),(60,'office19','password19','office'),(61,'office20','password20','office'),(62,'office21','password1','office'),(63,'office22','password2','office'),(64,'office23','password3','office'),(65,'office24','password4','office'),(66,'office25','password5','office'),(67,'office26','password6','office'),(68,'office27','password7','office'),(69,'office28','password8','office'),(70,'office29','password9','office'),(71,'office30','password10','office'),(72,'office31','password11','office'),(73,'office32','password12','office'),(74,'office33','password13','office'),(75,'office34','password14','office'),(76,'office35','password15','office'),(77,'office36','password16','office'),(78,'office37','password17','office'),(79,'office38','password18','office'),(80,'office39','password19','office'),(81,'office40','password20','office'),(82,'Admin','Java','Admin'),(83,'lecturer1','password1','lecturer'),(84,'lecturer2','password2','lecturer'),(85,'lecturer3','password3','lecturer'),(86,'lecturer4','password4','lecturer'),(87,'lecturer5','password5','lecturer'),(88,'lecturer6','password6','lecturer'),(89,'lecturer7','password7','lecturer'),(90,'lecturer8','password8','lecturer'),(91,'lecturer9','password9','lecturer'),(92,'lecturer10','password10','lecturer'),(93,'lecturer11','password11','lecturer'),(94,'lecturer12','password12','lecturer'),(95,'lecturer13','password13','lecturer'),(96,'lecturer14','password14','lecturer'),(97,'lecturer15','password15','lecturer'),(98,'lecturer16','password16','lecturer'),(99,'lecturer17','password17','lecturer'),(100,'lecturer18','password18','lecturer'),(101,'lecturer19','password19','lecturer'),(102,'lecturer20','password20','lecturer'),(103,'lecturer21','password21','lecturer'),(104,'lecturer22','password22','lecturer'),(105,'lecturer23','password23','lecturer'),(106,'lecturer24','password24','lecturer'),(107,'lecturer25','password25','lecturer'),(108,'lecturer26','password26','lecturer'),(109,'lecturer27','password27','lecturer'),(110,'lecturer28','password28','lecturer'),(111,'lecturer29','password29','lecturer'),(112,'lecturer30','password30','lecturer'),(113,'lecturer31','password31','lecturer'),(114,'lecturer32','password32','lecturer'),(115,'lecturer33','password33','lecturer'),(116,'lecturer34','password34','lecturer'),(117,'lecturer35','password35','lecturer'),(118,'lecturer36','password36','lecturer'),(119,'lecturer37','password37','lecturer'),(120,'lecturer38','password38','lecturer'),(121,'lecturer39','password39','lecturer'),(122,'lecturer40','password40','lecturer'),(123,'office1','password1','office'),(124,'office2','password2','office'),(125,'office3','password3','office'),(126,'office4','password4','office'),(127,'office5','password5','office'),(128,'office6','password6','office'),(129,'office7','password7','office'),(130,'office8','password8','office'),(131,'office9','password9','office'),(132,'office10','password10','office'),(133,'office11','password11','office'),(134,'office12','password12','office'),(135,'office13','password13','office'),(136,'office14','password14','office'),(137,'office15','password15','office'),(138,'office16','password16','office'),(139,'office17','password17','office'),(140,'office18','password18','office'),(141,'office19','password19','office'),(142,'office20','password20','office'),(143,'office21','password1','office'),(144,'office22','password2','office'),(145,'office23','password3','office'),(146,'office24','password4','office'),(147,'office25','password5','office'),(148,'office26','password6','office'),(149,'office27','password7','office'),(150,'office28','password8','office'),(151,'office29','password9','office'),(152,'office30','password10','office'),(153,'office31','password11','office'),(154,'office32','password12','office'),(155,'office33','password13','office'),(156,'office34','password14','office'),(157,'office35','password15','office'),(158,'office36','password16','office'),(159,'office37','password17','office'),(160,'office38','password18','office'),(161,'office39','password19','office'),(162,'office40','password20','office');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-17 23:46:53

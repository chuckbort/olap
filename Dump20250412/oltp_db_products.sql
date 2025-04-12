-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: oltp_db
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `product_name` varchar(100) DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL,
  `supplier_id` int DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`product_id`),
  KEY `fk_supplier` (`supplier_id`),
  CONSTRAINT `fk_supplier` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`supplier_id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Product #1','Category #3',14,32.00),(2,'Product #2','Category #5',8,21.00),(3,'Product #3','Category #5',2,137.00),(4,'Product #4','Category #8',11,130.00),(5,'Product #5','Category #9',5,96.00),(6,'Product #6','Category #10',2,45.00),(7,'Product #7','Category #5',17,31.00),(8,'Product #8','Category #8',18,104.00),(9,'Product #9','Category #8',1,94.00),(10,'Product #10','Category #4',5,84.00),(11,'Product #11','Category #3',14,148.00),(12,'Product #12','Category #1',16,14.00),(13,'Product #13','Category #9',5,56.00),(14,'Product #14','Category #9',5,15.00),(15,'Product #15','Category #2',9,167.00),(16,'Product #16','Category #3',13,128.00),(17,'Product #17','Category #9',20,43.00),(18,'Product #18','Category #2',19,131.00),(19,'Product #19','Category #3',18,197.00),(20,'Product #20','Category #4',8,17.00),(21,'Product #21','Category #2',15,199.00),(22,'Product #22','Category #2',8,98.00),(23,'Product #23','Category #4',9,127.00),(24,'Product #24','Category #10',3,46.00),(25,'Product #25','Category #10',9,88.00),(26,'Product #26','Category #1',13,54.00),(27,'Product #27','Category #4',6,175.00),(28,'Product #28','Category #3',1,101.00),(29,'Product #29','Category #2',8,5.00),(30,'Product #30','Category #9',13,59.00),(31,'Product #31','Category #6',11,22.00),(32,'Product #32','Category #2',2,126.00),(33,'Product #33','Category #9',12,172.00),(34,'Product #34','Category #3',17,38.00),(35,'Product #35','Category #6',4,117.00),(36,'Product #36','Category #3',10,144.00),(37,'Product #37','Category #1',14,93.00),(38,'Product #38','Category #7',19,45.00),(39,'Product #39','Category #2',13,106.00),(40,'Product #40','Category #9',20,14.00),(41,'Product #41','Category #5',16,182.00),(42,'Product #42','Category #2',20,93.00),(43,'Product #43','Category #6',9,135.00),(44,'Product #44','Category #6',2,7.00),(45,'Product #45','Category #5',5,133.00),(46,'Product #46','Category #5',9,179.00),(47,'Product #47','Category #4',10,130.00),(48,'Product #48','Category #9',11,117.00),(49,'Product #49','Category #7',3,150.00),(50,'Product #50','Category #9',1,98.00);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-12 22:49:30

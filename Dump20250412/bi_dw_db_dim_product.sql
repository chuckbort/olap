-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: bi_dw_db
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
-- Table structure for table `dim_product`
--

DROP TABLE IF EXISTS `dim_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dim_product` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `product_name` varchar(100) DEFAULT NULL,
  `category_name` varchar(100) DEFAULT NULL,
  `supplier_id` int DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dim_product`
--

LOCK TABLES `dim_product` WRITE;
/*!40000 ALTER TABLE `dim_product` DISABLE KEYS */;
INSERT INTO `dim_product` VALUES (1,'Product #1','Category #2',20,62.00),(2,'Product #2','Category #7',6,87.00),(3,'Product #3','Category #1',20,110.00),(4,'Product #4','Category #10',10,115.00),(5,'Product #5','Category #6',17,158.00),(6,'Product #6','Category #5',15,165.00),(7,'Product #7','Category #8',20,53.00),(8,'Product #8','Category #6',16,189.00),(9,'Product #9','Category #3',12,125.00),(10,'Product #10','Category #3',19,193.00),(11,'Product #11','Category #9',5,160.00),(12,'Product #12','Category #6',2,55.00),(13,'Product #13','Category #6',8,157.00),(14,'Product #14','Category #6',14,33.00),(15,'Product #15','Category #6',19,121.00),(16,'Product #16','Category #1',11,159.00),(17,'Product #17','Category #4',6,12.00),(18,'Product #18','Category #1',8,76.00),(19,'Product #19','Category #8',3,36.00),(20,'Product #20','Category #5',16,174.00),(21,'Product #21','Category #9',1,147.00),(22,'Product #22','Category #6',10,151.00),(23,'Product #23','Category #3',6,139.00),(24,'Product #24','Category #6',4,193.00),(25,'Product #25','Category #1',9,27.00),(26,'Product #26','Category #6',15,16.00),(27,'Product #27','Category #7',13,4.00),(28,'Product #28','Category #8',1,41.00),(29,'Product #29','Category #10',12,28.00),(30,'Product #30','Category #4',11,83.00),(31,'Product #31','Category #8',6,99.00),(32,'Product #32','Category #6',5,58.00),(33,'Product #33','Category #8',2,131.00),(34,'Product #34','Category #6',4,34.00),(35,'Product #35','Category #1',20,149.00),(36,'Product #36','Category #1',12,181.00),(37,'Product #37','Category #8',3,145.00),(38,'Product #38','Category #10',16,25.00),(39,'Product #39','Category #7',11,6.00),(40,'Product #40','Category #7',12,173.00),(41,'Product #41','Category #3',12,175.00),(42,'Product #42','Category #9',10,21.00),(43,'Product #43','Category #10',11,78.00),(44,'Product #44','Category #9',8,48.00),(45,'Product #45','Category #1',13,191.00),(46,'Product #46','Category #6',8,15.00),(47,'Product #47','Category #8',3,162.00),(48,'Product #48','Category #9',7,125.00),(49,'Product #49','Category #4',13,60.00),(50,'Product #50','Category #7',3,92.00);
/*!40000 ALTER TABLE `dim_product` ENABLE KEYS */;
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

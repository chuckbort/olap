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
-- Table structure for table `sales`
--

DROP TABLE IF EXISTS `sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales` (
  `sale_id` int NOT NULL AUTO_INCREMENT,
  `sale_date` date DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `manager_id` int DEFAULT NULL,
  `region` varchar(100) DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  PRIMARY KEY (`sale_id`),
  KEY `fk_product` (`product_id`),
  KEY `fk_manager` (`manager_id`),
  CONSTRAINT `fk_manager` FOREIGN KEY (`manager_id`) REFERENCES `managers` (`manager_id`),
  CONSTRAINT `fk_product` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=604 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales`
--

LOCK TABLES `sales` WRITE;
/*!40000 ALTER TABLE `sales` DISABLE KEYS */;
INSERT INTO `sales` VALUES (4,'2024-12-18',6,14,'Region #1',48),(5,'2024-09-20',2,7,'Region #7',113),(6,'2024-05-26',1,23,'Region #6',143),(7,'2024-06-04',6,4,'Region #6',310),(8,'2024-01-24',30,4,'Region #2',283),(9,'2024-11-20',24,7,'Region #1',339),(10,'2024-05-03',15,13,'Region #8',326),(11,'2024-03-12',23,22,'Region #2',312),(12,'2024-09-24',16,15,'Region #5',474),(13,'2024-09-08',44,27,'Region #4',421),(14,'2024-06-13',18,7,'Region #6',109),(15,'2024-07-21',30,9,'Region #4',382),(16,'2024-05-24',38,29,'Region #7',186),(17,'2024-03-17',32,25,'Region #2',79),(18,'2024-11-14',39,13,'Region #10',240),(19,'2024-09-28',1,22,'Region #5',394),(20,'2024-02-10',28,15,'Region #5',498),(21,'2024-03-17',7,27,'Region #10',102),(22,'2024-03-18',50,30,'Region #10',166),(23,'2024-02-12',20,2,'Region #10',485),(24,'2024-12-16',5,25,'Region #3',338),(25,'2024-09-06',17,28,'Region #7',494),(26,'2024-09-25',47,23,'Region #7',344),(27,'2024-08-17',29,8,'Region #2',174),(28,'2024-09-08',38,1,'Region #1',118),(29,'2024-01-28',22,17,'Region #5',343),(30,'2024-09-05',47,19,'Region #4',402),(31,'2024-07-07',7,22,'Region #6',217),(32,'2024-12-02',44,2,'Region #6',410),(33,'2024-04-07',13,15,'Region #7',94),(34,'2024-04-28',5,26,'Region #2',26),(35,'2024-09-27',1,30,'Region #3',209),(36,'2024-04-28',26,6,'Region #1',200),(37,'2024-08-10',28,22,'Region #3',98),(38,'2024-01-19',48,2,'Region #1',26),(39,'2024-09-28',34,2,'Region #2',436),(40,'2024-10-03',44,13,'Region #10',127),(41,'2024-01-20',6,22,'Region #10',268),(42,'2024-05-07',43,8,'Region #7',68),(43,'2024-05-15',21,1,'Region #10',289),(44,'2024-02-18',14,9,'Region #6',452),(45,'2024-04-12',19,15,'Region #5',314),(46,'2024-11-17',1,10,'Region #3',136),(47,'2024-02-24',36,9,'Region #10',108),(48,'2024-04-22',41,17,'Region #5',464),(49,'2024-01-03',41,27,'Region #1',2),(50,'2024-03-21',17,24,'Region #9',362),(51,'2024-01-04',5,18,'Region #6',299),(52,'2024-07-05',3,12,'Region #6',108),(53,'2024-11-04',23,29,'Region #10',384),(54,'2024-04-28',11,29,'Region #1',92),(55,'2024-06-26',27,9,'Region #2',196),(56,'2024-08-08',13,12,'Region #4',115),(57,'2024-04-13',22,28,'Region #5',180),(58,'2024-07-22',35,1,'Region #5',92),(59,'2024-05-02',7,14,'Region #6',224),(60,'2024-09-04',25,7,'Region #1',363),(61,'2024-09-26',35,12,'Region #2',486),(62,'2024-06-20',21,24,'Region #9',159),(63,'2024-06-13',45,18,'Region #4',216),(64,'2024-07-22',48,20,'Region #5',208),(65,'2024-01-10',19,14,'Region #10',336),(66,'2024-08-15',44,17,'Region #3',338),(67,'2024-09-22',41,11,'Region #4',345),(68,'2024-04-05',2,8,'Region #10',436),(69,'2024-08-14',41,7,'Region #8',205),(70,'2024-11-23',1,25,'Region #4',91),(71,'2024-12-17',30,18,'Region #2',234),(72,'2024-08-22',34,20,'Region #8',314),(73,'2024-09-14',36,29,'Region #8',231),(74,'2024-04-27',41,25,'Region #8',321),(75,'2024-08-03',46,8,'Region #6',164),(76,'2024-02-05',10,13,'Region #4',33),(77,'2024-06-18',30,2,'Region #7',200),(78,'2024-10-23',2,13,'Region #1',483),(79,'2024-07-28',27,24,'Region #10',460),(80,'2024-04-09',28,1,'Region #6',343),(81,'2024-07-24',11,30,'Region #10',274),(82,'2024-07-19',37,3,'Region #3',444),(83,'2024-01-09',25,7,'Region #6',173),(84,'2024-07-09',49,9,'Region #8',10),(85,'2024-01-12',15,25,'Region #1',487),(86,'2024-01-20',10,5,'Region #2',289),(87,'2024-08-23',17,6,'Region #10',494),(88,'2024-02-25',11,4,'Region #1',476),(89,'2024-11-13',26,3,'Region #4',53),(90,'2024-05-28',44,26,'Region #10',401),(91,'2024-09-14',43,3,'Region #6',7),(92,'2024-08-04',28,21,'Region #3',223),(93,'2024-09-21',18,26,'Region #8',239),(94,'2024-12-19',18,28,'Region #2',143),(95,'2024-04-25',30,20,'Region #6',15),(96,'2024-06-06',32,12,'Region #6',144),(97,'2024-12-09',36,17,'Region #2',124),(98,'2024-08-18',49,23,'Region #8',230),(99,'2024-02-10',15,23,'Region #5',340),(100,'2024-08-18',34,14,'Region #6',181),(101,'2024-05-10',17,4,'Region #6',62),(102,'2024-12-06',13,24,'Region #5',371),(103,'2024-09-20',19,27,'Region #5',117),(104,'2024-05-01',46,5,'Region #1',499),(105,'2024-05-23',9,4,'Region #10',146),(106,'2024-08-11',12,9,'Region #2',421),(107,'2024-08-03',37,5,'Region #10',486),(108,'2024-04-04',36,20,'Region #10',116),(109,'2024-07-15',29,28,'Region #7',157),(110,'2024-01-20',48,25,'Region #4',136),(111,'2024-03-08',12,3,'Region #1',210),(112,'2024-10-16',19,8,'Region #5',360),(113,'2024-02-22',15,26,'Region #4',218),(114,'2024-04-21',10,27,'Region #2',31),(115,'2024-05-20',48,30,'Region #8',64),(116,'2024-05-23',26,17,'Region #8',225),(117,'2024-01-14',48,20,'Region #1',47),(118,'2024-11-27',37,1,'Region #10',21),(119,'2024-03-16',34,30,'Region #3',300),(120,'2024-08-03',31,14,'Region #6',344),(121,'2024-03-11',27,10,'Region #9',19),(122,'2024-06-09',21,25,'Region #9',423),(123,'2024-11-28',35,14,'Region #4',266),(124,'2024-08-21',29,7,'Region #9',68),(125,'2024-08-23',32,1,'Region #4',364),(126,'2024-09-01',36,3,'Region #2',237),(127,'2024-11-27',10,30,'Region #9',362),(128,'2024-08-16',16,18,'Region #7',98),(129,'2024-09-24',9,9,'Region #6',479),(130,'2024-05-27',1,24,'Region #10',297),(131,'2024-08-28',10,18,'Region #6',171),(132,'2024-09-13',30,28,'Region #4',293),(133,'2024-07-02',21,23,'Region #7',340),(134,'2024-11-05',32,5,'Region #10',170),(135,'2024-08-04',34,1,'Region #7',446),(136,'2024-03-03',31,11,'Region #7',333),(137,'2024-06-28',44,13,'Region #8',447),(138,'2024-10-03',16,8,'Region #7',51),(139,'2024-12-28',7,6,'Region #1',24),(140,'2024-01-10',23,14,'Region #4',272),(141,'2024-11-26',12,6,'Region #10',446),(142,'2024-11-08',32,5,'Region #8',327),(143,'2024-05-22',1,29,'Region #9',81),(144,'2024-06-19',20,23,'Region #8',433),(145,'2024-07-28',31,8,'Region #10',184),(146,'2024-12-10',2,9,'Region #10',443),(147,'2024-12-02',39,27,'Region #4',311),(148,'2024-04-21',13,9,'Region #2',463),(149,'2024-01-10',29,19,'Region #3',47),(150,'2024-06-24',27,7,'Region #9',449),(151,'2024-09-17',18,9,'Region #5',383),(152,'2024-02-15',5,25,'Region #7',496),(153,'2024-09-12',6,1,'Region #9',64),(154,'2024-11-24',44,19,'Region #6',56),(155,'2024-08-01',40,11,'Region #4',332),(156,'2024-08-23',20,4,'Region #1',485),(157,'2024-08-04',7,29,'Region #3',199),(158,'2024-11-24',45,14,'Region #3',454),(159,'2024-02-27',32,14,'Region #1',354),(160,'2024-08-15',16,4,'Region #9',462),(161,'2024-06-02',26,7,'Region #8',47),(162,'2024-11-21',39,2,'Region #4',65),(163,'2024-04-03',49,7,'Region #4',417),(164,'2024-06-25',10,1,'Region #3',67),(165,'2024-03-04',43,5,'Region #6',405),(166,'2024-10-11',2,9,'Region #3',380),(167,'2024-02-24',5,15,'Region #9',304),(168,'2024-09-08',40,24,'Region #5',235),(169,'2024-01-02',31,14,'Region #8',365),(170,'2024-02-03',21,5,'Region #3',141),(171,'2024-10-18',46,13,'Region #9',151),(172,'2024-10-14',7,28,'Region #4',221),(173,'2024-04-14',22,13,'Region #2',161),(174,'2024-11-09',24,22,'Region #2',47),(175,'2024-02-14',7,26,'Region #9',31),(176,'2024-09-18',22,14,'Region #7',445),(177,'2024-01-10',39,12,'Region #10',260),(178,'2024-11-16',15,12,'Region #6',59),(179,'2024-10-08',28,25,'Region #10',346),(180,'2024-01-20',43,1,'Region #5',360),(181,'2024-06-12',1,28,'Region #10',337),(182,'2024-03-24',41,3,'Region #4',193),(183,'2024-06-06',24,24,'Region #10',306),(184,'2024-01-05',11,2,'Region #5',227),(185,'2024-08-20',29,9,'Region #9',59),(186,'2024-02-10',44,16,'Region #5',24),(187,'2024-10-02',1,10,'Region #3',392),(188,'2024-06-04',1,24,'Region #3',67),(189,'2024-12-08',33,27,'Region #2',204),(190,'2024-01-14',2,30,'Region #6',295),(191,'2024-07-23',41,10,'Region #7',11),(192,'2024-03-26',40,27,'Region #2',224),(193,'2024-04-14',38,17,'Region #7',446),(194,'2024-06-08',22,3,'Region #2',272),(195,'2024-06-12',47,8,'Region #3',132),(196,'2024-10-05',49,6,'Region #8',387),(197,'2024-10-15',44,21,'Region #6',443),(198,'2024-06-05',29,16,'Region #5',408),(199,'2024-01-12',33,10,'Region #8',20),(200,'2024-05-03',42,20,'Region #9',197),(201,'2024-09-26',48,15,'Region #4',165),(202,'2024-09-05',4,4,'Region #2',259),(203,'2024-01-08',46,15,'Region #9',313),(204,'2024-06-10',25,25,'Region #10',27),(205,'2024-11-11',5,4,'Region #7',146),(206,'2024-11-20',10,3,'Region #3',470),(207,'2024-11-23',43,5,'Region #2',159),(208,'2024-11-26',22,22,'Region #2',331),(209,'2024-09-12',2,10,'Region #4',175),(210,'2024-08-07',15,5,'Region #5',433),(211,'2024-09-25',35,2,'Region #10',68),(212,'2024-03-06',12,26,'Region #8',23),(213,'2024-11-24',16,20,'Region #8',120),(214,'2024-05-26',31,12,'Region #8',237),(215,'2024-07-17',34,6,'Region #10',71),(216,'2024-01-21',31,18,'Region #9',436),(217,'2024-02-25',11,15,'Region #3',426),(218,'2024-04-27',29,30,'Region #7',28),(219,'2024-06-08',25,12,'Region #1',164),(220,'2024-12-21',22,5,'Region #5',470),(221,'2024-12-27',9,15,'Region #1',464),(222,'2024-05-07',10,24,'Region #9',217),(223,'2024-05-08',20,2,'Region #7',328),(224,'2024-08-03',8,20,'Region #1',324),(225,'2024-04-23',10,14,'Region #10',181),(226,'2024-07-06',43,17,'Region #2',489),(227,'2024-09-26',33,1,'Region #8',23),(228,'2024-06-09',48,12,'Region #6',124),(229,'2024-11-04',50,24,'Region #3',23),(230,'2024-06-27',42,27,'Region #8',324),(231,'2024-03-03',46,2,'Region #4',23),(232,'2024-01-11',20,13,'Region #8',130),(233,'2024-11-07',19,28,'Region #6',140),(234,'2024-06-14',26,29,'Region #6',499),(235,'2024-12-16',24,9,'Region #7',41),(236,'2024-03-18',19,4,'Region #6',339),(237,'2024-08-20',46,6,'Region #6',229),(238,'2024-06-20',28,21,'Region #2',344),(239,'2024-06-17',48,1,'Region #10',348),(240,'2024-01-05',5,25,'Region #6',197),(241,'2024-01-20',10,12,'Region #8',391),(242,'2024-03-17',24,11,'Region #4',492),(243,'2024-12-06',32,13,'Region #2',135),(244,'2024-12-15',14,10,'Region #4',63),(245,'2024-02-15',12,3,'Region #6',364),(246,'2024-09-10',20,23,'Region #6',261),(247,'2024-04-26',9,26,'Region #1',185),(248,'2024-06-15',36,20,'Region #2',159),(249,'2024-12-24',31,14,'Region #10',38),(250,'2024-06-21',5,15,'Region #6',66),(251,'2024-09-21',38,25,'Region #7',258),(252,'2024-01-27',8,5,'Region #3',83),(253,'2024-12-08',23,29,'Region #2',129),(254,'2024-09-09',9,20,'Region #2',258),(255,'2024-10-19',10,22,'Region #10',173),(256,'2024-10-02',2,2,'Region #5',334),(257,'2024-10-14',40,16,'Region #5',329),(258,'2024-08-08',44,10,'Region #2',353),(259,'2024-08-14',31,7,'Region #10',74),(260,'2024-12-11',47,13,'Region #6',264),(261,'2024-06-08',30,9,'Region #4',73),(262,'2024-05-13',40,8,'Region #6',479),(263,'2024-06-07',49,16,'Region #8',256),(264,'2024-08-01',6,17,'Region #4',111),(265,'2024-01-02',19,20,'Region #5',275),(266,'2024-02-14',9,24,'Region #7',188),(267,'2024-01-19',36,12,'Region #5',38),(268,'2024-08-25',36,27,'Region #10',61),(269,'2024-02-13',24,18,'Region #3',102),(270,'2024-07-17',3,2,'Region #6',412),(271,'2024-08-05',39,5,'Region #10',164),(272,'2024-10-24',20,11,'Region #9',273),(273,'2024-10-10',31,12,'Region #2',214),(274,'2024-12-28',45,20,'Region #5',496),(275,'2024-10-19',15,19,'Region #3',269),(276,'2024-10-25',25,27,'Region #1',294),(277,'2024-02-07',2,11,'Region #3',212),(278,'2024-07-17',50,30,'Region #1',362),(279,'2024-04-18',21,17,'Region #6',490),(280,'2024-09-11',35,22,'Region #10',248),(281,'2024-04-09',36,8,'Region #5',361),(282,'2024-12-16',21,12,'Region #5',148),(283,'2024-11-18',25,27,'Region #3',149),(284,'2024-12-03',23,21,'Region #8',110),(285,'2024-09-09',36,5,'Region #10',380),(286,'2024-04-02',43,8,'Region #1',52),(287,'2024-12-16',7,1,'Region #3',209),(288,'2024-08-16',42,25,'Region #6',147),(289,'2024-02-21',37,18,'Region #3',214),(290,'2024-03-02',26,6,'Region #1',5),(291,'2024-10-04',22,15,'Region #9',253),(292,'2024-03-28',33,9,'Region #2',170),(293,'2024-08-21',17,1,'Region #5',291),(294,'2024-04-06',40,27,'Region #9',168),(295,'2024-11-04',12,16,'Region #4',4),(296,'2024-04-15',49,11,'Region #10',371),(297,'2024-05-21',24,2,'Region #8',158),(298,'2024-11-17',46,23,'Region #5',189),(299,'2024-04-05',31,15,'Region #6',213),(300,'2024-08-25',35,25,'Region #10',448),(301,'2024-09-15',34,3,'Region #2',32),(302,'2024-09-07',37,5,'Region #6',438),(303,'2024-02-22',14,16,'Region #9',229),(304,'2024-08-05',33,15,'Region #1',287),(305,'2024-05-24',2,9,'Region #4',297),(306,'2024-07-12',45,18,'Region #2',479),(307,'2024-05-14',12,25,'Region #6',457),(308,'2024-07-13',6,5,'Region #2',92),(309,'2024-07-17',9,27,'Region #1',153),(310,'2024-12-18',28,13,'Region #4',236),(311,'2024-05-07',47,2,'Region #10',393),(312,'2024-01-08',14,4,'Region #1',229),(313,'2024-12-28',4,24,'Region #7',225),(314,'2024-04-25',50,5,'Region #5',120),(315,'2024-12-19',21,20,'Region #4',155),(316,'2024-11-17',15,10,'Region #1',286),(317,'2024-12-06',41,18,'Region #1',498),(318,'2024-11-22',25,11,'Region #7',77),(319,'2024-03-25',35,8,'Region #5',440),(320,'2024-08-02',36,14,'Region #9',69),(321,'2024-05-07',22,30,'Region #6',48),(322,'2024-04-02',18,22,'Region #10',21),(323,'2024-04-26',49,24,'Region #4',246),(324,'2024-06-10',1,30,'Region #2',383),(325,'2024-08-08',45,23,'Region #7',469),(326,'2024-06-25',19,15,'Region #6',158),(327,'2024-09-16',30,26,'Region #6',469),(328,'2024-06-14',3,28,'Region #3',9),(329,'2024-10-19',47,10,'Region #4',169),(330,'2024-10-27',16,18,'Region #5',391),(331,'2024-12-21',48,15,'Region #6',87),(332,'2024-09-16',12,21,'Region #9',18),(333,'2024-02-27',43,25,'Region #7',71),(334,'2024-04-03',46,1,'Region #9',234),(335,'2024-10-21',43,30,'Region #8',9),(336,'2024-09-14',1,17,'Region #9',147),(337,'2024-12-22',28,4,'Region #9',77),(338,'2024-10-17',17,9,'Region #2',192),(339,'2024-08-19',16,10,'Region #1',48),(340,'2024-07-18',31,21,'Region #3',43),(341,'2024-07-21',22,28,'Region #9',471),(342,'2024-04-28',45,16,'Region #1',474),(343,'2024-05-18',37,6,'Region #1',493),(344,'2024-03-25',46,30,'Region #5',84),(345,'2024-10-27',25,11,'Region #3',405),(346,'2024-12-03',33,2,'Region #7',119),(347,'2024-06-20',50,20,'Region #6',16),(348,'2024-08-16',15,18,'Region #7',96),(349,'2024-11-13',6,10,'Region #2',43),(350,'2024-07-23',41,24,'Region #6',185),(351,'2024-01-10',29,25,'Region #2',68),(352,'2024-07-15',36,17,'Region #2',14),(353,'2024-09-03',39,26,'Region #7',7),(354,'2024-07-25',6,29,'Region #10',267),(355,'2024-07-06',9,10,'Region #8',75),(356,'2024-07-09',27,16,'Region #6',129),(357,'2024-12-21',32,20,'Region #8',55),(358,'2024-01-13',22,13,'Region #8',172),(359,'2024-11-20',9,11,'Region #4',246),(360,'2024-07-11',19,19,'Region #6',193),(361,'2024-07-12',8,7,'Region #9',93),(362,'2024-09-01',47,23,'Region #8',409),(363,'2024-12-03',27,5,'Region #4',130),(364,'2024-12-14',25,15,'Region #8',299),(365,'2024-09-28',45,18,'Region #6',360),(366,'2024-09-20',41,4,'Region #6',86),(367,'2024-01-19',42,25,'Region #7',55),(368,'2024-05-08',33,18,'Region #10',114),(369,'2024-07-15',50,23,'Region #3',177),(370,'2024-08-04',19,30,'Region #2',426),(371,'2024-03-12',20,15,'Region #9',248),(372,'2024-02-15',47,11,'Region #5',23),(373,'2024-02-01',22,22,'Region #4',265),(374,'2024-03-11',36,15,'Region #7',323),(375,'2024-11-22',28,1,'Region #4',231),(376,'2024-07-01',46,7,'Region #2',296),(377,'2024-09-06',24,7,'Region #2',135),(378,'2024-08-17',41,20,'Region #10',201),(379,'2024-06-12',30,6,'Region #10',303),(380,'2024-03-11',8,10,'Region #3',192),(381,'2024-09-13',27,5,'Region #7',217),(382,'2024-11-18',45,18,'Region #8',148),(383,'2024-06-27',29,2,'Region #1',249),(384,'2024-07-18',33,14,'Region #7',364),(385,'2024-08-06',6,1,'Region #5',17),(386,'2024-09-10',11,19,'Region #9',262),(387,'2024-02-09',50,27,'Region #9',422),(388,'2024-12-15',35,14,'Region #4',153),(389,'2024-01-15',17,28,'Region #8',444),(390,'2024-04-07',48,23,'Region #10',324),(391,'2024-10-05',14,26,'Region #10',180),(392,'2024-10-18',11,23,'Region #5',294),(393,'2024-09-22',7,25,'Region #1',142),(394,'2024-03-23',9,5,'Region #4',390),(395,'2024-07-16',10,21,'Region #7',193),(396,'2024-11-26',50,13,'Region #5',356),(397,'2024-06-15',32,19,'Region #2',375),(398,'2024-11-22',45,28,'Region #9',204),(399,'2024-07-27',14,9,'Region #5',173),(400,'2024-03-19',32,29,'Region #1',51),(401,'2024-08-01',8,15,'Region #1',491),(402,'2024-12-05',42,6,'Region #2',336),(403,'2024-02-12',43,2,'Region #5',372),(404,'2024-04-14',42,23,'Region #1',110),(405,'2024-03-19',15,22,'Region #1',5),(406,'2024-02-28',28,16,'Region #4',197),(407,'2024-02-04',21,29,'Region #3',196),(408,'2024-03-21',44,3,'Region #10',5),(409,'2024-03-15',23,21,'Region #7',316),(410,'2024-04-03',7,25,'Region #10',374),(411,'2024-07-11',9,9,'Region #4',284),(412,'2024-12-20',19,28,'Region #4',266),(413,'2024-04-24',26,21,'Region #4',254),(414,'2024-04-16',41,3,'Region #1',185),(415,'2024-03-13',37,12,'Region #3',391),(416,'2024-02-01',38,1,'Region #4',21),(417,'2024-07-17',19,25,'Region #7',360),(418,'2024-11-18',35,5,'Region #2',159),(419,'2024-04-26',10,11,'Region #10',325),(420,'2024-11-22',42,10,'Region #4',30),(421,'2024-07-04',30,20,'Region #5',342),(422,'2024-12-06',8,23,'Region #1',84),(423,'2024-06-17',34,6,'Region #3',384),(424,'2024-05-24',8,11,'Region #5',269),(425,'2024-12-19',41,16,'Region #9',185),(426,'2024-10-06',24,9,'Region #10',346),(427,'2024-04-24',33,2,'Region #4',24),(428,'2024-07-05',12,18,'Region #4',165),(429,'2024-12-11',18,19,'Region #2',258),(430,'2024-01-06',15,2,'Region #2',450),(431,'2024-05-25',20,3,'Region #8',5),(432,'2024-05-19',20,8,'Region #6',303),(433,'2024-04-24',35,5,'Region #7',13),(434,'2024-06-21',45,11,'Region #7',435),(435,'2024-05-04',14,8,'Region #8',493),(436,'2024-03-23',18,2,'Region #9',212),(437,'2024-06-15',48,19,'Region #9',69),(438,'2024-07-03',38,2,'Region #3',122),(439,'2024-06-26',26,11,'Region #5',120),(440,'2024-04-05',50,4,'Region #2',85),(441,'2024-06-14',8,12,'Region #8',158),(442,'2024-02-03',11,27,'Region #1',111),(443,'2024-06-05',6,12,'Region #9',26),(444,'2024-05-27',12,13,'Region #9',384),(445,'2024-02-15',7,4,'Region #1',426),(446,'2024-04-05',13,12,'Region #10',301),(447,'2024-02-01',5,29,'Region #3',48),(448,'2024-06-04',3,2,'Region #10',222),(449,'2024-07-16',2,22,'Region #3',182),(450,'2024-03-09',18,29,'Region #1',315),(451,'2024-04-21',19,14,'Region #8',32),(452,'2024-07-05',27,21,'Region #4',323),(453,'2024-09-26',2,26,'Region #8',279),(454,'2024-06-19',33,13,'Region #3',14),(455,'2024-04-01',50,2,'Region #9',184),(456,'2024-04-06',7,22,'Region #5',274),(457,'2024-12-02',49,19,'Region #6',479),(458,'2024-03-06',16,11,'Region #10',15),(459,'2024-06-19',37,19,'Region #8',278),(460,'2024-08-02',6,8,'Region #4',11),(461,'2024-01-11',40,26,'Region #6',368),(462,'2024-06-02',2,19,'Region #2',434),(463,'2024-06-03',24,19,'Region #6',155),(464,'2024-03-24',28,21,'Region #3',363),(465,'2024-12-20',23,22,'Region #3',194),(466,'2024-12-10',9,24,'Region #10',201),(467,'2024-10-02',12,11,'Region #4',328),(468,'2024-08-05',22,8,'Region #6',86),(469,'2024-02-27',46,15,'Region #5',108),(470,'2024-02-12',17,24,'Region #1',198),(471,'2024-07-06',27,29,'Region #6',280),(472,'2024-08-26',37,6,'Region #2',410),(473,'2024-05-01',21,4,'Region #6',88),(474,'2024-03-24',5,29,'Region #6',305),(475,'2024-08-23',2,21,'Region #10',456),(476,'2024-01-04',22,7,'Region #9',370),(477,'2024-09-09',43,10,'Region #2',26),(478,'2024-09-27',32,2,'Region #1',219),(479,'2024-11-21',39,7,'Region #1',106),(480,'2024-05-03',31,10,'Region #8',251),(481,'2024-05-03',42,13,'Region #6',454),(482,'2024-03-15',3,15,'Region #5',116),(483,'2024-10-02',10,3,'Region #9',212),(484,'2024-10-08',36,27,'Region #9',215),(485,'2024-11-28',31,29,'Region #8',154),(486,'2024-12-02',33,29,'Region #10',347),(487,'2024-03-04',49,6,'Region #4',414),(488,'2024-01-14',6,7,'Region #10',133),(489,'2024-12-26',5,13,'Region #7',283),(490,'2024-05-17',30,26,'Region #10',268),(491,'2024-02-14',10,19,'Region #10',389),(492,'2024-02-04',37,26,'Region #9',451),(493,'2024-07-09',25,19,'Region #8',20),(494,'2024-07-05',40,22,'Region #1',203),(495,'2024-06-23',16,24,'Region #5',460),(496,'2024-06-27',20,9,'Region #2',498),(497,'2024-03-10',48,25,'Region #5',374),(498,'2024-11-03',13,7,'Region #8',389),(499,'2024-06-27',4,26,'Region #2',160),(500,'2024-07-05',50,29,'Region #1',89),(501,'2024-04-27',4,2,'Region #1',471),(502,'2024-04-09',24,17,'Region #2',349),(503,'2024-06-16',39,6,'Region #10',283),(504,'2024-03-27',17,10,'Region #7',26),(505,'2024-10-25',14,21,'Region #4',138),(506,'2024-09-01',50,16,'Region #3',308),(507,'2024-04-09',39,23,'Region #7',459),(508,'2024-06-15',17,15,'Region #9',423),(509,'2024-10-04',1,22,'Region #9',332),(510,'2024-05-10',44,16,'Region #6',142),(511,'2024-05-09',42,7,'Region #9',392),(512,'2024-01-26',39,22,'Region #3',370),(513,'2024-08-10',17,13,'Region #1',299),(514,'2024-10-27',13,24,'Region #9',327),(515,'2024-11-12',33,28,'Region #9',93),(516,'2024-08-05',48,24,'Region #3',485),(517,'2024-06-21',6,12,'Region #5',216),(518,'2024-06-12',17,10,'Region #2',241),(519,'2024-11-19',38,3,'Region #4',257),(520,'2024-11-13',34,14,'Region #3',71),(521,'2024-06-14',37,5,'Region #3',399),(522,'2024-06-21',12,21,'Region #1',232),(523,'2024-03-19',49,16,'Region #3',315),(524,'2024-07-13',28,13,'Region #1',274),(525,'2024-06-01',21,7,'Region #1',321),(526,'2024-04-23',23,5,'Region #7',258),(527,'2024-03-03',3,10,'Region #9',306),(528,'2024-07-22',9,29,'Region #6',385),(529,'2024-07-01',15,24,'Region #4',376),(530,'2024-09-06',8,23,'Region #7',449),(531,'2024-09-20',4,2,'Region #1',25),(532,'2024-07-15',25,18,'Region #8',360),(533,'2024-12-22',41,10,'Region #2',340),(534,'2024-10-20',45,14,'Region #9',369),(535,'2024-05-04',7,7,'Region #4',399),(536,'2024-09-07',23,10,'Region #1',281),(537,'2024-04-23',31,8,'Region #1',344),(538,'2024-02-27',37,5,'Region #9',39),(539,'2024-02-09',42,15,'Region #5',238),(540,'2024-03-28',3,12,'Region #7',379),(541,'2024-01-01',9,11,'Region #8',490),(542,'2024-12-03',24,6,'Region #7',205),(543,'2024-05-27',25,26,'Region #3',58),(544,'2024-12-02',11,14,'Region #8',411),(545,'2024-08-06',40,25,'Region #10',15),(546,'2024-12-05',31,4,'Region #8',24),(547,'2024-11-11',1,25,'Region #10',115),(548,'2024-11-28',22,17,'Region #2',222),(549,'2024-04-16',23,5,'Region #10',28),(550,'2024-03-17',31,28,'Region #2',385),(551,'2024-04-11',18,17,'Region #9',330),(552,'2024-04-03',30,26,'Region #8',46),(553,'2024-08-11',8,24,'Region #2',207),(554,'2024-09-18',1,26,'Region #10',327),(555,'2024-09-18',14,11,'Region #1',419),(556,'2024-08-11',36,20,'Region #6',367),(557,'2024-02-25',43,1,'Region #6',425),(558,'2024-05-18',34,23,'Region #1',460),(559,'2024-03-27',46,4,'Region #10',101),(560,'2024-07-07',30,23,'Region #2',388),(561,'2024-11-27',44,4,'Region #8',338),(562,'2024-09-05',32,17,'Region #9',479),(563,'2024-10-16',33,23,'Region #3',375),(564,'2024-02-13',43,20,'Region #9',452),(565,'2024-10-23',49,9,'Region #6',497),(566,'2024-03-05',27,23,'Region #5',432),(567,'2024-06-23',48,21,'Region #4',108),(568,'2024-05-22',23,23,'Region #9',278),(569,'2024-06-23',8,18,'Region #10',293),(570,'2024-12-14',44,10,'Region #1',268),(571,'2024-07-05',4,7,'Region #3',147),(572,'2024-03-27',4,7,'Region #1',184),(573,'2024-02-20',44,28,'Region #9',200),(574,'2024-12-10',45,30,'Region #7',214),(575,'2024-11-11',36,1,'Region #4',318),(576,'2024-08-27',15,25,'Region #9',379),(577,'2024-12-07',19,6,'Region #3',493),(578,'2024-09-04',25,14,'Region #9',136),(579,'2024-10-28',17,11,'Region #3',21),(580,'2024-06-20',4,27,'Region #8',405),(581,'2024-06-03',46,17,'Region #3',267),(582,'2024-09-06',27,18,'Region #2',179),(583,'2024-04-22',22,12,'Region #4',487),(584,'2024-09-16',36,4,'Region #8',124),(585,'2024-10-20',16,22,'Region #7',469),(586,'2024-02-13',17,24,'Region #1',467),(587,'2024-06-17',33,16,'Region #5',460),(588,'2024-06-17',6,6,'Region #9',4),(589,'2024-04-22',41,28,'Region #2',106),(590,'2024-12-24',50,21,'Region #3',13),(591,'2024-06-02',6,2,'Region #5',286),(592,'2024-04-09',27,15,'Region #7',162),(593,'2024-11-04',35,21,'Region #2',388),(594,'2024-01-23',5,30,'Region #2',149),(595,'2024-05-20',6,25,'Region #7',203),(596,'2024-01-16',11,8,'Region #7',408),(597,'2024-09-10',41,10,'Region #1',284),(598,'2024-03-04',3,19,'Region #7',276),(599,'2024-02-10',14,7,'Region #9',73),(600,'2024-04-20',17,4,'Region #10',437),(601,'2024-09-15',42,3,'Region #2',129),(602,'2024-12-19',32,12,'Region #4',52),(603,'2024-01-01',2,1,'2',10000);
/*!40000 ALTER TABLE `sales` ENABLE KEYS */;
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

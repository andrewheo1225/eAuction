-- MySQL dump 10.13  Distrib 8.0.28, for macos11 (x86_64)
--
-- Host: 127.0.0.1    Database: bootleg_ebay
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `auction`
--

DROP TABLE IF EXISTS `auction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auction` (
  `auctionID` int NOT NULL AUTO_INCREMENT,
  `userID` int DEFAULT NULL,
  `startDate` date DEFAULT NULL,
  `endDate` date DEFAULT NULL,
  `initialBidPrice` decimal(10,2) DEFAULT NULL,
  `incrementBidPrice` decimal(10,2) DEFAULT NULL,
  `minBid` decimal(10,2) DEFAULT NULL,
  `currentBidPrice` decimal(10,2) DEFAULT NULL,
  `isAvailable` varchar(1) DEFAULT NULL,
  `highestBidder` int DEFAULT NULL,
  PRIMARY KEY (`auctionID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auction`
--

LOCK TABLES `auction` WRITE;
/*!40000 ALTER TABLE `auction` DISABLE KEYS */;
INSERT INTO `auction` VALUES (1,29,'2022-04-01','2022-06-06',150.02,20.00,130.00,1500.34,'Y',30),(2,30,'2022-01-01','2023-02-23',50.92,25.00,150.00,100.21,'N',29),(3,31,'2022-09-09','2022-10-10',50.00,20.00,25.09,56.76,'Y',30),(4,29,'2022-02-02','2034-09-02',20.21,2.23,120.12,45.00,'N',31),(5,35,'2022-02-02','2024-01-01',56.76,12.32,40.00,102.23,'Y',33),(6,35,'2022-02-02','2032-05-02',142.00,32.00,122.00,123.54,'N',34),(7,32,'2022-02-02','2022-11-11',100.00,100.00,100.00,100.00,'Y',-1),(8,32,'2022-02-02','2022-03-02',150.00,150.00,150.00,150.00,'Y',-1),(9,32,'2024-05-03','2025-02-10',180.00,20.00,180.00,180.00,'Y',-1);
/*!40000 ALTER TABLE `auction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bid`
--

DROP TABLE IF EXISTS `bid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bid` (
  `userID` int NOT NULL,
  `auctionID` int NOT NULL,
  `autoBidCap` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`userID`,`auctionID`),
  KEY `auctionID` (`auctionID`),
  CONSTRAINT `bid_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `users` (`userId`),
  CONSTRAINT `bid_ibfk_2` FOREIGN KEY (`auctionID`) REFERENCES `auction` (`auctionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bid`
--

LOCK TABLES `bid` WRITE;
/*!40000 ALTER TABLE `bid` DISABLE KEYS */;
/*!40000 ALTER TABLE `bid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contains`
--

DROP TABLE IF EXISTS `contains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contains` (
  `itemID` int NOT NULL,
  `auctionID` int DEFAULT NULL,
  PRIMARY KEY (`itemID`),
  KEY `auctionID` (`auctionID`),
  CONSTRAINT `contains_ibfk_1` FOREIGN KEY (`itemID`) REFERENCES `items` (`itemID`),
  CONSTRAINT `contains_ibfk_2` FOREIGN KEY (`auctionID`) REFERENCES `auction` (`auctionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contains`
--

LOCK TABLES `contains` WRITE;
/*!40000 ALTER TABLE `contains` DISABLE KEYS */;
INSERT INTO `contains` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9);
/*!40000 ALTER TABLE `contains` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `has`
--

DROP TABLE IF EXISTS `has`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `has` (
  `itemID` int NOT NULL AUTO_INCREMENT,
  `userID` int DEFAULT NULL,
  PRIMARY KEY (`itemID`),
  KEY `has_ibfk_1` (`userID`),
  CONSTRAINT `has_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `users` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `has`
--

LOCK TABLES `has` WRITE;
/*!40000 ALTER TABLE `has` DISABLE KEYS */;
INSERT INTO `has` VALUES (1,29),(4,29),(2,30),(3,31),(7,32),(8,32),(9,32),(5,35),(6,35);
/*!40000 ALTER TABLE `has` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `items` (
  `itemID` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`itemID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES (1),(2),(3),(4),(5),(6),(7),(8),(9);
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pant`
--

DROP TABLE IF EXISTS `pant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pant` (
  `uniqueItemID` int NOT NULL AUTO_INCREMENT,
  `itemID` int NOT NULL,
  `pant_waist` int DEFAULT NULL,
  `pant_type` varchar(50) DEFAULT NULL,
  `pant_gender` varchar(50) DEFAULT NULL,
  `color` varchar(50) DEFAULT NULL,
  `bidPrice` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`uniqueItemID`),
  KEY `itemID` (`itemID`),
  CONSTRAINT `pant_ibfk_1` FOREIGN KEY (`itemID`) REFERENCES `items` (`itemID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pant`
--

LOCK TABLES `pant` WRITE;
/*!40000 ALTER TABLE `pant` DISABLE KEYS */;
INSERT INTO `pant` VALUES (1,4,30,'high waist','female','red',45.00),(3,3,31,'linen','female','white',56.76),(4,7,32,'jean','male','white',100.00);
/*!40000 ALTER TABLE `pant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shirt`
--

DROP TABLE IF EXISTS `shirt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shirt` (
  `uniqueItemID` int NOT NULL AUTO_INCREMENT,
  `itemID` int NOT NULL,
  `shirt_size` varchar(50) DEFAULT NULL,
  `shirt_gender` varchar(50) DEFAULT NULL,
  `shirt_brand` varchar(50) DEFAULT NULL,
  `color` varchar(50) DEFAULT NULL,
  `bidPrice` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`uniqueItemID`),
  KEY `itemID` (`itemID`),
  CONSTRAINT `shirt_ibfk_1` FOREIGN KEY (`itemID`) REFERENCES `items` (`itemID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shirt`
--

LOCK TABLES `shirt` WRITE;
/*!40000 ALTER TABLE `shirt` DISABLE KEYS */;
INSERT INTO `shirt` VALUES (1,2,'medium','male','Nike','blue',100.21),(2,1,'large','female','Off-White','white',1500.34),(3,8,'medium','female','apes','black',150.00),(4,9,'medium','female','nike','white',180.00);
/*!40000 ALTER TABLE `shirt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shoe`
--

DROP TABLE IF EXISTS `shoe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shoe` (
  `uniqueItemID` int NOT NULL AUTO_INCREMENT,
  `itemID` int NOT NULL,
  `shoe_size` decimal(10,2) DEFAULT NULL,
  `shoe_gender` varchar(50) DEFAULT NULL,
  `shoe_brand` varchar(50) DEFAULT NULL,
  `color` varchar(50) DEFAULT NULL,
  `bidPrice` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`uniqueItemID`),
  KEY `itemID` (`itemID`),
  CONSTRAINT `shoe_ibfk_1` FOREIGN KEY (`itemID`) REFERENCES `items` (`itemID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoe`
--

LOCK TABLES `shoe` WRITE;
/*!40000 ALTER TABLE `shoe` DISABLE KEYS */;
INSERT INTO `shoe` VALUES (1,5,10.50,'male','Adidas','orange',102.23),(2,6,9.00,'female','Nike','grey',123.54);
/*!40000 ALTER TABLE `shoe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `userId` int NOT NULL AUTO_INCREMENT,
  `userName` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  PRIMARY KEY (`userId`),
  UNIQUE KEY `userName` (`userName`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (29,'andrewheo','email@gmail.com','pass','new brsunw','2022-01-01'),(30,'peter','email@gmail.com','pass','new brsunw','2022-01-01'),(31,'saijin','email@gmail.com','pass','new brsunw','2022-01-01'),(32,'monga','andrewheo1225@gmail.com','monga','idk','2002-01-15'),(33,'andrew','andrewheo1225@gmail.com','oass','2420 Rossett St, B','2002-01-15'),(34,'test','andrewheo1225@gmail.com','testpass','2420 Rossett St, B','2022-01-01'),(35,'dummy','andrewheo1225@gmail.com','dummypass','2420 Rossett St, B','2002-02-09');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-10 19:51:19

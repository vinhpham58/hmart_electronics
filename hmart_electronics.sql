-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: localhost    Database: electronic_devices_shop
-- ------------------------------------------------------
-- Server version	8.0.25

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
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `CartID` int NOT NULL AUTO_INCREMENT,
  `ProductID` int NOT NULL,
  `Quantity` smallint NOT NULL,
  `Price` double NOT NULL,
  `ImageUrl` varchar(128) NOT NULL,
  `ProductName` varchar(128) NOT NULL,
  `UserID` bigint NOT NULL,
  `AddedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`CartID`),
  KEY `fk_cart_product` (`ProductID`),
  KEY `fk_cart_user` (`UserID`),
  CONSTRAINT `fk_cart_product` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`),
  CONSTRAINT `fk_cart_user` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (1,3,48,700,'6.webp','Iphone X',5405173221823301368,'2022-07-02 00:00:00'),(2,2,7,60,'2.webp','Iphone 11',5405173221823301368,'2022-07-02 00:00:00'),(3,2,4,60,'2.webp','Iphone 11',4557477557166721127,'2022-07-02 00:00:00'),(4,1,10,50,'img1.jpg','Iphone 12',4557477557166721127,'2022-07-02 00:00:00'),(5,3,9,700,'6.webp','Iphone X',4557477557166721127,'2022-07-02 00:00:00');
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `CategoryID` int NOT NULL AUTO_INCREMENT,
  `CategoryName` varchar(128) NOT NULL,
  PRIMARY KEY (`CategoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'SmartPhones'),(2,'SmartWatches'),(3,'HeadPhones'),(11,'SmartWatches'),(12,'SmartWatches'),(13,'SmartWatches'),(14,'SmartWatches'),(15,'SmartWatches');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice`
--

DROP TABLE IF EXISTS `invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoice` (
  `InvoiceID` char(32) NOT NULL,
  `UserID` bigint DEFAULT NULL,
  `Email` varchar(64) NOT NULL,
  `Tel` varchar(16) NOT NULL,
  `Address` varchar(128) NOT NULL,
  `AddedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`InvoiceID`),
  KEY `fk_invoice_user` (`UserID`),
  CONSTRAINT `fk_invoice_user` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice`
--

LOCK TABLES `invoice` WRITE;
/*!40000 ALTER TABLE `invoice` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoicedetail`
--

DROP TABLE IF EXISTS `invoicedetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoicedetail` (
  `InvoiceDetailID` int NOT NULL AUTO_INCREMENT,
  `ProductID` int NOT NULL,
  `InvoiceID` char(32) NOT NULL,
  `Quantity` smallint DEFAULT NULL,
  `Price` double DEFAULT NULL,
  PRIMARY KEY (`InvoiceDetailID`),
  KEY `fk_productID_idx` (`ProductID`),
  KEY `fk_invoicedetail_invoice` (`InvoiceID`),
  CONSTRAINT `fk_invoicedetail_invoice` FOREIGN KEY (`InvoiceID`) REFERENCES `invoice` (`InvoiceID`),
  CONSTRAINT `fk_invoicedetail_product` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoicedetail`
--

LOCK TABLES `invoicedetail` WRITE;
/*!40000 ALTER TABLE `invoicedetail` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoicedetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `ProductID` int NOT NULL,
  `CategoryID` int NOT NULL,
  `ProductName` varchar(128) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `Description` varchar(1028) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `Weight` varchar(45) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `ImageUrl` varchar(128) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `Price` double NOT NULL,
  `Dimensions` varchar(45) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `Material` varchar(45) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  PRIMARY KEY (`ProductID`),
  KEY `fk_product_category` (`CategoryID`),
  CONSTRAINT `fk_product_category` FOREIGN KEY (`CategoryID`) REFERENCES `category` (`CategoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,2,'Iphone 12','Dien thoai Iphone 12','35.0','img1.jpg',50,'30x40','Mental'),(2,15,'Iphone 11','Dien thoai Iphone 11','45.0','3.webp',60,'20x50','mental'),(3,3,'Iphone X','Iphone X new','50.0','6.webp',700,'30x50','mental');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `RoleID` int NOT NULL,
  `RoleName` varchar(45) NOT NULL,
  PRIMARY KEY (`RoleID`),
  UNIQUE KEY `RoleName_UNIQUE` (`RoleName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'ROLE_ADMIN'),(2,'ROLE_USER');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `UserID` bigint NOT NULL,
  `Username` varchar(45) NOT NULL,
  `Password` varchar(200) NOT NULL,
  `FirstName` varchar(45) NOT NULL,
  `LastName` varchar(45) DEFAULT NULL,
  `Email` varchar(64) NOT NULL,
  `Tel` varchar(15) NOT NULL,
  `Address` varchar(128) NOT NULL,
  `AddedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`UserID`),
  UNIQUE KEY `CustomerID_UNIQUE` (`UserID`),
  UNIQUE KEY `Email_UNIQUE` (`Email`),
  UNIQUE KEY `Tel_UNIQUE` (`Tel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (3557197791216969285,'XCVBXCVB@gmail.com','$2a$10$6N6J.ji2Am28elQnGWOwBuH3fPfN6J6EPNHxfP4B633a97vUKQ/ua','o','zxcv','XCVBXCVB@gmail.com','zxcvzxcvzxcv','zxcvzxcvzxcv','2022-07-01 00:00:00'),(3886133914103333787,'c','$2a$10$KXH/6awOgyIzPClETGgl8e6RwFlUyzui4dXxd90ZEHWmQ7tWVlAlC','i','Vinh','vinhpham8598nt1@gmail.com','cc','v','2022-06-30 00:00:00'),(4484923697388558523,'qq@gmail.com','$2a$10$Wz8.jbK4ikpurXR7vcMO.uJdu9IcUvPky9dAJFvAFEZrDzaUtddl2','11','11','qq@gmail.com','33','qq','2022-06-30 00:00:00'),(4557477557166721127,'u','$2a$10$w8hf/kP2VHE4YbtCqkP8U.uyOKdTTZf0Gd8Jsja7a0uf/HJ5jxbCq','u','u','u@gmail.com','u','u','2022-07-01 00:00:00'),(5405173221823301368,'a','$2a$10$/LrcplXhVq9djuc1NVcKGuGkmpO1PutVW16Nu5XOk7MPMYvMwKdDW','a','a','a@gmail.com','a','a','2022-07-01 00:00:00'),(6125319066425423414,'v','$2a$10$fAHhFv8n6L5V24DTMIls6.eMMmhQlp6ahLcTq.o8ib8WeQLgU0kSu','v','v','1614128@hcmut.edu.vn','v','v',NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_role` (
  `RoleID` int NOT NULL,
  `UserID` bigint NOT NULL,
  PRIMARY KEY (`RoleID`,`UserID`),
  KEY `fk_user` (`UserID`),
  CONSTRAINT `fk_role` FOREIGN KEY (`RoleID`) REFERENCES `role` (`RoleID`),
  CONSTRAINT `fk_user` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (1,3557197791216969285),(1,4484923697388558523),(2,4557477557166721127),(1,5405173221823301368);
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-07-23  1:31:10

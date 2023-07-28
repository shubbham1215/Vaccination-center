-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: society_maintenance
-- ------------------------------------------------------
-- Server version	8.0.22

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


create schema society_maintenance;

USE society_maintenance ;
--
-- Table structure for table `premise_types`
--

DROP TABLE IF EXISTS `premise_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `premise_types` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(45) DEFAULT NULL,
  `maintenanceFee` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `premise_types`
--

LOCK TABLES `premise_types` WRITE;
/*!40000 ALTER TABLE `premise_types` DISABLE KEYS */;
INSERT INTO `premise_types` VALUES (1,'1 BHK flat',500),(2,'2 BHK flat',700),(3,'3 BHK flat',1000),(4,'Row Villa',2000),(5,'Shop',400);
/*!40000 ALTER TABLE `premise_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--
DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member` (
  `id` int NOT NULL AUTO_INCREMENT,
  `firstName` varchar(45) DEFAULT NULL,
  `lastName` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `aadharNo` varchar(45) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `createdOn` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES (6,'Pranay','Usgaonkar','pranayu6@gmail.com','8390812643','412355551289','1997-06-05','2021-08-24 21:12:46'),(7,'Sarvesh','Raikar','sarvesh@gmail.com','8550264530','412355551349','1992-06-05','2021-08-24 21:14:21'),(8,'Reuben','Vaz','Vaz@gmail.com','8550264230','412346551349','2000-09-22','2021-08-24 21:16:33'),(11,'Sasha','Banks','sasha@gmail.com','8550264420','412346551424','2000-09-22','2021-08-25 22:44:31'),(12,'Deepak','Pai','deepak@gmail.com','9673228966','412315951421','1982-06-05','2021-08-25 22:48:52'),(14,'Joel','Fernandes','joel@gmail.com','8390812643','412315951782','1988-06-25','2021-08-27 12:42:03'),(16,'Devidas','Patil','patil@gmail.com','8390812632','412315951789','1987-06-05','2021-08-27 13:02:08'),(17,'Ivo','Costa','ivo@gmail.com','8390812632','412315951789','1987-06-05','2021-08-27 13:14:23');
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `renter`
--

DROP TABLE IF EXISTS `renter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `renter` (
  `id` int NOT NULL AUTO_INCREMENT,
  `firstName` varchar(45) DEFAULT NULL,
  `lastName` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `aadharNo` varchar(45) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `createdOn` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `renter`
--

LOCK TABLES `renter` WRITE;
/*!40000 ALTER TABLE `renter` DISABLE KEYS */;
INSERT INTO `renter` VALUES (4,'Sachin','Salunke','salunke@gmail.com','8390264230','412346551212','2001-06-22','2021-08-24 22:06:57'),(5,'Aniket','Shet','shet@gmail.com','8390256230','412346552019','1990-02-15','2021-08-24 22:07:54'),(6,'Prakash','Nayak','prakash@gmail.com','8390256230','412346552899','1991-01-30','2021-08-25 22:50:39'),(8,'John','Mendis','john@gmail.com','8390256268','412346552126','1980-01-03','2021-08-25 22:52:16'),(10,'Shubham','Gauns','shubham@gmail.com','9673222475','412346552893','1975-08-30','2021-08-27 10:11:28'),(12,'Satish','Kumar','kumar@gmail.com','8390812678','412346552812','1995-07-20','2021-08-27 13:02:17');
/*!40000 ALTER TABLE `renter` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `ledger`
--

DROP TABLE IF EXISTS `ledger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ledger` (
  `id` int NOT NULL AUTO_INCREMENT,
  `memberId` int DEFAULT NULL,
  `dueAmount` decimal(10,2) DEFAULT NULL,
  `dueDate` date DEFAULT NULL,
  `createdOn` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedOn` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_ledger_member_memberId_idx` (`memberId`),
  CONSTRAINT `FK_ledger_member_memberId` FOREIGN KEY (`memberId`) REFERENCES `member` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ledger`
--

LOCK TABLES `ledger` WRITE;
/*!40000 ALTER TABLE `ledger` DISABLE KEYS */;
INSERT INTO `ledger` VALUES (1,6,1000.00,'2022-02-10','2021-08-25 07:56:42','2021-08-27 10:00:16'),(30,7,2000.00,'2021-09-10','2021-08-25 16:49:04','2021-08-25 19:05:01'),(47,8,2510.00,'2021-08-10','2021-07-16 23:19:25','2021-08-26 17:29:35'),(48,11,1400.00,'2021-09-10','2021-08-25 23:20:38','2021-08-25 23:26:21'),(49,12,502.00,'2021-08-10','2021-06-26 23:27:17','2021-08-26 17:29:56'),(51,14,400.00,'2021-09-10','2021-08-27 12:44:13','2021-08-27 12:44:13'),(52,16,400.00,'2021-10-10','2021-08-27 13:03:37','2021-08-27 13:04:47'),(53,17,1000.00,'2021-10-10','2021-08-27 13:15:38','2021-08-27 13:16:48');
/*!40000 ALTER TABLE `ledger` ENABLE KEYS */;
UNLOCK TABLES;




--
-- Table structure for table `premise`
--

DROP TABLE IF EXISTS `premise`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `premise` (
  `id` int NOT NULL AUTO_INCREMENT,
  `premiseTypeId` int DEFAULT NULL,
  `premiseNo` varchar(5) DEFAULT NULL,
  `memberId` int DEFAULT NULL,
  `renterId` int DEFAULT NULL,
  `createdOn` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedOn` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQUE_premiseNo` (`premiseNo`) /*!80000 INVISIBLE */,
  KEY `FK_premise_member_memberId_idx` (`memberId`),
  KEY `FK_premise_premise_type_premiseTypeId_idx` (`premiseTypeId`),
  KEY `FK_premise_renter_renterId_idx` (`renterId`),
  CONSTRAINT `FK_premise_member_memberId` FOREIGN KEY (`memberId`) REFERENCES `member` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_premise_premise_type_premiseTypeId` FOREIGN KEY (`premiseTypeId`) REFERENCES `premise_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_premise_renter_renterId` FOREIGN KEY (`renterId`) REFERENCES `renter` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `premise`
--

LOCK TABLES `premise` WRITE;
/*!40000 ALTER TABLE `premise` DISABLE KEYS */;
INSERT INTO `premise` VALUES (5,1,'F-01',6,5,'2021-08-24 20:43:31','2021-08-25 20:21:07'),(7,3,'F-02',7,NULL,'2021-08-24 20:43:31','2021-08-25 23:17:27'),(8,4,'V-01',8,NULL,'2021-08-24 20:43:31','2021-08-25 23:19:25'),(9,5,'SH-01',11,4,'2021-08-24 20:43:31','2021-08-25 23:21:53'),(10,5,'SH-02',12,NULL,'2021-08-24 20:43:31','2021-08-25 23:27:17'),(11,5,'SH-05',14,NULL,'2021-08-25 22:53:54','2021-08-27 12:44:13'),(12,5,'SH-06',16,NULL,'2021-08-25 22:54:04','2021-08-27 13:03:37'),(13,5,'SH-07',NULL,NULL,'2021-08-25 23:02:43','2021-08-25 23:02:43'),(14,4,'V-02',NULL,NULL,'2021-08-27 10:07:45','2021-08-27 10:07:45'),(16,5,'SH-03',NULL,NULL,'2021-08-27 12:36:06','2021-08-27 12:36:06'),(17,5,'SH-10',NULL,NULL,'2021-08-27 13:02:53','2021-08-27 13:02:53'),(18,3,'F-20',17,NULL,'2021-08-27 13:13:33','2021-08-27 13:15:38');
/*!40000 ALTER TABLE `premise` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `premise_AFTER_UPDATE` AFTER UPDATE ON `premise` FOR EACH ROW BEGIN

	IF (NEW.renterId IS NULL) THEN

	INSERT INTO society_maintenance.ledger(memberId)
	select NEW.memberId;

	select max(id) into @maxid from  society_maintenance.ledger;

	-- Update dueAmount

	update society_maintenance.ledger l
	inner join society_maintenance.member m  on l.memberId=m.id
	inner join society_maintenance.premise p on p.memberId=m.id
	inner join society_maintenance.premise_types pt on p.premiseTypeId=pt.id
	set l.dueAmount=pt.maintenanceFee
	where l.id=@maxid;
    
	-- Update dueDate
    
	select day(createdOn) into @day
	from society_maintenance.ledger l
	where id=@maxid;

	select year(CURDATE()),month(CURDATE()) into @year, @month;

	SELECT DATEDIFF(CONCAT( @year,"-",@month,"-10"),CURDATE()) into @DATEDIFF;

    -- If DATEDIFF is positive due to date is for 10th of this month else due date in on 10th of next month
	SELECT IF(@DATEDIFF >  1, CONCAT( @year,"-",@month,"-10"), cast(NOW() as date) + INTERVAL 1 MONTH + INTERVAL @DATEDIFF Day) into @dueDate;

	update society_maintenance.ledger
	set dueDate= @dueDate
	where id=@maxid;
    
    ELSE
		update society_maintenance.ledger
		set dueAmount=dueAmount+500
		where memberid=NEW.memberId;
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;



--
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaction` (
  `id` int NOT NULL AUTO_INCREMENT,
  `amount` decimal(10,2) DEFAULT NULL,
  `memberId` int DEFAULT NULL,
  `createdOn` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction`
--

LOCK TABLES `transaction` WRITE;
/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
INSERT INTO `transaction` VALUES (1,1000.00,6,'2021-08-25 23:34:18'),(2,1000.00,6,'2021-08-25 23:35:18'),(3,400.00,12,'2021-08-25 23:36:04'),(4,502.00,12,'2021-08-27 09:39:12'),(5,1000.00,6,'2021-08-27 09:59:16'),(6,1000.00,6,'2021-08-27 10:00:16'),(7,400.00,16,'2021-08-27 13:04:47'),(8,1000.00,17,'2021-08-27 13:16:48');
/*!40000 ALTER TABLE `transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'society_maintenance'
--

--
-- Dumping routines for database 'society_maintenance'
--
/*!50003 DROP PROCEDURE IF EXISTS `updatePendingDues` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updatePendingDues`()
BEGIN

	-- If DATEDIFF is negative add 1.5% interest daily to existing dueAmount
    
	update society_maintenance.ledger
	set dueAmount=IF(DATEDIFF(dueDate,CURDATE()) >=  0, dueAmount, dueAmount +(dueAmount*0.015 ));
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-08-28  1:29:36

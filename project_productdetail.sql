CREATE DATABASE  IF NOT EXISTS `project` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;
USE `project`;
-- MySQL dump 10.13  Distrib 8.0.15, for Win64 (x86_64)
--
-- Host: localhost    Database: project
-- ------------------------------------------------------
-- Server version	8.0.15

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `productdetail`
--

DROP TABLE IF EXISTS `productdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `productdetail` (
  `productId` int(11) NOT NULL AUTO_INCREMENT,
  `productDescription` varchar(255) DEFAULT NULL,
  `productName` varchar(255) DEFAULT NULL,
  `productPrice` int(11) DEFAULT NULL,
  PRIMARY KEY (`productId`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productdetail`
--

LOCK TABLES `productdetail` WRITE;
/*!40000 ALTER TABLE `productdetail` DISABLE KEYS */;
INSERT INTO `productdetail` VALUES (1,'i7 8th gen, 1TB HDD,16GB Ram,1060 MaxQ Nvidia 6GB DDR5 graphics','Hp Laptop',1459),(2,'i7 8th gen, 1TB HDD,8GB Ram,1050Ti  Nvidia 4GB DDR5 graphics','Dell m15',1090),(4,'CHIPSET=>Qualcomm Snapdragon 845,\r\nGRAPHICS=>Adreno 630,\r\nPROCESSOR=>Octa core (2.5 GHz, Quad core, Kryo 385 + 1.6 GHz, Quad core, Kryo 385),\r\nARCHITECTURE=>64 bit,\r\nRAM=>4 GB.','Google Pixel 3',700),(5,'CHIPSET=>HiSilicon Kirin 710,\r\nGRAPHICS=>Mali-G51 MP4,\r\nPROCESSOR=>Octa core (2.2 GHz, Quad core, Cortex A73 + 1.7 GHz, Quad core, Cortex A53),\r\nARCHITECTURE=>64 bit,\r\nRAM=>4 GB.','Honor 10 Lite',350),(6,'CHIPSET=>Qualcomm Snapdragon 632,\r\nGRAPHICS=>Adreno 506,\r\nPROCESSOR=>Octa core (1.8 GHz, Quad core, Kryo 250 + 1.8 GHz, Quad core, Kryo 250),\r\nARCHITECTURE=>64 bit,\r\nRAM=>3 GB.','Asus Zenfone Max M2',455),(7,'CHIPSET=>Qualcomm Snapdragon 845,\r\nGRAPHICS=>Adreno 630,\r\nPROCESSOR=>Octa core (2.8 GHz, Quad core, Kryo 385 + 1.8 GHz, Quad core, Kryo 385),\r\nARCHITECTURE=>64 bit,\r\nRAM=>10 GB,\r\nINTERNAL MEMORY=>256 GB.','OnePlus 6T McLaren Edition',625);
/*!40000 ALTER TABLE `productdetail` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-21 17:31:37

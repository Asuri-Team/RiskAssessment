CREATE DATABASE  IF NOT EXISTS `risk` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `risk`;
-- MySQL dump 10.13  Distrib 5.6.19, for osx10.7 (i386)
--
-- Host: localhost    Database: risk
-- ------------------------------------------------------
-- Server version	5.6.21-enterprise-commercial-advanced

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Assets`
--

DROP TABLE IF EXISTS `Assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Assets` (
  `Assets_id` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `System_id` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `Assets_type` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `Assets_name` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `confidentiality` int(11) DEFAULT NULL,
  `integrality` int(11) DEFAULT NULL,
  `availability` int(11) DEFAULT NULL,
  `Assets_value` int(11) DEFAULT NULL,
  PRIMARY KEY (`Assets_id`)
) ENGINE=InnoDB DEFAULT CHARSET=big5;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Mapping`
--

DROP TABLE IF EXISTS `Mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Mapping` (
  `Asset_id` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `Vul_id` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `Thread_id` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Project`
--

DROP TABLE IF EXISTS `Project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Project` (
  `Project_id` varchar(45) NOT NULL,
  `Project_name` varchar(80) DEFAULT NULL,
  `Project_client` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`Project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `RISK`
--

DROP TABLE IF EXISTS `RISK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RISK` (
  `Asset_id` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `Asset_value` int(11) DEFAULT NULL,
  `Vul_id` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `Vul_level` int(11) DEFAULT NULL,
  `Threat_id` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `Threat_level` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TV` int(11) DEFAULT NULL,
  `AV` int(11) DEFAULT NULL,
  `R` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `System`
--

DROP TABLE IF EXISTS `System`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `System` (
  `System_id` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `System_name` varchar(80) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `Project_id` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`System_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Threat`
--

DROP TABLE IF EXISTS `Threat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Threat` (
  `Asset_id` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `THR-01` int(11) DEFAULT NULL,
  `THR-02` int(11) DEFAULT NULL,
  `THR-03` int(11) DEFAULT NULL,
  `THR-04` int(11) DEFAULT NULL,
  `THR-05` int(11) DEFAULT NULL,
  `THR-06` int(11) DEFAULT NULL,
  `THR-07` int(11) DEFAULT NULL,
  `THR-08` int(11) DEFAULT NULL,
  `THR-09` int(11) DEFAULT NULL,
  `THR-10` int(11) DEFAULT NULL,
  `THR-11` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Threat_possibility`
--

DROP TABLE IF EXISTS `Threat_possibility`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Threat_possibility` (
  `THR-01` int(11) DEFAULT NULL,
  `THR-02` int(11) DEFAULT NULL,
  `THR-03` int(11) DEFAULT NULL,
  `THR-04` int(11) DEFAULT NULL,
  `THR-05` int(11) DEFAULT NULL,
  `THR-06` int(11) DEFAULT NULL,
  `THR-07` int(11) DEFAULT NULL,
  `THR-08` int(11) DEFAULT NULL,
  `THR-09` int(11) DEFAULT NULL,
  `THR-10` int(11) DEFAULT NULL,
  `THR-11` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Threat_type`
--

DROP TABLE IF EXISTS `Threat_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Threat_type` (
  `Threat_id` varchar(80) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Threat_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Threat_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`Threat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=big5;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Threat_value`
--

DROP TABLE IF EXISTS `Threat_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Threat_value` (
  `Asset_id` varchar(45) DEFAULT NULL,
  `THR-01` int(11) DEFAULT NULL,
  `THR-02` int(11) DEFAULT NULL,
  `THR-03` int(11) DEFAULT NULL,
  `THR-04` int(11) DEFAULT NULL,
  `THR-05` int(11) DEFAULT NULL,
  `THR-06` int(11) DEFAULT NULL,
  `THR-07` int(11) DEFAULT NULL,
  `THR-08` int(11) DEFAULT NULL,
  `THR-09` int(11) DEFAULT NULL,
  `THR-10` int(11) DEFAULT NULL,
  `THR-11` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Vulnerability`
--

DROP TABLE IF EXISTS `Vulnerability`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Vulnerability` (
  `Vul_id` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `Vul_content` varchar(80) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `Vul_level` int(11) DEFAULT NULL,
  `Asset_id` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=big5;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'risk'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-10-22  0:06:34

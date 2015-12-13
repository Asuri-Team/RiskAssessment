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
-- Dumping data for table `Assets`
--

LOCK TABLES `Assets` WRITE;
/*!40000 ALTER TABLE `Assets` DISABLE KEYS */;
/*!40000 ALTER TABLE `Assets` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `Mapping`
--

LOCK TABLES `Mapping` WRITE;
/*!40000 ALTER TABLE `Mapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `Mapping` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `Project`
--

LOCK TABLES `Project` WRITE;
/*!40000 ALTER TABLE `Project` DISABLE KEYS */;
/*!40000 ALTER TABLE `Project` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `RISK`
--

LOCK TABLES `RISK` WRITE;
/*!40000 ALTER TABLE `RISK` DISABLE KEYS */;
/*!40000 ALTER TABLE `RISK` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `System`
--

LOCK TABLES `System` WRITE;
/*!40000 ALTER TABLE `System` DISABLE KEYS */;
/*!40000 ALTER TABLE `System` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `Threat`
--

LOCK TABLES `Threat` WRITE;
/*!40000 ALTER TABLE `Threat` DISABLE KEYS */;
/*!40000 ALTER TABLE `Threat` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `Threat_possibility`
--

LOCK TABLES `Threat_possibility` WRITE;
/*!40000 ALTER TABLE `Threat_possibility` DISABLE KEYS */;
/*!40000 ALTER TABLE `Threat_possibility` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `Threat_type`
--

LOCK TABLES `Threat_type` WRITE;
/*!40000 ALTER TABLE `Threat_type` DISABLE KEYS */;
INSERT INTO `Threat_type` VALUES ('THR-01','软硬件故障','对业务实施或系统运行产生影响的设备硬件故障、通讯链路中断、系统本身或软件缺陷等问题'),('THR-02','物理环境影响','对信息系统正常运行造成影响的物理环境问题和自然灾害'),('THR-03','无作为或操作失误','应该执行而没有执行相应的操作，或无意执行了错误的操作'),('THR-04','管理不到位','安全管理无法落实或不到位，从而破坏信息系统正常有序运行'),('THR-05','恶意代码','故意在计算机系统上执行恶意任务的程序代码'),('THR-06','越权或滥用','通过采用一些措施，超越自己的权限访问了本来无权访问的资源，或者滥用自己的权限，做出破坏信息系统的行为'),('THR-07','网络攻击','利用工具和技术通过网络对信息系统进行攻击和入侵'),('THR-08','物理攻击','通过物理的接触造成对软件、硬件、数据的破坏'),('THR-09','泄密','信息泄露给不应了解的他人'),('THR-10','篡改','非法修改信息，破坏信息的完整性使系统的安全性降低或信息不可用'),('THR-11','抵赖','不承认收到的信息和所作的操作和交易');
/*!40000 ALTER TABLE `Threat_type` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `Threat_value`
--

LOCK TABLES `Threat_value` WRITE;
/*!40000 ALTER TABLE `Threat_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `Threat_value` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `Vulnerability`
--

LOCK TABLES `Vulnerability` WRITE;
/*!40000 ALTER TABLE `Vulnerability` DISABLE KEYS */;
/*!40000 ALTER TABLE `Vulnerability` ENABLE KEYS */;
UNLOCK TABLES;

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

-- Dump completed on 2015-12-13 16:16:09

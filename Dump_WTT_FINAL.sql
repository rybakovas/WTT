CREATE DATABASE  IF NOT EXISTS `Jogo` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `Jogo`;
-- MySQL dump 10.13  Distrib 5.5.32, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: Jogo
-- ------------------------------------------------------
-- Server version	5.5.33

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
-- Table structure for table `Horde`
--

DROP TABLE IF EXISTS `Horde`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Horde` (
  `idHorde` int(11) NOT NULL AUTO_INCREMENT,
  `idHordeQuest` int(11) NOT NULL,
  `idEnemy` int(11) NOT NULL,
  PRIMARY KEY (`idHorde`),
  KEY `fk_Horde_1` (`idHordeQuest`),
  KEY `fk_Horde_2` (`idEnemy`),
  CONSTRAINT `fk_Horde_1` FOREIGN KEY (`idHordeQuest`) REFERENCES `HordeQuest` (`idHordeQuest`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Horde_2` FOREIGN KEY (`idEnemy`) REFERENCES `Enemy` (`idEnemy`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1279 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Horde`
--

LOCK TABLES `Horde` WRITE;
/*!40000 ALTER TABLE `Horde` DISABLE KEYS */;
/*!40000 ALTER TABLE `Horde` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Log`
--

DROP TABLE IF EXISTS `Log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Log` (
  `idLog` int(11) NOT NULL AUTO_INCREMENT,
  `idCategori` int(11) NOT NULL,
  `idUser` int(11) NOT NULL,
  `Time` datetime NOT NULL,
  `Description` varchar(200) NOT NULL,
  PRIMARY KEY (`idLog`),
  KEY `fk_Log_Categoria_Atividade1` (`idCategori`),
  KEY `fk_Log_Usuario1` (`idUser`),
  CONSTRAINT `fk_Log_Categoria_Atividade1` FOREIGN KEY (`idCategori`) REFERENCES `Categoria_Atividade` (`idCategori`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Log_Usuario1` FOREIGN KEY (`idUser`) REFERENCES `Users` (`idUser`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Log`
--

LOCK TABLES `Log` WRITE;
/*!40000 ALTER TABLE `Log` DISABLE KEYS */;
/*!40000 ALTER TABLE `Log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EnemyClass`
--

DROP TABLE IF EXISTS `EnemyClass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EnemyClass` (
  `idEnemyClass` int(11) NOT NULL AUTO_INCREMENT,
  `Description` varchar(45) DEFAULT NULL,
  `Image` varchar(45) DEFAULT NULL,
  `Difficult` varchar(45) DEFAULT NULL,
  `Life` int(11) DEFAULT NULL,
  PRIMARY KEY (`idEnemyClass`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EnemyClass`
--

LOCK TABLES `EnemyClass` WRITE;
/*!40000 ALTER TABLE `EnemyClass` DISABLE KEYS */;
INSERT INTO `EnemyClass` VALUES (1,'Ba_jiao_gui',NULL,'Easy',10),(2,'Di_fu_ling',NULL,'Normal',20),(3,'Diao_si_gui',NULL,'Hard',35),(4,'E_gui',NULL,'Easy',10),(5,'Gui_po',NULL,'Hard',35),(6,'Heibai_Wuchang',NULL,'Normal',20),(7,'Jian',NULL,'Normal',20),(8,'Jiangshi',NULL,'Easy',10),(9,'Niu_tou_ma_mian',NULL,'Hard',35),(10,'Nu_gui',NULL,'Easy',10),(11,'Shui_gui',NULL,'Easy',10),(12,'Wutou_gui',NULL,'Hard',35),(13,'You_hun_ye_gui',NULL,'Hard',35),(14,'Yuan_gui',NULL,'Easy',10),(15,'Ying_ling',NULL,'Normal',20),(16,'Zhi_ren',NULL,'Normal',20),(17,'Zhong_yin_shen',NULL,'Hard',35),(18,'Zhi_ren_ken',NULL,'Normal',20);
/*!40000 ALTER TABLE `EnemyClass` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Army`
--

DROP TABLE IF EXISTS `Army`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Army` (
  `idArmy` int(11) NOT NULL AUTO_INCREMENT,
  `idVillageBuild` int(11) NOT NULL,
  `idUnit` int(11) NOT NULL,
  `Unit_Name` varchar(45) DEFAULT NULL,
  `ChunkAt` int(11) DEFAULT NULL,
  `Attack` int(11) DEFAULT NULL,
  `Defense` int(11) DEFAULT NULL,
  `Life` int(11) DEFAULT NULL,
  `Pending` varchar(45) NOT NULL,
  `EndTime` datetime DEFAULT NULL,
  `Face` varchar(20) DEFAULT NULL,
  `Squad` varchar(1) NOT NULL DEFAULT 'N',
  `Sell` varchar(1) NOT NULL DEFAULT 'N',
  `Work` varchar(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`idArmy`),
  KEY `fk_Army_1` (`idVillageBuild`),
  KEY `fk_Army_2` (`idUnit`),
  CONSTRAINT `fk_Army_1` FOREIGN KEY (`idVillageBuild`) REFERENCES `VillageBuild` (`idVillageBuild`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Army_2` FOREIGN KEY (`idUnit`) REFERENCES `UnitClass` (`idUnit`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1782375 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Army`
--

LOCK TABLES `Army` WRITE;
/*!40000 ALTER TABLE `Army` DISABLE KEYS */;
INSERT INTO `Army` VALUES (1782344,1616,1,'Chao',NULL,1,1,10,'N',NULL,'Farmer','N','N','Y'),(1782345,1616,1,'Lonlon',NULL,1,1,10,'N',NULL,'Farmer','N','N','Y'),(1782346,1616,1,'Kaikai',NULL,1,1,10,'N',NULL,'Farmer','N','N','Y'),(1782347,1616,1,'Lonlon',NULL,1,1,10,'N',NULL,'Farmer','N','N','Y'),(1782348,1616,1,'Jun',NULL,1,1,10,'N',NULL,'Farmer','N','N','Y'),(1782349,1616,1,'Ru',NULL,1,1,10,'N',NULL,'Farmer','N','N','Y'),(1782350,1616,1,'Jin',NULL,1,1,10,'N',NULL,'Farmer','N','N','Y'),(1782351,1616,1,'Lan',NULL,1,1,10,'N',NULL,'Farmer','N','N','Y'),(1782352,1623,1,'Bai',NULL,1,1,10,'N',NULL,'Farmer','N','N','Y'),(1782353,1616,1,'De',NULL,1,1,10,'N',NULL,'Farmer','N','N','Y'),(1782354,1624,1,'Qiu',NULL,1,1,10,'N',NULL,'Farmer','N','N','Y'),(1782355,1625,1,'Chao',NULL,1,1,10,'N',NULL,'Farmer','N','N','Y'),(1782356,1626,1,'Jing',NULL,1,1,10,'N',NULL,'Farmer','N','N','Y'),(1782357,1623,1,'Minmin',NULL,1,1,10,'N',NULL,'Farmer','N','N','Y'),(1782358,1616,1,'Shu',NULL,1,1,10,'N',NULL,'Farmer','N','N','Y'),(1782359,1624,1,'Ju',NULL,1,1,10,'N',NULL,'Farmer','N','N','Y'),(1782360,1626,1,'Dishi',NULL,1,1,10,'N',NULL,'Farmer','N','N','Y'),(1782361,1623,1,'Ayra',NULL,1,1,10,'N',NULL,'Farmer','N','N','Y'),(1782362,1616,1,'De',NULL,1,1,10,'N',NULL,'Farmer','N','N','Y'),(1782363,1625,1,'Wu',NULL,1,1,10,'N',NULL,'Farmer','N','N','Y'),(1782364,1624,1,'Bai',NULL,1,1,10,'N',NULL,'Farmer','N','N','Y'),(1782365,1621,3,'Heng',NULL,7,2,15,'N',NULL,'Archer','N','N','N'),(1782366,1622,6,'Qiu',NULL,10,5,20,'N',NULL,'Pikeman','N','N','N'),(1782367,1626,1,'Rong',NULL,1,1,10,'N',NULL,'Farmer','N','N','Y'),(1782368,1623,1,'Tai',NULL,1,1,10,'N',NULL,'Farmer','N','N','Y'),(1782369,1624,1,'Bao',NULL,1,1,10,'N',NULL,'Farmer','N','N','Y'),(1782370,1616,1,'Ping',NULL,1,1,10,'N',NULL,'Farmer','N','N','Y'),(1782371,1625,1,'Huan',NULL,1,1,10,'N',NULL,'Farmer','N','N','N'),(1782372,1621,3,'Wu',NULL,7,2,15,'N',NULL,'Archer','N','N','N'),(1782373,1628,3,'Jiang',NULL,7,2,15,'N',NULL,'Archer','N','N','N'),(1782374,1621,3,'Wen',NULL,7,2,15,'Y','2013-12-02 16:47:31','Archer','N','N','N');
/*!40000 ALTER TABLE `Army` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `VillageBuild`
--

DROP TABLE IF EXISTS `VillageBuild`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `VillageBuild` (
  `idVillageBuild` int(11) NOT NULL AUTO_INCREMENT,
  `idVillage` int(11) NOT NULL,
  `idBuilding` int(11) NOT NULL,
  `posX` int(11) NOT NULL,
  `posY` int(11) NOT NULL,
  `endTime` datetime DEFAULT NULL,
  `pending` varchar(1) DEFAULT NULL,
  `endTimeColection` datetime DEFAULT NULL,
  PRIMARY KEY (`idVillageBuild`),
  KEY `fk_VillageBuild_Village1` (`idVillage`),
  KEY `fk_VillageBuild_Construcao_Dados1` (`idBuilding`),
  CONSTRAINT `fk_VillageBuild_Construcao_Dados1` FOREIGN KEY (`idBuilding`) REFERENCES `Buildings` (`idBuilding`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_VillageBuild_Village1` FOREIGN KEY (`idVillage`) REFERENCES `Village` (`idVillage`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1631 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `VillageBuild`
--

LOCK TABLES `VillageBuild` WRITE;
/*!40000 ALTER TABLE `VillageBuild` DISABLE KEYS */;
INSERT INTO `VillageBuild` VALUES (1616,97,1,5,5,NULL,'N',NULL),(1617,97,6,4,4,NULL,'N','2013-12-02 16:47:03'),(1618,97,7,5,4,NULL,'N','2013-12-02 16:47:03'),(1619,97,9,6,4,NULL,'N','2013-12-02 16:47:03'),(1620,97,10,7,4,NULL,'N','2013-12-02 16:47:03'),(1621,97,2,3,7,'2013-12-02 16:47:31','Y',NULL),(1622,97,4,4,7,NULL,'N',NULL),(1623,97,1,4,5,NULL,'N',NULL),(1624,97,1,6,5,NULL,'N',NULL),(1625,97,1,7,5,NULL,'N',NULL),(1626,97,1,3,5,NULL,'N',NULL),(1627,97,8,3,4,NULL,'N','2013-12-02 16:47:03'),(1628,97,2,3,8,NULL,'N',NULL),(1629,97,4,4,8,NULL,'N',NULL),(1630,97,8,3,3,NULL,'N','2013-12-02 16:47:27');
/*!40000 ALTER TABLE `VillageBuild` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PlayerSession`
--

DROP TABLE IF EXISTS `PlayerSession`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PlayerSession` (
  `idUser` int(11) NOT NULL,
  `sessionId` int(10) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `endOn` datetime NOT NULL,
  PRIMARY KEY (`idUser`),
  UNIQUE KEY `idUser_UNIQUE` (`idUser`),
  KEY `sessionId` (`sessionId`),
  KEY `fk_PlayerSession_Users1` (`idUser`),
  CONSTRAINT `fk_PlayerSession_Users1` FOREIGN KEY (`idUser`) REFERENCES `Users` (`idUser`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=478 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PlayerSession`
--

LOCK TABLES `PlayerSession` WRITE;
/*!40000 ALTER TABLE `PlayerSession` DISABLE KEYS */;
INSERT INTO `PlayerSession` VALUES (54,477,'2013-12-02 16:38:09','2013-12-02 17:38:09');
/*!40000 ALTER TABLE `PlayerSession` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UnitClass`
--

DROP TABLE IF EXISTS `UnitClass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UnitClass` (
  `idUnit` int(11) NOT NULL AUTO_INCREMENT,
  `idBuilding` int(11) NOT NULL,
  `Description` varchar(45) NOT NULL,
  `Image` varchar(20) NOT NULL,
  `Time_Creat` time NOT NULL,
  `Attack` int(11) NOT NULL,
  `Defense` int(11) NOT NULL,
  `Life` int(11) NOT NULL,
  `Obs` text,
  PRIMARY KEY (`idUnit`),
  KEY `idBuilding` (`idBuilding`),
  CONSTRAINT `idBuilding` FOREIGN KEY (`idBuilding`) REFERENCES `Buildings` (`idBuilding`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UnitClass`
--

LOCK TABLES `UnitClass` WRITE;
/*!40000 ALTER TABLE `UnitClass` DISABLE KEYS */;
INSERT INTO `UnitClass` VALUES (1,1,'Farmer','Farmer','00:00:30',1,1,10,NULL),(3,2,'Archer','Archer','00:01:00',7,2,15,NULL),(4,4,'Swordman','Swordman','00:01:00',7,10,20,NULL),(5,5,'Ninja','Ninja','00:03:00',25,8,25,NULL),(6,4,'Pikeman','Pikeman','00:01:30',10,5,20,NULL),(7,5,'Monk','Monk','00:02:45',15,0,40,NULL),(8,3,'Archer Mount','Archer_Mount','00:03:00',20,10,30,NULL),(9,13,'Ladder','Ladder','00:04:00',1,25,30,NULL),(10,13,'Catapult','Catapult','00:04:30',45,15,25,NULL),(11,15,'Ninja Mount','Ninja_Mount','00:03:30',35,15,30,NULL);
/*!40000 ALTER TABLE `UnitClass` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Offert`
--

DROP TABLE IF EXISTS `Offert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Offert` (
  `idOffert` int(11) NOT NULL AUTO_INCREMENT,
  `idUser` int(11) NOT NULL,
  `idBasecResouce` int(11) NOT NULL,
  `Qty` int(11) NOT NULL,
  `Money` int(11) NOT NULL,
  `Sell` varchar(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`idOffert`),
  KEY `fk_Offert_1` (`idBasecResouce`),
  KEY `fk_Offert_2` (`idUser`),
  CONSTRAINT `fk_Offert_1` FOREIGN KEY (`idBasecResouce`) REFERENCES `BasecResource` (`idBasecResouce`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Offert_2` FOREIGN KEY (`idUser`) REFERENCES `Users` (`idUser`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Offert`
--

LOCK TABLES `Offert` WRITE;
/*!40000 ALTER TABLE `Offert` DISABLE KEYS */;
/*!40000 ALTER TABLE `Offert` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Enemy`
--

DROP TABLE IF EXISTS `Enemy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Enemy` (
  `idEnemy` int(11) NOT NULL AUTO_INCREMENT,
  `idEnemyClass` int(11) NOT NULL,
  `Enemy_name` varchar(45) DEFAULT NULL,
  `Attack` int(11) NOT NULL,
  `Defense` int(11) NOT NULL,
  `Life` int(11) NOT NULL,
  `InHorde` varchar(45) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`idEnemy`),
  KEY `fk_Enemy_1` (`idEnemyClass`),
  CONSTRAINT `fk_Enemy_1` FOREIGN KEY (`idEnemyClass`) REFERENCES `EnemyClass` (`idEnemyClass`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Enemy`
--

LOCK TABLES `Enemy` WRITE;
/*!40000 ALTER TABLE `Enemy` DISABLE KEYS */;
INSERT INTO `Enemy` VALUES (1,1,'AI',7,0,10,'Y'),(2,2,'BAOZHAI',13,3,20,'Y'),(3,3,'BIYU',20,5,0,'Y'),(4,4,'CHANGCHANG',7,0,10,'N'),(5,5,'CHANGYING',20,5,35,'Y'),(6,6,'CHEN',13,3,20,'Y'),(7,7,'CHENGUANG',13,3,20,'Y'),(8,8,'CHUNHUA',7,0,10,'N'),(9,9,'CHUNTAO',20,5,35,'Y'),(10,10,'CUIFEN',7,0,10,'N'),(11,11,'DAIYU',7,0,10,'N'),(12,12,'EHUANG',20,5,23,'Y'),(13,13,'FAN',20,5,-10,'Y'),(14,14,'HUIQING',7,0,10,'N'),(15,15,'JIA',14,3,20,'Y'),(16,16,'JIAO',14,3,11,'Y'),(17,17,'JIAYI',21,6,-19,'Y'),(18,18,'JIAYING',14,3,20,'N'),(19,1,'JINGFEI',7,0,10,'N'),(20,2,'JINGHUA',14,3,20,'Y'),(21,3,'JINJING',20,5,35,'Y'),(22,4,'JU',7,0,3,'N'),(23,5,'JUAN',20,5,35,'Y'),(24,6,'LAN',14,3,20,'Y'),(25,7,'LANFEN',14,3,20,'Y'),(26,8,'LANYING',7,0,10,'N'),(27,9,'LI',20,5,35,'Y'),(28,10,'LIFEN',7,0,10,'N'),(29,11,'LIHUA',7,0,10,'N'),(30,12,'LIJUAN',21,6,17,'Y'),(31,13,'LILING',21,6,16,'Y'),(32,14,'LIN',7,0,10,'N'),(33,15,'LING',14,3,4,'Y'),(34,16,'LIQIN',14,3,20,'N'),(35,17,'LIQIU',20,5,35,'N'),(36,18,'LIU',14,3,20,'N'),(37,1,'LULI',7,0,10,'Y'),(38,2,'MEI',14,3,20,'Y'),(39,3,'MEIFEN',20,5,35,'Y'),(40,4,'MEIFENG',7,0,10,'N'),(41,5,'MEIHUI',20,5,35,'Y'),(42,6,'MEILI',14,3,20,'Y'),(43,7,'MEILIN',14,3,20,'N'),(44,8,'MEIRONG',7,0,10,'N'),(45,9,'MEIXIANG',20,5,35,'Y'),(46,10,'MEIXIU',7,0,10,'N'),(47,11,'MINGXIA',7,0,10,'N'),(48,12,'MINGZHU',20,5,23,'Y'),(49,13,'XENXEN',20,5,25,'Y'),(50,14,'XINXIN',7,0,10,'N'),(51,15,'XAN',14,3,20,'N'),(52,16,'XANG',14,3,20,'N'),(53,17,'XUN',20,5,35,'N'),(54,18,'XUNGA',14,3,15,'N'),(55,1,'Frank',7,0,10,'Y'),(56,2,'Rebecca',14,3,20,'Y'),(57,3,'Angela',21,3,35,'Y'),(58,4,'Carolyn',7,0,10,'N'),(59,5,'Sarah',20,5,35,'Y'),(60,6,'Dennis',14,3,20,'Y'),(61,7,'Angela',14,3,-3,'Y'),(62,8,'Jessica',7,0,10,'N'),(63,9,'Harold',20,5,25,'Y'),(64,10,'Dennis',7,0,10,'N'),(65,11,'Steven',7,0,10,'N'),(66,12,'Ruth',20,5,14,'Y'),(67,13,'Patrick',20,5,23,'Y'),(68,14,'John',7,0,10,'N'),(69,15,'Brenda',14,3,15,'Y'),(70,16,'Robert',14,3,20,'N'),(71,17,'Edward',20,5,35,'N'),(72,1,'Ping',0,0,10,'N'),(73,2,'Cheng',0,0,20,'N'),(74,3,'Ling',0,0,35,'N'),(75,4,'Hui',0,0,10,'N'),(76,5,'Cong',0,0,35,'N'),(77,6,'Mu',0,0,20,'N'),(78,7,'Na',0,0,20,'N'),(79,8,'He',0,0,10,'N'),(80,9,'Meimei',0,0,35,'N'),(81,10,'Zan',0,0,10,'N'),(82,11,'Ayra',0,0,10,'N'),(83,12,'Huang',0,0,35,'N'),(84,13,'Meimei',0,0,35,'N'),(85,14,'Wen',0,0,10,'N'),(86,15,'Jiang',0,0,20,'N'),(87,16,'Lan',0,0,20,'N'),(88,17,'Chun',0,0,35,'N'),(89,1,'Lonlon',0,0,10,'N'),(90,2,'Xiang',0,0,20,'N'),(91,3,'Lin',0,0,35,'N'),(92,4,'Chen',0,0,10,'N'),(93,5,'Yun',0,0,35,'N'),(94,6,'Jia',0,0,20,'N'),(95,7,'Zhong',0,0,20,'N'),(96,8,'Xiu',0,0,10,'N'),(97,9,'Hai',0,0,35,'N'),(98,10,'Wen',0,0,10,'N'),(99,11,'Gang',0,0,10,'N'),(100,12,'Wen',0,0,35,'N'),(101,13,'Heng',0,0,35,'N'),(102,14,'Bai',0,0,10,'N'),(103,15,'Heng',0,0,20,'N'),(104,16,'Jian',0,0,20,'N'),(105,17,'Zhen',0,0,35,'N');
/*!40000 ALTER TABLE `Enemy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Resource`
--

DROP TABLE IF EXISTS `Resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Resource` (
  `idUser` int(11) NOT NULL,
  `wood` int(11) NOT NULL,
  `food` int(11) NOT NULL,
  `stone` int(11) NOT NULL,
  `iron` int(11) NOT NULL,
  `gold` int(11) NOT NULL,
  PRIMARY KEY (`idUser`),
  KEY `fk_Resource_Users1` (`idUser`),
  CONSTRAINT `fk_Resource_Users1` FOREIGN KEY (`idUser`) REFERENCES `Users` (`idUser`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Resource`
--

LOCK TABLES `Resource` WRITE;
/*!40000 ALTER TABLE `Resource` DISABLE KEYS */;
INSERT INTO `Resource` VALUES (54,32225,1991,7465,2750,825);
/*!40000 ALTER TABLE `Resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Buildings`
--

DROP TABLE IF EXISTS `Buildings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Buildings` (
  `idBuilding` int(11) NOT NULL AUTO_INCREMENT,
  `Description` varchar(45) NOT NULL,
  `wood` int(11) DEFAULT NULL,
  `stone` int(11) DEFAULT NULL,
  `iron` int(11) DEFAULT NULL,
  `gold` int(11) DEFAULT NULL,
  `buildTimer` time NOT NULL,
  `Type` varchar(2) DEFAULT NULL,
  `gatherTime` time DEFAULT NULL,
  `sizeX` smallint(6) DEFAULT NULL,
  `sizeY` smallint(6) DEFAULT NULL,
  `idTile` int(11) DEFAULT NULL,
  `Obs` text,
  PRIMARY KEY (`idBuilding`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Buildings`
--

LOCK TABLES `Buildings` WRITE;
/*!40000 ALTER TABLE `Buildings` DISABLE KEYS */;
INSERT INTO `Buildings` VALUES (1,'House',100,100,0,0,'00:00:45','P','00:00:00',1,1,8,'The House provide you more village capacity and also can train Farmers.'),(2,'Archery Range',500,300,175,300,'00:01:45','P','00:00:00',1,1,9,'The Archery Range can train Archers. This building have a lv2 upgrade'),(3,'Archery Range Lv2',1000,600,350,600,'00:03:00','P','00:00:00',1,1,10,'The Archery Range lv2 can train the Archery Mount unit. This is the final upgrade of this building'),(4,'Barracks',275,550,300,400,'00:01:45','P','00:00:00',2,2,11,'The Barracks can train Swordmans and Pikemans. This building have a lv3 upgrade'),(5,'Barracks Lv2',550,1100,600,800,'00:03:30','P','00:00:00',2,2,12,'The Barracks lv2 can train the Ninja and Monk unit. This building have a lv3 upgrade'),(6,'Lumber Camp',25,175,175,75,'00:01:00','R','00:00:30',1,1,13,'The Lumber Camp provide you Wood. Each Farmer allocated on it will collect 60 of Wood.'),(7,'Stone Camp',175,25,175,75,'00:01:00','R','00:00:30',1,1,14,'The Stone Camp provide you Stone. Each Farmer allocated on it will collect 50 of Stone.'),(8,'Gold Camp',400,400,250,25,'00:01:30','R','00:00:30',1,1,15,'The Gold Camp provide you Gold. Each Farmer allocated on it will collect 20 of Wood'),(9,'Iron Camp',300,300,25,75,'00:01:30','R','00:00:30',1,1,16,'The Farm  provide you Food. Each Farmer allocated on it will collect 35 of Food'),(10,'Farm',300,200,0,125,'00:01:30','R','00:00:30',1,1,17,'The Farm  provide you Food. Each Farmer allocated on it will collect 35 of Food'),(11,'Market',175,175,175,600,'00:02:30','T','00:00:00',1,1,18,'The Market open the possibility to sell and buy Resources from others players.'),(12,'Mercenary Den',275,275,275,600,'00:02:30','T','00:00:00',1,1,19,'The Mercenary Den open the possibility to sell and buy Units from others players.'),(13,'Siege Workshop',2000,1200,1000,500,'00:04:00','P','00:00:00',1,1,20,'The Siege Workshop can train Ladders and Catapults.'),(14,'University',500,500,450,1000,'00:05:00','T','00:00:00',1,1,21,'The University unlock the Siege Workshop to be build'),(15,'Barracks Lv3',825,1650,1800,1200,'00:05:00','P','00:00:00',1,1,30,'The Barracks lv2 can train Ninja Mounts. This is the final upgrade of this building');
/*!40000 ALTER TABLE `Buildings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BasecResource`
--

DROP TABLE IF EXISTS `BasecResource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BasecResource` (
  `idBasecResouce` int(11) NOT NULL,
  `Description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idBasecResouce`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BasecResource`
--

LOCK TABLES `BasecResource` WRITE;
/*!40000 ALTER TABLE `BasecResource` DISABLE KEYS */;
INSERT INTO `BasecResource` VALUES (1,'wood'),(2,'food'),(3,'stone'),(4,'iron'),(5,'gold');
/*!40000 ALTER TABLE `BasecResource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Users`
--

DROP TABLE IF EXISTS `Users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Users` (
  `idUser` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL,
  `Lastname` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Nick` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Data_Registro` date DEFAULT NULL,
  `Data_Ultimo_login` datetime DEFAULT NULL,
  PRIMARY KEY (`idUser`),
  UNIQUE KEY `idUser` (`idUser`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=latin1 COMMENT='-- retirada longblob da imagem\r\n-- adicionada coluna usernam';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Users`
--

LOCK TABLES `Users` WRITE;
/*!40000 ALTER TABLE `Users` DISABLE KEYS */;
INSERT INTO `Users` VALUES (53,'Victor','Rybakovas','rybakovas@gmail.com','Vorlok','123','2013-11-25',NULL),(54,'Felipe','Ryba','ryba@wtt.com','Ryba','123','2013-11-25','2013-12-02 16:38:09'),(55,'Wtt','Teste','wtt@wtt.com','Wtt','123','2013-11-25',NULL),(58,'Mimi','Salinas','mimix.teles@gmail.com','BodeFuceta','mimimi22','2013-11-26',NULL),(60,'asd','asd','asd','asd','123','2013-11-27',NULL),(61,'bruno ','almeida','brunolove3@hotmail.com','URSAO','y6n5gdkss','2013-11-27',NULL),(62,'Fabrizio','Armando','f.armando@hotmail.com','NightWalker','unreal','2013-11-27',NULL),(63,'Tiago','Marques','tiagolww@gmail.com','Surfista','wttbeta','2013-11-27',NULL);
/*!40000 ALTER TABLE `Users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Season`
--

DROP TABLE IF EXISTS `Season`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Season` (
  `idSeason` int(11) NOT NULL AUTO_INCREMENT,
  `StartTime` datetime DEFAULT NULL,
  `EndTime` datetime DEFAULT NULL,
  `Winner` int(11) DEFAULT NULL,
  PRIMARY KEY (`idSeason`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Season`
--

LOCK TABLES `Season` WRITE;
/*!40000 ALTER TABLE `Season` DISABLE KEYS */;
INSERT INTO `Season` VALUES (1,'2013-11-25 09:49:08','2013-11-25 14:16:42',52),(2,'2013-11-25 14:19:42','2013-11-25 14:29:28',52),(3,'2013-11-25 14:32:28','2013-11-25 17:15:28',53),(4,'2013-11-25 17:18:28','2013-11-26 09:20:04',53),(5,'2013-11-26 09:23:04','2013-11-26 17:39:25',55),(6,'2013-11-26 17:42:25','2013-11-27 07:30:09',55),(7,'2013-11-27 07:33:09','2013-11-27 09:01:49',54),(8,'2013-11-27 09:04:49','2013-11-27 10:49:27',62),(9,'2013-11-27 10:52:27','2013-11-27 12:56:02',55),(10,'2013-11-27 12:59:02','2013-12-01 15:27:04',54),(11,'2013-12-01 15:30:04',NULL,NULL);
/*!40000 ALTER TABLE `Season` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Categoria_Atividade`
--

DROP TABLE IF EXISTS `Categoria_Atividade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Categoria_Atividade` (
  `idCategori` int(11) NOT NULL AUTO_INCREMENT,
  `Description` text NOT NULL,
  PRIMARY KEY (`idCategori`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Categoria_Atividade`
--

LOCK TABLES `Categoria_Atividade` WRITE;
/*!40000 ALTER TABLE `Categoria_Atividade` DISABLE KEYS */;
/*!40000 ALTER TABLE `Categoria_Atividade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Quest`
--

DROP TABLE IF EXISTS `Quest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Quest` (
  `idQuest` int(11) NOT NULL AUTO_INCREMENT,
  `idChunk` int(11) NOT NULL,
  PRIMARY KEY (`idQuest`),
  KEY `fk_Quest_1` (`idChunk`),
  CONSTRAINT `fk_Quest_1` FOREIGN KEY (`idChunk`) REFERENCES `Chunk` (`idChunk`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=600 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Quest`
--

LOCK TABLES `Quest` WRITE;
/*!40000 ALTER TABLE `Quest` DISABLE KEYS */;
INSERT INTO `Quest` VALUES (569,639),(570,640),(571,641),(572,642),(573,643),(574,644),(575,645),(576,646),(577,647),(578,648),(579,649),(580,650),(581,651),(582,652),(583,653),(584,654),(585,655),(586,656),(587,657),(588,658),(589,659),(590,660),(591,661),(592,662),(593,663),(594,664),(595,665),(596,666),(597,667),(598,668),(599,669);
/*!40000 ALTER TABLE `Quest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UserKeys`
--

DROP TABLE IF EXISTS `UserKeys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UserKeys` (
  `idKeys` int(11) NOT NULL AUTO_INCREMENT,
  `Key` varchar(255) DEFAULT NULL,
  `Status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idKeys`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UserKeys`
--

LOCK TABLES `UserKeys` WRITE;
/*!40000 ALTER TABLE `UserKeys` DISABLE KEYS */;
INSERT INTO `UserKeys` VALUES (1,'0f3ca5db644009bbed1bf9be14e416a2','used'),(2,'d535c6593944edc2b3a22a91c59ea7fe','use'),(3,'6b1e6ec1caab5c10c00f76615331b6fa','used'),(4,'b67a83a07b83c62037ce7d845603e6e9','used'),(5,'c21c0674eae5a2162d98d28948e9ca95','use'),(6,'f463fb6a4a3f0ae2009924aba56469c8','used'),(7,'54f06ff17eadaf0fa88b47f2b38b5ae6','use'),(8,'d41d8cd98f220b204e9800998ecf8427e','use'),(9,'19cdffa933084a8b37ab722bd61a1016','use'),(10,'3bff2d24d4123b39c3729876eedd91b6','use'),(11,'7743ea0ff87434fcac0524aefbd65afe','use'),(12,'4c615bc27566e27fe4b0f94a45dc2ee3','use'),(13,'8fab14502d5ca6e2924b551fe48ad5b3','use'),(14,'91c52d922e3114ca6bb3d1f9f38ad0e8','use'),(15,'a012a8d375449341df24133120e7dad5','use'),(16,'785ea77d7b56717638a50dad3e41dc81','use'),(17,'713804f57544bc76ee2049b88f233bb9','use'),(18,'cb03cd86110c621f9f6650d5bd52a454','use'),(19,'7054db79c2627961c51e072ca5d23afb','use'),(20,'d41d8cd98f00b204e9820998ecf8427e','use'),(21,'181d006701f4645699bbe4e785aea0f1','use'),(22,'b20af1c0ed3456de12fd6b954d4d9e07','use'),(23,'78c673106fe3a4306692c9284422489f','use'),(24,'c338779c4889872effe026f17db0f5ea','use'),(25,'d41d8cd98f00b204e9800898ecf8427e','use'),(26,'2794c04246043c9fa77f2b8db56d8386','use'),(27,'a0bb49be35a37c4c1e9a040a87a9e209','use'),(28,'017aef96f0accb00947db5031f11d289','use'),(29,'13cd7c00a514684663fc459ed3dabf6c','use'),(30,'221876b9d6226d4c8a46fed2c6af4123','use');
/*!40000 ALTER TABLE `UserKeys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Transaction`
--

DROP TABLE IF EXISTS `Transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Transaction` (
  `idTransaction` int(11) NOT NULL AUTO_INCREMENT,
  `idUser_Buy` int(11) NOT NULL,
  `idResource_Tran` int(11) DEFAULT NULL,
  `idUnit_Tran` int(11) DEFAULT NULL,
  `idUser_Sell` int(11) NOT NULL,
  `Old_Value_Buy` int(11) DEFAULT NULL,
  `Old_Value_Sell` int(11) DEFAULT NULL,
  `New_Value_Buy` int(11) DEFAULT NULL,
  `New_Value_Sell` int(11) DEFAULT NULL,
  `Date_Tran` datetime NOT NULL,
  `idCategori` int(11) NOT NULL,
  PRIMARY KEY (`idTransaction`),
  KEY `fk_Transacao_Usuario1` (`idUser_Buy`),
  KEY `fk_Transacao_Unidade1` (`idUnit_Tran`),
  KEY `fk_Transacao_Usuario2` (`idUser_Sell`),
  KEY `fk_Transacao_Categoria_Atividade1` (`idCategori`),
  CONSTRAINT `fk_Transacao_Categoria_Atividade1` FOREIGN KEY (`idCategori`) REFERENCES `Categoria_Atividade` (`idCategori`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Transacao_Unidade1` FOREIGN KEY (`idUnit_Tran`) REFERENCES `UnitClass` (`idUnit`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Transacao_Usuario1` FOREIGN KEY (`idUser_Buy`) REFERENCES `Users` (`idUser`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Transacao_Usuario2` FOREIGN KEY (`idUser_Sell`) REFERENCES `Users` (`idUser`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Transaction`
--

LOCK TABLES `Transaction` WRITE;
/*!40000 ALTER TABLE `Transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `Transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ResourceColect`
--

DROP TABLE IF EXISTS `ResourceColect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ResourceColect` (
  `idResourceColect` int(11) NOT NULL AUTO_INCREMENT,
  `idBuildings` int(11) NOT NULL,
  `idBasecResouce` int(11) NOT NULL,
  `Qtd` int(11) NOT NULL,
  PRIMARY KEY (`idResourceColect`),
  KEY `fk_ResourceColect_1` (`idBuildings`),
  KEY `fk_ResourceColect_2` (`idBasecResouce`),
  CONSTRAINT `fk_ResourceColect_1` FOREIGN KEY (`idBuildings`) REFERENCES `Buildings` (`idBuilding`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ResourceColect`
--

LOCK TABLES `ResourceColect` WRITE;
/*!40000 ALTER TABLE `ResourceColect` DISABLE KEYS */;
INSERT INTO `ResourceColect` VALUES (1,6,1,55),(2,7,3,49),(3,8,5,15),(4,9,4,37),(5,10,2,37);
/*!40000 ALTER TABLE `ResourceColect` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ArmyOffert`
--

DROP TABLE IF EXISTS `ArmyOffert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ArmyOffert` (
  `idArmyOffert` int(11) NOT NULL AUTO_INCREMENT,
  `idUser` int(11) NOT NULL,
  `IdArmy` int(11) NOT NULL,
  `Money` int(11) NOT NULL,
  `Sell` varchar(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`idArmyOffert`),
  KEY `fk_ArmyOffert_1` (`idUser`),
  KEY `fk_ArmyOffert_2` (`IdArmy`),
  CONSTRAINT `fk_ArmyOffert_1` FOREIGN KEY (`idUser`) REFERENCES `Users` (`idUser`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ArmyOffert_2` FOREIGN KEY (`IdArmy`) REFERENCES `Army` (`idArmy`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ArmyOffert`
--

LOCK TABLES `ArmyOffert` WRITE;
/*!40000 ALTER TABLE `ArmyOffert` DISABLE KEYS */;
/*!40000 ALTER TABLE `ArmyOffert` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Work`
--

DROP TABLE IF EXISTS `Work`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Work` (
  `idWork` int(11) NOT NULL AUTO_INCREMENT,
  `idVillageBuild` int(11) NOT NULL,
  `idArmy` int(11) NOT NULL,
  PRIMARY KEY (`idWork`),
  KEY `fk_Work_1` (`idVillageBuild`),
  KEY `fk_Work_2` (`idArmy`),
  CONSTRAINT `fk_Work_1` FOREIGN KEY (`idVillageBuild`) REFERENCES `VillageBuild` (`idVillageBuild`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Work_2` FOREIGN KEY (`idArmy`) REFERENCES `Army` (`idArmy`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2978 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Work`
--

LOCK TABLES `Work` WRITE;
/*!40000 ALTER TABLE `Work` DISABLE KEYS */;
INSERT INTO `Work` VALUES (2953,1617,1782344),(2954,1617,1782345),(2955,1617,1782346),(2956,1617,1782347),(2957,1617,1782348),(2958,1618,1782349),(2959,1618,1782350),(2960,1618,1782351),(2961,1618,1782352),(2962,1618,1782353),(2963,1619,1782354),(2964,1619,1782355),(2965,1619,1782356),(2966,1619,1782357),(2967,1619,1782358),(2968,1620,1782359),(2969,1627,1782360),(2970,1627,1782361),(2971,1627,1782362),(2972,1627,1782363),(2973,1627,1782364),(2974,1620,1782367),(2975,1620,1782368),(2976,1620,1782369),(2977,1620,1782370);
/*!40000 ALTER TABLE `Work` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ResourceUnit`
--

DROP TABLE IF EXISTS `ResourceUnit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ResourceUnit` (
  `idResourceUnit` int(11) NOT NULL,
  `idUnit` int(11) DEFAULT NULL,
  `idBasecResouce` int(11) DEFAULT NULL,
  `Qty` int(11) DEFAULT NULL,
  PRIMARY KEY (`idResourceUnit`),
  KEY `fk_ResourceUnit_1` (`idUnit`),
  KEY `fk_ResourceUnit_2` (`idBasecResouce`),
  CONSTRAINT `fk_ResourceUnit_1` FOREIGN KEY (`idUnit`) REFERENCES `UnitClass` (`idUnit`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ResourceUnit_2` FOREIGN KEY (`idBasecResouce`) REFERENCES `BasecResource` (`idBasecResouce`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ResourceUnit`
--

LOCK TABLES `ResourceUnit` WRITE;
/*!40000 ALTER TABLE `ResourceUnit` DISABLE KEYS */;
INSERT INTO `ResourceUnit` VALUES (1,8,1,275),(2,8,2,400),(3,8,4,100),(4,8,5,125),(5,1,2,50),(6,3,1,150),(7,3,2,100),(8,3,4,25),(9,3,5,50),(10,4,2,150),(11,4,4,75),(12,4,5,50),(13,5,1,50),(14,5,2,200),(16,5,4,125),(17,5,5,125),(18,6,2,150),(19,6,4,100),(20,6,5,75),(21,7,3,50),(22,7,2,275),(24,7,4,75),(25,7,5,125),(26,9,1,300),(27,9,3,50),(28,9,4,300),(29,9,5,275),(30,10,1,600),(31,10,3,500),(32,10,4,75),(33,10,5,500),(34,11,1,250),(35,11,2,600),(37,11,4,250),(38,11,5,300),(39,10,2,75),(40,9,2,25);
/*!40000 ALTER TABLE `ResourceUnit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Zone`
--

DROP TABLE IF EXISTS `Zone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Zone` (
  `idZone` int(11) NOT NULL AUTO_INCREMENT,
  `posX` int(11) NOT NULL,
  `posY` int(11) NOT NULL,
  PRIMARY KEY (`idZone`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Zone`
--

LOCK TABLES `Zone` WRITE;
/*!40000 ALTER TABLE `Zone` DISABLE KEYS */;
INSERT INTO `Zone` VALUES (1,1,1);
/*!40000 ALTER TABLE `Zone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ImgIndex`
--

DROP TABLE IF EXISTS `ImgIndex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ImgIndex` (
  `idResource_img` int(11) NOT NULL AUTO_INCREMENT,
  `idTile` int(11) NOT NULL,
  `idTile_Pox` int(11) DEFAULT NULL,
  PRIMARY KEY (`idResource_img`),
  KEY `fk_Recurso_img_Ids_Tiles1` (`idTile`),
  KEY `fk_Recurso_img_Ids_Tiles2` (`idTile_Pox`),
  CONSTRAINT `fk_Recurso_img_Ids_Tiles1` FOREIGN KEY (`idTile`) REFERENCES `TileIndex` (`idTile`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Recurso_img_Ids_Tiles2` FOREIGN KEY (`idTile_Pox`) REFERENCES `TileIndex` (`idTile`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ImgIndex`
--

LOCK TABLES `ImgIndex` WRITE;
/*!40000 ALTER TABLE `ImgIndex` DISABLE KEYS */;
/*!40000 ALTER TABLE `ImgIndex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TileIndex`
--

DROP TABLE IF EXISTS `TileIndex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TileIndex` (
  `idTile` int(11) NOT NULL AUTO_INCREMENT,
  `Description` varchar(45) NOT NULL,
  PRIMARY KEY (`idTile`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TileIndex`
--

LOCK TABLES `TileIndex` WRITE;
/*!40000 ALTER TABLE `TileIndex` DISABLE KEYS */;
INSERT INTO `TileIndex` VALUES (13,'Lumber'),(20,'Gold Mine');
/*!40000 ALTER TABLE `TileIndex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SquadVillage`
--

DROP TABLE IF EXISTS `SquadVillage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SquadVillage` (
  `idSquadVillage` int(11) NOT NULL AUTO_INCREMENT,
  `idVillage` int(11) NOT NULL,
  `SquadName` varchar(20) NOT NULL,
  `Battle` varchar(45) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`idSquadVillage`),
  KEY `fk_SquadVillage_1` (`idVillage`),
  CONSTRAINT `fk_SquadVillage_1` FOREIGN KEY (`idVillage`) REFERENCES `Village` (`idVillage`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=197 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SquadVillage`
--

LOCK TABLES `SquadVillage` WRITE;
/*!40000 ALTER TABLE `SquadVillage` DISABLE KEYS */;
/*!40000 ALTER TABLE `SquadVillage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Chunk`
--

DROP TABLE IF EXISTS `Chunk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Chunk` (
  `idChunk` int(11) NOT NULL AUTO_INCREMENT,
  `idZone` int(11) NOT NULL,
  `idTile` int(11) DEFAULT NULL,
  `posX` int(11) NOT NULL,
  `posY` int(11) NOT NULL,
  `binTiled` varbinary(2400) NOT NULL,
  PRIMARY KEY (`idChunk`),
  KEY `fk_Chunk_1` (`idZone`),
  CONSTRAINT `fk_Chunk_1` FOREIGN KEY (`idZone`) REFERENCES `Zone` (`idZone`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=671 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Chunk`
--

LOCK TABLES `Chunk` WRITE;
/*!40000 ALTER TABLE `Chunk` DISABLE KEYS */;
INSERT INTO `Chunk` VALUES (639,1,38,13,10,''),(640,1,38,11,5,''),(641,1,38,14,14,''),(642,1,38,7,16,''),(643,1,38,1,14,''),(644,1,38,9,2,''),(645,1,38,7,6,''),(646,1,38,10,15,''),(647,1,38,3,13,''),(648,1,38,14,12,''),(649,1,38,0,3,''),(650,1,38,17,18,''),(651,1,38,17,11,''),(652,1,38,4,7,''),(653,1,38,5,5,''),(654,1,39,11,18,''),(655,1,39,18,16,''),(656,1,39,9,14,''),(657,1,39,7,12,''),(658,1,39,19,2,''),(659,1,39,10,7,''),(660,1,39,6,9,''),(661,1,39,9,16,''),(662,1,39,15,5,''),(663,1,39,4,2,''),(664,1,40,1,19,''),(665,1,40,13,9,''),(666,1,40,7,9,''),(667,1,40,4,14,''),(668,1,40,19,15,''),(669,1,37,15,12,''),(670,1,41,11,15,'');
/*!40000 ALTER TABLE `Chunk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BuildDep`
--

DROP TABLE IF EXISTS `BuildDep`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BuildDep` (
  `idBuildDep` int(11) NOT NULL AUTO_INCREMENT,
  `Build` int(11) NOT NULL,
  `BuildDep` int(11) NOT NULL,
  `Upgrade` varchar(45) NOT NULL,
  PRIMARY KEY (`idBuildDep`),
  KEY `fk_BuildDep_IdConstrucao1` (`Build`),
  KEY `fk_BuildDep_IdConstrucao2` (`BuildDep`),
  CONSTRAINT `fk_BuildDep_IdConstrucao1` FOREIGN KEY (`Build`) REFERENCES `Buildings` (`idBuilding`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_BuildDep_IdConstrucao2` FOREIGN KEY (`BuildDep`) REFERENCES `Buildings` (`idBuilding`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BuildDep`
--

LOCK TABLES `BuildDep` WRITE;
/*!40000 ALTER TABLE `BuildDep` DISABLE KEYS */;
INSERT INTO `BuildDep` VALUES (3,3,2,'Y'),(4,5,4,'Y'),(7,13,14,'N'),(8,15,5,'Y'),(9,11,9,'N');
/*!40000 ALTER TABLE `BuildDep` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Village`
--

DROP TABLE IF EXISTS `Village`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Village` (
  `idVillage` int(11) NOT NULL AUTO_INCREMENT,
  `idUser` int(11) DEFAULT NULL,
  `idChunck` int(11) NOT NULL,
  `VillageNick` varchar(45) DEFAULT NULL,
  `DominateTime` datetime DEFAULT NULL,
  `IsTemple` varchar(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`idVillage`),
  KEY `fk_Village_Usuario1` (`idUser`),
  KEY `fk_Village_1` (`idChunck`),
  CONSTRAINT `fk_Village_1` FOREIGN KEY (`idChunck`) REFERENCES `Chunk` (`idChunk`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Village_Usuario1` FOREIGN KEY (`idUser`) REFERENCES `Users` (`idUser`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Village`
--

LOCK TABLES `Village` WRITE;
/*!40000 ALTER TABLE `Village` DISABLE KEYS */;
INSERT INTO `Village` VALUES (96,NULL,669,'Guan Yu Temple',NULL,'Y'),(97,54,670,'Hebei',NULL,'N');
/*!40000 ALTER TABLE `Village` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Battle`
--

DROP TABLE IF EXISTS `Battle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Battle` (
  `idBattle` int(11) NOT NULL AUTO_INCREMENT,
  `AttackTable` varchar(255) DEFAULT NULL,
  `DefenseTable` varchar(255) DEFAULT NULL,
  `StartTime` date DEFAULT NULL,
  `Win` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idBattle`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Battle`
--

LOCK TABLES `Battle` WRITE;
/*!40000 ALTER TABLE `Battle` DISABLE KEYS */;
/*!40000 ALTER TABLE `Battle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Squad`
--

DROP TABLE IF EXISTS `Squad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Squad` (
  `idSquad` int(11) NOT NULL AUTO_INCREMENT,
  `idSquadVillage` int(11) NOT NULL,
  `idArmy` int(11) NOT NULL,
  PRIMARY KEY (`idSquad`),
  KEY `fk_Squad_1` (`idSquadVillage`),
  KEY `fk_Squad_2` (`idArmy`),
  CONSTRAINT `fk_Squad_1` FOREIGN KEY (`idSquadVillage`) REFERENCES `SquadVillage` (`idSquadVillage`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Squad_2` FOREIGN KEY (`idArmy`) REFERENCES `Army` (`idArmy`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5993 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Squad`
--

LOCK TABLES `Squad` WRITE;
/*!40000 ALTER TABLE `Squad` DISABLE KEYS */;
/*!40000 ALTER TABLE `Squad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HordeQuest`
--

DROP TABLE IF EXISTS `HordeQuest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `HordeQuest` (
  `idHordeQuest` int(11) NOT NULL AUTO_INCREMENT,
  `idQuest` int(11) NOT NULL,
  PRIMARY KEY (`idHordeQuest`),
  KEY `fk_HordeQuest_1` (`idQuest`),
  CONSTRAINT `fk_HordeQuest_1` FOREIGN KEY (`idQuest`) REFERENCES `Quest` (`idQuest`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HordeQuest`
--

LOCK TABLES `HordeQuest` WRITE;
/*!40000 ALTER TABLE `HordeQuest` DISABLE KEYS */;
/*!40000 ALTER TABLE `HordeQuest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'Jogo'
--

--
-- Dumping routines for database 'Jogo'
--
/*!50003 DROP FUNCTION IF EXISTS `generate_fname` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `generate_fname`() RETURNS varchar(255) CHARSET latin1
BEGIN
	RETURN ELT(FLOOR(1 + (RAND() * (93-1))), "Ai","An","Ayra","Bai","Bao","Bo","Chang","Chao","Chen","Cheng","Chun","Cong","Da","De","Deshi","Dewei","Dishi","Enlai","Fa","Fang","Fen","Fu","Gang","Guo","Hai","He","Heng","Hong","Hua","Huan","Huang","Hui","Jia","Jian","Jiang","Jin","Jing","Ju","Jun","Kaikai","Kun","Lan","Lanlan","Li","Lian","Lie","Lili","Lin","Ling","Lonlon","Mei","Meimei","Min","Ming","Minmin","Mu","Na","Ning","Nuan","Nuo","Ping","Qing","Qiu","Rong","Ru","Shao","Shi","Shu","Shui","Shun","Su","Tai","Tu","Wei","Wen","Wu","Xiang","Xiu","Xue","Xun","Ya","Yi","Yin","Yong","Yu","Yun","Zan","Zhen","Zheng","Zhi","Zhong","Zhou");
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `generate_lname` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `generate_lname`() RETURNS varchar(255) CHARSET latin1
BEGIN
	RETURN ELT(FLOOR(1 + (RAND() * (100-1))), "Smith","Johnson","Williams","Jones","Brown","Davis","Miller","Wilson","Moore","Taylor","Anderson","Thomas","Jackson","White","Harris","Martin","Thompson","Garcia","Martinez","Robinson","Clark","Rodriguez","Lewis","Lee","Walker","Hall","Allen","Young","Hernandez","King","Wright","Lopez","Hill","Scott","Green","Adams","Baker","Gonzalez","Nelson","Carter","Mitchell","Perez","Roberts","Turner","Phillips","Campbell","Parker","Evans","Edwards","Collins","Stewart","Sanchez","Morris","Rogers","Reed","Cook","Morgan","Bell","Murphy","Bailey","Rivera","Cooper","Richardson","Cox","Howard","Ward","Torres","Peterson","Gray","Ramirez","James","Watson","Brooks","Kelly","Sanders","Price","Bennett","Wood","Barnes","Ross","Henderson","Coleman","Jenkins","Perry","Powell","Long","Patterson","Hughes","Flores","Washington","Butler","Simmons","Foster","Gonzales","Bryant","Alexander","Russell","Griffin","Diaz","Hayes");
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `generate_villagename` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `generate_villagename`() RETURNS varchar(255) CHARSET latin1
BEGIN
	RETURN ELT(FLOOR(1 + (RAND() * (44-1))), "Anhui","Hefei","Fujian","Fuzhou","Gansu","Lanzhou","Guangdong","Guangzhou","Guizhou","Guiyang","Hainan","Haikou","Hebei","Shijiazhuang","Heilongjiang","Harbin","Henan","Zhengzhou","Hubei","Wuhan","Hunan","Changsha","Jiangsu","Nanjing","Jiangxi","Nanchang","Jilin","Changchun","Liaoning","Shenyang","Qinghai","Xining","Shaanxi","Xian","Shandong","Jinan","Shanxi","Taiyuan","Sichuan","Chengdu","Yunnan","Kunming","Zhejiang","Hangzhou");
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `SPLIT_STRING` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `SPLIT_STRING`(str  LONGBLOB, delim VARCHAR(12), pos INT) RETURNS longblob
RETURN REPLACE(SUBSTRING(SUBSTRING_INDEX(str, delim, pos),
       LENGTH(SUBSTRING_INDEX(str, delim, pos-1)) + 1),
       delim, '') ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ArrayToBinary` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ArrayToBinary`(in mapArray LONGBLOB)
BEGIN
set @p1=0;
set @p2=0;
set @p3=0;
set @lop=0;
Set @concatena='';
label2: LOOP

SET @p2 = @p2 + 1;
SET @p3 = @p3 + 2;
set @var1=(select SUBSTRING_INDEX(mapArray,',', @p2));
set @var2=(select SUBSTRING_INDEX(mapArray,',', @p3));
if @var2=@var1 then

SET @p2=@p2+1;

else

ITERATE label2;
    END IF;

    LEAVE label2;
  END LOOP label2;

label1: LOOP


    SET @p1 = @p1 + 1;

    IF @p1 < @p2 THEN

set @Array=(SELECT SPLIT_STRING(mapArray, ',', @p1));
set @binario=(select LPAD(BIN(@Array),6,'0')); 
set @concatena=(select CONCAT(@binario,@concatena));
      ITERATE label1;
    END IF;
    LEAVE label1;
  END LOOP label1;
#select @concatena;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Auth` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Auth`(IN `login` VARCHAR(255), IN `senha` VARCHAR(255))
    COMMENT 'Proc por realizar o login'
BEGIN
	proc_label:BEGIN

    set @startSeason=(Select StartTime From Season where EndTime is NULL);



         if @startSeason >  now() then
	    	#wrong username/password
            set @miss =(select timeDIFF(@startSeason, now() ));
	    	select concat('Season Will Start in ',@miss, ' Minutes') as msg;
	    	leave proc_label;
	    end if;

	    set @userId = -1;
	    #endDate = DATE_ADD(NOW(), INTERVAL 1 HOUR);
	    #userId = -1;
	    #validate user and password
	    set @userId = (select idUser from Users where Email = login and Password = senha);
	    #select idUser from Users where Email = @login and Password = @senha into @userId;
       
	    if @userId is NULL then
	    	#wrong username/password
	    	select 'Wrong Username and/or Password' as msg;
	    	leave proc_label;
	    end if;
	    #delete previous session
	    delete from PlayerSession where idUser = @userId;
	    #initiate new session				
		 set @endDate = now();
		 insert into PlayerSession (idUser, created, endOn)
		 values (@userId, now(), now() + INTERVAL 1 HOUR);
		 set @sessId = 0;
		 select sessionId from PlayerSession where idUser = @userId into @sessId;			      
        
        set @firtLogin=(select Data_Ultimo_login from Users where idUser = @userId );
        if @firtLogin is null then
        call newVillage(@userId);
        update Users set Data_Ultimo_login=(now()) where idUser=@userId;
        end if;
        update Users set Data_Ultimo_login=(now()) where idUser=@userId;

       set @idVillag=(Select idVillage from Village where idUser=@userId limit 0,1) ;																																	    if @idVillag is NULL then
	    	
	    	select 'You aready Vanquish from this Session, Please Wait The Next One' as msg;
	    	leave proc_label;
	    end if;	

         set @Seasonid=(Select idSeason from Season where EndTime is NULL) ;
		
	    select @sessId as sessionId, @userId as userId,@idVillag as idVillage,@Seasonid as idSeason;
   
        call `BigUpdate`(@userId);
    END;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Battle` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Battle`(in `ArraySquad` LONGBLOB,IN `IdVillagDef` Int,IN `IdUsedAtk` Int)
BEGIN
proc_label:BEGIN
DECLARE SquadATK int;
set SquadATK=0;
set @aspas=char(39);
set @p1=0;
set @p2=0;
set @p3=0;
set @lop=0;
Set @DefResult=0;
Set @AtkResult=0;
set @varAtk=0;
set @Atk=0;
Set @Def=0;
set @varDef=0;
set @countAtk=0;
set @countDef=0;
set @rc2=0;

set @nickAtk=(select Nick From Users where iduser=IdUsedAtk);

set @nickDef=(select Users.Nick From Users inner join Village on Users.idUser=Village.idUser where Village.idVillage=IdVillagDef);

set @DefHaveUnit=(select Army.idArmy from Army inner join VillageBuild on Army.idVillageBuild=VillageBuild.idVillageBuild inner join Village on Village.idVillage=VillageBuild.idVillage  where Village.idVillage=IdVillagDef and Army.Squad='N' and Army.Sell='N' and Army.Pending='N' limit 0,1);

if @DefHaveUnit is Not NULL then

call `CreateTempSquadDefVillage`(IdVillagDef);

end if;

set @tempname=(select concat('Battle_',IdVillagDef,'_Squad_',ArraySquad));

set @tempnamedef=(select concat('Battle_',IdVillagDef,'_Squad_From_Village_',IdVillagDef));

########Pega Squads de Ataque Separadamente####################
label2: LOOP

SET @p2 = @p2 + 1;
SET @p3 = @p3 + 2;
set @var1=(select SUBSTRING_INDEX(ArraySquad,',', @p2));
set @var2=(select SUBSTRING_INDEX(ArraySquad,',', @p3));
if @var2=@var1 then

SET @p2=@p2+1;

else  

ITERATE label2;
    END IF;

    LEAVE label2;
  END LOOP label2;


set @DefInBattle=(select idSquadVillage from SquadVillage where idVillage=IdVillagDef and Battle='Y');

label1: LOOP


    SET @p1 = @p1 + 1;

    IF @p1 < @p2 THEN

set @Array=(SELECT SPLIT_STRING(ArraySquad, ',', @p1));

set SquadATK=@Array;


set @AtkInBattle=(select idSquadVillage from SquadVillage where idSquadVillage=SquadATK and Battle='Y');

if @DefInBattle is not NULL or @AtkInBattle is not NULL then

select 'Already have a Battle in This Village, You cant Attack Now!' as Msg;

set @rc2=0;
leave proc_label;

end if;

update SquadVillage set Battle='Y' where idSquadVillage=SquadATK;

if @p1 = 1 then


set @temptable=(select concat('CREATE TEMPORARY TABLE `',@tempname,'` as (select Squad.idArmy from Squad inner join SquadVillage on Squad.idSquadVillage=SquadVillage.idSquadVillage where SquadVillage.idSquadVillage=',SquadATK,');'));

PREPARE stmt FROM @temptable;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

else

set @temptable=(select concat('insert into `',@tempname,'` select Squad.idArmy from Squad inner join SquadVillage on Squad.idSquadVillage=SquadVillage.idSquadVillage where SquadVillage.idSquadVillage=',SquadATK,';'));

PREPARE stmt FROM @temptable;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

end if;

      ITERATE label1;
    END IF;
    LEAVE label1;
  END LOOP label1;
#######################################################################


set @HaveSquadToDef=(select Squad.idArmy from Squad inner join SquadVillage on Squad.idSquadVillage=SquadVillage.idSquadVillage where SquadVillage.idVillage=IdVillagDef and SquadVillage.Battle='N' limit 0,1);

if @HaveSquadToDef is NULL then
select concat('This Village Dont Have Squad, ',@nickAtk,' Win This Battle') as Msg;

Update Village set idUser=IdUsedAtk where idVillage=IdVillagDef;
update SquadVillage set Battle='N' where idVillage=IdVillagDef;
update SquadVillage set Battle='N' where idSquadVillage=SquadATK;
set @temptable=(select concat('DROP TABLE `',@tempname,'`;'));

PREPARE stmt FROM @temptable;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

set @rc2=2;

leave proc_label;

end if;


set @temptabledef=(select concat('CREATE TEMPORARY TABLE `',@tempnamedef,'` as (select Squad.idArmy from Squad inner join SquadVillage on Squad.idSquadVillage=SquadVillage.idSquadVillage where SquadVillage.idVillage=',IdVillagDef,' and SquadVillage.Battle=',@aspas,'N',@aspas,');'));

PREPARE stmt FROM @temptabledef;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

update SquadVillage set Battle='Y' where idVillage=IdVillagDef;

set @temptabledef=(select concat('select count(*) from `',@tempnamedef,'` into @countDef;'));

PREPARE stmt FROM @temptabledef;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

set @temptable=(select concat('select count(*) from `',@tempname,'` into @countAtk;'));

PREPARE stmt FROM @temptable;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

set @p1=0;
set @p2=0;
set @p3=0;

label3: LOOP

set @varDef=((FLOOR(RAND()  * (@countDef))));
set @varAtk=((FLOOR(RAND()  * (@countAtk))));

set @selectAtk=(select concat('select idArmy from `',@tempname,'` limit ',@varAtk,',1 into @Atk'));

PREPARE stmt FROM @selectAtk;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;



set @selectDef=(select concat('select idArmy from `',@tempnamedef,'` limit ',@varDef,',1 into @Def'));

PREPARE stmt FROM @selectDef;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;


###################Calculo Batalha##########################



set @AtkPower=(select Attack from Army where idArmy=@Atk);
set @AtkDefence=(select Defense from Army where idArmy=@Atk);
set @AtkLife=(select Life from Army where idArmy=@Atk);

set @DefPower=(select Attack from Army where idArmy=@Def);
set @DefDefence=(select Defense from Army where idArmy=@Def);
set @DefLife=(select Life from Army where idArmy=@Def);


###################Criar Loop##################
Set @AtkTotal=(@DefPower-@AtkDefence);
Set @DefTotal=(@AtkPower-@DefDefence);

if @AtkTotal > 0 then
Set @DefResult=(@AtkLife-(@AtkTotal));
else
Set @DefResult=@AtkLife;
end if;

if @DefTotal > 0 then
Set @AtkResult=(@DefLife-(@DefTotal));
else
Set @AtkResult=@DefLife;
end if;


label4: LOOP

#Def Ganha
if @DefResult <= 0 then
#Select 'Deffense Wins Row';

#Select concat('Deffense id ',@Def,' Wins');

Update Army set Life=@AtkResult where idArmy=@Def;

delete from Squad where idArmy=@Atk;

delete from Army where idArmy=@Atk;

set @DelAtk=(select concat('Delete from `',@tempname,'` where idArmy=',@Atk,';'));

PREPARE stmt FROM @DelAtk;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

set @countAtk=((@countAtk)-1);



if @AtkResult <= 0 then
delete from Squad where idArmy=@Def;

set @atWork=(select idWork from Work where idArmy=@Def);

if @atWork is Not NULL then

delete from Work where idArmy=@Def;

end if;

delete from Army where idArmy=@Def;

set @DelDef=(select concat('Delete from `',@tempnamedef,'` where idArmy=',@Def,';'));

PREPARE stmt FROM @DelDef;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

set @countDef=((@countDef)-1);
end if;


LEAVE label4;
end if;

#Atk Ganha
if @AtkResult <= 0 then
#Select 'Attack Wins Row'; 

#Select concat('Attack id ',@Atk,' Wins');


Update Army set Life=@DefResult where idArmy=@Atk;

delete from Squad where idArmy=@Def;

set @atWork=(select idWork from Work where idArmy=@Def);

if @atWork is Not NULL then

delete from Work where idArmy=@Def;

end if;

delete from Army where idArmy=@Def;

set @DelDef=(select concat('Delete from `',@tempnamedef,'` where idArmy=',@Def,';'));

PREPARE stmt FROM @DelDef;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

set @countDef=((@countDef)-1);

if @DefResult <= 0 then

delete from Squad where idArmy=@Atk;

delete from Army where idArmy=@Atk;

set @DelAtk=(select concat('Delete from `',@tempname,'` where idArmy=',@Atk,';'));

PREPARE stmt FROM @DelAtk;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

set @countAtk=((@countAtk)-1);

end if;
LEAVE label4; 
end if;

Set @DefResult=((@DefResult)-@DefPower);
Set @AtkResult=((@AtkResult)-@AtkPower);


ITERATE label4;

END LOOP label4;


###############################################

#Def Ganha
if @countAtk <=0 then
set @rc2=1;
Select concat(@nickDef,' Wins The Battle') as Msg;

#if @DefHaveUnit is Not NULL then



set @idSquadVillag=(select idSquadVillage from SquadVillage where idVillage=IdVillagDef and SquadName=@nickBattle);


delete Squad.* from Squad where idArmy in (select Army.idArmy from Army inner join VillageBuild on Army.idVillageBuild=VillageBuild.idVillageBuild inner join Village on Village.idVillage=VillageBuild.idVillage inner join SquadVillage on SquadVillage.idVillage=Village.idVillage where Village.idVillage=IdVillagDef and Army.Squad='N' and Army.Sell='N' and idSquadVillage=@idSquadVillag);

delete SquadVillage.* from SquadVillage where idVillage=IdVillagDef and SquadName=@nickBattle;

#end if;

label5: LOOP

SET @p2 = @p2 + 1;
SET @p3 = @p3 + 2;
set @var1=(select SUBSTRING_INDEX(ArraySquad,',', @p2));
set @var2=(select SUBSTRING_INDEX(ArraySquad,',', @p3));
if @var2=@var1 then

SET @p2=@p2+1;

else

ITERATE label5;
    END IF;

    LEAVE label5;
  END LOOP label5;



label6: LOOP


    SET @p1 = @p1 + 1;

    IF @p1 < @p2 THEN

set @Array=(SELECT SPLIT_STRING(ArraySquad, ',', @p1));
set SquadATK=@Array;

delete from SquadVillage where idSquadVillage=SquadATK;

      ITERATE label6;
    END IF;
    LEAVE label6;
  END LOOP label6;

update SquadVillage set Battle='N' where idVillage=IdVillagDef;


LEAVE label3;
end if;

#Atk Ganha
if @countDef <=0 then
set @rc2=2;
Select concat(@nickAtk,' Wins The Battle') as Msg;

delete from SquadVillage where idVillage=IdVillagDef;
Update Village set idUser=IdUsedAtk where idVillage=IdVillagDef;
label7: LOOP

SET @p2 = @p2 + 1;
SET @p3 = @p3 + 2;
set @var1=(select SUBSTRING_INDEX(ArraySquad,',', @p2));
set @var2=(select SUBSTRING_INDEX(ArraySquad,',', @p3));
if @var2=@var1 then

SET @p2=@p2+1;

else

ITERATE label7;
    END IF;

    LEAVE label7;
  END LOOP label7;



label8: LOOP


    SET @p1 = @p1 + 1;

    IF @p1 < @p2 THEN

set @Array=(SELECT SPLIT_STRING(ArraySquad, ',', @p1));
set SquadATK=@Array;

update SquadVillage set Battle='N' where idSquadVillage=SquadATK;

      ITERATE label8;
    END IF;
    LEAVE label8;
  END LOOP label8;


LEAVE label3;
end if;

ITERATE label3;
    
END LOOP label3;

end;

set @temptable=(select concat('DROP TABLE `',@tempname,'`;'));

PREPARE stmt FROM @temptable;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

set @temptabledef=(select concat('DROP TABLE `',@tempnamedef,'`;'));

PREPARE stmt FROM @temptabledef;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `BattleNPC` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `BattleNPC`(in `ArraySquad` LONGBLOB,IN `possX` Int,IN `possY` Int,IN `IdUsedAtk` Int)
BEGIN


proc_label:BEGIN


DECLARE SquadATK int;
set SquadATK=0;
set @aspas=char(39);
Set @DefResult=0;
Set @AtkResult=0;
set @varAtk=0;
set @Atk=0;
Set @Def=0;
set @varDef=0;
set @countAtk=0;
set @countDef=0;
set @var1=0;
set @var2=0;
set @p1=0;
set @p2=0;
set @p3=0;
set @rc=0;

set @nickAtk=(select Nick From Users where iduser=IdUsedAtk);

set @idChun=(select idChunk from Chunk where PosX=possX and PosY=possY);

set @Quest=(select Quest.idQuest from Quest inner join Chunk on Chunk.idChunk=Quest.idChunk  where Chunk.PosX=possX and Chunk.PosY=possY);

set @QuestHorde=(select idHordeQuest from HordeQuest where idQuest=@Quest);

if @QuestHorde is NULL then

select 'This Quest Dont Have any Enemy' as Msg;

leave proc_label;

end if;

set @tempname=(select concat('Battle_',@Quest,'_Squad_',ArraySquad));

set @tempnamedef=(select concat('Battle_',@Quest,'_',ArraySquad,'_Squad_From_Zone_1'));

label1: LOOP

SET @p2 = @p2 + 1;
SET @p3 = @p3 + 2;
set @var1=(select SUBSTRING_INDEX(ArraySquad,',', @p2));
set @var2=(select SUBSTRING_INDEX(ArraySquad,',', @p3));
if @var2=@var1 then

SET @p2=@p2+1;

else

ITERATE label1;
    END IF;

    LEAVE label1;
  END LOOP label1;

label2: LOOP


    SET @p1 = @p1 + 1;

    IF @p1 < @p2 THEN

set @Array=(SELECT SPLIT_STRING(ArraySquad, ',', @p1));

set SquadATK=@Array;

if @p1 = 1 then


set @temptable=(select concat('CREATE TEMPORARY TABLE `',@tempname,'` as (select Squad.idArmy from Squad inner join SquadVillage on Squad.idSquadVillage=SquadVillage.idSquadVillage where SquadVillage.idSquadVillage=',SquadATK,');'));

PREPARE stmt FROM @temptable;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

else

set @temptable=(select concat('insert into `',@tempname,'` select Squad.idArmy from Squad inner join SquadVillage on Squad.idSquadVillage=SquadVillage.idSquadVillage where SquadVillage.idSquadVillage=',SquadATK,';'));

PREPARE stmt FROM @temptable;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

end if;

      ITERATE label2;
    END IF;
    LEAVE label2;
  END LOOP label2;

set @temptabledef=(select concat('CREATE TEMPORARY TABLE `',@tempnamedef,'` as (select Horde.idEnemy from Horde inner join HordeQuest on Horde.idHordeQuest=HordeQuest.idHordeQuest where HordeQuest.idQuest=',@Quest,');'));

PREPARE stmt FROM @temptabledef;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

set @temptabledef=(select concat('select count(*) from `',@tempnamedef,'` into @countDef;'));

PREPARE stmt FROM @temptabledef;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

set @temptable=(select concat('select count(*) from `',@tempname,'` into @countAtk;'));

PREPARE stmt FROM @temptable;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;  

set @p1=0;
set @p2=0;
set @p3=0;

label3: LOOP

set @varDef=((FLOOR(RAND()  * (@countDef))));
set @varAtk=((FLOOR(RAND()  * (@countAtk))));

set @selectAtk=(select concat('select idArmy from `',@tempname,'` limit ',@varAtk,',1 into @Atk'));

PREPARE stmt FROM @selectAtk;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;



set @selectDef=(select concat('select idEnemy from `',@tempnamedef,'` limit ',@varDef,',1 into @Def'));

PREPARE stmt FROM @selectDef;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

set @AtkPower=(select Attack from Army where idArmy=@Atk);
set @AtkDefence=(select Defense from Army where idArmy=@Atk);
set @AtkLife=(select Life from Army where idArmy=@Atk);

set @DefPower=(select Attack from Enemy where idEnemy=@Def);
set @DefDefence=(select Defense from Enemy where idEnemy=@Def);
set @DefLife=(select Life from Enemy where idEnemy=@Def);

Set @AtkTotal=(@DefPower-@AtkDefence);
Set @DefTotal=(@AtkPower-@DefDefence);

if @AtkTotal > 0 then
Set @DefResult=(@AtkLife-(@AtkTotal));
else
Set @DefResult=@AtkLife;
end if;

if @DefTotal > 0 then
Set @AtkResult=(@DefLife-(@DefTotal));
else
Set @AtkResult=@DefLife;
end if;

label4: LOOP

#Def Ganha
if @DefResult <=0 then

Update Enemy set Life=@AtkResult where idEnemy=@Def;

delete from Squad where idArmy=@Atk;

delete from Army where idArmy=@Atk;


set @DelAtk=(select concat('Delete from `',@tempname,'` where idArmy=',@Atk,';'));

PREPARE stmt FROM @DelAtk;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

set @countAtk=((@countAtk)-1);
LEAVE label4; 
end if;

#Atk Ganha
if @AtkResult <=0 then

Update Army set Life=@DefResult where idArmy=@Atk;

delete from Horde where idEnemy=@Def;

Update Enemy set InHorde='N' where idEnemy=@Def;

set @OrigenLife=(select EnemyClass.Life from EnemyClass inner join Enemy on EnemyClass.idEnemyClass=Enemy.idEnemyClass where EnemyClass.idEnemyClass=Enemy.idEnemyClass and Enemy.idEnemy=@Def);

Update Enemy set Life=@OrigenLife where idEnemy=@Def;

set @DelDef=(select concat('Delete from `',@tempnamedef,'` where idEnemy=',@Def,';'));

PREPARE stmt FROM @DelDef;
EXECUTE stmt;	
DEALLOCATE PREPARE stmt;

set @countDef=((@countDef)-1);
LEAVE label4; 
end if;


Set @DefResult=((@DefResult)-@DefPower);
Set @AtkResult=((@AtkResult)-@AtkPower);


ITERATE label4;

END LOOP label4;

#Def Ganha
if @countAtk <=0 then
set @rc=2;
Select 'Enemy Wins The Battle' as Msg;

Update Enemy set InHorde='N' where idEnemy in (Select idEnemy from Horde inner join HordeQuest on Horde.idHordeQuest=HordeQuest.idHordeQuest inner join Quest on Quest.idQuest=HordeQuest.idQuest inner join Chunk on Chunk.idChunk=Quest.idChunk where Chunk.idChunk=@idChun);

delete Horde.* from Horde inner join HordeQuest on Horde.idHordeQuest=HordeQuest.idHordeQuest inner join Quest on Quest.idQuest=HordeQuest.idQuest inner join Chunk on Chunk.idChunk=Quest.idChunk where Chunk.idChunk=@idChun;

delete HordeQuest.* from HordeQuest inner join Quest on Quest.idQuest=HordeQuest.idQuest inner join Chunk on Chunk.idChunk=Quest.idChunk where Chunk.idChunk=@idChun;

label5: LOOP

SET @p2 = @p2 + 1;
SET @p3 = @p3 + 2;
set @var1=(select SUBSTRING_INDEX(ArraySquad,',', @p2));
set @var2=(select SUBSTRING_INDEX(ArraySquad,',', @p3));
if @var2=@var1 then

SET @p2=@p2+1;

else

ITERATE label5;
    END IF;

    LEAVE label5;
  END LOOP label5;



label6: LOOP


    SET @p1 = @p1 + 1;

    IF @p1 < @p2 THEN

set @Array=(SELECT SPLIT_STRING(ArraySquad, ',', @p1));
set SquadATK=@Array;

delete from SquadVillage where idSquadVillage=SquadATK;

      ITERATE label6;
    END IF;
    LEAVE label6;
  END LOOP label6;

LEAVE label3;
end if;

#Atk Ganha
if @countDef <=0 then
set @rc=1;


#delete Horde.* from Horde inner join HordeQuest on Horde.idHordeQuest=HordeQuest.idHordeQuest inner join Quest on Quest.idQuest=HordeQuest.idQuest inner join Chunk on Chunk.idChunk=Quest.idChunk where Chunk.idChunk=@idChun ;

set @level=(select Chunk.idTile from Chunk where Chunk.idChunk=@idChun);

delete HordeQuest.* from HordeQuest inner join Quest on Quest.idQuest=HordeQuest.idQuest inner join Chunk on Chunk.idChunk=Quest.idChunk where Chunk.idChunk=@idChun;

delete Quest.* from Quest inner join Chunk on Chunk.idChunk=Quest.idChunk where Chunk.idChunk=@idChun;

if @level <> '37' then
delete Chunk.* from Chunk where Chunk.idChunk=@idChun;
end if;

call `WinQuest`(IdUsedAtk,@level);

Select concat(@nickAtk,' Wins The Battle. ',@MsgWin) as Msg;

LEAVE label3;
end if;

ITERATE label3;
    
END LOOP label3;

set @temptable=(select concat('DROP TABLE `',@tempname,'`;'));

PREPARE stmt FROM @temptable;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

set @temptabledef=(select concat('DROP TABLE `',@tempnamedef,'`;'));

PREPARE stmt FROM @temptabledef;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

end;

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `BattleTemple` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `BattleTemple`(in `ArraySquad` LONGBLOB,IN `IdVillagDef` Int,IN `possX` Int,IN `possY` Int,IN `IdUsedAtk` Int)
BEGIN
proc_label:BEGIN
set @idUse=(select IdUser from Village where idVillage=IdVillagDef);

if @idUse is NULL then

call `CreatHordeTemple`(ArraySquad,possX,possY,IdUsedAtk);

Call `BattleNPC`(ArraySquad,possX,possY,IdUsedAtk);

if @rc=1 then

Update Village set IdUser=IdUsedAtk,DominateTime=Now() where idVillage=IdVillagDef;

select 'The Temple is Yours' as Msg;
end if;

else
 
call `Battle`(ArraySquad,IdVillagDef,IdUsedAtk);

if @rc2=2 then

Update Village set IdUser=IdUsedAtk,DominateTime=Now() where idVillage=IdVillagDef;
select 'The Temple is Yours' as Msg;
end if;

if @rc2=0 then

leave proc_label;
end if;
end if;
end;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `BigUpdate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `BigUpdate`(in user int)
BEGIN

update VillageBuild INNER JOIN Village ON VillageBuild.idVillage = Village.idVillage set VillageBuild.pending='N',VillageBuild.endTime=NULL where Village.idUser=user and VillageBuild.pending='Y' and VillageBuild.endTime<=now();

update Army inner join VillageBuild on VillageBuild.idVillageBuild = Army.idVillageBuild inner join Village on Village.idVillage=VillageBuild.idVillage set Army.Pending='N',Army.endTime=NULL where Village.idUser=user and Army.Pending='Y' and Army.endTime<=now();

call `BigUpdate_Resource`(user);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `BigUpdate_Resource` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `BigUpdate_Resource`(in iduser int)
BEGIN

Declare rowResource int default 0;



set @counter=((Select count(*) from  VillageBuild INNER JOIN Village ON VillageBuild.idVillage = Village.idVillage where Village.idUser=iduser and endTimeColection is not NULL));


label2: LOOP

if rowResource<@counter then

set @possX =(Select posX from  VillageBuild INNER JOIN Village ON VillageBuild.idVillage = Village.idVillage where Village.idUser=iduser and endTimeColection is not NULL limit rowResource,1 );


set @possY =(Select posY from  VillageBuild INNER JOIN Village ON VillageBuild.idVillage = Village.idVillage where Village.idUser=iduser and endTimeColection is not NULL limit rowResource,1 );


set @idBuild =(Select idBuilding from  VillageBuild INNER JOIN Village ON VillageBuild.idVillage = Village.idVillage where Village.idUser=iduser and endTimeColection is not NULL limit rowResource,1 );


set @endTime =(Select endTimeColection from  VillageBuild INNER JOIN Village ON VillageBuild.idVillage = Village.idVillage where Village.idUser=iduser and endTimeColection is not NULL limit rowResource,1 );

set @diffTime =(select timeDIFF(now(),@endTime));

set @secdiffTime=(select time_to_sec(@diffTime));

set @timeToColect=(Select gatherTime from Buildings where idbuilding=@idBuild);

set @sectimeToColect=(select time_to_sec(@timeToColect));

set @MultTimes=(select (@secdiffTime) DIV (@sectimeToColect)); 

set @restTime=(select @secdiffTime % @sectimeToColect);

set @restTime=(select sec_to_time(@restTime));

set @userresource='';

set @worker=(select count(*) from Work inner join VillageBuild on Work.idVillageBuild=VillageBuild.idVillageBuild inner join Buildings on VillageBuild.idBuilding=Buildings.idBuilding  inner join Village on VillageBuild.idVillage=Village.idVillage where Village.idUser=iduser and Buildings.idBuilding=@idBuild and VillageBuild.posX=@possX and VillageBuild.posY=@possY);


set @wonqtd=(select `Qtd` from ResourceColect where idBuildings=@idBuild);

set @won=(@wonqtd*@worker);

set @basecresource=(select idBasecResouce from ResourceColect where idBuildings=@idBuild);

set @resourcename=(select `Description` from BasecResource where idBasecResouce=@basecresource);

set @resourcenow=(select concat('select ',@resourcename,' from Resource where idUser=',iduser,' into @userresource'));

PREPARE stmt FROM @resourcenow;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

set @wonTimeOut=@won*@MultTimes;

set @userresource=@userresource+@wonTimeOut;

set @newEndTime=(select (ADDTIME(now(),@restTime)));

update VillageBuild INNER JOIN Village ON VillageBuild.idVillage = Village.idVillage set endTimeColection=@newEndTime where Village.idUser=iduser and endTimeColection=@endTime and posX=@possX and posY=@possY;

set @upd=(select concat('Update Resource set ',@resourcename,'=',@userresource,' where idUser=',iduser));


PREPARE stmt FROM @upd;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

set rowResource=rowResource+1;

ITERATE label2;

else

LEAVE label2;

end if;
END LOOP label2;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `BuyOffer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `BuyOffer`(IN `IdUse` Int,IN `idOff` Int,IN `QtdBuy` Int)
BEGIN
proc_label:BEGIN

set @idseller=(select idUser from Offert where idOffert=idOff);
set @BasecResouce=(select idBasecResouce from Offert where idOffert=idOff);
set @Qtd=(select Qty from Offert where idOffert=idOff);
set @Mon=(select Money from Offert where idOffert=idOff);

Set @montoBuy=@Mon*QtdBuy;

set @resourcename=(select `Description` from BasecResource where idBasecResouce=@BasecResouce);

set @BuyMoney = (Select gold from Resource where idUser=IdUse);

if @montoBuy > @BuyMoney then

select 'Insufficient Gold To Buy' as Msg;

leave proc_label;

end if;

if @Qtd < QtdBuy then

select 'You cant Buy This Much' as Msg;

leave proc_label;

end if;

set @newQtd=@Qtd-QtdBuy;

update Offert set Qty=@newQtd where idOffert=idOff;

set @resourcenow=(select concat('select ',@resourcename,' from Resource where idUser=',IdUse,' into @test'));

PREPARE stmt FROM @resourcenow;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

set @total=(@test+QtdBuy);


set @upd=(select concat('Update Resource set ',@resourcename,'=',@total,' where idUser=',IdUse));


PREPARE stmt FROM @upd;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

set @goldnow=(select concat('select gold from Resource where idUser=',IdUse,' into @test2'));

PREPARE stmt FROM @goldnow;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

set @totalGold=(@test2-@montoBuy);

Update Resource set gold =@totalGold where idUser=IdUse;



set @goldnowForSeller=(select concat('select gold from Resource where idUser=',@idseller,' into @test3'));

PREPARE stmt FROM @goldnowForSeller;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

set @totalGoldForSeller=(@test3+@montoBuy);

Update Resource set gold =@totalGoldForSeller where idUser=@idseller;
set @Qtd=(select Qty from Offert where idOffert=idOff);

if @Qtd = 0 then 

Update Offert set Sell='Y' where idOffert=idOff;

end if;

Select 'Done' as Msg;

end;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `BuyOfferArmy` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `BuyOfferArmy`(IN `IdUse` Int,IN `idOff` Int,IN `idVB` Int)
BEGIN
proc_label:BEGIN
set @idseller=(select idUser from ArmyOffert where idArmyOffert=idOff);
set @ArmyOff=(select idArmy from ArmyOffert where idArmyOffert=idOff);
set @Mon=(select Money from ArmyOffert where idArmyOffert=idOff);

set @BuyMoney = (Select gold from Resource where idUser=IdUse);

if @Mon > @BuyMoney then

select 'Insufficient Gold To Buy' as Msg;

leave proc_label;

end if;


set @goldnow=(select concat('select gold from Resource where idUser=',IdUse,' into @test2'));

PREPARE stmt FROM @goldnow;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

set @totalGold=(@test2-@Mon);

Update Resource set gold =@totalGold where idUser=IdUse;

set @goldnowForSeller=(select concat('select gold from Resource where idUser=',@idseller,' into @test3'));

PREPARE stmt FROM @goldnowForSeller;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

set @totalGoldForSeller=(@test3+@Mon);

Update Resource set gold=@totalGoldForSeller where idUser=@idseller;

Delete ArmyOffert.* from ArmyOffert where idArmy=@ArmyOff;

update Army set idVillageBuild=@idVB, Sell='N' where idArmy=@ArmyOff;

Select 'Done' as Msg;
end;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ChunkTiledGenerator` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ChunkTiledGenerator`()
BEGIN

set @var1=0;
set @var2=0;
set @test2=1;
set @test='';
set @test6='';
set @test3='col';
set @test4='';
set @test5='';
set @conc='';

CREATE TEMPORARY TABLE TempChunk (col1  int,col2  int,col3  int,col4  int,col5  int,col6  int,col7  int,col8  int,col9  int,col10 int,col11 int,col12 int,col13 int,col14 int,col15 int,col16 int,col17 int,col18 int,col19 int,col20 int);



label1: LOOP
if @var1<=19 then

insert into TempChunk (col1,col2,col3,col4,col5,col6,col7,col8,col9,col10,col11,col12,col13,col14,col15,col16,col17,col18,col19,col20) values (( 0 + CEIL( RAND() * 9 ) ),( 0 + CEIL( RAND() * 9 ) ),( 0 + CEIL( RAND() * 9 ) ),( 0 + CEIL( RAND() * 9 ) ),( 0 + CEIL( RAND() * 9 ) ),( 0 + CEIL( RAND() * 9 ) ),( 0 + CEIL( RAND() * 9 ) ),( 0 + CEIL( RAND() * 9 ) ),( 0 + CEIL( RAND() * 9 ) ),( 0 + CEIL( RAND() * 9 ) ),( 0 + CEIL( RAND() * 9 ) ),( 0 + CEIL( RAND() * 9 ) ),( 0 + CEIL( RAND() * 9 ) ),( 0 + CEIL( RAND() * 9 ) ),( 0 + CEIL( RAND() * 9 ) ),( 0 + CEIL( RAND() * 9 ) ),( 0 + CEIL( RAND() * 9 ) ),( 0 + CEIL( RAND() * 9 ) ),( 0 + CEIL( RAND() * 9 ) ),( 0 + CEIL( RAND() * 9 ) ));

set @var1 =@var1+1;

    ITERATE label1;
end if;
    LEAVE label1;
END LOOP label1;


label2: LOOP
if @var2<=19 then

label3:loop
if @test2<=20 then

set @test4=(select concat(@test3,@test2));

set @test5=(select concat('select ',@test4,' from TempChunk limit  ',@var2,' ,1 into @test'));

PREPARE stmt FROM @test5;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
set @test6=@test;

if @conc='' then
    set @conc=(select concat(@test6,@conc));
else
    set @conc=(select concat(@test6,',',@conc));
END IF;

set @test2 =@test2+1;


    ITERATE label3;
end if;

    LEAVE label3;
END LOOP label3;
set @test2 = 1;
set @var2 =@var2+1;
ITERATE label2;

End if;

    LEAVE label2;
END LOOP label2;


call `ArrayToBinary`(@conc);
drop TEMPORARY TABLE TempChunk;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CountUnitSquad` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CountUnitSquad`(in idSquadV int)
BEGIN
Select Army.idUnit,count(Army.idUnit) as qty, UnitClass.Description, UnitClass.Image from Army  
inner join UnitClass on UnitClass.idUnit = Army.idUnit
inner join Squad on Squad.idArmy = Army.idArmy
inner join SquadVillage on SquadVillage.idSquadVillage=Squad.idSquadVillage
where SquadVillage.idSquadVillage=idSquadV  GROUP BY Army.idUnit;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CountUnitVillage` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CountUnitVillage`(IN `IdVillag` Int)
BEGIN

Select Army.idUnit,count(Army.idUnit) as qty, UnitClass.Description, UnitClass.Image from Army 
inner join VillageBuild on VillageBuild.idVillageBuild = Army.idVillageBuild 
inner join Village on Village.idVillage=VillageBuild.idVillage 
inner join UnitClass on UnitClass.idUnit = Army.idUnit
where Village.idVillage=IdVillag and Army.Pending='N' GROUP BY Army.idUnit;
-- select * from Army;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CreateTempSquadDefVillage` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CreateTempSquadDefVillage`(IN `IdVillagDef` Int)
BEGIN

set @nickBattle=(select `generate_villagename`());

insert into SquadVillage (idVillage,SquadName) Values (IdVillagDef,@nickBattle);

set @idSquadVillag=(select idSquadVillage from SquadVillage where idVillage=IdVillagDef and SquadName=@nickBattle);


insert into Squad (idSquadVillage,idArmy) select SquadVillage.idSquadVillage,Army.idArmy from Army inner join VillageBuild on Army.idVillageBuild=VillageBuild.idVillageBuild inner join Village on Village.idVillage=VillageBuild.idVillage inner join SquadVillage on SquadVillage.idVillage=Village.idVillage where Village.idVillage=IdVillagDef and Army.Squad='N' and Army.Sell='N' and Army.Pending='N' and idSquadVillage=@idSquadVillag;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CreateUnit` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CreateUnit`(IN `idVillagB` Int, IN `idUni` int, IN `unitname` Varchar(20), IN `faceimg` Varchar(20))
BEGIN
proc_label:BEGIN

set @idVB=idVillagB;

set @faceRandom = faceimg;

set @IdVillag=(select `idVillage` from `VillageBuild` where `idVillageBuild`=@idVB);

set @Atk=(select Attack from UnitClass where idUnit=idUni);
set @Def=(select Defense from UnitClass where idUnit=idUni);
set @Lif=(select Life from UnitClass where idUnit=idUni);

call `moneytoUnit`(@idVB,idUni,@IdVillag);

if @RC=1 then
leave proc_label;
end if;

Call `TimeCostUnit`(idUni);

insert into Army (idVillageBuild,IdUnit,Unit_Name,Attack,Defense,Life,Pending,EndTime,Face) Values (@idVB,idUni,unitname,@Atk,@Def,@Lif,'Y',@endTime, @faceRandom);

UPDATE `VillageBuild` set endTime=@endTime,pending='Y' where `idVillageBuild`=idVillagB;






select 'Done' as Msg, @t2 as Timer;

end;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CreateUnitView` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CreateUnitView`(IN `idVillag` Int,IN `possX` Int,IN `possY` Int)
BEGIN
proc_label:BEGIN

set @idVB=(select `idVillageBuild` from `VillageBuild` where `idVillage`=IdVillag and `posX`=possX and `posY`=possY);

set @idUni= (select `idUnit` from `Army` where `idVillageBuild`=@idVB and `Pending`='Y');

if @idUni is null then
select 'You Dont Have a unit here.' as Msg;
	    	leave proc_label;
	    end if;

set @unitDesc=(select `Description` from `UnitClass` where `idUnit`=@idUni);
set @unitimg=(select `Image` from `UnitClass` where `idUnit`=@idUni);

call `TimeCheckUnit` (idVillag,possX,possY);

set @infoBuild = (select idBuilding from VillageBuild where idVillage=IdVillag and posX=possX and posY=possY);
set @buildDesc=(select Description from Buildings where idBuilding=@infoBuild);


Select @idUni as idUnit ,@buildDesc as Description, @unitimg as Image,@miss as Timer;
end ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CreatHorde` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CreatHorde`(IN `IdSquadAtk` LONGBLOB,IN `possX` Int,IN `possY` Int,IN `IdUsedAtk` Int)
BEGIN
set @idTiled=(select idTile from Chunk where PosX=possX and PosY=possY);

Case @idTiled 

WHEN 38 THEN

call `CreatHordeEasy`(IdSquadAtk,possX,possY,IdUsedAtk);

Call `BattleNPC`(IdSquadAtk,possX,possY,IdUsedAtk);

WHEN 39 THEN

call `CreatHordeNormal`(IdSquadAtk,possX,possY,IdUsedAtk);

Call `BattleNPC`(IdSquadAtk,possX,possY,IdUsedAtk);

WHEN 40 THEN

call `CreatHordeHard`(IdSquadAtk,possX,possY,IdUsedAtk);

Call `BattleNPC`(IdSquadAtk,possX,possY,IdUsedAtk);

end case;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CreatHordeEasy` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CreatHordeEasy`(IN `IdSquadAtk` Int,IN `possX` Int,IN `possY` Int,IN `IdUsedAtk` Int)
BEGIN

Set @count=0;

set @idChun=(select idChunk from Chunk where PosX=possX and PosY=possY);


set @Quest=(select idQuest from Quest where idChunk=@idChun);

Insert HordeQuest(idQuest) values (@Quest);

set @QuestHorde=(select idHordeQuest from HordeQuest where idQuest=@Quest);

label1: LOOP

set @Enemy=(select idEnemy from Enemy inner join EnemyClass on EnemyClass.idEnemyClass=Enemy.idEnemyClass where EnemyClass.Difficult='Easy' and Enemy.InHorde='N' limit 0,1);

if @Enemy is NULL Then

call `EnemyGenerate`();

End if;

if @count<6 then

Insert Horde(idHordeQuest,idEnemy) values (@QuestHorde,@Enemy);

Update Enemy set InHorde='Y' where idEnemy=@Enemy;

Set @count=@count+1;
ITERATE label1;
else
LEAVE label1;
end if;
END LOOP label1;

Set @count=0;

label2: LOOP

set @Enemy=(select idEnemy from Enemy inner join EnemyClass on EnemyClass.idEnemyClass=Enemy.idEnemyClass where EnemyClass.Difficult='Normal' and Enemy.InHorde='N' limit 0,1);

if @Enemy is NULL Then

call `EnemyGenerate`();

End if;

if @count<3 then

Insert Horde(idHordeQuest,idEnemy) values (@QuestHorde,@Enemy);

Update Enemy set InHorde='Y' where idEnemy=@Enemy;

Set @count=@count+1;
ITERATE label2;
else
LEAVE label2;
end if;
END LOOP label2;

Set @count=0;

#label3: LOOP

#set @Enemy=(select idEnemy from Enemy inner join EnemyClass on EnemyClass.idEnemyClass=Enemy.idEnemyClass where EnemyClass.Difficult='Hard' and Enemy.InHorde='N' limit 0,1);

#if @count<3 then

#Insert Horde(idHordeQuest,idEnemy) values (@QuestHorde,@Enemy);

#Update Enemy set InHorde='Y' where idEnemy=@Enemy;

#Set @count=@count+1;
#ITERATE label3;
#else
#LEAVE label3;
#end if;
#END LOOP label3;
#Set @count=0;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CreatHordeHard` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CreatHordeHard`(IN `IdSquadAtk` Int,IN `possX` Int,IN `possY` Int,IN `IdUsedAtk` Int)
BEGIN
Set @count=0;

set @idChun=(select idChunk from Chunk where PosX=possX and PosY=possY);

set @Quest=(select idQuest from Quest where idChunk=@idChun);

Insert HordeQuest(idQuest) values (@Quest);

set @QuestHorde=(select idHordeQuest from HordeQuest where idQuest=@Quest);

#label1: LOOP

#set @Enemy=(select idEnemy from Enemy inner join EnemyClass on EnemyClass.idEnemyClass=Enemy.idEnemyClass where EnemyClass.Difficult='Easy' and Enemy.InHorde='N' limit 0,1);

#if @count<4 then

#Insert Horde(idHordeQuest,idEnemy) values (@QuestHorde,@Enemy);

#Update Enemy set InHorde='Y' where idEnemy=@Enemy;

#Set @count=@count+1;
#ITERATE label1;
#else
#LEAVE label1;
#end if;
#END LOOP label1;

#Set @count=0;

label2: LOOP

set @Enemy=(select idEnemy from Enemy inner join EnemyClass on EnemyClass.idEnemyClass=Enemy.idEnemyClass where EnemyClass.Difficult='Normal' and Enemy.InHorde='N' limit 0,1);

if @Enemy is NULL Then

call `EnemyGenerate`();

End if;

if @count<4 then

Insert Horde(idHordeQuest,idEnemy) values (@QuestHorde,@Enemy);

Update Enemy set InHorde='Y' where idEnemy=@Enemy;

Set @count=@count+1;
ITERATE label2;
else
LEAVE label2;
end if;
END LOOP label2;

Set @count=0;

label3: LOOP

set @Enemy=(select idEnemy from Enemy inner join EnemyClass on EnemyClass.idEnemyClass=Enemy.idEnemyClass where EnemyClass.Difficult='Hard' and Enemy.InHorde='N' limit 0,1);

if @Enemy is NULL Then

call `EnemyGenerate`();

End if;

if @count<5 then

Insert Horde(idHordeQuest,idEnemy) values (@QuestHorde,@Enemy);

Update Enemy set InHorde='Y' where idEnemy=@Enemy;

Set @count=@count+1;
ITERATE label3;
else
LEAVE label3;
end if;
END LOOP label3;
Set @count=0;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CreatHordeNormal` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CreatHordeNormal`(IN `IdSquadAtk` Int,IN `possX` Int,IN `possY` Int,IN `IdUsedAtk` Int)
BEGIN
Set @count=0;

set @idChun=(select idChunk from Chunk where PosX=possX and PosY=possY);

set @Quest=(select idQuest from Quest where idChunk=@idChun);

Insert HordeQuest(idQuest) values (@Quest);

set @QuestHorde=(select idHordeQuest from HordeQuest where idQuest=@Quest);

label1: LOOP

set @Enemy=(select idEnemy from Enemy inner join EnemyClass on EnemyClass.idEnemyClass=Enemy.idEnemyClass where EnemyClass.Difficult='Easy' and Enemy.InHorde='N' limit 0,1);

if @Enemy is NULL Then

call `EnemyGenerate`();

End if;

if @count<4 then

Insert Horde(idHordeQuest,idEnemy) values (@QuestHorde,@Enemy);

Update Enemy set InHorde='Y' where idEnemy=@Enemy;

Set @count=@count+1;
ITERATE label1;
else
LEAVE label1;
end if;
END LOOP label1;

Set @count=0;

label2: LOOP

set @Enemy=(select idEnemy from Enemy inner join EnemyClass on EnemyClass.idEnemyClass=Enemy.idEnemyClass where EnemyClass.Difficult='Normal' and Enemy.InHorde='N' limit 0,1);

if @Enemy is NULL Then

call `EnemyGenerate`();

End if;

if @count<5 then

Insert Horde(idHordeQuest,idEnemy) values (@QuestHorde,@Enemy);

Update Enemy set InHorde='Y' where idEnemy=@Enemy;

Set @count=@count+1;
ITERATE label2;
else
LEAVE label2;
end if;
END LOOP label2;

Set @count=0;

label3: LOOP

set @Enemy=(select idEnemy from Enemy inner join EnemyClass on EnemyClass.idEnemyClass=Enemy.idEnemyClass where EnemyClass.Difficult='Hard' and Enemy.InHorde='N' limit 0,1);

if @Enemy is NULL Then

call `EnemyGenerate`();

End if;

if @count<1 then

Insert Horde(idHordeQuest,idEnemy) values (@QuestHorde,@Enemy);

Update Enemy set InHorde='Y' where idEnemy=@Enemy;

Set @count=@count+1;
ITERATE label3;
else
LEAVE label3;
end if;
END LOOP label3;
Set @count=0;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CreatHordeTemple` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CreatHordeTemple`(IN `IdSquadAtk` Int,IN `possX` Int,IN `possY` Int,IN `IdUsedAtk` Int)
BEGIN
Set @count=0;

set @idChun=(select idChunk from Chunk where PosX=possX and PosY=possY);

set @Quest=(select idQuest from Quest where idChunk=@idChun);

Insert HordeQuest(idQuest) values (@Quest);

set @QuestHorde=(select idHordeQuest from HordeQuest where idQuest=@Quest);

#label1: LOOP

#set @Enemy=(select idEnemy from Enemy inner join EnemyClass on EnemyClass.idEnemyClass=Enemy.idEnemyClass where EnemyClass.Difficult='Easy' and Enemy.InHorde='N' limit 0,1);

#if @count<4 then

#Insert Horde(idHordeQuest,idEnemy) values (@QuestHorde,@Enemy);

#Update Enemy set InHorde='Y' where idEnemy=@Enemy;

#Set @count=@count+1;
#ITERATE label1;
#else
#LEAVE label1;
#end if;
#END LOOP label1;

#Set @count=0;

label2: LOOP

set @Enemy=(select idEnemy from Enemy inner join EnemyClass on EnemyClass.idEnemyClass=Enemy.idEnemyClass where EnemyClass.Difficult='Normal' and Enemy.InHorde='N' limit 0,1);

if @Enemy is NULL Then

call `EnemyGenerate`();

End if;

if @count<7 then

Insert Horde(idHordeQuest,idEnemy) values (@QuestHorde,@Enemy);

Update Enemy set InHorde='Y' where idEnemy=@Enemy;

Set @count=@count+1;
ITERATE label2;
else
LEAVE label2;
end if;
END LOOP label2;

Set @count=0;

label3: LOOP

set @Enemy=(select idEnemy from Enemy inner join EnemyClass on EnemyClass.idEnemyClass=Enemy.idEnemyClass where EnemyClass.Difficult='Hard' and Enemy.InHorde='N' limit 0,1);

if @Enemy is NULL Then

call `EnemyGenerate`();

End if;

if @count<10 then

Insert Horde(idHordeQuest,idEnemy) values (@QuestHorde,@Enemy);

Update Enemy set InHorde='Y' where idEnemy=@Enemy;

Set @count=@count+1;
ITERATE label3;
else
LEAVE label3;
end if;
END LOOP label3;
Set @count=0;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `doOffer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `doOffer`(IN `IdUse` Int,IN `IdBasecresource` Int,IN `QTD` Int,IN `money_value` Int)
BEGIN

proc_label:BEGIN

set @resourcename=(select `Description` from BasecResource where idBasecResouce=IdBasecresource);

set @resourcenow=(select concat('select ',@resourcename,' from Resource where idUser=',IdUse,' into @test'));

PREPARE stmt FROM @resourcenow;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

if QTD > @test then

select 'Insufficient Resources To Sell' as Msg;


leave proc_label;

end if;

set @total=(@test-QTD);


set @upd=(select concat('Update Resource set ',@resourcename,'=',@total,' where idUser=',IdUse));


PREPARE stmt FROM @upd;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

insert into Offert(idUser,idBasecResouce,Qty,Money) values (IdUse,IdBasecresource,QTD,money_value);

select 'Your Offert Was Created' as Msg;
end;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `doOfferArmy` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `doOfferArmy`(IN `IdUse` Int,IN `idUni` Int,IN `money_value` Int)
BEGIN
proc_label:BEGIN

insert into ArmyOffert(idUser,idArmy,Money) values (IdUse,idUni,money_value);

update Army set Sell='Y' where idArmy=idUni;

set @inSquad=(select Squad from Army where idArmy=idUni);

if @inSquad = 'Y' then

set @Squadid=(select idSquadVillage From Squad where idArmy=idUni);

Delete Squad.* from Squad where idArmy=idUni;

update Army set Squad='N' where idArmy=idUni;

set @countSquaUnit=(select count(*) From Squad where idSquadVillage=@Squadid);

if @countSquaUnit=0 then

delete SquadVillage.* from SquadVillage where idSquadVillage=@Squadid;

end if;

end if;

select 'Your Unit Offert Was Created' as Msg;

end;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DropGame` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `DropGame`()
BEGIN
delete Work.* from Work;
delete Squad.* from Squad;
delete Resource.* from Resource;
delete Horde.* from Horde;
delete HordeQuest.* from HordeQuest;
delete Quest.* from Quest;
delete PlayerSession.* from PlayerSession;
delete Offert.* from Offert;
delete Battle.* from Battle;
delete ArmyOffert.* from ArmyOffert;
delete Army.* from Army;
delete VillageBuild.* from VillageBuild;
delete SquadVillage.* from SquadVillage;
delete Village.* from Village;
delete Chunk.* from Chunk;
update Users set Data_Ultimo_login=NULL where Data_Ultimo_login is Not NULL;
#delete Users.* from Users;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DropGameALL` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `DropGameALL`()
BEGIN
delete Work.* from Work;
delete Squad.* from Squad;
delete Resource.* from Resource;
delete Quest.* from Quest;
delete PlayerSession.* from PlayerSession;
delete Offert.* from Offert;
delete Battle.* from Battle;
delete ArmyOffert.* from ArmyOffert;
delete Army.* from Army;
delete VillageBuild.* from VillageBuild;
delete SquadVillage.* from SquadVillage;
delete Village.* from Village;
delete Chunk.* from Chunk;
delete Users.* from Users;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EndSeason` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `EndSeason`(in Seasonid int)
BEGIN


set @Userid=(select idUser from Village where isTemple='Y');

set @TimeEnd=(select EndTime From Season where idSeason=Seasonid);


if @TimeEnd Is NULL Then
update Season set EndTime=Now(),Winner=@Userid where idSeason=Seasonid;

call `StartSeason`(Seasonid);

end if;







END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EnemyGenerate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `EnemyGenerate`()
BEGIN


Set @count=0;
Set @class=1;
label1: loop 

if @count=17 then

LEAVE label1;

Else


set @name=(select `generate_fname`());
set @lif=(select Life from EnemyClass where idEnemyClass=@class);

Insert Enemy (idEnemyClass,Enemy_name,Attack,Defense,Life) Values (@class,@name,'0','0'
,@lif);

set @count=@count+1;
set @class=@class+1;

ITERATE label1;

end if;
END LOOP label1;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getResources` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getResources`(IN `user` INT)
BEGIN

SELECT * FROM Resource WHERE idUser = user; 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getUserVillages` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getUserVillages`(IN User int)
BEGIN
select idVillage,VillageNick from Village where idUser=User;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getVillageBuilding` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getVillageBuilding`(IN `IdVillag` Int)
BEGIN

#(select timeDIFF(VillageBuild.endTime,now()) from VillageBuild where VillageBuild.endTime>now()) as timer

#select VillageBuild.posX,VillageBuild.posY,VillageBuild.pending,Buildings.idTile,Buildings.Type,(timeDIFF(VillageBuild.endTime,now())) as Timer, Buildings.gatherTime as TimerColection from VillageBuild, Buildings where VillageBuild.IdBuilding=Buildings.IdBuilding and VillageBuild.idVillage=IdVillag;

select Distinct VillageBuild.posX,VillageBuild.posY,VillageBuild.pending,Buildings.idTile,Buildings.Type,(timeDIFF(VillageBuild.endTime,now())) as Timer, Buildings.gatherTime as TimerColection, (case when(timeDIFF(VillageBuild.endTime,now())) is not Null then (select UnitClass.Description from UnitClass left join Army on UnitClass.idUnit=Army.idUnit where UnitClass.idUnit=Army.idUnit and Army.idVillageBuild=VillageBuild.idVillageBuild and Army.pending='Y') end) as JobDescription from VillageBuild left join Buildings on VillageBuild.IdBuilding=Buildings.IdBuilding left join Army on VillageBuild.IdVillageBuild=Army.IdVillageBuild left join UnitClass on Army.idUnit=UnitClass.idUnit where VillageBuild.IdBuilding=Buildings.IdBuilding and VillageBuild.idVillage=IdVillag;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getVillageUnit` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getVillageUnit`(IN `IdVillag` Int)
BEGIN
Select Army.*,UnitClass.Description,UnitClass.image from Army inner join UnitClass on Army.idUnit = UnitClass.idUnit  inner join VillageBuild on VillageBuild.idVillageBuild = Army.idVillageBuild inner join Village on Village.idVillage=VillageBuild.idVillage where Village.idVillage=IdVillag and Army.Pending='N' and Army.Sell='N';

call `CountUnitVillage`(IdVillag);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getWorldVillages` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getWorldVillages`(IN `idZon` Int)
BEGIN

select Chunk.idTile,Chunk.posX,Chunk.posY,Village.VillageNick,Village.idVillage,Village.idUser, Users.Nick, Quest.idQuest from Chunk  left join Village on Chunk.idChunk = Village.idChunck left  join Users on Village.idUser=Users.idUser left  join Quest on Chunk.idChunk = Quest.idChunk where Chunk.idZone=idZon;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `haveBuildings` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `haveBuildings`(IN `IdVillag` Int,IN `possX` Int, IN `possY` Int)
BEGIN

proc_label:BEGIN

set @haveBuild=(select idVillageBuild from VillageBuild where idVillage=IdVillag and posX=possX and posY=possY);

if @haveBuild is not NULL then
	    	select 'You have building here' as Msg;
    leave proc_label;

end if;

END;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `haveChunk` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `haveChunk`(in zone int,in possX int,in possY int)
BEGIN
set @chunck=(select Chunk from `Chunk` where posX=possX and posY=possY and idZone=zone);

select @chunck as Msg;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `isLogged` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `isLogged`()
BEGIN

select true as logged;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `makeBuildings` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `makeBuildings`(IN `IdVillag` Int,IN `possX` Int, IN `possY` Int,IN `IdConstr` Int)
BEGIN
proc_label:BEGIN


call `haveBuildings`(IdVillag,possX,possY);
if @haveBuild is not NULL then
    leave proc_label;
end if;
call `resourcetoBuildings`(IdVillag,IdConstr);

if @nok = 0 then   
INSERT INTO `Jogo`.`VillageBuild` (`idVillage`, `idBuilding`, `posX`, `posY`) VALUES (IdVillag,IdConstr,possX,possY);
Call `TimeCost`(IdVillag,possX,possY,IdConstr);

else

leave proc_label;

end if;
set @idVB=(select `idVillageBuild` from VillageBuild where `idVillage`=IdVillag and `posX`=possX and `posY`=possY);
set @timer=(select `endTime` from VillageBuild where idVillageBuild=@idVB);
select 'Done' as Msg, @timer as Timer;


end;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `MergeSquad` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `MergeSquad`(in `ArraySquad` LONGBLOB, in `idSqua` int)
BEGIN

DECLARE SquadUnit int;
set SquadUnit=0;
set @var1=0;
set @var2=0;
set @p1=0;
set @p2=0;
set @p3=0;

label1: LOOP

SET @p2 = @p2 + 1;
SET @p3 = @p3 + 2;
set @var1=(select SUBSTRING_INDEX(ArraySquad,',', @p2));
set @var2=(select SUBSTRING_INDEX(ArraySquad,',', @p3));
if @var2=@var1 then

SET @p2=@p2+1;

else

ITERATE label1;
    END IF;

    LEAVE label1;
  END LOOP label1;

label2: LOOP


    SET @p1 = @p1 + 1;

    IF @p1 < @p2 THEN

set @Array=(SELECT SPLIT_STRING(ArraySquad, ',', @p1));

set SquadUnit=@Array;

Set @idsquade=(select idSquadVillage from Squad where idArmy=SquadUnit);

set @idVIllagTrans=(select distinct idVillage from SquadVillage where idSquadVillage=idSqua);

set @idVBTrans=(select VillageBuild.idVillageBuild from SquadVillage inner join Village on SquadVillage.idVillage=Village.idVillage inner join VillageBuild on VillageBuild.idVillage=Village.idVillage where VillageBuild.idVillage=@idVIllagTrans and VillageBuild.endTimeColection is NULL limit 0,1);

update Army set idVillageBuild=@idVBTrans where idArmy=SquadUnit;
update Squad set idSquadVillage=idSqua where idArmy=SquadUnit;

set @haveUnit=(select idSquad from Squad where idSquadVillage=@idsquade limit 0,1);

if @haveUnit is NULL then

delete SquadVillage.* from SquadVillage where idSquadVillage=@idsquade;

end if;

      ITERATE label2;
    END IF;
    LEAVE label2;
  END LOOP label2;

select 'Merge Done' as Msg;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `moneytoBuildings` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `moneytoBuildings`(IN `IdVillag` Int, IN `IdConstr` Int,IN `possX` Int, IN `possY` Int)
BEGIN

proc_label:BEGIN

set @haveBuild=(select idVillageBuild from VillageBuild where idVillage=IdVillag and posX=possX and posY=possY);

if @haveBuild is not NULL then
	    	select 'You have building here' as Msg;
    leave proc_label;

end if;
#Get resources values of the build
set @Descri=(Select Description From Buildings where idBuilding=IdConstr);
set @wood=(Select wood From Buildings where idBuilding=IdConstr);
set @stone=(Select stone From Buildings where idBuilding=IdConstr);
set @iron=(Select iron From Buildings where idBuilding=IdConstr);
set @gold=(Select gold From Buildings where idBuilding=IdConstr);
#Get User ID
set @User=(select idUser from Village where idVillage=IdVillag);


#Get who many resources the user have
set @wood_user=(SELECT wood FROM Resource where idUser=@User);
set @stone_user=(SELECT stone FROM Resource where idUser=@User);
set @iron_user=(SELECT iron FROM Resource where idUser=@User);
set @gold_user=(SELECT gold FROM Resource where idUser=@User);

#Check if the user have resources to building
if @wood > @wood_user then
select 'Insufficient Resources' as Msg;
	    	leave proc_label;
	    end if;

if @stone > @stone_user then
select 'Insufficient Resources' as Msg;
	    	leave proc_label;
	    end if;

if @iron > @iron_user then
select 'Insufficient Resources' as Msg;
	    	leave proc_label;
	    end if;

if @gold > @gold_user then
select 'Insufficient Resources' as Msg;
	    	leave proc_label;
	    end if;

#Make the calc  
set @wood_new=@wood_user - @wood;
set @stone_new=@stone_user - @stone;
set @iron_new=@iron_user - @iron;
set @gold_new=@gold_user - @gold;

#Update The user resources 
UPDATE `Jogo`.`Resource` SET `wood`=@wood_new, `stone`=@stone_new, `iron`=@iron_new, `gold`=@gold_new WHERE `idUser`=@User;

#Insert build in village
INSERT INTO `Jogo`.`VillageBuild` (`idVillage`, `idBuilding`, `posX`, `posY`) VALUES (IdVillag,IdConstr,possX,possY);

select 'Done' as Msg;

END;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `moneytoUnit` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `moneytoUnit`(IN `IdVillagB` Int, in `IdUni` int,in `IdVillag` int)
BEGIN
proc_label:BEGIN

set @wood=(Select Qty From ResourceUnit where idUnit=IdUni and idBasecResouce='1');
set @food=(Select Qty From ResourceUnit where idUnit=IdUni and idBasecResouce='2');
set @stone=(Select Qty From ResourceUnit where idUnit=IdUni and idBasecResouce='3');
set @iron=(Select Qty From ResourceUnit where idUnit=IdUni and idBasecResouce='4');
set @gold=(Select Qty From ResourceUnit where idUnit=IdUni and idBasecResouce='5');

#Get User ID
set @User=(select idUser from Village where idVillage=IdVillag);


#Get who many resources the user have
set @wood_user=(SELECT wood FROM Resource where idUser=@User);
set @food_user=(SELECT food FROM Resource where idUser=@User);
set @stone_user=(SELECT stone FROM Resource where idUser=@User);
set @iron_user=(SELECT iron FROM Resource where idUser=@User);
set @gold_user=(SELECT gold FROM Resource where idUser=@User);

#Check if the user have resources to building
if @wood > @wood_user then
select 'Insufficient Resources' as Msg;
set @RC=1;
	    	leave proc_label;
 end if;
if @wood is Null then
set @wood=0;
 end if;

if @food > @food_user then
select 'Insufficient Resources' as Msg;
set @RC=1;
	    	leave proc_label;
 end if;
if @food is Null then
set @food=0;
	    end if;

if @stone > @stone_user then
select 'Insufficient Resources' as Msg;
set @RC=1;	    	
leave proc_label;
 end if;
if @stone is Null then
set @stone=0;
 end if;

if @iron > @iron_user then
set @RC=1;
select 'Insufficient Resources' as Msg;
	    	leave proc_label;
 end if;
if @iron is Null then
set @iron=0;
	    end if;


if @gold > @gold_user then
set @RC=1;
select 'Insufficient Resources' as Msg;
	    	leave proc_label;
 end if;
if @gold is Null then
set @gold=0;
	    end if;

#Make the calc  
set @wood_new=@wood_user - @wood;
set @stone_new=@stone_user - @stone;
set @iron_new=@iron_user - @iron;
set @gold_new=@gold_user - @gold;
set @food_new=@food_user - @food;

#Update The user resources 


UPDATE `Jogo`.`Resource` SET `wood`=@wood_new, `food`=@food_new,`stone`=@stone_new, `iron`=@iron_new, `gold`=@gold_new WHERE `idUser`=@User;

end;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `newChunk` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `newChunk`()
BEGIN
proc_label:BEGIN
Declare rowChunk int default 0;
set rowChunk=((select count(*) from Chunk)-1);
set @rowZone=(select count(*) from Zone);
set @chunkPosX=(select posX from Chunk limit rowChunk,1);
set @chunkPosY=(select posY from Chunk limit rowChunk,1);

if @chunkPosX=20 and @chunkPosY=20 then
call `newZone`();
leave proc_label;
end if;

if @chunkPosX<20 and @chunkPosY<20 then

call `ChunkTiledGenerator`();
insert into Chunk (idZone,posX,posY,binTiled) values (@rowZone,@chunkPosX,(@chunkPosY+1),@concatena);

else

call `ChunkTiledGenerator`();
set @chunkPosY=0;
insert into Chunk (idZone,posX,posY,binTiled) values (@rowZone,(@chunkPosX+1),@chunkPosY,@concatena);

leave proc_label;
end if;
end;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `newQuest` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `newQuest`()
BEGIN

set @count=0;

label1: LOOP

Set @randonX=(select((FLOOR(RAND()  * 20))));
Set @randonY=(select((FLOOR(RAND()  * 20))));

set @valposs=(select idChunk from Chunk where posX=@randonX and posY=@randonY);

if @valposs is not null then
LEAVE label1;
end if;

Set @randonTiled='38';

insert into Chunk (idZone,idTile,posX,posY) Values ('1',@randonTiled,@randonX,@randonY);

set @idChun=(select idChunk from Chunk where PosX=@randonX and PosY=@randonY);

Insert Quest (idChunk) values (@idChun);

set @count=@count+1;

if @count=15 then

LEAVE label1;

else

ITERATE label1;

end if;

END LOOP label1;

set @count=0;

label2: LOOP

Set @randonX=(select((FLOOR(RAND()  * 20))));
Set @randonY=(select((FLOOR(RAND()  * 20))));

set @valposs=(select idChunk from Chunk where posX=@randonX and posY=@randonY);

if @valposs is not null then
LEAVE label2;
end if;

Set @randonTiled='39';

insert into Chunk (idZone,idTile,posX,posY) Values ('1',@randonTiled,@randonX,@randonY);

set @idChun=(select idChunk from Chunk where PosX=@randonX and PosY=@randonY);

Insert Quest (idChunk) values (@idChun);

set @count=@count+1;

if @count=10 then

LEAVE label2;

else

ITERATE label2;

end if;

END LOOP label2;

set @count=0;

label3: LOOP

Set @randonX=(select((FLOOR(RAND()  * 20))));
Set @randonY=(select((FLOOR(RAND()  * 20))));

set @valposs=(select idChunk from Chunk where posX=@randonX and posY=@randonY);

if @valposs is not null then
LEAVE label3;
end if;

Set @randonTiled='40';

insert into Chunk (idZone,idTile,posX,posY) Values ('1',@randonTiled,@randonX,@randonY);

set @idChun=(select idChunk from Chunk where PosX=@randonX and PosY=@randonY);

Insert Quest (idChunk) values (@idChun);

set @count=@count+1;

if @count=5 then

LEAVE label3;

else

ITERATE label3;

end if;

END LOOP label3;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `newSquad` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `newSquad`(in idvillag int,in idArmy LONGBLOB,in squad_Name varchar(20))
BEGIN
proc_label:BEGIN

set @p1=0;
set @p2=0;
set @p3=0;
Set @concatena='';

set @newname=(select SquadName from SquadVillage where SquadName=squad_Name and idVillage=idvillag);

if @newname is not null then
Select 'This Squad already exist';
 leave proc_label;
end if;

Insert SquadVillage (idVillage,SquadName) Values (idvillag,squad_Name);


set @idnewsquad=(select idSquadVillage from SquadVillage where idVillage=idvillag and SquadName=squad_Name);

label2: LOOP

SET @p2 = @p2 + 1;
SET @p3 = @p3 + 2;
set @var1=(select SUBSTRING_INDEX(idArmy,',', @p2));
set @var2=(select SUBSTRING_INDEX(idArmy,',', @p3));
if @var2=@var1 then

SET @p2=@p2+1;

else

ITERATE label2;
    END IF;

    LEAVE label2;
  END LOOP label2;

label1: LOOP


    SET @p1 = @p1 + 1;

    IF @p1 < @p2 THEN

set @SquadTeam=(SELECT SPLIT_STRING(idArmy, ',', @p1));

Insert Squad (idArmy,idSquadVillage) values (@SquadTeam,@idnewsquad);
Update Army set Army.Squad='Y' where Army.idArmy=@SquadTeam;
      ITERATE label1;
    END IF;
    LEAVE label1;
  END LOOP label1;
select 'Done' as Msg;

end;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `newTemple` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `newTemple`()
BEGIN

label1: LOOP

Set @randonX=(select((FLOOR(RAND()  * 20))));
Set @randonY=(select((FLOOR(RAND()  * 20))));

set @valposs=(select idChunk from Chunk where posX=@randonX and posY=@randonY);

if @valposs is null then
leave  label1;
else
ITERATE label1;
end if;
end loop label1;

Set @randonTiled='37';

insert into Chunk (idZone,idTile,posX,posY) Values ('1',@randonTiled,@randonX,@randonY);

set @idChun=(select idChunk from Chunk where PosX=@randonX and PosY=@randonY);

insert into Village (idChunck,VillageNick,IsTemple) Values (@idChun,'Guan Yu Temple','Y');

Insert Quest (idChunk) values (@idChun);


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `newVillage` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `newVillage`(in idUse int)
BEGIN

proc_label:BEGIN


Set @randonX=(select((FLOOR(RAND()  * 20))));
Set @randonY=(select((FLOOR(RAND()  * 20))));

set @valposs=(select idChunk from Chunk where posX=@randonX and posY=@randonY);

label1: LOOP
if @valposs is not null then

Set @randonX=(select((FLOOR(RAND()  * 20))));
Set @randonY=(select((FLOOR(RAND()  * 20))));

set @valposs=(select idChunk from Chunk where posX=@randonX and posY=@randonY);

ITERATE label1;

else

leave label1;

end if;
END LOOP label1;

insert into Chunk (idZone,idTile,posX,posY) Values ('1','41',@randonX,@randonY);

set @idChun = (select idChunk from Chunk where posX=@randonX and posY=@randonY);
set @nickVillag=(select `generate_villagename`());

insert into Village (idUser, idChunck,VillageNick) Values (idUse,@idChun,@nickVillag);

set @idVillag=(select idVillage From Village where idUser=idUse and idChunck=@idChun);

insert into VillageBuild (idVillage,idBuilding,posX,posY,pending) Values (@idVillag,'1','5','5','N');

set @idVB=(select idVillageBuild from VillageBuild where idVillage=@idVillag and idBuilding='1' and posX='5' and posY='5');

insert into Resource (idUser,wood,food,stone,iron,gold) Values (idUse,2000,2000,2000,2000,2000);




set @Atk=(select Attack from UnitClass where idUnit='1');
set @Def=(select Defense from UnitClass where idUnit='1');
set @Lif=(select Life from UnitClass where idUnit='1');


set @countArmy=0;

label2: LOOP

if @countArmy<5 then

set @unitname=(select `generate_fname`());

insert into Army (idVillageBuild,IdUnit,Unit_Name,Attack,Defense,Life,Pending,Face) Values (@idVB,'1',@unitname,@Atk,@Def,@Lif,'N','Farmer');


set @countArmy=@countArmy+1;

ITERATE label2;

else

leave label2;

end if;
END LOOP label2;
end;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `newZone` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `newZone`()
BEGIN
proc_label:BEGIN
Declare rowZone int default 0;
set @Zoneid = 0;
set rowZone=((select count(*) from Zone)-1);
set @zonePosX=(select posX from Zone limit rowZone,1);
set @zonePosY=(select posY from Zone limit rowZone,1);

if @zonePosX=10 and @zonePosY=10 then
leave proc_label;
end if;

if @zonePosX<10 and @zonePosY<10 then

insert into Zone (posX,posY) values (@zonePosX,(@zonePosY+1));

else

set @zonePosY=0;
insert into Zone (posX,posY) values ((@zonePosX+1),@zonePosY);
end if;
leave proc_label;
END;

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `possibleBuildings` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `possibleBuildings`(IN `IdVillag` Int)
BEGIN



#Select * From Buildings where Buildings.idBuilding in (select Buildings.idBuilding from Buildings where Buildings.idBuilding not in (select Buildings.idBuilding from Buildings, BuildDep where BuildDep.Build=Buildings.idBuilding)
#union
#select BuildDep.Build as idBuilding from BuildDep where `Upgrade`='N' and BuildDep.BuildDep in (select Buildings.idBuilding from Buildings,VillageBuild where Buildings.idBuilding=VillageBuild.idBuilding and VillageBuild.idVillage in (select Village.idVillage from Village where Village.idVillage=IdVillag))) ;


Select * From Buildings where Buildings.idBuilding in (select Buildings.idBuilding from Buildings where Buildings.idBuilding not in (select Buildings.idBuilding from Buildings, BuildDep where BuildDep.Build=Buildings.idBuilding) union select BuildDep.Build as idBuilding from BuildDep where `Upgrade`='N' and BuildDep.BuildDep in (select Buildings.idBuilding from Buildings,VillageBuild where Buildings.idBuilding=VillageBuild.idBuilding and VillageBuild.endTime is NULL and VillageBuild.idVillage in (select Village.idVillage from Village where Village.idVillage=IdVillag))) ;





END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PutToWork` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PutToWork`(in idUni LONGBLOB, in idVillagb int)
BEGIN
proc_label:BEGIN
set @p1=0;
set @p2=0;
set @p3=0;




label2: LOOP

SET @p2 = @p2 + 1;
SET @p3 = @p3 + 2;
set @var1=(select SUBSTRING_INDEX(idUni,',', @p2));
set @var2=(select SUBSTRING_INDEX(idUni,',', @p3));
if @var2=@var1 then

SET @p2=@p2+1;

else

ITERATE label2;
    END IF;

    LEAVE label2;
  END LOOP label2;

label1: LOOP


    SET @p1 = @p1 + 1;

    IF @p1 < @p2 THEN

set @WorkerTeam=(SELECT SPLIT_STRING(idUni, ',', @p1));

set @MaxWorker=(select count(*) from Work where idVillageBuild=idVillagb);

if @MaxWorker = 5 then
select 'You cant put more Workers in this Building' as Msg;

leave proc_label;
end if;

insert into Work (idVillageBuild,idArmy) Values (idVillagb,@WorkerTeam);

Update Army set Army.Work='Y' where Army.idArmy=@WorkerTeam;
      ITERATE label1;
    END IF;
    LEAVE label1;
  END LOOP label1;
select 'Done' as Msg;



end;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RandomResources` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `RandomResources`()
BEGIN
#FLOOR(RAND() * (<max> - <min> + 1)) + <min>
#wood 1 basic 60
set @newWood=(select (FLOOR(RAND() * (20 + 1)) + 40));
#stone 3 basic 50
set @newStone=(select (FLOOR(RAND() * (10 + 1)) + 40));
#gold 5 basic 20
set @newGold=(select (FLOOR(RAND() * (10 + 1)) + 15));
#iron 4 basic 35
set @newIron=(select (FLOOR(RAND() * (15 + 1)) + 25));
#food 2 basic 35
set @newFood=(select (FLOOR(RAND() * (15 + 1)) + 25));

Update ResourceColect set Qtd=@newWood where idResourceColect='1';
Update ResourceColect set Qtd=@newStone where idResourceColect='2';
Update ResourceColect set Qtd=@newGold where idResourceColect='3';
Update ResourceColect set Qtd=@newIron where idResourceColect='4';
Update ResourceColect set Qtd=@newFood where idResourceColect='5';


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RegisterUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `RegisterUser`(in UserName varchar(255),in UserLastname varchar(255),in UserEmail varchar(255), in UserNick varchar(255),in UserPassword varchar(255),in userKey varchar(255))
BEGIN
proc_label:BEGIN

set @keyUser=(select `idKeys` from `UserKeys` where `Key` = userKey AND `Status` != 'used');

if @keyUser is NULL THEN 

select 'Wrong Key!' as Msg;

leave proc_label;

end if;

set @Email=(select Email from Users where Email=UserEmail);
set @Nick=(select Nick from Users where Nick=UserNick);

if @Email is not NULL THEN

select 'This Email already Exist' as Msg;

leave proc_label;

end if;

if @Nick is not NULL THEN

select 'This Nick already Exist' as Msg;

leave proc_label;

end if;

Insert into Users (Name,Lastname, Email, Nick, Password, Data_Registro) Values (UserName,UserLastname,UserEmail,UserNick,UserPassword,CURDATE());
update `UserKeys` set `Status` = 'used' where `idKeys` = @keyUser;
Select 'User Create Successful!' as Msg;

end;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ResourceByUnit` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ResourceByUnit`(IN `IdUni` Int)
BEGIN

Select BasecResource.Description, ResourceUnit.Qty from UnitClass inner join ResourceUnit on UnitClass.idUnit =ResourceUnit.idUnit inner join BasecResource on BasecResource.idBasecResouce=ResourceUnit.idBasecResouce where UnitClass.idUnit=IdUni;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ResourceColectorUpdate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ResourceColectorUpdate`(IN `idBuild` Int,IN `idVillag` Int,IN `idVB` Int)
BEGIN

set @test='';

set @userid=(select `idUser` from Village where idVillage=idVillag);

set @worker=(select count(*) from Work inner join VillageBuild on Work.idVillageBuild=VillageBuild.idVillageBuild inner join Buildings on VillageBuild.idBuilding=Buildings.idBuilding  inner join Village on VillageBuild.idVillage=Village.idVillage where Village.idUser=@userid and VillageBuild.idVillageBuild=idVB);

set @wonqtd=(select `Qtd` from ResourceColect where idBuildings=idBuild);

set @won=(@wonqtd*@worker);

set @basecresource=(select idBasecResouce from ResourceColect where idBuildings=idBuild);
set @resourcename=(select `Description` from BasecResource where idBasecResouce=@basecresource);

set @resourcenow=(select concat('select ',@resourcename,' from Resource where idUser=',@userid,' into @test'));

PREPARE stmt FROM @resourcenow;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

set @total=(@test+@won);


set @upd=(select concat('Update Resource set ',@resourcename,'=',@total,' where idUser=',@userid));


PREPARE stmt FROM @upd;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `resourcetoBuildings` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `resourcetoBuildings`(IN `IdVillag` Int,IN `IdConstr` Int)
BEGIN

proc_label:BEGIN

#Get resources values of the build
set @Descri=(Select Description From Buildings where idBuilding=IdConstr);
set @wood=(Select wood From Buildings where idBuilding=IdConstr);
set @stone=(Select stone From Buildings where idBuilding=IdConstr);
set @iron=(Select iron From Buildings where idBuilding=IdConstr);
set @gold=(Select gold From Buildings where idBuilding=IdConstr);
#Get User ID
set @User=(select idUser from Village where idVillage=IdVillag);


#Get who many resources the user have
set @wood_user=(SELECT wood FROM Resource where idUser=@User);
set @stone_user=(SELECT stone FROM Resource where idUser=@User);
set @iron_user=(SELECT iron FROM Resource where idUser=@User);
set @gold_user=(SELECT gold FROM Resource where idUser=@User);

#Check if the user have resources to building
if @wood > @wood_user then
select 'Insufficient Resources' as Msg;
set @nok=1;
	    	leave proc_label;
	    end if;

if @stone > @stone_user then
select 'Insufficient Resources' as Msg;
set @nok=1;
	    	leave proc_label;
	    end if;

if @iron > @iron_user then
select 'Insufficient Resources' as Msg;
set @nok=1;
	    	leave proc_label;
	    end if;

if @gold > @gold_user then
select 'Insufficient Resources' as Msg;
set @nok=1;
	    	leave proc_label;
	    end if;

#Make the calc  
set @wood_new=@wood_user - @wood;
set @stone_new=@stone_user - @stone;
set @iron_new=@iron_user - @iron;
set @gold_new=@gold_user - @gold;

#Update The user resources 
UPDATE `Jogo`.`Resource` SET `wood`=@wood_new, `stone`=@stone_new, `iron`=@iron_new, `gold`=@gold_new WHERE `idUser`=@User;

set @nok=0;
End;
End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SeasonResource` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SeasonResource`()
BEGIN

Select Users.Nick,Resource.* from Resource inner join Users on Resource.idUser=Users.idUser;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `setWorkingAt` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `setWorkingAt`(IN `IdVillagB` Int,IN `IdArm` Int)
BEGIN

insert Work(idVillageBuild,idArmy) values (IdVillagB,IdArm);

Select concat('Unit ', IdArm, ' Working') as Msg;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `StartGame` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `StartGame`()
BEGIN

call `newQuest`();

call `newTemple`();


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `StartSeason` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `StartSeason`(in Seasonid int)
BEGIN

set @TimeEnd=(select EndTime From Season where idSeason=Seasonid);

set @endTime=(select DATE_ADD(@TimeEnd, INTERVAL 3 MINUTE));

call `DropGame`();

insert into Season(StartTime) Values (@endTime);

call `StartGame`();

call `RandomResources`();

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `stopWorking` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `stopWorking`(IN `IdArm` Int)
BEGIN

delete from Work where idArmy=IdArm;

Select concat('Unit ', IdArm, ' Stop Working') as Msg;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `TimeCheck` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `TimeCheck`(IN `idVillag` Int, IN `possX` int, in `possY` int)
BEGIN

set @endtime=(select `endTime` from `VillageBuild` where `idVillage`=IdVillag and `posX`=possX and `posY`=possY);

set @idVB=(select `idVillageBuild` from `VillageBuild` where `idVillage`=IdVillag and `posX`=possX and `posY`=possY);

if (@endtime <= now()) or @endtime is NULL then


select 'Done' as Msg;

update `VillageBuild` set `pending`='N',`endTime`=NULL where `idVillageBuild`=@idVB;

else

set @miss =(select timeDIFF(@endtime, now() ));

select @miss as Msg;

end if;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `TimeCheckBattle` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `TimeCheckBattle`()
BEGIN

select *,timeDIFF(EndTime,now() ) from Army;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `TimeCheckResource` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `TimeCheckResource`(IN `idVillag` Int, IN `possX` int, in `possY` int)
BEGIN
set @endtime=(select `endTimeColection` from `VillageBuild` where `idVillage`=IdVillag and `posX`=possX and `posY`=possY);

set @idbuild=(select idBuilding from VillageBuild where `idVillage`=IdVillag and `posX`=possX and `posY`=possY);

set @idVB=(select idVillageBuild from VillageBuild where `idVillage`=IdVillag and `posX`=possX and `posY`=possY);

if (@endtime <= now()) or @endtime is NULL then



call `ResourceColectorUpdate`(@idbuild,IdVillag,@idVB);

call `TimeCostResource`(idVillag,possX,possY,@idbuild);

select 'Done' as Msg, @won as Qtd;
else

set @miss =(select timeDIFF(@endtime, now() ));

select @miss as Msg;

end if;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `TimeCheckTemple` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `TimeCheckTemple`()
BEGIN

proc_label:BEGIN
set @DominaTime=(select DominateTime from Village where DominateTime is not NULL);

if 	@DominaTime is NULL then
Select 'Timeout' as Msg;
leave proc_label;
	end if;

set @endTime=(select DATE_ADD(@DominaTime, INTERVAL 1 MINUTE));

set @miss=(select timeDIFF(@endTime, now() ));

if now() > @endTime then

Select 'Timeout' as Msg;

else

select  @miss as Msg, Users.Nick, Users.idUser from Village inner join Users on Village.idUser=Users.idUser where Village.DominateTime is not NULL;



end if;

end;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `TimeCheckUnit` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `TimeCheckUnit`(IN `idVillag` Int,IN `possX` Int,IN `possY` Int)
BEGIN

set @idVB=(select `idVillageBuild` from `VillageBuild` where `idVillage`=IdVillag and `posX`=possX and `posY`=possY);

set @idUni= (select `idUnit` from `Army` where `idVillageBuild`=@idVB and `Pending`='Y');


set @endtime=(select `endTime` from `Army` where `idVillageBuild`=@idVB and `idUnit`=@idUni and  `endTime` is not NULL);


if (@endtime <= now()) or @endtime is NULL and @rc=0 then


select 'Done' as Msg;

update `Army` set `Pending`='N',`endTime`=NULL where `idVillageBuild`=@idVB and `Pending`='Y';

UPDATE `VillageBuild` set endTime=NULL,pending='N' where `idVillageBuild`=@idVB;

else 

set @miss =(select timeDIFF(@endtime, now() ));
if @rc=0 then
select @miss as Msg;
end if;
end if;

set @rc=0;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `TimeCost` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `TimeCost`(IN `IdVillag` Int,IN `possX` Int, IN `possY` Int,IN `IdConstr` Int)
BEGIN



set @t1=now();

set @t2=(SELECT buildTimer FROM Jogo.Buildings where idBuilding=idConstr);

#set @done=(Select ADDTIME(@t1,@t2));


UPDATE `VillageBuild` set endTime=ADDTIME(@t1,@t2),pending='Y' where `idVillage`=IdVillag and `posX`=possX and `posY`=possY;

#Select * from `BuildTime`;
#set @del=(Select `idBuildTime` from `BuildTime` where `startTime`=@t1) ;
#while ((Now()) <> (@done)) DO
#set @i=@i+ "1";
#END WHILE;

#select @i;

#delete from `BuildTime` where `idBuildTime`=@del;
#Select * from `BuildTime`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `TimeCostResource` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `TimeCostResource`(IN `IdVillag` Int,IN `possX` Int, IN `possY` Int,IN `IdConstr` Int)
BEGIN
set @t1=now();

set @t2=(SELECT gatherTime FROM Jogo.Buildings where idBuilding=idConstr);

#set @done=(Select ADDTIME(@t1,@t2));


UPDATE `VillageBuild` set endTimeColection = ADDTIME(@t1,@t2) where `idVillage`=IdVillag and `posX`=possX and `posY`=possY;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `TimeCostUnit` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `TimeCostUnit`( IN `idUni` int)
BEGIN



set @t1=now();

set @t2=(SELECT Time_Creat FROM Jogo.UnitClass where idUnit=idUni);

set @endTime=(Select ADDTIME(@t1,@t2));

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `TransferSquad` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `TransferSquad`(in `ArraySquad` LONGBLOB,in `idVillag` int)
BEGIN
proc_label:BEGIN
DECLARE SquadTrans int;
set SquadTrans=0;
set @p1=0;
set @p2=0;
set @p3=0;
set @lop=0;


label1: LOOP

SET @p2 = @p2 + 1;
SET @p3 = @p3 + 2;
set @var1=(select SUBSTRING_INDEX(ArraySquad,',', @p2));
set @var2=(select SUBSTRING_INDEX(ArraySquad,',', @p3));
if @var2=@var1 then

SET @p2=@p2+1;

else

ITERATE label1;
    END IF;

    LEAVE label1;
  END LOOP label1;

label1: LOOP


    SET @p1 = @p1 + 1;

    IF @p1 < @p2 THEN

set @Array=(SELECT SPLIT_STRING(ArraySquad, ',', @p1));

set SquadTrans=@Array;

set @SquadVillag=(select idVillage from SquadVillage where idSquadVillage=SquadTrans);


if @SquadVillag=idVillag then

select 'One of Your Squads is already in The Distination Village' as Msg;

leave proc_label;

end if;


set @idVBTrans=(select VillageBuild.idVillageBuild from Village inner join VillageBuild on VillageBuild.idVillage=Village.idVillage where VillageBuild.idVillage=idVillag and VillageBuild.endTimeColection is NULL limit 0,1);

update Army set Army.idVillageBuild=@idVBTrans where idArmy in (Select idArmy from Squad where idSquadVillage=SquadTrans);

update SquadVillage set idVillage=idVillag where idSquadVillage=SquadTrans;

 ITERATE label1;
    END IF;
    LEAVE label1;
  END LOOP label1;

Select 'Trasnfer Done' as Msg;
end;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UnitBuildingCanBuild` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UnitBuildingCanBuild`(IN `IdBuild` Int)
BEGIN
proc_label:BEGIN

set @dep=(select BuildDep from BuildDep where BuildDep.Build=IdBuild);

set @dep2=(select BuildDep from BuildDep where BuildDep.Build=@dep);

if @dep is NULL then

Select UnitClass.idUnit, UnitClass.Description, UnitClass.Image, UnitClass.Time_Creat,UnitClass.Obs,UnitClass.Attack, UnitClass.Defense, UnitClass.Life from UnitClass  where  UnitClass.idBuilding=IdBuild;

leave proc_label;
end if;

if @dep2 is NULL then

Select UnitClass.idUnit, UnitClass.Description, UnitClass.Image, UnitClass.Time_Creat,UnitClass.Obs,UnitClass.Attack, UnitClass.Defense, UnitClass.Life from UnitClass where UnitClass.idBuilding=IdBuild or UnitClass.idBuilding=@dep;

leave proc_label;
end if;

if @dep2 is not NULL and @dep is not NULL  then

Select UnitClass.idUnit, UnitClass.Description, UnitClass.Image, UnitClass.Time_Creat,UnitClass.Obs,UnitClass.Attack, UnitClass.Defense, UnitClass.Life from UnitClass where UnitClass.idBuilding=IdBuild or UnitClass.idBuilding=@dep or UnitClass.idBuilding=@dep2;

leave proc_label;
end if;


end;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateBuildings` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateBuildings`(IN `idVillag` Int,IN `idConstr` Int, IN `possX` int, in `possY` int)
BEGIN
proc_label:BEGIN

set @needBuild=(select BuildDep from BuildDep where Build=idConstr);

set @haveBuild=(select idBuilding from VillageBuild where idBuilding=@needBuild and idVillage=idVillag and posX=possX and posY=possY);

if @haveBuild is NULL then

	    	select 'You dont have the pre-req Build' as Msg;
	    	
leave proc_label;
	    
else

set @id = (SELECT idVillageBuild FROM Jogo.VillageBuild where idBuilding=@needBuild and idVillage=idVillag and posX=possX and posY=possY);

end if;
set @pend =(SELECT pending FROM Jogo.VillageBuild where idBuilding=@needBuild and idVillage=idVillag and posX=possX and posY=possY);

if @pend='Y' then

select 'Wait to the End of Construction' as Msg;
leave proc_label;
end if;

call `resourcetoBuildings`(IdVillag,IdConstr);

if @nok = 0 then

Call `TimeCost`(IdVillag,possX,possY,IdConstr);

UPDATE `VillageBuild` SET `idBuilding`=idConstr WHERE `idVillageBuild`=@id;


set @timer=(select `endTime` from VillageBuild where idVillageBuild=@id);
select 'Done' as Msg, @timer as Timer;


else

leave proc_label;


end if;

END;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `upgradeBuildView` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `upgradeBuildView`(IN `IdVilla` Int, IN `possX` Int, IN `possY` Int)
BEGIN
proc_label:BEGIN

set @idVB = (select idVillageBuild from VillageBuild where idVillage=IdVilla and posX=possX and posY=possY);

set @infoBuild = (select idBuilding from VillageBuild where idVillage=IdVilla and posX=possX and posY=possY);

if @infoBuild is null then
select 'You Dont Have a building here.' as Msg;
	    	leave proc_label;
	    end if;

set @infounit = (select idArmy from Army where idVillageBuild=@idVB and Pending='Y');

if @infounit is not null then
set @rc=1;
call `CreateUnitView`(IdVilla,possX,possY);
	leave proc_label;
	    end if;


set @infoPending=(select VillageBuild.pending from VillageBuild where idVillage=IdVilla and posX=possX and posY=possY);

if @infoPending='Y' then

set @endtime=(select `endTime` from `VillageBuild` where `idVillage`=IdVilla and `posX`=possX and `posY`=possY);

set @miss =(select timeDIFF(@endtime, now() ));

Select @miss as Timer, Description from Buildings where idBuilding=@infoBuild;
  	leave proc_label;
	    end if;

set @infoUpgrade=(select BuildDep.Build from BuildDep where BuildDep.BuildDep=@infoBuild and `Upgrade`='Y');



if @infoUpgrade is null then
Select 'Dont Have an Upgrade to this Building' as Msg,@idVB as idBuildingBuilt, Description,idBuilding,Type from Buildings where idBuilding=@infoBuild;
#select 'Dont Have an Upgrade to this Building' as Msg;
	    	leave proc_label;
	    end if;


set @possX=possX;
set @possY=possy;
set @basicBuilding=(Select Description from Buildings where idBuilding=@infoBuild);



Select  @idVB as idBuildingBuilt,@basicBuilding as basicDescription,@possX as posX,@possY as posY,@infoBuild as idBasicBuild, idBuilding, Description, wood, stone, iron, gold, idTile, buildTimer,Type from Buildings where idBuilding=@infoUpgrade;
set @rc=0;
END;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ViewMergeSquad` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ViewMergeSquad`(in idUse int)
BEGIN

select Army.idArmy,Army.Unit_Name,Army.Attack,Army.Defense,Army.Life,UnitClass.Description,UnitClass.Image,SquadVillage.SquadName from Army inner join VillageBuild on Army.idVillageBuild=VillageBuild.idVillageBuild inner join Village on Village.idVillage=VillageBuild.idVillage inner Join UnitClass on Army.idUnit=UnitClass.idUnit inner join Squad on Squad.idArmy=Army.idArmy inner join SquadVillage on Squad.idSquadVillage=SquadVillage.idSquadVillage where Village.idUser=idUse and Army.Sell='N' and Army.Squad='Y' and UnitClass.idUnit <> '1';

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ViewOffer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ViewOffer`(IN `IdUse` Int)
BEGIN
Select * from Offert inner join BasecResource on BasecResource.idBasecResouce=Offert.idBasecResouce where Offert.Sell='N' and Offert.idUser not like IdUse;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ViewOfferArmy` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ViewOfferArmy`(IN `IdUse` Int)
BEGIN
select ArmyOffert.*,Army.Unit_Name,Army.Attack,Army.Defense,Army.Life,UnitClass.Description,UnitClass.Image from ArmyOffert inner join Army on ArmyOffert.idArmy=Army.idArmy inner join  UnitClass on Army.idUnit=UnitClass.idUnit where ArmyOffert.idUser not like IdUse and ArmyOffert.Sell='N';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ViewSell` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ViewSell`()
BEGIN
Select * from BasecResource;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ViewSellArmy` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ViewSellArmy`(in idUse int)
BEGIN
select Army.idArmy,Army.Unit_Name,Army.Attack,Army.Defense,Army.Life,UnitClass.Description,UnitClass.Image from Army inner join VillageBuild on Army.idVillageBuild=VillageBuild.idVillageBuild inner join Village on Village.idVillage=VillageBuild.idVillage inner Join UnitClass on Army.idUnit=UnitClass.idUnit where Village.idUser=idUse and Army.Sell='N'and  Army.Pending='N'and UnitClass.idUnit <> '1';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ViewToCreateSquad` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ViewToCreateSquad`(IN `IdVillag` Int)
BEGIN

set @haveUnit=(Select distinct Village.idVillage from Village inner join  VillageBuild on Village.idVillage=VillageBuild.idVillage inner join Army on Army.idVillageBuild=VillageBuild.idVillageBuild where Village.idVillage=IdVillag and Army.Pending='N' and Army.idUnit<>'1' and Army.idUnit<>'2' and Army.Squad='N' and Army.Sell='N');

if @haveUnit is NULL then

select 'You dont Have Units' as Msg;

Else

Select Army.idArmy,Army.Unit_Name,Army.Attack,Army.Defense,Army.Life,Army.Face,UnitClass.Description from Army inner join UnitClass on Army.idUnit = UnitClass.idUnit  inner join VillageBuild on VillageBuild.idVillageBuild = Army.idVillageBuild inner join Village on Village.idVillage=VillageBuild.idVillage where Village.idVillage=IdVillag and Army.Pending='N' and Army.idUnit<>'1' and Army.idUnit<>'2' and Army.Squad='N' and Army.Sell='N';

end if;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ViewUserSquad` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ViewUserSquad`(in idUse int)
BEGIN

set @idvilla=(select SquadVillage.idSquadVillage from SquadVillage inner join Village on  SquadVillage.idVillage=Village.idVillage where Village.idUser=idUse limit 0,1);

if @idvilla is NULL then

select 'You dont Have any Squad' as Msg;

else

select SquadVillage.*,Village.VillageNick from SquadVillage inner join Village on  SquadVillage.idVillage=Village.idVillage where Village.idUser=idUse;
end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ViewVillageOwner` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ViewVillageOwner`(in idUse int,in PossX int,in PossY int)
BEGIN

set @temple=(Select Village.IsTemple from Village inner join Chunk on Village.idChunck = Chunk.idChunk where Chunk.posX=PossX and Chunk.posY=PossY);

set @onwer=(Select Village.idVillage from Village inner join Chunk on Village.idChunck = Chunk.idChunk where Village.idUser=idUse and Chunk.posX=PossX and Chunk.posY=PossY);

if @onwer is NULL then

set @onwer=(Select Village.idVillage from Village inner join Chunk on Village.idChunck = Chunk.idChunk where Chunk.posX=PossX and Chunk.posY=PossY);

set @onwerid=(Select Village.idUser from Village inner join Chunk on Village.idChunck = Chunk.idChunk where Chunk.posX=PossX and Chunk.posY=PossY);

Select 'Enemy Village' as Msg, @onwer as idVillage, @onwerid as VillageOwner, @temple as isTemple;

else

Select 'Your Village' as Msg, @onwer as idVillage,@temple as isTemple; 

end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ViewVillageSquad` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ViewVillageSquad`(in idVillag int)
BEGIN

set @idvilla=(select distinct idVillage from SquadVillage where idVillage=idVillag);

if @idvilla is NULL then

select 'You dont Have any Squad on this Village' as Msg;

else

select * from SquadVillage where idVillage=idVillag;

end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ViewWorker` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ViewWorker`(in idUse int)
BEGIN

select Army.idArmy,Army.Unit_Name,Army.Attack,Army.Defense,Army.Life,UnitClass.Description,UnitClass.Image from Army inner join VillageBuild on Army.idVillageBuild=VillageBuild.idVillageBuild inner join Village on Village.idVillage=VillageBuild.idVillage inner Join UnitClass on Army.idUnit=UnitClass.idUnit where Village.idUser=idUse and Army.Sell='N'and  Army.Pending='N'and Army.Work='N' and UnitClass.idUnit = '1';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Winners` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Winners`()
BEGIN
set @Userid=(select idUser from Village where isTemple='Y');

set @userNick=(select Nick From Users where idUser=@Userid);

Select Concat('Congrats, ',@userNick,' Won The Season!') as Msg;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `WinQuest` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `WinQuest`(IN `IdUse` Int,IN `IdTiled` Int)
BEGIN
set @new_wood=0;
set @new_iron=0;
set @new_food=0;
set @new_stone=0;
set @new_gold=0;

set @nick=(select Nick from Users where idUser=IdUse);

if IdTiled='38' then
set @randon=(select((FLOOR(RAND()  * 5))));

case @randon

 WHEN 0 THEN 

set @old_wood=(Select distinct wood from  Resource INNER JOIN Village ON Resource.idUser = Village.idUser where Village.idUser=IdUse);

set @new_wood=@old_wood+1000;

update Resource set wood=@new_wood where idUser=IdUse;

set @MsgWin=(select Concat('Congrats ',@nick,' you win 1000 of Wood'));

 WHEN 1 THEN 

set @old_iron=(Select distinct iron from  Resource INNER JOIN Village ON Resource.idUser = Village.idUser where Village.idUser=IdUse);

set @new_iron=@old_iron+1000;

update Resource set iron=@new_iron where idUser=IdUse;

set @MsgWin=(select Concat('Congrats ',@nick,' you win 1000 of Iron'));

 WHEN 2 THEN

set @old_food=(Select distinct food from  Resource INNER JOIN Village ON Resource.idUser = Village.idUser where Village.idUser=IdUse);

set @new_food=@old_food+1000;

update Resource set food=@new_food where idUser=IdUse;

 set @MsgWin=(select Concat('Congrats ',@nick,' you win 1000 of Food'));

 WHEN 3 THEN 

set @old_stone=(Select distinct stone from  Resource INNER JOIN Village ON Resource.idUser = Village.idUser where Village.idUser=IdUse);

set @new_stone=@old_stone+1000;

update Resource set stone=@new_stone where idUser=IdUse;

set @MsgWin=(select Concat('Congrats ',@nick,' you win 1000 of Stone'));

 WHEN 4 THEN 

set @old_gold=(Select distinct gold from  Resource INNER JOIN Village ON Resource.idUser = Village.idUser where Village.idUser=IdUse);

set @new_gold=@old_gold+1000;

update Resource set gold=@new_gold where idUser=IdUse;

set @MsgWin=(select Concat('Congrats ',@nick,' you win 1000 of Gold'));

end case;
end if;

if IdTiled='40' then
set @randon=(select((FLOOR(RAND()  * 5))));

case @randon

 WHEN 0 THEN 

set @old_wood=(Select distinct wood from  Resource INNER JOIN Village ON Resource.idUser = Village.idUser where Village.idUser=IdUse);

set @new_wood=@old_wood+10000;

update Resource set wood=@new_wood where idUser=IdUse;

set @MsgWin=(select Concat('Congrats ',@nick,' you win 10000 of Wood'));

 WHEN 1 THEN 

set @old_iron=(Select distinct iron from  Resource INNER JOIN Village ON Resource.idUser = Village.idUser where Village.idUser=IdUse);

set @new_iron=@old_iron+10000;

update Resource set iron=@new_iron where idUser=IdUse;

set @MsgWin=(select Concat('Congrats ',@nick,' you win 10000 of Iron'));

 WHEN 2 THEN

set @old_food=(Select distinct food from  Resource INNER JOIN Village ON Resource.idUser = Village.idUser where Village.idUser=IdUse);

set @new_food=@old_food+10000;

update Resource set food=@new_food where idUser=IdUse;

 set @MsgWin=(select Concat('Congrats ',@nick,' you win 10000 of Food'));

 WHEN 3 THEN 

set @old_stone=(Select distinct stone from  Resource INNER JOIN Village ON Resource.idUser = Village.idUser where Village.idUser=IdUse);

set @new_stone=@old_stone+10000;

update Resource set stone=@new_stone where idUser=IdUse;

set @MsgWin=(select Concat('Congrats ',@nick,' you win 10000 of Stone'));

 WHEN 4 THEN 

set @old_gold=(Select distinct gold from  Resource INNER JOIN Village ON Resource.idUser = Village.idUser where Village.idUser=IdUse);

set @new_gold=@old_gold+10000;

update Resource set gold=@new_gold where idUser=IdUse;

set @MsgWin=(select Concat('Congrats ',@nick,' you win 10000 of Gold'));

end case;
end if;

if IdTiled='39' then
set @randon=(select((FLOOR(RAND()  * 5))));

case @randon

 WHEN 0 THEN 

set @old_wood=(Select distinct wood from  Resource INNER JOIN Village ON Resource.idUser = Village.idUser where Village.idUser=IdUse);

set @new_wood=@old_wood+5000;

update Resource set wood=@new_wood where idUser=IdUse;

set @MsgWin=(select Concat('Congrats ',@nick,' you win 5000 of Wood'));

 WHEN 1 THEN 

set @old_iron=(Select distinct iron from  Resource INNER JOIN Village ON Resource.idUser = Village.idUser where Village.idUser=IdUse);

set @new_iron=@old_iron+5000;

update Resource set iron=@new_iron where idUser=IdUse;

set @MsgWin=(select Concat('Congrats ',@nick,' you win 5000 of Iron'));

 WHEN 2 THEN

set @old_food=(Select distinct food from  Resource INNER JOIN Village ON Resource.idUser = Village.idUser where Village.idUser=IdUse);

set @new_food=@old_food+5000;

update Resource set food=@new_food where idUser=IdUse;

 set @MsgWin=(select Concat('Congrats ',@nick,' you win 5000 of Food'));

 WHEN 3 THEN 

set @old_stone=(Select distinct stone from  Resource INNER JOIN Village ON Resource.idUser = Village.idUser where Village.idUser=IdUse);
 
set @new_stone=@old_stone+5000;

update Resource set stone=@new_stone where idUser=IdUse;

set @MsgWin=(select Concat('Congrats ',@nick,' you win 5000 of Stone'));

 WHEN 4 THEN 

set @old_gold=(Select distinct gold from  Resource INNER JOIN Village ON Resource.idUser = Village.idUser where Village.idUser=IdUse);

set @new_gold=@old_gold+5000;

update Resource set gold=@new_gold where idUser=IdUse;

set @MsgWin=(select Concat('Congrats ',@nick,' you win 5000 of Gold'));

end case;
end if;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `WorkerAtBuild` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `WorkerAtBuild`(in idVillagB int)
BEGIN
select Work.idArmy,Army.Unit_Name,UnitClass.Description,UnitClass.Image from Work inner join Army on Army.idArmy=Work.idArmy inner join UnitClass on UnitClass.idUnit=Army.idUnit where Work.idVillageBuild=idVillagB;
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

-- Dump completed on 2013-12-03 11:15:17

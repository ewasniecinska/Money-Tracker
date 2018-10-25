-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: 150.254.36.206    Database: wap18_p3
-- ------------------------------------------------------
-- Server version	5.6.26-log

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
-- Table structure for table `expenses`
--

DROP TABLE IF EXISTS `expenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `expenses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `amount` float NOT NULL,
  `date` date NOT NULL,
  `description` varchar(45) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  `user` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cat_exp2_idx` (`category`),
  KEY `fk_exp_user_idx` (`user`),
  CONSTRAINT `fk_cat_exp2` FOREIGN KEY (`category`) REFERENCES `expenses_categories` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION,
  CONSTRAINT `fk_cat_user` FOREIGN KEY (`user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expenses`
--

LOCK TABLES `expenses` WRITE;
/*!40000 ALTER TABLE `expenses` DISABLE KEYS */;
INSERT INTO `expenses` VALUES (18,'PEKA',120,'2018-05-13','Peka payment - May',20,12),(19,'Train to Warsaw',80,'2018-05-10','one-way train',20,12),(21,'Dinner at Manekin',20.5,'2018-05-10','with Nat.',21,12),(22,'Coffee',15,'2018-05-11','Costa',21,12),(23,'ZUS',230.7,'2018-05-10','May',22,12),(25,'Pizza',12,'2018-05-12','pizza hut',21,12),(26,'Bus ticket',3,'2018-05-23','desc',20,12),(27,'Bus ticket',3,'2018-05-23','desc',20,12),(28,'Coffee',12,'2018-05-23','so coffee',21,12),(29,'Manekin',15,'2018-05-18','desc',21,12),(30,'Train to Warsaw',32,'2018-05-17','desc',20,12),(31,'House taxes',250,'2018-05-22','',22,12),(32,'Dinner',120,'2018-03-24','desc',20,12),(33,'PEKA',25,'2018-05-16','ZTM',20,12),(34,'Bus ticket',3,'2018-05-25','ZTM',20,12),(35,'Coffee',12,'2018-06-03','Costa',21,12),(36,'Test',99,'2018-05-27','test',20,12),(37,'Test2',120,'2018-06-02','hehe',20,12),(38,'wydane',140,'2018-06-04','',21,12),(39,'Test',52,'2018-06-02','desc',20,12),(40,'Test',42,'2018-05-30','desc',22,12),(41,'sobota',700,'2018-06-02','test',20,12),(42,'Poniedzialek',300,'2018-05-28','co to ',20,12),(43,'Sob2',80,'2018-05-26','lol',20,12),(44,'Test',200,'2018-06-02','ZTM',20,12),(46,'PEKA',120,'2018-06-05','DESC',20,12);
/*!40000 ALTER TABLE `expenses` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-06-05 15:54:16

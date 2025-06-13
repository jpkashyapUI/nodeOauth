-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: localhost    Database: testdb
-- ------------------------------------------------------
-- Server version	8.0.36

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `testdb`
--

CREATE DATABASE IF NOT EXISTS `social`;
USE `social`;

--
-- Table structure for table `oauthconfig`
--

DROP TABLE IF EXISTS `oauthconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauthconfig` (
  `id` int NOT NULL AUTO_INCREMENT,
  `config_name` varchar(100) DEFAULT NULL,
  `secret_key` varchar(255) DEFAULT NULL,
  `app_id` varchar(255) DEFAULT NULL,
  `consent_url` varchar(255) DEFAULT NULL,
  `callback_url` varchar(255) DEFAULT NULL,
  `accesstoken_url` varchar(255) DEFAULT NULL,
  `userinfo_api` varchar(255) DEFAULT NULL,
  `scopes` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauthconfig`
--

LOCK TABLES `oauthconfig` WRITE;
/*!40000 ALTER TABLE `oauthconfig` DISABLE KEYS */;
INSERT INTO `oauthconfig` VALUES (1,'google','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','835228653739-1h2nqodub4cqs93voibkn7vh7dihud9j.apps.googleusercontent.com','https://accounts.google.com/o/oauth2/v2/auth?','http://localhost:3000/auth/google/callback','https://oauth2.googleapis.com/token','https://www.googleapis.com/oauth2/v2/userinfo','https://www.googleapis.com/auth/userinfo.email https://www.googleapis.com/auth/userinfo.profile'),(2,'facebook','25148ceb353bf0a025afee3ede5515c1','1847732232677762','https://www.facebook.com/v18.0/dialog/oauth?','http://localhost:3000/auth/facebook/callback','https://graph.facebook.com/v18.0/oauth/access_token?','https://graph.facebook.com/me?fields=id,name,email&access_token=','email,public_profile');
/*!40000 ALTER TABLE `oauthconfig` ENABLE KEYS */;
UNLOCK TABLES;



--
-- Table structure for table `page_list`
--

DROP TABLE IF EXISTS `page_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `page_list` (
  `pageId` int NOT NULL AUTO_INCREMENT,
  `pageName` varchar(45) NOT NULL,
  PRIMARY KEY (`pageId`),
  UNIQUE KEY `pageId_UNIQUE` (`pageId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page_list`
--

LOCK TABLES `page_list` WRITE;
/*!40000 ALTER TABLE `page_list` DISABLE KEYS */;
INSERT INTO `page_list` VALUES (1,'login');
/*!40000 ALTER TABLE `page_list` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

--
-- Table structure for table `page_config`
--

DROP TABLE IF EXISTS `page_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `page_config` (
  `id` int unsigned NOT NULL,
  `pageId` int DEFAULT NULL,
  `labelType` varchar(45) DEFAULT NULL,
  `inputType` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `pageId_idx` (`pageId`),
  CONSTRAINT `pageId` FOREIGN KEY (`pageId`) REFERENCES `page_list` (`pageId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page_config`
--

LOCK TABLES `page_config` WRITE;
/*!40000 ALTER TABLE `page_config` DISABLE KEYS */;
INSERT INTO `page_config` VALUES (1,1,'Google','button'),(2,1,'Facebook','button');
/*!40000 ALTER TABLE `page_config` ENABLE KEYS */;
UNLOCK TABLES;




--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `socialLogin_id` varchar(100) DEFAULT NULL,
  `createdAt` datetime DEFAULT CURRENT_TIMESTAMP,
  `loginVia` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

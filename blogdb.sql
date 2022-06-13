-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: blogdb
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `accounts_doctor`
--

DROP TABLE IF EXISTS `accounts_doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_doctor` (
  `user_id` bigint NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `profile_picture` varchar(100) NOT NULL,
  `email` varchar(254) NOT NULL,
  `address_line_1` varchar(1024) NOT NULL,
  `city` varchar(1024) NOT NULL,
  `state` varchar(1024) NOT NULL,
  `pin_code` varchar(12) NOT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `accounts_doctor_user_id_d06b185a_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_doctor`
--

LOCK TABLES `accounts_doctor` WRITE;
/*!40000 ALTER TABLE `accounts_doctor` DISABLE KEYS */;
INSERT INTO `accounts_doctor` VALUES (2,'doctor','1','profile/22-223968_default-profile-picture-circle-hd-png-download.png','doctor1@gmail.com','abc','Mumbai','Maharashtra','400001'),(5,'Doctor','2','profile/22-223968_default-profile-picture-circle-hd-png-download_RI3lLz5.png','pubgt7919@gmail.com','123 Abc','Mumbai','Maharashtra','400002');
/*!40000 ALTER TABLE `accounts_doctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_patient`
--

DROP TABLE IF EXISTS `accounts_patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_patient` (
  `user_id` bigint NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `profile_picture` varchar(100) NOT NULL,
  `email` varchar(254) NOT NULL,
  `address_line_1` varchar(1024) NOT NULL,
  `city` varchar(1024) NOT NULL,
  `state` varchar(1024) NOT NULL,
  `pin_code` varchar(12) NOT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `accounts_patient_user_id_c6b04ce0_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_patient`
--

LOCK TABLES `accounts_patient` WRITE;
/*!40000 ALTER TABLE `accounts_patient` DISABLE KEYS */;
INSERT INTO `accounts_patient` VALUES (3,'patient','1','profile/22-223968_default-profile-picture-circle-hd-png-download_qZXBpoq.png','pubgt7919@gmail.com','xyz','Mumbai','Maharashtra','400001'),(4,'patient','1','profile/22-223968_default-profile-picture-circle-hd-png-download_yO8TLgz.png','tohidmalik002@gmail.com','abc','Mumbai','Maharashtra','400001');
/*!40000 ALTER TABLE `accounts_patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_user`
--

DROP TABLE IF EXISTS `accounts_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `is_doctor` tinyint(1) NOT NULL,
  `is_patient` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_user`
--

LOCK TABLES `accounts_user` WRITE;
/*!40000 ALTER TABLE `accounts_user` DISABLE KEYS */;
INSERT INTO `accounts_user` VALUES (1,'pbkdf2_sha256$320000$tjUa5Nk0ynHjqGmCcMEWqI$sTgRf2NYBVIozMjy8szF4ELnPEOIjQdHYoz2eLbrxHI=','2022-06-13 12:41:56.825984',1,'admin','','','',1,1,'2022-06-13 08:05:18.268361',0,0),(2,'pbkdf2_sha256$320000$JPaalWBwns242yhusfEKg9$r2DJNe3JWMeT24LgkHIJrs81kbsqfumxO2dyyJO1cw4=','2022-06-13 13:10:35.073910',0,'doctor1','','','doctor1@gmail.com',0,1,'2022-06-13 08:13:13.827227',1,0),(3,'pbkdf2_sha256$320000$j8vUGBioWLoOhj320ffNBz$YkBnhETSd/lzcpLP16jl2fgc3q3BwPsRFAdOKyRSCoo=','2022-06-13 09:11:49.059564',0,'patient1','','','pubgt7919@gmail.com',0,1,'2022-06-13 09:01:44.394916',0,1),(4,'pbkdf2_sha256$320000$IyjlYnftLg8NxhfEKVaApf$cwGvzKOpvioWBBIjo8YZ5TjkxXusOTQjdo+iwba3z6M=','2022-06-13 13:11:26.427561',0,'pat1','','','tohidmalik002@gmail.com',0,1,'2022-06-13 09:12:58.075243',0,1),(5,'pbkdf2_sha256$320000$6Gu9H4RMMsCcxigwtIRWvU$1ekyCR06xWfZwLAODpRYbLvzQ3J1ljzwNNf5AWv2I3E=','2022-06-13 13:08:25.468468',0,'doctor2','','','pubgt7919@gmail.com',0,1,'2022-06-13 12:04:21.982996',1,0);
/*!40000 ALTER TABLE `accounts_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_user_groups`
--

DROP TABLE IF EXISTS `accounts_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `accounts_user_groups_user_id_group_id_59c0b32f_uniq` (`user_id`,`group_id`),
  KEY `accounts_user_groups_group_id_bd11a704_fk_auth_group_id` (`group_id`),
  CONSTRAINT `accounts_user_groups_group_id_bd11a704_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `accounts_user_groups_user_id_52b62117_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_user_groups`
--

LOCK TABLES `accounts_user_groups` WRITE;
/*!40000 ALTER TABLE `accounts_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_user_user_permissions`
--

DROP TABLE IF EXISTS `accounts_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `accounts_user_user_permi_user_id_permission_id_2ab516c2_uniq` (`user_id`,`permission_id`),
  KEY `accounts_user_user_p_permission_id_113bb443_fk_auth_perm` (`permission_id`),
  CONSTRAINT `accounts_user_user_p_permission_id_113bb443_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `accounts_user_user_p_user_id_e4f0a161_fk_accounts_` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_user_user_permissions`
--

LOCK TABLES `accounts_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `accounts_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add user',1,'add_user'),(2,'Can change user',1,'change_user'),(3,'Can delete user',1,'delete_user'),(4,'Can view user',1,'view_user'),(5,'Can add doctor',2,'add_doctor'),(6,'Can change doctor',2,'change_doctor'),(7,'Can delete doctor',2,'delete_doctor'),(8,'Can view doctor',2,'view_doctor'),(9,'Can add patient',3,'add_patient'),(10,'Can change patient',3,'change_patient'),(11,'Can delete patient',3,'delete_patient'),(12,'Can view patient',3,'view_patient'),(13,'Can add category',4,'add_category'),(14,'Can change category',4,'change_category'),(15,'Can delete category',4,'delete_category'),(16,'Can view category',4,'view_category'),(17,'Can add post',5,'add_post'),(18,'Can change post',5,'change_post'),(19,'Can delete post',5,'delete_post'),(20,'Can view post',5,'view_post'),(21,'Can add log entry',6,'add_logentry'),(22,'Can change log entry',6,'change_logentry'),(23,'Can delete log entry',6,'delete_logentry'),(24,'Can view log entry',6,'view_logentry'),(25,'Can add permission',7,'add_permission'),(26,'Can change permission',7,'change_permission'),(27,'Can delete permission',7,'delete_permission'),(28,'Can view permission',7,'view_permission'),(29,'Can add group',8,'add_group'),(30,'Can change group',8,'change_group'),(31,'Can delete group',8,'delete_group'),(32,'Can view group',8,'view_group'),(33,'Can add content type',9,'add_contenttype'),(34,'Can change content type',9,'change_contenttype'),(35,'Can delete content type',9,'delete_contenttype'),(36,'Can view content type',9,'view_contenttype'),(37,'Can add session',10,'add_session'),(38,'Can change session',10,'change_session'),(39,'Can delete session',10,'delete_session'),(40,'Can view session',10,'view_session');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_category`
--

DROP TABLE IF EXISTS `blog_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog_category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_category`
--

LOCK TABLES `blog_category` WRITE;
/*!40000 ALTER TABLE `blog_category` DISABLE KEYS */;
INSERT INTO `blog_category` VALUES (1,'Mental Health'),(2,'Heart Disease'),(3,'Covid19'),(4,'Immunization'),(6,'Sports');
/*!40000 ALTER TABLE `blog_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_post`
--

DROP TABLE IF EXISTS `blog_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog_post` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `image` varchar(100) NOT NULL,
  `category` varchar(255) NOT NULL,
  `summary` longtext NOT NULL,
  `content` longtext NOT NULL,
  `author_id` bigint NOT NULL,
  `draft` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `blog_post_author_id_dd7a8485` (`author_id`),
  CONSTRAINT `blog_post_author_id_dd7a8485_fk_accounts_user_id` FOREIGN KEY (`author_id`) REFERENCES `accounts_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_post`
--

LOCK TABLES `blog_post` WRITE;
/*!40000 ALTER TABLE `blog_post` DISABLE KEYS */;
INSERT INTO `blog_post` VALUES (1,'Post1','post/download_1.jpg','Mental Health','1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20','Everyone feels worried or anxious or down from time to time. But relatively few people develop a mental illness. What\'s the difference? A mental illness is a mental health condition that gets in the way of thinking, relating to others, and day-to-day function.\r\n\r\nDozens of mental illnesses have been identified and defined. They include depression, generalized anxiety disorder, bipolar disorder, obsessive-compulsive disorder, post-traumatic stress disorder, schizophrenia, and many more.\r\n\r\nMental illness is an equal opportunity issue. It affects young and old, male and female, and individuals of every race, ethnic background, education level, and income level. The good news is that it can often be treated.\r\n\r\nSigns and symptoms of mental illness depend in part on the illness. Common symptoms include\r\n\r\nfeeling down for a while\r\nextreme swings in mood\r\nwithdrawing from family, friends, or activities\r\nlow energy or problems sleeping\r\noften feeling angry, hostile, or violent\r\nfeeling paranoid, hearing voices, or having hallucinations\r\noften thinking about death or suicide.\r\nIn some people, symptoms of a mental illness first appear as physical problems such as stomach aches, back pain, or insomnia.\r\n\r\nIndividuals with a mental illness can often ease their symptoms and feel better by talking with a therapist and following a treatment plan that may or may not include medication.',2,0),(2,'Post2','post/download_2.jpg','Heart Disease','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.','Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.\r\n\r\nThe standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.',2,0),(3,'Covid 19 Post','post/download_3.jpg','Covid19','asdsghghfb h','gffdfdfdfdfdfdfdfdfdfdg',5,0),(4,'Immuzation','post/download_4.png','Immunization','fgfghbhgjhgj','hhkkkk',2,0),(5,'Post 4','post/download_1_R0uGY8u.jpg','Covid19','dffffffffffffffffffg','gggggggggggggggggggggggggggggggg',2,0),(6,'Post 9','post/download_3_qqUjrZd.jpg','Heart Disease','fdddddddddddddd','fffffffffffffffffffff',2,0);
/*!40000 ALTER TABLE `blog_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_accounts_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2022-06-13 08:07:50.833479','1','Mental Health',1,'[{\"added\": {}}]',4,1),(2,'2022-06-13 08:07:56.110146','2','Heart Disease',1,'[{\"added\": {}}]',4,1),(3,'2022-06-13 08:08:00.312085','3','Covid19',1,'[{\"added\": {}}]',4,1),(4,'2022-06-13 08:08:04.246250','4','Immunization',1,'[{\"added\": {}}]',4,1),(5,'2022-06-13 08:29:56.828566','1','Post1',2,'[{\"changed\": {\"fields\": [\"Draft\"]}}]',5,1),(6,'2022-06-13 09:02:55.617095','1','Post1',2,'[{\"changed\": {\"fields\": [\"Draft\"]}}]',5,1),(7,'2022-06-13 09:09:41.083302','2','Post2',1,'[{\"added\": {}}]',5,1),(8,'2022-06-13 12:42:28.370504','5','Sports',1,'[{\"added\": {}}]',4,1),(9,'2022-06-13 12:43:43.670323','4','Immuzation',2,'[{\"changed\": {\"fields\": [\"Draft\"]}}]',5,1),(10,'2022-06-13 12:55:55.667069','5','Sports',3,'',4,1),(11,'2022-06-13 13:02:19.399319','5','Post 4',2,'[{\"changed\": {\"fields\": [\"Draft\"]}}]',5,1),(12,'2022-06-13 13:09:04.517209','6','Post 9',2,'[{\"changed\": {\"fields\": [\"Draft\"]}}]',5,1),(13,'2022-06-13 13:09:56.274357','2','Post2',2,'[{\"changed\": {\"fields\": [\"Draft\"]}}]',5,1),(14,'2022-06-13 13:10:16.411349','2','Post2',2,'[{\"changed\": {\"fields\": [\"Draft\"]}}]',5,1),(15,'2022-06-13 13:10:59.437761','6','Sports',1,'[{\"added\": {}}]',4,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (2,'accounts','doctor'),(3,'accounts','patient'),(1,'accounts','user'),(6,'admin','logentry'),(8,'auth','group'),(7,'auth','permission'),(4,'blog','category'),(5,'blog','post'),(9,'contenttypes','contenttype'),(10,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2022-06-13 08:03:40.355730'),(2,'contenttypes','0002_remove_content_type_name','2022-06-13 08:03:41.441535'),(3,'auth','0001_initial','2022-06-13 08:03:45.722821'),(4,'auth','0002_alter_permission_name_max_length','2022-06-13 08:03:46.736476'),(5,'auth','0003_alter_user_email_max_length','2022-06-13 08:03:46.804617'),(6,'auth','0004_alter_user_username_opts','2022-06-13 08:03:46.863613'),(7,'auth','0005_alter_user_last_login_null','2022-06-13 08:03:46.945227'),(8,'auth','0006_require_contenttypes_0002','2022-06-13 08:03:47.007203'),(9,'auth','0007_alter_validators_add_error_messages','2022-06-13 08:03:47.090154'),(10,'auth','0008_alter_user_username_max_length','2022-06-13 08:03:47.161586'),(11,'auth','0009_alter_user_last_name_max_length','2022-06-13 08:03:47.226189'),(12,'auth','0010_alter_group_name_max_length','2022-06-13 08:03:47.431299'),(13,'auth','0011_update_proxy_permissions','2022-06-13 08:03:47.492273'),(14,'auth','0012_alter_user_first_name_max_length','2022-06-13 08:03:47.568629'),(15,'accounts','0001_initial','2022-06-13 08:03:55.375964'),(16,'accounts','0002_rename_address1_doctor_address_line_1_and_more','2022-06-13 08:03:56.461419'),(17,'accounts','0003_alter_doctor_profile_picture','2022-06-13 08:03:56.536364'),(18,'accounts','0004_alter_patient_profile_picture','2022-06-13 08:03:56.616436'),(19,'admin','0001_initial','2022-06-13 08:03:58.800940'),(20,'admin','0002_logentry_remove_auto_add','2022-06-13 08:03:58.925278'),(21,'admin','0003_logentry_add_action_flag_choices','2022-06-13 08:03:58.989817'),(22,'blog','0001_initial','2022-06-13 08:04:00.535793'),(23,'blog','0002_remove_post_published_post_draft','2022-06-13 08:04:01.289378'),(24,'blog','0003_alter_post_draft','2022-06-13 08:04:01.410472'),(25,'blog','0004_rename_draft_post_draft','2022-06-13 08:04:01.678243'),(26,'blog','0005_alter_post_category','2022-06-13 08:04:01.763801'),(27,'blog','0006_alter_post_author','2022-06-13 08:04:02.967850'),(28,'blog','0007_alter_post_author','2022-06-13 08:04:04.872042'),(29,'sessions','0001_initial','2022-06-13 08:04:05.489391');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('89e3me8tmap1jwoduisljmz59izi76kj','.eJxVjE0OwiAYBe_C2pCitIhL956BfL9SNZCUdmW8u23ShW5n5r23SbDMOS1NpjSyuRhnDr8MgZ5SNsEPKPdqqZZ5GtFuid1ts7fK8rru7d9BhpbXdacnlqBBgAZBDhTO6BXRS1QGFRc7T06Vo4OV9ahx4GNkJnSAvTefLzqtOiI:1o0fyA:7klGVgTX-cyRmnut4VP6UZ3paXQJ8_Gn6hEs1sw5h5g','2022-06-27 09:02:46.971222'),('bfwvu4m7zzyszeg0aiky338h45r472zl','.eJxVjE0OwiAYBe_C2pCitIhL956BfL9SNZCUdmW8u23ShW5n5r23SbDMOS1NpjSyuRhnDr8MgZ5SNsEPKPdqqZZ5GtFuid1ts7fK8rru7d9BhpbXdacnlqBBgAZBDhTO6BXRS1QGFRc7T06Vo4OV9ahx4GNkJnSAvTefLzqtOiI:1o0jOG:fpZ9a4DCGG6uXfvnxJmR8KYS0MP48l7pbE5lrnCryCE','2022-06-27 12:41:56.910634'),('hiaaws7ro2g6sykrg6heexw1k6svb79n','.eJxVjDsOwjAQBe_iGlkx_i4lfc5grddrHECOFCcV4u4QKQW0b2beS0Tc1hq3zkucsrgIK06_W0J6cNtBvmO7zZLmti5TkrsiD9rlOGd-Xg_376Bir9_aBeCBQWkmXQICkra5FFDJczp7Vk5bqzxiAWdN8kBk0HjDEGAwYMT7A_NMN84:1o0io4:FAsIjnjKabGBgBCKh77AA6mq4wAxGBHdaDgyhrku23w','2022-06-27 12:04:32.605254'),('wrhbg8lbxsu7hpzxot7dnmns0wg9sh30','.eJxVjMsOwiAURP-FtSGAEK4u3fsN5D5AqoYmpV01_rtt0oUms5pzZlaVcJlrWnqe0iDqqrw6_XaE_MptB_LE9hg1j22eBtK7og_a9X2U_L4d7t9BxV63dYSL9-QsE2YysWCQaMkDbLGOmZzEQgRwZucJPJVoQ-BM4Iw1KOrzBez3OCs:1o0jqo:J7ELeDnXKuHwplegxzIu3Vq5jWIZvX3dLY7MjZyqwZM','2022-06-27 13:11:26.510562');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-13 19:28:42

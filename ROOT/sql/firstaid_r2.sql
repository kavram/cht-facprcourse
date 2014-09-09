CREATE DATABASE  IF NOT EXISTS `mydb` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `mydb`;
-- MySQL dump 10.13  Distrib 5.5.16, for Win32 (x86)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	5.5.24

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
-- Table structure for table `fa_courses_tb`
--

DROP TABLE IF EXISTS `fa_courses_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fa_courses_tb` (
  `crs_id` int(11) NOT NULL AUTO_INCREMENT,
  `crs_name` varchar(100) DEFAULT NULL,
  `crs_url` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`crs_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fa_questions_tb`
--

DROP TABLE IF EXISTS `fa_questions_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fa_questions_tb` (
  `que_id` int(11) NOT NULL AUTO_INCREMENT,
  `que_question` varchar(128) DEFAULT NULL,
  `que_num_ans` int(11) DEFAULT NULL,
  `que_type` int(11) DEFAULT NULL,
  PRIMARY KEY (`que_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fa_login_email_validation_tb`
--

DROP TABLE IF EXISTS `fa_login_email_validation_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fa_login_email_validation_tb` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login_id` int(11) NOT NULL,
  `validation_key` varchar(70) NOT NULL,
  `validation_status` int(11) NOT NULL,
  `dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fa_video_tb`
--

DROP TABLE IF EXISTS `fa_video_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fa_video_tb` (
  `vid_id` int(11) NOT NULL AUTO_INCREMENT,
  `vid_name` varchar(100) DEFAULT NULL,
  `vid_url` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`vid_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fa_quiz_results_tb`
--

DROP TABLE IF EXISTS `fa_quiz_results_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fa_quiz_results_tb` (
  `qur_id` int(11) NOT NULL AUTO_INCREMENT,
  `log_id` int(11) DEFAULT NULL,
  `qur_score` int(11) DEFAULT NULL,
  PRIMARY KEY (`qur_id`),
  KEY `qur_login_fk_idx` (`log_id`),
  CONSTRAINT `qur_login_fk` FOREIGN KEY (`log_id`) REFERENCES `fa_login_tb` (`log_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fa_login_paid_courses_tb`
--

DROP TABLE IF EXISTS `fa_login_paid_courses_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fa_login_paid_courses_tb` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login_payment_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `payment_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `amount` double NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `lpc_courses_fk` (`course_id`),
  KEY `lpc_login_fk` (`login_payment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fa_login_tb`
--

DROP TABLE IF EXISTS `fa_login_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fa_login_tb` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `log_email_tx` varchar(45) NOT NULL,
  `log_password_tx` varchar(45) DEFAULT NULL,
  `log_name_tx` varchar(45) DEFAULT NULL,
  `log_first_name_tx` varchar(45) DEFAULT NULL,
  `log_last_name_tx` varchar(45) DEFAULT NULL,
  `log_level_tx` int(11) NOT NULL,
  `log_hash` varchar(45) NOT NULL,
  `dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fa_login_courses_tb`
--

DROP TABLE IF EXISTS `fa_login_courses_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fa_login_courses_tb` (
  `log_id` int(11) NOT NULL,
  `crs_id` int(11) NOT NULL,
  `loc_compl_dt` datetime DEFAULT NULL,
  `loc_cert-issued` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`log_id`,`crs_id`),
  UNIQUE KEY `log_id_UNIQUE` (`log_id`),
  UNIQUE KEY `crs_id_UNIQUE` (`crs_id`),
  CONSTRAINT `crs_courses_fk` FOREIGN KEY (`crs_id`) REFERENCES `fa_courses_tb` (`crs_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `crs_login_fk` FOREIGN KEY (`log_id`) REFERENCES `fa_login_tb` (`log_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fa_answers_tb`
--

DROP TABLE IF EXISTS `fa_answers_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fa_answers_tb` (
  `ans_id` int(11) NOT NULL AUTO_INCREMENT,
  `que_id` int(11) DEFAULT NULL,
  `que_answer` varchar(256) DEFAULT NULL,
  `que_correct_ans` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ans_id`),
  KEY `ans_questions_fk_idx` (`que_id`),
  CONSTRAINT `ans_questions_fk` FOREIGN KEY (`que_id`) REFERENCES `fa_questions_tb` (`que_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fa_quiz_ptr_tb`
--

DROP TABLE IF EXISTS `fa_quiz_ptr_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fa_quiz_ptr_tb` (
  `vid_id` int(11) NOT NULL,
  `que_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`vid_id`),
  KEY `que_questions_fk_idx` (`que_id`),
  CONSTRAINT `que_questions_fk` FOREIGN KEY (`que_id`) REFERENCES `fa_questions_tb` (`que_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `que_video_fk` FOREIGN KEY (`vid_id`) REFERENCES `fa_video_tb` (`vid_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fa_video_ptr_tb`
--

DROP TABLE IF EXISTS `fa_video_ptr_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fa_video_ptr_tb` (
  `crs_id` int(11) NOT NULL,
  `vid_id` int(11) NOT NULL,
  PRIMARY KEY (`crs_id`,`vid_id`),
  KEY `vid_courses_fk_idx` (`crs_id`),
  KEY `vid_video_fk_idx` (`vid_id`),
  CONSTRAINT `vid_courses_fk` FOREIGN KEY (`crs_id`) REFERENCES `fa_courses_tb` (`crs_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `vid_video_fk` FOREIGN KEY (`vid_id`) REFERENCES `fa_video_tb` (`vid_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fa_login_payments_tb`
--

DROP TABLE IF EXISTS `fa_login_payments_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fa_login_payments_tb` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login_id` int(11) NOT NULL,
  `invoice_num` varchar(70) NOT NULL,
  `payment_status` int(11) NOT NULL,
  `transaction_id` varchar(70) DEFAULT NULL,
  `authorization_code` varchar(10) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `payment_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'mydb'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-09-05 15:23:46

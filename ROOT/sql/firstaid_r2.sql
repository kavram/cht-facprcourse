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
  `crs_price` decimal(4,2) DEFAULT NULL,
  `crs_desc` varchar(4096) DEFAULT NULL,
  `crs_type` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`crs_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fa_courses_tb`
--

LOCK TABLES `fa_courses_tb` WRITE;
/*!40000 ALTER TABLE `fa_courses_tb` DISABLE KEYS */;
INSERT INTO `fa_courses_tb` VALUES (1,'First Aid Certification',NULL,19.95,'First Aid training at it\'s finest in both First Aid and CPR. Designed for people that want to master the science of First Aid and CPR at their own pace. Certification meets all of the necessary AHA or OSHA regulations. Learn what to do in the event of an emergency.  . This course follows the latest American Heart Association, ECC/ILCOR guidelines. \n			Topics include: Heimlich maneuver, conscious choking adult, and stroke, Cardiac Arrest, Heart Attack\n			Bite Wounds, puncture wounds, nose bleed, head injury, treatments, fractures, I.C.E., Electrocution, cleaning wounds, stop bleeding, cuts and Scrapes, choking, and burns',NULL),(2,'CPR and First Aid Certification',NULL,29.95,'',NULL),(3,'Healthcare Basic Life Support (BLS)',NULL,49.95,'Learn how to perform CPR on Children, Adults, and Infants. \n    		In addition you will learn how to respond to a scene with  Adults ( 1 or 2 rescuers) \n    		as how to use an Automated External Defibrillator (AED). \n    		You\'ll also learn about First-Aid and how to  care for wounds, cuts and scrapes, strokes, and seizures.',NULL),(4,'CPR Basic Certification - Adult Only',NULL,14.95,'',NULL);
/*!40000 ALTER TABLE `fa_courses_tb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fa_questions_tb`
--

DROP TABLE IF EXISTS `fa_questions_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fa_questions_tb` (
  `que_id` int(11) NOT NULL AUTO_INCREMENT,
  `que_question` varchar(500) DEFAULT NULL,
  `que_num_ans` int(11) DEFAULT NULL,
  `que_type` int(11) DEFAULT NULL,
  PRIMARY KEY (`que_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fa_questions_tb`
--

LOCK TABLES `fa_questions_tb` WRITE;
/*!40000 ALTER TABLE `fa_questions_tb` DISABLE KEYS */;
INSERT INTO `fa_questions_tb` VALUES (1,'To take care of a nosebleed you need to administer CPR?',2,0),(2,'In the case of a head injury it is advised to keep the person still?',2,0),(3,'If you are bitten by a wild animal it carries a risk of Rabies?  ',2,0),(4,'Foreign objects can get caught in the throat and block breathing?  ',2,0),(5,'A first-degree burn is the most serious of burns?',2,0),(6,'Any fracture should be treated by a physician?',2,0),(7,'Is it good to perform the Heimlich maneuver from the front?  ',2,0),(8,'A minor open wound should be immediately washed thoroughly with soap and water? ',2,0),(9,'When caring for an electrical injury it is best to first make sure the power source is off?',2,0),(10,'A serious head injury requires immediate medical attention?  ',2,0),(11,'When you have encountered a person with a serious cut. Should you begin CPR immediately?',2,0),(12,'When treating someone that has been electrocuted you should be careful not to run the shock through you?  ',2,0),(13,'A minor open wound should be immediately washed thoroughly with soap and water?',2,0),(14,'What does the B stand for in the ABC check?',2,0),(15,'What does the C stand for in the ABC check?',2,0),(16,'You need to perform CPR on your neighbor after she collapsed and stopped breathing. How many chest compressions to rescue breaths should you do?',2,0),(17,'What does CPR stand for?',4,0),(18,'When administering CPR to an infant you should do what?',4,0),(19,'To clear a victims airway you should?',4,0),(20,'How deep should you deliver chest compressions when delivering CPR on a baby?',4,0),(21,'At 30 chest compressions, how many rescue breaths should you deliver?',4,0),(22,'Hands only CPR is just as effective as conventional bystander CPR?',2,0),(23,'After opening the airway of a casualty, you should check for breathing for a maximum of how long?',4,0),(24,'When giving a rescue breath you should blow as much air into the casualty as possible?',2,0),(25,'How many seconds should a rescue breath roughly take to inflate the casualtie\'s lungs?',4,0),(26,'Rescue breathing can be mouth-to-mouth breathing or mouth-to-nose breathing if the mouth is seriously injured or can\'t be opened?',2,0),(27,'With the airway open (using the head-tilt, chin-lift maneuver), pinch the nostrils shut for mouth-to-mouth breathing and cover the person\'ss mouth with yours, making a seal?',2,0),(28,'If there is more than one rescuer, how often should you swap over doing chest compressions?',4,0),(29,'How deep should you deliver chest compressions when delivering CPR on a adult?',4,0),(30,'How many chest compressions should you air for per minute?',4,0),(31,'How do you check for a response in an adult casualty?',4,0),(32,'What is the proper term when someone\'s heart stops beating?',4,0),(33,'The procedure for giving CPR to a child age 1 through 8 is essentially the same as that for an adult. Use the same compression-breath rate as is used for adults: 30 compressions followed by two breaths. This is one cycle. Following the two breaths, immediately begin the next cycle of compressions and breaths. Is this true or false?',2,0);
/*!40000 ALTER TABLE `fa_questions_tb` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fa_login_email_validation_tb`
--

LOCK TABLES `fa_login_email_validation_tb` WRITE;
/*!40000 ALTER TABLE `fa_login_email_validation_tb` DISABLE KEYS */;
INSERT INTO `fa_login_email_validation_tb` VALUES (4,10,'b81c28df-6af0-4e39-92ca-7f07e7207272',1,'2014-09-10 06:35:10'),(5,11,'c596afa5-f6db-4af1-94b0-b5ad2b174a32',0,'2014-09-10 19:02:38'),(6,12,'01be5687-40e6-4c1e-9d3e-1cf8ed2a0499',0,'2014-09-12 19:17:37'),(7,13,'bcdf0f57-96f5-45f7-b197-cf5fb267127b',0,'2014-09-13 05:40:15'),(8,14,'e6ed42bf-b68e-43e4-ab43-59d8848014d2',0,'2014-09-13 05:49:39'),(9,15,'49c70fa1-2408-4ed4-84a9-3e92fd23ac75',0,'2014-09-17 20:49:57'),(10,16,'e020389a-01e9-4c3d-9d27-36a55a92f745',0,'2014-09-17 21:09:35'),(11,17,'74063471-0fa0-4632-9bb0-13c93a4afbe8',0,'2014-09-17 21:40:40'),(12,18,'8b8d9ba2-49b7-481b-bf1c-d03fb5d82356',0,'2014-09-17 21:53:38'),(13,19,'60ed22b4-f79a-44b1-b463-0e4b3b7c8b44',0,'2014-09-17 22:04:16'),(14,20,'28e214da-372a-4266-97ea-9c57148badef',0,'2014-09-17 23:58:53'),(15,21,'ed47ab20-e0f4-4e0b-8871-8c9001ac837c',0,'2014-09-18 00:06:29'),(17,23,'78da5329-adb8-4edc-8bf2-b66e12383716',1,'2014-09-18 23:00:55'),(18,24,'8103f578-70c8-4c40-a1b6-60bcf756da26',0,'2014-10-05 05:44:03'),(19,25,'b333c3f6-d6ed-4d99-9cc3-7a60c1c068da',1,'2014-10-05 05:47:43'),(20,26,'cbeada28-e207-4088-a845-ff77ff4aa227',1,'2014-10-05 05:59:57'),(21,27,'de36f296-987c-4995-be08-5760b868fa2c',1,'2014-10-05 09:23:52'),(22,28,'ab378560-22e4-4fbe-b34d-9dde3220e67c',1,'2014-11-23 06:34:11'),(23,29,'95fc1aa9-bb32-4f5c-b33c-c06b6eaa20fb',1,'2014-11-23 06:52:27'),(24,30,'69825efb-921d-4fc9-96ba-131ff4eed5d7',0,'2014-11-23 07:30:33'),(25,31,'e1055637-5091-474b-b987-70bcc243f055',0,'2014-11-23 07:39:43'),(26,32,'1c69a074-55f8-413f-af87-20762469b6cc',0,'2014-11-23 07:45:30'),(27,33,'1fe5d5db-ce3f-4f74-9304-cadfd9d3ca47',0,'2014-11-23 07:49:43'),(28,34,'daa387fc-6696-4cef-b18e-fb073af72dc5',1,'2014-11-23 07:53:55'),(29,35,'a6acba83-4377-4773-9ce5-539ad86be823',0,'2014-11-23 08:32:59'),(30,36,'b8abe458-610b-4538-8aef-cc3cd57b4382',0,'2014-11-23 08:35:50'),(31,37,'09139b63-f726-417f-82d9-bdc74ddfe289',0,'2014-11-23 22:40:11'),(32,38,'4504954a-f5e8-4a81-b147-da36f615a636',1,'2014-11-23 22:48:52'),(33,39,'da490aff-89a5-465c-9204-e022ddc42d2e',0,'2014-11-23 23:36:33'),(34,40,'327b80ca-b4ed-4ba5-a165-70109950f50f',1,'2014-11-26 06:48:28');
/*!40000 ALTER TABLE `fa_login_email_validation_tb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fa_video_tb`
--

DROP TABLE IF EXISTS `fa_video_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fa_video_tb` (
  `vid_id` int(11) NOT NULL AUTO_INCREMENT,
  `vid_name` varchar(100) DEFAULT NULL,
  `vid_url` varchar(100) DEFAULT NULL,
  `vid_icon_act` varchar(100) DEFAULT NULL,
  `vid_icon_inact` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`vid_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fa_video_tb`
--

LOCK TABLES `fa_video_tb` WRITE;
/*!40000 ALTER TABLE `fa_video_tb` DISABLE KEYS */;
INSERT INTO `fa_video_tb` VALUES (1,'CPR Hands Only','http://drive.flowplayer.org/196963/29520-cprhandsonly.mp4','http://drive.flowplayer.org/196963/29520-cprhandsonly',NULL),(2,'Conscious Choking Child','http://drive.flowplayer.org/196963/29521-cprconsciouschokingchild.mp4','http://drive.flowplayer.org/196963/29521-thumb.jpg',NULL),(3,'Adult CPR','http://drive.flowplayer.org/196963/29530-cpradultcpr.mp4','http://drive.flowplayer.org/196963/29530-thumb.jpg',NULL),(4,'Performing Child CPR','http://drive.flowplayer.org/196963/29523-faperformchildcpr.mp4','http://drive.flowplayer.org/196963/29523-thumb.jpg',NULL),(5,'CPR Intro','http://drive.flowplayer.org/196963/32547-CPRIntro.mp4','http://drive.flowplayer.org/196963/29518-thumb.jpg',NULL),(6,'CPR Hands Only Review','http://drive.flowplayer.org/196963/29526-cprhandsonlyreview.mp4','http://drive.flowplayer.org/196963/29526-thumb.jpg',NULL),(7,'Conscious Choking Adult','http://drive.flowplayer.org/196963/29510-faconsciouschokingadult.mp4','http://drive.flowplayer.org/196963/29510-thumb.jpg',NULL),(8,'Heart Attack','http://drive.flowplayer.org/196963/29528-faheartattacktraining.mp4','http://drive.flowplayer.org/196963/29528-thumb.jpg',NULL),(9,'Cardiac Arrest Training Infants','http://drive.flowplayer.org/196963/29524-facardiacarresttraininginfant.mp4','http://drive.flowplayer.org/196963/29524-thumb.jpg',NULL),(10,'Stroke Training Video','http://drive.flowplayer.org/196963/29506-fastroke.mp4','http://drive.flowplayer.org/196963/29506-thumb.jpg',NULL),(11,'Arterial Bleeding','http://drive.flowplayer.org/196963/29515-faarterialbleeding.mp4','http://drive.flowplayer.org/196963/29515-thumb.jpg',NULL),(12,'Conscious Choking Adult Summary','http://drive.flowplayer.org/196963/29511-faconsciouschokingadultsum.mp4','http://drive.flowplayer.org/196963/29511-thumb.jpg',NULL),(13,'Arterial Bleeding Summary','http://drive.flowplayer.org/196963/29529-faarterialbleedingvideosum.mp4','http://drive.flowplayer.org/196963/29529-thumb.jpg',NULL),(14,'Responding To an Emergency','http://drive.flowplayer.org/196963/29522-farespondingtoemergency.mp4','http://drive.flowplayer.org/196963/29522-thumb.jpg',NULL),(15,'AED Training','http://drive.flowplayer.org/196963/29516-faaedtraining.mp4','http://drive.flowplayer.org/196963/29516-thumb.jpg',NULL),(16,'AED Two Person Rescuer','http://drive.flowplayer.org/196963/29499-fatwopersonaedadultinfant.mp4','http://drive.flowplayer.org/196963/29499-thumb.jpg',NULL);
/*!40000 ALTER TABLE `fa_video_tb` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `fa_quiz_results_tb`
--

LOCK TABLES `fa_quiz_results_tb` WRITE;
/*!40000 ALTER TABLE `fa_quiz_results_tb` DISABLE KEYS */;
/*!40000 ALTER TABLE `fa_quiz_results_tb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fa_login_paid_courses_tb`
--

DROP TABLE IF EXISTS `fa_login_paid_courses_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fa_login_paid_courses_tb` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_transaction_id` varchar(50) NOT NULL,
  `course_id` int(11) NOT NULL,
  `payment_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `amount` double NOT NULL,
  `login_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `lpc_courses_fk` (`course_id`),
  KEY `lpc_login_fk` (`payment_transaction_id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fa_login_paid_courses_tb`
--

LOCK TABLES `fa_login_paid_courses_tb` WRITE;
/*!40000 ALTER TABLE `fa_login_paid_courses_tb` DISABLE KEYS */;
INSERT INTO `fa_login_paid_courses_tb` VALUES (1,'123',1,'2014-09-29 06:30:40',5.99,23),(64,'test',4,'2014-10-04 09:13:57',14.95,23),(65,'test',2,'2014-10-04 09:19:28',19.95,23),(66,'test',4,'2014-10-05 06:02:13',14.95,26),(67,'test',1,'2014-10-05 06:46:05',14.95,26),(68,'0',2,'2014-11-07 21:06:41',19.95,26),(69,'test',3,'2014-11-09 08:24:00',49.95,26),(70,'test',1,'2014-11-23 22:53:56',19.95,38),(71,'test',1,'2014-11-26 06:50:14',19.95,40),(72,'test',2,'2014-11-27 05:38:05',29.95,40),(73,'test',3,'2014-11-29 04:07:10',49.95,40);
/*!40000 ALTER TABLE `fa_login_paid_courses_tb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fa_login_courses_tb`
--

DROP TABLE IF EXISTS `fa_login_courses_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fa_login_courses_tb` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `log_id` int(11) NOT NULL,
  `crs_id` int(11) NOT NULL,
  `loc_compl_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `loc_cert_issued` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fa_login_courses_tb`
--

LOCK TABLES `fa_login_courses_tb` WRITE;
/*!40000 ALTER TABLE `fa_login_courses_tb` DISABLE KEYS */;
INSERT INTO `fa_login_courses_tb` VALUES (1,23,1,'2014-10-02 08:03:28',0),(2,23,1,'2014-10-03 18:17:53',0),(3,23,1,'2014-10-03 18:21:32',0),(4,26,4,'2014-10-05 06:47:28',0),(5,26,4,'2014-10-05 08:01:01',0),(6,26,1,'2014-11-06 06:10:42',0),(7,26,1,'2014-11-06 06:30:08',0),(8,26,1,'2014-11-06 06:34:14',0),(9,26,1,'2014-11-06 06:35:38',0),(10,26,1,'2014-11-06 06:38:21',0),(11,26,1,'2014-11-06 06:39:35',0),(12,26,1,'2014-11-06 06:43:05',0),(13,26,1,'2014-11-06 06:44:14',0),(14,26,1,'2014-11-06 06:52:52',0),(15,26,1,'2014-11-06 06:55:08',0),(16,26,1,'2014-11-06 07:24:47',0),(17,26,1,'2014-11-06 07:25:51',0),(18,26,1,'2014-11-07 20:57:37',0),(19,26,1,'2014-11-07 21:00:53',0),(20,26,4,'2014-11-07 21:01:37',0),(21,26,2,'2014-11-07 21:08:02',0),(22,26,2,'2014-11-07 21:13:36',0),(23,26,1,'2014-11-08 04:48:44',0),(24,26,4,'2014-11-08 04:49:53',0),(25,26,2,'2014-11-08 04:50:40',0),(26,26,1,'2014-11-09 07:29:09',0),(27,26,2,'2014-11-09 07:42:49',0),(28,26,1,'2014-11-17 06:37:31',0),(29,40,1,'2014-11-26 06:51:29',0),(30,40,1,'2014-11-26 06:57:44',0),(31,40,1,'2014-11-26 07:04:18',0),(32,40,1,'2014-11-26 07:09:41',0),(33,40,1,'2014-11-26 07:13:04',0),(34,40,1,'2014-11-26 07:16:38',0),(35,40,1,'2014-11-26 07:20:53',0),(36,40,1,'2014-11-26 07:24:24',0),(37,40,1,'2014-11-26 07:28:48',0),(38,40,1,'2014-11-26 07:33:02',0),(39,40,1,'2014-11-27 04:02:34',0),(40,40,1,'2014-11-27 04:05:49',0),(41,40,1,'2014-11-27 04:35:15',0),(42,40,1,'2014-11-27 04:39:22',0),(43,40,1,'2014-11-27 04:44:50',0),(44,40,1,'2014-11-27 04:49:52',0),(45,40,1,'2014-11-27 04:52:49',0),(46,40,1,'2014-11-27 05:23:04',0),(47,40,2,'2014-11-27 05:40:01',0),(48,40,2,'2014-11-27 05:46:25',0),(49,40,2,'2014-11-27 05:49:57',0),(50,40,3,'2014-11-29 04:27:12',0),(51,40,2,'2014-11-29 04:32:27',0),(52,40,3,'2014-11-29 04:36:42',0);
/*!40000 ALTER TABLE `fa_login_courses_tb` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fa_answers_tb`
--

LOCK TABLES `fa_answers_tb` WRITE;
/*!40000 ALTER TABLE `fa_answers_tb` DISABLE KEYS */;
INSERT INTO `fa_answers_tb` VALUES (1,1,'TRUE',0),(2,1,'FALSE',1),(4,2,'TRUE',1),(5,2,'FALSE',0),(7,3,'TRUE',1),(8,3,'FALSE',0),(10,4,'TRUE',1),(11,4,'FALSE',0),(13,5,'TRUE',0),(14,5,'FALSE',1),(16,6,'TRUE',1),(17,6,'FALSE',0),(19,7,'TRUE',0),(20,7,'FALSE',1),(22,8,'TRUE',1),(23,8,'FALSE',0),(25,9,'TRUE',1),(26,9,'FALSE',0),(28,10,'TRUE',1),(29,10,'FALSE',0),(31,11,'TRUE',0),(32,11,'FALSE',1),(34,12,'TRUE',1),(35,12,'FALSE',0),(37,13,'TRUE',1),(38,13,'FALSE',0),(40,14,'BREATHING',1),(41,14,'BLOOD',0),(42,14,'BACK',0),(43,15,'CASE',0),(44,15,'COMPRESSION',1),(45,15,'COLD',0),(46,16,'20 chest compressions',0),(47,16,'30 chest compressions',1),(48,16,'40 chest compressions',0),(49,17,'Cardio Pulmonary Rescue',0),(50,17,'Chest Pulmonary Resuscitation',0),(51,17,'Cardio Pulmonary Resuscitation',1),(52,17,'Cardio Patrol Rental',0),(53,18,'Cover his nose and blow into the nose',0),(54,18,'Cover mouth and nose with your mouth',1),(55,18,'Cover his mouth with yours?',0),(56,18,'Do not cover at all as it is not important',0),(57,19,'Lift nose, tilt head forward',0),(58,19,'Lift chin and tilt the head back',1),(59,19,'Tilt chin forward',0),(60,19,'Tilt chin and head forward',0),(61,20,'1-2 cm',1),(62,20,'2-3 cm',0),(63,20,'4-5 cm',0),(64,20,'5-6 cm',0),(65,21,'3',0),(66,21,'4',0),(67,21,'5',0),(68,21,'2',1),(69,22,'True',0),(70,22,'False',1),(71,23,'2 seconds',0),(72,23,'4 seconds',0),(73,23,'5-10 seconds',1),(74,23,'10-20 seconds',0),(75,24,'True',0),(76,24,'False',1),(77,25,'One second',1),(78,25,'Two seconds',0),(79,25,'Three seconds',0),(80,25,'Four seconds',0),(81,26,'True',1),(82,26,'False',0),(83,27,'True',1),(84,27,'False',0),(85,28,'Every 2 minutes',0),(86,28,'Every 6 minutes',0),(87,28,'Every 10 minutes',0),(88,28,'Whenever you feel tired',1),(89,29,'1-2 cm',0),(90,29,'2-3 cm',0),(91,29,'4-5 cm',0),(92,29,'5-6 cm',1),(93,30,'50',0),(94,30,'100',1),(95,30,'150',0),(96,30,'175',0),(97,31,'Pour cold water on their head',0),(98,31,'Shake their arm',0),(99,31,'Nudge them with your foot',0),(100,31,'Shout at them and gently shake their shoulders',1),(101,32,'Stroke',0),(102,32,'Heart Attack',0),(103,32,'Cardiac Arrest',1),(104,32,'Myocardial Infraction',0),(105,33,'False',0),(106,33,'True',1);
/*!40000 ALTER TABLE `fa_answers_tb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fa_quiz_ptr_tb`
--

DROP TABLE IF EXISTS `fa_quiz_ptr_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fa_quiz_ptr_tb` (
  `crs_id` int(11) NOT NULL,
  `que_id` int(11) NOT NULL,
  KEY `que_questions_fk_idx` (`que_id`),
  CONSTRAINT `que_questions_fk` FOREIGN KEY (`que_id`) REFERENCES `fa_questions_tb` (`que_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fa_quiz_ptr_tb`
--

LOCK TABLES `fa_quiz_ptr_tb` WRITE;
/*!40000 ALTER TABLE `fa_quiz_ptr_tb` DISABLE KEYS */;
INSERT INTO `fa_quiz_ptr_tb` VALUES (4,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8),(1,9),(1,10),(1,11),(1,12),(1,13),(1,14),(4,15),(4,16),(4,17),(4,18),(4,19),(4,20),(4,21),(4,22),(4,23),(4,24),(4,25),(4,26),(4,27),(4,28),(4,29),(4,30),(4,31),(4,32),(4,33),(2,1),(2,2),(2,3),(2,4),(2,5),(2,6),(2,7),(2,8),(2,9),(2,10),(2,11),(2,12),(2,13),(2,14),(2,15),(2,16),(2,17),(2,18),(2,19),(2,20),(2,21),(2,22),(2,23),(2,24),(2,25),(2,26),(2,27),(2,28),(2,29),(2,30),(2,31),(2,32),(2,33),(3,1),(3,2),(3,3),(3,4),(3,5),(3,6),(3,7),(3,8),(3,9),(3,10),(3,11),(3,12),(3,13),(3,14),(3,15),(3,16),(3,17),(3,18),(3,19),(3,20),(3,21),(3,22),(3,23),(3,24),(3,25),(3,26),(3,27),(3,28),(3,29),(3,30),(3,31),(3,32),(3,33);
/*!40000 ALTER TABLE `fa_quiz_ptr_tb` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `fa_video_ptr_tb`
--

LOCK TABLES `fa_video_ptr_tb` WRITE;
/*!40000 ALTER TABLE `fa_video_ptr_tb` DISABLE KEYS */;
INSERT INTO `fa_video_ptr_tb` VALUES (1,2),(1,8),(1,9),(1,10),(1,11),(1,12),(1,13),(2,1),(2,2),(2,3),(2,4),(2,5),(2,6),(2,7),(2,8),(2,9),(2,10),(2,11),(2,12),(2,13),(3,1),(3,2),(3,3),(3,4),(3,5),(3,6),(3,7),(3,8),(3,9),(3,10),(3,11),(3,12),(3,13),(3,14),(3,15),(3,16),(4,1),(4,2),(4,3),(4,4),(4,5),(4,6);
/*!40000 ALTER TABLE `fa_video_ptr_tb` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fa_login_tb`
--

LOCK TABLES `fa_login_tb` WRITE;
/*!40000 ALTER TABLE `fa_login_tb` DISABLE KEYS */;
INSERT INTO `fa_login_tb` VALUES (40,'kirill_avramenko@yahoo.com','123456',NULL,'kir','test',1,'a43e447b-07f1-4d02-b076-e7463665c2a2','2014-11-26 06:48:28');
/*!40000 ALTER TABLE `fa_login_tb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fa_login_forgot_password_tb`
--

DROP TABLE IF EXISTS `fa_login_forgot_password_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fa_login_forgot_password_tb` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login_id` int(11) NOT NULL,
  `token` varchar(70) NOT NULL,
  `status` int(11) NOT NULL,
  `dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fa_login_forgot_password_tb`
--

LOCK TABLES `fa_login_forgot_password_tb` WRITE;
/*!40000 ALTER TABLE `fa_login_forgot_password_tb` DISABLE KEYS */;
INSERT INTO `fa_login_forgot_password_tb` VALUES (17,23,'0e79ca19-2a5a-4e84-a7e0-9db09e6409b7',0,'2014-09-24 04:49:22'),(18,23,'ce0526f6-8d3f-4f7f-ac2f-52e9ae3b4b4b',0,'2014-09-24 05:01:00'),(20,23,'c68f9c6f-a7c3-4f3d-a206-2e463ab1e2eb',0,'2014-09-24 05:14:44'),(21,23,'765f99a9-957d-4d84-8d05-0866e1c8c7c9',0,'2014-09-24 05:32:59'),(22,26,'8e333544-9ca2-4a7d-9867-b3e2c9844abc',0,'2014-10-05 06:08:00'),(23,26,'dd0f0f75-24e5-4f78-87fa-9d6ad022f01c',0,'2014-11-13 07:05:18'),(24,26,'80659119-c5ae-4b34-bdac-c6de6a9d7dec',0,'2014-11-17 06:18:03'),(25,26,'a6e1f4a4-31fb-4845-973c-92f4f30e20a2',0,'2014-11-17 06:27:37'),(26,26,'f6fa2f64-07be-41a6-a0aa-b29e679167cb',0,'2014-11-17 06:33:05');
/*!40000 ALTER TABLE `fa_login_forgot_password_tb` ENABLE KEYS */;
UNLOCK TABLES;

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

-- Dump completed on 2014-11-28 21:09:00

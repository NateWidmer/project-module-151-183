/*
SQLyog Community v13.1.6 (64 bit)
MySQL - 10.1.37-MariaDB : Database - quiz
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`quiz` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;

USE `quiz`;

/*Table structure for table `highscore` */

DROP TABLE IF EXISTS `highscore`;

CREATE TABLE `highscore` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `score` int(11) NOT NULL,
  `username_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `username_id` (`username_id`),
  CONSTRAINT `highscore_ibfk_1` FOREIGN KEY (`username_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `highscore` */

insert  into `highscore`(`id`,`score`,`username_id`) values 
(1,300,47),
(2,100,48),
(4,200,46),
(5,200,47),
(6,100,46),
(7,400,46),
(8,300,48),
(9,100,46);

/*Table structure for table `highscore_quiz` */

DROP TABLE IF EXISTS `highscore_quiz`;

CREATE TABLE `highscore_quiz` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `highscore_id` int(11) DEFAULT NULL,
  `quiz_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `highscore_id` (`highscore_id`),
  KEY `quiz_id` (`quiz_id`),
  CONSTRAINT `highscore_quiz_ibfk_1` FOREIGN KEY (`highscore_id`) REFERENCES `highscore` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `highscore_quiz_ibfk_2` FOREIGN KEY (`quiz_id`) REFERENCES `quiz` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `highscore_quiz` */

insert  into `highscore_quiz`(`id`,`highscore_id`,`quiz_id`) values 
(4,5,6),
(5,6,6),
(6,7,7),
(7,8,7),
(8,9,8);

/*Table structure for table `questions` */

DROP TABLE IF EXISTS `questions`;

CREATE TABLE `questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question` varchar(100) COLLATE utf8_bin NOT NULL,
  `answer` varchar(50) COLLATE utf8_bin NOT NULL,
  `quiz_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `quiz_id` (`quiz_id`),
  CONSTRAINT `questions_ibfk_1` FOREIGN KEY (`quiz_id`) REFERENCES `quiz` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `questions` */

insert  into `questions`(`id`,`question`,`answer`,`quiz_id`) values 
(7,'Katze','Cat',6),
(8,'Hund','Dog',6),
(9,'Name the three types of rocks','Igneous, Sedimentary, Metamorphic',7),
(10,'What are rocks made out of?','Minerals',7),
(11,'Where do igneous rocks come from?','Molten Magma',7),
(12,'What is the study of rocks called?','Geology',7),
(13,'This is a test question','This is a test answer',8);

/*Table structure for table `quiz` */

DROP TABLE IF EXISTS `quiz`;

CREATE TABLE `quiz` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8_bin NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `quiz_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `quiz` */

insert  into `quiz`(`id`,`title`,`user_id`) values 
(6,'Do YOU know these GERMAN words?',47),
(7,'How well do you know rocks?',46),
(8,'Test Quiz',46);

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) COLLATE utf8_bin NOT NULL,
  `password` varchar(255) COLLATE utf8_bin NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `users` */

insert  into `users`(`id`,`username`,`password`,`created_at`) values 
(46,'admin','$2y$10$TebKpT1vZe28de.8nPd1Zu/2A7bbiJZxxeipNBugI5yb0/8sRLNA6','2020-10-27 09:16:22'),
(47,'nwidmer','$2y$10$MYoJcikgv/0mDL5Y5HCwv.PGEOhkI0dCgsGhxtIgwREN92pwWatje','2020-10-27 09:25:38'),
(48,'lbosshard','$2y$10$2.x.O30X6TxyKy/hf4.eAOfGDTF1OxYnUUEDJCV.vsgnRSYfKRXBK','2020-10-27 09:30:25'),
(49,'Testuser','$2y$10$LJZrAzQmRHfGkNVejEcUVeiibkTvMbrQtv1XElgo911VUq0f7GtMm','2020-11-02 22:07:39'),
(50,'Testuser2','$2y$10$eYng.XnpNoGgL0HE9rFfp.O/xM5sHcePNyTTGv2wrUQ6/6pKcBoay','2020-11-02 22:10:04'),
(51,'Testuser3','$2y$10$hvoI5J0x3rbYGe.R8bM1q.APDA1Jov7Za2YvUvXp7whlJ7/C.gYPu','2020-11-02 22:10:21'),
(53,'Gaffel','$2y$10$tnzHeOaF.o0aHZOR56UvBer3PKH/OarhN5P3engftfS3xC/O2MdAq','2020-11-02 22:13:00'),
(54,'Hades','$2y$10$xqyGx/U/Lccrwoh5hVH4QOOuwNcW5Pm9DpeP1Ou7PKt.F8tOOc2Ny','2020-11-02 22:14:28'),
(55,'Hansel','$2y$10$IN8ZQajKgmp2pzze5Y7iAuarvQoVNBNAxN9JhtkrqyEaCZNYj3l4C','2020-11-02 22:16:13'),
(56,'FinalTest','$2y$10$ktRrz5NquQpwsfMwAxAx.Orcj6gi7YxB9jkESz48X1DZ8W8OvRBvG','2020-11-02 22:44:03');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

# ************************************************************
# Sequel Pro SQL dump
# Version 3408
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: localhost (MySQL 5.1.55)
# Database: esper_simulator
# Generation Time: 2012-06-28 19:11:33 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table answers
# ------------------------------------------------------------

DROP TABLE IF EXISTS `answers`;

CREATE TABLE `answers` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `quizz_id` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `question_id` int(11) DEFAULT NULL,
  `answer` varchar(255) DEFAULT NULL,
  `answers` varchar(255) DEFAULT NULL,
  `nb_tries` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

LOCK TABLES `answers` WRITE;
/*!40000 ALTER TABLE `answers` DISABLE KEYS */;

INSERT INTO `answers` (`id`, `quizz_id`, `user_id`, `question_id`, `answer`, `answers`, `nb_tries`, `created_at`, `updated_at`)
VALUES
	(1731,'UNIT',100,120,'/panel1','puma|sfr|/panel1',3,'2012-06-28 21:02:52','2012-06-28 21:02:52'),
	(1127,'EXPOSES',100,105,'ready','ready',1,'2012-06-21 22:04:18','2012-06-21 22:04:18'),
	(1126,'EXPOSES',100,100,'OK','OK',1,'2012-06-21 22:04:17','2012-06-21 22:04:17'),
	(1729,'UNIT',100,100,'OK','OK',1,'2012-06-28 21:02:47','2012-06-28 21:02:47'),
	(1730,'UNIT',100,105,'/panel1','/panel1',1,'2012-06-28 21:02:49','2012-06-28 21:02:49');

/*!40000 ALTER TABLE `answers` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table quizz
# ------------------------------------------------------------

DROP TABLE IF EXISTS `quizz`;

CREATE TABLE `quizz` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `quizz_id` varchar(255) DEFAULT NULL,
  `question_id` int(11) DEFAULT NULL,
  `next_question_id` int(11) DEFAULT NULL,
  `next_condition` varchar(255) DEFAULT NULL,
  `answer` varchar(255) DEFAULT NULL,
  `quizz_type` varchar(255) DEFAULT NULL,
  `question_name` varchar(255) DEFAULT NULL,
  `panneau1` varchar(1024) DEFAULT NULL,
  `panneau2` varchar(1024) DEFAULT NULL,
  `notification` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

LOCK TABLES `quizz` WRITE;
/*!40000 ALTER TABLE `quizz` DISABLE KEYS */;

INSERT INTO `quizz` (`id`, `quizz_id`, `question_id`, `next_question_id`, `next_condition`, `answer`, `quizz_type`, `question_name`, `panneau1`, `panneau2`, `notification`)
VALUES
	(69,'UNIT',100,NULL,NULL,NULL,'DIALOG','Test Dialog + First Question','http://mimesis-republic.com/wp-content/uploads/2012/06/mamba_lab03.jpg',NULL,'Test Dialog + First Question'),
	(70,'UNIT',105,NULL,NULL,'ready /panel1','QCM','Test QCM OK','Texte1','Texte2','Test QCM OK'),
	(71,'UNIT',120,NULL,NULL,'fin /panel1','OPEN','Test Open','Texte3',NULL,'Test Open'),
	(72,'UNIT',130,NULL,NULL,'oui non o n','QCM','Test QCM NOK',NULL,'texte4','Test QCM NOK'),
	(73,'UNIT',1000,NULL,NULL,'','DIALOG','Test End Quizz','Texte6','Texte5','Test End Quizz');

/*!40000 ALTER TABLE `quizz` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table room_quizz
# ------------------------------------------------------------

DROP TABLE IF EXISTS `room_quizz`;

CREATE TABLE `room_quizz` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `room_id` varchar(255) DEFAULT NULL,
  `quizz_id` varchar(255) DEFAULT NULL,
  `room_class` varchar(255) DEFAULT NULL,
  `activated` int(11) DEFAULT NULL,
  `panel1_code` varchar(255) DEFAULT NULL,
  `panel2_code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

LOCK TABLES `room_quizz` WRITE;
/*!40000 ALTER TABLE `room_quizz` DISABLE KEYS */;

INSERT INTO `room_quizz` (`id`, `room_id`, `quizz_id`, `room_class`, `activated`, `panel1_code`, `panel2_code`)
VALUES
	(4,'TEST_ROOM','UNIT',NULL,1,'Panel1Code','Panel2Code');

/*!40000 ALTER TABLE `room_quizz` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

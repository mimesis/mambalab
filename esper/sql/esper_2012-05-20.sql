# ************************************************************
# Sequel Pro SQL dump
# Version 3408
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: localhost (MySQL 5.1.55)
# Database: esper
# Generation Time: 2012-05-20 19:29:27 +0200
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
  `quizz_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `question_id` int(11) DEFAULT NULL,
  `answer` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

LOCK TABLES `answers` WRITE;
/*!40000 ALTER TABLE `answers` DISABLE KEYS */;

INSERT INTO `answers` (`id`, `quizz_id`, `user_id`, `question_id`, `answer`, `created_at`, `updated_at`)
VALUES
	(1,NULL,100,1,'/1',NULL,NULL),
	(2,NULL,100,1,'/1',NULL,NULL),
	(3,NULL,100,1,'/1',NULL,NULL),
	(4,NULL,100,1,'/1',NULL,NULL),
	(5,NULL,100,1,'/1',NULL,NULL),
	(6,NULL,100,1,'/1',NULL,NULL),
	(7,NULL,100,1,'/1',NULL,NULL),
	(8,NULL,100,1,'/1',NULL,NULL),
	(9,NULL,100,1,'/1',NULL,NULL),
	(10,NULL,100,1,'/1',NULL,NULL),
	(11,NULL,100,1,'/1',NULL,NULL),
	(12,NULL,100,1,'/1',NULL,NULL),
	(13,NULL,100,1,'/1',NULL,NULL),
	(14,NULL,100,1,'/1',NULL,NULL),
	(15,NULL,100,1,'/1',NULL,NULL),
	(16,NULL,100,1,'/1',NULL,NULL),
	(17,NULL,100,1,'/1','2012-05-20 19:27:34','2012-05-20 19:27:34');

/*!40000 ALTER TABLE `answers` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table quizz
# ------------------------------------------------------------

DROP TABLE IF EXISTS `quizz`;

CREATE TABLE `quizz` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `question_name` varchar(255) DEFAULT NULL,
  `answer` varchar(255) DEFAULT NULL,
  `quizz_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

LOCK TABLES `quizz` WRITE;
/*!40000 ALTER TABLE `quizz` DISABLE KEYS */;

INSERT INTO `quizz` (`id`, `question_name`, `answer`, `quizz_id`)
VALUES
	(1,'combien font 2+2?','4',1),
	(2,'quel est la capitale de l\'Italie?','rome',1);

/*!40000 ALTER TABLE `quizz` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;

INSERT INTO `user` (`id`, `user_id`, `user_name`)
VALUES
	(1,100,'Olivier'),
	(2,200,'Delta');

/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

# ************************************************************
# Sequel Pro SQL dump
# Version 3408
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: localhost (MySQL 5.1.55)
# Database: esper
# Generation Time: 2012-06-13 19:08:34 +0200
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
	(184,'exposes',100,20,'no','nope',1,'2012-06-02 22:57:10','2012-06-02 22:57:10'),
	(185,'exposes',100,30,'oui',NULL,0,'2012-06-02 22:57:11','2012-06-02 22:57:11'),
	(183,'exposes',100,10,'fin','sfr|puma|trace',3,'2012-06-02 22:57:08','2012-06-02 22:57:08'),
	(225,'redirect',100,330,'ok',NULL,0,'2012-06-05 16:12:55','2012-06-05 16:12:55'),
	(224,'redirect',100,320,'ok',NULL,0,'2012-06-05 16:12:54','2012-06-05 16:12:54'),
	(223,'redirect',100,300,'oui',NULL,0,'2012-06-05 16:12:53','2012-06-05 16:12:53'),
	(228,'redirect',200,330,'ok',NULL,0,'2012-06-05 16:12:59','2012-06-05 16:12:59'),
	(227,'redirect',200,310,'ok',NULL,0,'2012-06-05 16:12:58','2012-06-05 16:12:58'),
	(226,'redirect',200,300,'non',NULL,0,'2012-06-05 16:12:57','2012-06-05 16:12:57'),
	(948,'test',15,110,'ready',NULL,0,'2012-06-07 17:39:24','2012-06-07 17:39:24'),
	(947,'test',15,100,'OK',NULL,0,'2012-06-07 17:39:13','2012-06-07 17:39:13');

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
  `panneau1_url` varchar(1024) DEFAULT NULL,
  `panneau2_url` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

LOCK TABLES `quizz` WRITE;
/*!40000 ALTER TABLE `quizz` DISABLE KEYS */;

INSERT INTO `quizz` (`id`, `quizz_id`, `question_id`, `next_question_id`, `next_condition`, `answer`, `quizz_type`, `question_name`, `panneau1`, `panneau2`, `notification`, `panneau1_url`, `panneau2_url`)
VALUES
	(1,'EXPOSES',10,NULL,NULL,'fin','OPEN','Cites les marques','Cite nous les marques que tu te souviens avoir vu dans MambaNation récemment stp ? (Tape FIN pour finir)',NULL,NULL,NULL,NULL),
	(2,'EXPOSES',20,NULL,NULL,'oui|non','QCM','As-tu vu SFR?','Voici un certain nombre de Marques ? Les-as-tu vu récemment sur MambaNation?','SFR',NULL,NULL,NULL),
	(3,'EXPOSES',30,NULL,NULL,'oui|non','QCM','As-tu vu PUMA?','Voici un certain nombre de Marques ? Les-as-tu vu récemment sur MambaNation?','PUMA',NULL,NULL,NULL),
	(5,'EXPOSES',40,NULL,NULL,'oui|non','QCM','SFR est-elle innovante?','Pourrais-tu donner ton avis sur la marque SFR, stp ? la trouves-tu','Innovante',NULL,NULL,NULL),
	(6,'EXPOSES',50,NULL,NULL,'oui|non','QCM','SFR est-elle cool?','Pourrais-tu donner ton avis sur la marque SFR, stp ? la trouves-tu','Cool',NULL,NULL,NULL),
	(7,'EXPOSES',60,NULL,NULL,'oui|non','QCM','SFR est-elle digne de confiance?','Pourrais-tu donner ton avis sur la marque SFR, stp ? la trouves-tu','Digne de confiance',NULL,NULL,NULL),
	(8,'EXPOSES',70,NULL,NULL,'oui|non','QCM','SFR est-elle proche de mes attentes?','Pourrais-tu donner ton avis sur la marque SFR, stp ? la trouves-tu','Proche de moi et de mes attentes',NULL,NULL,NULL),
	(10,'EXPOSES',90,NULL,NULL,'oui|non','QCM','SFR vu sur page XGames?','Tu as déclaré avoir vu la marque SFR récémment sur Mamba... Pourrais-tu nous préciser ou ?','Sur une page consacrée aux Winter XGames',NULL,NULL,NULL),
	(11,'EXPOSES',100,NULL,NULL,'oui|non','QCM','SFR vu sur un building?','Tu as déclaré avoir vu la marque SFR récémment sur Mamba... Pourrais-tu nous préciser ou ?','En haut d\'un building',NULL,NULL,NULL),
	(12,'EXPOSES',110,NULL,NULL,'oui|non','QCM','SFR vu dans un cinéma?','Tu as déclaré avoir vu la marque SFR récémment sur Mamba... Pourrais-tu nous préciser ou ?','Dans un cinéma',NULL,NULL,NULL),
	(15,'EXPOSES',120,NULL,NULL,'oui|non','QCM','SFR vu dans un stade?','Tu as déclaré avoir vu la marque SFR récémment sur Mamba... Pourrais-tu nous préciser ou ?','Dans un stade',NULL,NULL,NULL),
	(14,'EXPOSES',130,NULL,NULL,'oui|non','QCM','SFR vu dans un dancefloor?','Tu as déclaré avoir vu la marque SFR récémment sur Mamba... Pourrais-tu nous préciser ou ?','Dans une room dance-floor où les membres peuvent discuter',NULL,NULL,NULL),
	(16,'EXPOSES',140,NULL,NULL,'oui|non','QCM','SFR vu dans aucun endroit?','Tu as déclaré avoir vu la marque SFR récémment sur Mamba... Pourrais-tu nous préciser ou ?','Aucun de ces endroits',NULL,NULL,NULL),
	(17,'EXPOSES',150,NULL,NULL,'tres|assez|peu|pas du tout','QCM','Originalité?','Tu as déclaré avoir vu la marque SFR dans l\'un des espace sponsorisés par SFR. Pourrais-tu nous donner ton avis sur l\'expérience ? L\'as tu trouvé originale ?','Oui, TRES originale, Oui ASSEZ originale, Non PEU originale, Non, PAS DU TOUT originale',NULL,NULL,NULL),
	(18,'EXPOSES',160,NULL,NULL,'1|2|3|4','QCM','Aurais-tu plaisir à retourner?','Tu as déclaré avoir vu la marque SFR dans l\'un des espace sponsorisés par SFR. Aurais-tu plaisir à retourner dans cette espace ?','1) Oui avec grand plaisir, 2) Oui avec Plaisir, 3) Non avec peu de plaisir, 4)  Non sans aucun plaisir',NULL,NULL,NULL),
	(19,'EXPOSES',170,NULL,NULL,'ok','QUESTION','Transition video','Nous allons te montrer des images /videos dans lesquelles tu verras que SFR a sponsorisé un certain nombre d\'espaces dans la Mamba Nation. Nous allons te demander de bien les regarder et des les observer.','OK?','okayy???',NULL,NULL),
	(20,'EXPOSES',180,NULL,NULL,'bien|suprenant|bizarre','QCM','Sponsorisation Winter XGames','Espace Winter XGames','C\'est BIEN, SURPRENANT ou BIZARRE que SFR propose des lieux d\'échanges et de jeux virtuels dans le cadre des Winter X Games\n','',NULL,NULL),
	(21,'EXPOSES',190,NULL,NULL,'bien|suprenant|bizarre','QCM','Sponsorisation Cinema','Espace Cinéma','C\'est BIEN, SURPRENANT ou BIZARRE que SFR propose des lieux d\'échanges et de jeux virtuels dans un cadre urbain','',NULL,NULL),
	(22,'EXPOSES',200,NULL,NULL,'1|2|3|4|5','QCM','Intégration Marque','Oublie à présent que nous parlions de SFR?\rAvec ces espaces virtuels, nous venons de te montrer quelques-unes des nouvelles opportunités pour une marque de se montrer et s?adresser à ses clients ou à des gens ayant le même profil que le tien.\rD?après ton expérience de membre Mamba Nation, que penses-tu de ce procédé ?\r','1/ J\'aime Bien, il en faudrait plus\n2/ J\'aime bien mais tant qu\'l n\'y en a pas trop sur Mamba Nation\n3/ Je trouve ça rigolo mais ça reste d\'un intérer limité\n4/ C\'est juste de la publicité sur Internet\n5/ Je n\'aime pas du tout','',NULL,NULL),
	(23,'EXPOSES',210,NULL,NULL,'1|2|3','QCM','Page Facebook','Avant dernière question, connais-tu la page Facebook des bons plans SFR ?','1/ Oui, et j\'ai déjà été faire un tour sur la page\n2/ Oui, mais je m\'y suis jamais connecté\n3/ Non, je n\'en ai jamais entendu parler','',NULL,NULL),
	(24,'EXPOSES',220,NULL,NULL,'1|2|3|4|5|6','QCM','Opérateur','Dernière question :  quel est l\'opérateur de ton téléphone portable ?','1/SFR,\n2/Orange\n3/ Bouygues Telecom\n4/ Free\n5/ Autre (Virgin, M6, ...)\n6/ Je n\'ai pas de mobile','',NULL,NULL),
	(30,'TEST',100,NULL,NULL,NULL,'DIALOG','welcome',NULL,NULL,'Bienvenu au mambalab','http://farm9.staticflickr.com/8141/7166108511_fec26ef84f_m.jpg',NULL),
	(26,'REDIRECT',300,320,'oui','oui|non','QCM','Souhaites-tu être redirigé?',NULL,NULL,NULL,NULL,NULL),
	(27,'REDIRECT',310,330,NULL,'ok','QCM','Tu n\'as pas été redirigé : OK pour continuer',NULL,NULL,NULL,NULL,NULL),
	(28,'REDIRECT',320,NULL,NULL,'ok','QCM','Tu as été redirigé : OK pour continuer',NULL,NULL,NULL,NULL,NULL),
	(29,'REDIRECT',330,NULL,NULL,'ok','QCM','Fin du quizz : OK pour continuer',NULL,NULL,NULL,NULL,NULL),
	(31,'TEST',110,NULL,NULL,'ready','QUESTION','ready',NULL,NULL,'Tapes READY pour démarrer','http://farm8.staticflickr.com/7071/7166108179_03bbe97891_m.jpg',NULL),
	(32,'TEST',128,NULL,NULL,'oui|non','QCM','avez-vous apprécié ce test?',NULL,NULL,'Avez-vous apprécié ce test ? oui/non','http://farm8.staticflickr.com/7095/7351321548_6ece8f6293_m.jpg',NULL),
	(33,'TEST',130,NULL,NULL,'\n','DIALOG','merci',NULL,NULL,'Merci pour votre participation','http://farm8.staticflickr.com/7221/7166107773_c3748e77d9_m.jpg',NULL),
	(34,'TEST',125,NULL,NULL,'fin','OPEN','Cites les marques','',NULL,'Cite nous les marques que tu te souviens avoir vu dans MambaNation récemment stp ? (Tape FIN pour finir)','http://farm8.staticflickr.com/7225/7166107477_038535c99c_m.jpg',NULL);

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
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

LOCK TABLES `room_quizz` WRITE;
/*!40000 ALTER TABLE `room_quizz` DISABLE KEYS */;

INSERT INTO `room_quizz` (`id`, `room_id`, `quizz_id`, `room_class`, `activated`)
VALUES
	(1,'R1','TEST',NULL,1),
	(2,'R2','EXPOSE',NULL,1);

/*!40000 ALTER TABLE `room_quizz` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

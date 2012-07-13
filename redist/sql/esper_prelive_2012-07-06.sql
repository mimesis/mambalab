# ************************************************************
# Sequel Pro SQL dump
# Version 3408
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: groupm.caqjxg9bpn6g.eu-west-1.rds.amazonaws.com (MySQL 5.5.20-log)
# Database: esper_prelive
# Generation Time: 2012-07-06 09:40:36 +0000
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
	(40,'EXPOSES',140,NULL,NULL,'/panel1 /panel2','QCM','PUMA','http://img401.imageshack.us/img401/3913/slide04.gif','http://img651.imageshack.us/img651/6998/slide1rw.gif','Clique sur l\'écran de ton choix'),
	(37,'EXPOSES',100,NULL,NULL,NULL,'DIALOG','Bienvenue','http://img262.imageshack.us/img262/6873/slide01.gif','http://img262.imageshack.us/img262/6873/slide01.gif','Merci de participer au 1er Mamba Lab ! Nous allons te poser quelques questions (environ 5mn). Complète l\'intégralité du questionnaire, gagne 100 000 vibes et participe au tirage au sort pour remporter un iPad ! C\'est parti !'),
	(36,'EXPOSES',105,NULL,NULL,'ready /panel1 /panel2','QCM','Clic sur Ready','http://img52.imageshack.us/img52/8902/slide1g.gif','http://img262.imageshack.us/img262/6873/slide01.gif','Clic sur  l\'écran pour démarrer'),
	(39,'EXPOSES',120,NULL,NULL,'fin /panel1 /panel2','OPEN','Cites les marques','http://img545.imageshack.us/img545/9379/slide02.gif','http://img6.imageshack.us/img6/7002/slide03.gif','Clic sur l\'écran qd tu aura terminé'),
	(35,'EXPOSES',130,NULL,NULL,'/panel1 /panel2','QCM','SFR','http://img401.imageshack.us/img401/3913/slide04.gif','http://img443.imageshack.us/img443/6392/slide07.gif','Clique sur l\'écran de ton choix'),
	(38,'EXPOSES',1000,NULL,NULL,'','DIALOG','Congrats','http://img194.imageshack.us/img194/8007/slide46.gif','http://img262.imageshack.us/img262/6873/slide01.gif','Merci'),
	(41,'EXPOSES',150,NULL,NULL,'/panel1 /panel2','QCM','DAILYMOTION','http://img401.imageshack.us/img401/3913/slide04.gif','http://img846.imageshack.us/img846/650/slide06.gif','Clique sur l\'écran de ton choix'),
	(42,'EXPOSES',160,NULL,NULL,'/panel1 /panel2','QCM','TraceTV','http://img401.imageshack.us/img401/3913/slide04.gif','http://img441.imageshack.us/img441/2354/slide10.gif','Clique sur l\'écran de ton choix'),
	(43,'EXPOSES',170,NULL,NULL,'/panel1 /panel2','QCM','CocaCola','http://img401.imageshack.us/img401/3913/slide04.gif','http://img850.imageshack.us/img850/1781/slide09.gif','Clique sur l\'écran de ton choix'),
	(44,'EXPOSES',180,NULL,NULL,'/panel1 /panel2','QCM','FNAC','http://img401.imageshack.us/img401/3913/slide04.gif','http://img717.imageshack.us/img717/7669/slide08.gif','Clique sur l\'écran de ton choix'),
	(45,'EXPOSES',190,NULL,NULL,'/panel1 /panel2','QCM','Avis SFR Innovante','http://img801.imageshack.us/img801/6330/slide2t.gif','http://img708.imageshack.us/img708/6330/slide2t.gif','Clique sur l\'écran de ton choix'),
	(47,'EXPOSES',200,NULL,NULL,'/panel1 /panel2','QCM','Avis SFR Cool','http://img801.imageshack.us/img801/6330/slide2t.gif','http://img402.imageshack.us/img402/5440/slide13o.gif','Clique sur l\'écran de ton choix'),
	(48,'EXPOSES',210,NULL,NULL,'/panel1 /panel2','QCM','Avis SFR Digne de confiance','http://img801.imageshack.us/img801/6330/slide2t.gif','http://img853.imageshack.us/img853/1340/slide14.gif','Clique sur l\'écran de ton choix'),
	(49,'EXPOSES',220,NULL,NULL,'/panel1 /panel2','QCM','Avis SFR Proche de mes attentes','http://img801.imageshack.us/img801/6330/slide2t.gif','http://img641.imageshack.us/img641/936/slide15.gif','Clique sur l\'écran de ton choix'),
	(50,'EXPOSES',230,NULL,NULL,'/panel1 /panel2','QCM','SFR Agora Winter X Games','http://img713.imageshack.us/img713/3060/slide19f.gif','http://img577.imageshack.us/img577/7949/slide20.gif','Clique sur l\'écran de ton choix'),
	(51,'EXPOSES',240,NULL,NULL,'/panel1 /panel2','QCM','SFR Rooftop','http://img3.imageshack.us/img3/1556/slide21e.gif','http://img27.imageshack.us/img27/7681/slide22.gif','Clique sur l\'écran de ton choix'),
	(52,'EXPOSES',250,NULL,NULL,'/panel1 /panel2','QCM','SFR Mambawood','http://img694.imageshack.us/img694/8029/slide27.gif','http://img502.imageshack.us/img502/4501/slide26.gif','Clique sur l\'écran de ton choix'),
	(53,'EXPOSES',260,NULL,NULL,'/panel1 /panel2','QCM','SFR Mamba stadium','http://img228.imageshack.us/img228/8103/slide23.gif','http://img502.imageshack.us/img502/2898/slide24.gif','Clique sur l\'écran de ton choix'),
	(55,'EXPOSES',270,NULL,NULL,'/panel1 /panel2','QCM','SFR Messagerie','http://img444.imageshack.us/img444/6513/slide8.gif','http://img853.imageshack.us/img853/7463/slide28.gif','Clique sur l\'écran de ton choix'),
	(58,'EXPOSES',290,NULL,NULL,'1 2 3 4','QCM','Plaisir à retourner room SFR','http://img850.imageshack.us/img850/2505/slide31.gif','http://img528.imageshack.us/img528/4440/slide32.gif','Réponds par 1, 2, 3 ou 4'),
	(57,'EXPOSES',280,NULL,NULL,'1 2 3 4','QCM','Originalite','http://img163.imageshack.us/img163/4527/slide29y.gif','http://img28.imageshack.us/img28/6295/slide30.gif','Réponds par 1, 2, 3 ou 4'),
	(59,'EXPOSES',300,NULL,NULL,'/panel1 /panel2','QCM','Transition','http://img88.imageshack.us/img88/848/slide33.gif','http://img820.imageshack.us/img820/4121/slide34v.gif','Clique sur l\'écran pour passer'),
	(60,'EXPOSES',310,NULL,NULL,'1 2 3','QCM','Sponsorisation Winter XGames','http://img256.imageshack.us/img256/5299/slide3h.gif','http://img4.imageshack.us/img4/3817/slide35.gif','Réponds par 1, 2 ou 3'),
	(61,'EXPOSES',320,NULL,NULL,'1 2 3','QCM','Sponsorisation Cinema','http://img152.imageshack.us/img152/5047/slide36c.gif','http://img29.imageshack.us/img29/5204/slide6.gif','Réponds par 1, 2 ou 3'),
	(62,'EXPOSES',330,NULL,NULL,'1 2 3','QCM','Espace Rooftop','http://img440.imageshack.us/img440/7080/slide4.gif','http://img825.imageshack.us/img825/4087/slide38.gif','Réponds par 1, 2 ou 3'),
	(63,'EXPOSES',340,NULL,NULL,'1 2 3','QCM','Espace Stadium','http://img840.imageshack.us/img840/1466/slide37.gif','http://img407.imageshack.us/img407/7796/slide5.gif','Réponds par 1, 2 ou 3'),
	(64,'EXPOSES',350,NULL,NULL,'1 2 3','QCM','Messagerie','http://img52.imageshack.us/img52/3064/slide7w.gif','http://img13.imageshack.us/img13/5779/slide39.gif','Réponds par 1, 2 ou 3'),
	(65,'EXPOSES',360,NULL,NULL,'1 2 3 4 5','QCM','Intégration Marque','http://img844.imageshack.us/img844/9262/slide40.gif','http://img801.imageshack.us/img801/2239/slide41.gif','Réponds par 1, 2, 3, 4 ou 5'),
	(66,'EXPOSES',370,NULL,NULL,'1 2 3 4 5','QCM','Page Facebook','http://img528.imageshack.us/img528/7825/slide42.gif','http://img404.imageshack.us/img404/8/slide43.gif','Réponds par 1, 2 ou 3'),
	(67,'EXPOSES',380,NULL,NULL,'1 2 3 4 5 6','QCM','Operateur','http://img528.imageshack.us/img528/8044/slide44.gif','http://img220.imageshack.us/img220/8933/slide45.gif','Réponds par 1, 2, 3, 4 ou 5'),
	(75,'NONEXPOSED',100,NULL,NULL,NULL,'DIALOG','Bienvenue','http://img262.imageshack.us/img262/6873/slide01.gif','http://img262.imageshack.us/img262/6873/slide01.gif','Merci de participer au 1er Mamba Lab ! Nous allons te poser quelques questions (environ 5mn). Complète l\'intégralité du questionnaire, gagne 100 000 vibes et participe au tirage au sort pour remporter un iPad ! C\'est parti !'),
	(76,'NONEXPOSED',105,NULL,NULL,'/panel1 /panel2','QCM','Clic sur Ready','http://img52.imageshack.us/img52/8902/slide1g.gif','http://img262.imageshack.us/img262/6873/slide01.gif','Clic sur  l\'écran pour démarrer'),
	(108,'EXPOSES',-1,NULL,NULL,NULL,'DIALOG','Timeout','http://img262.imageshack.us/img262/6873/slide01.gif','http://img262.imageshack.us/img262/6873/slide01.gif','La session est expirée, relance Mamba Lab pour gagner 100 000 vibes et participer au tirage au sort pour remporter un iPad'),
	(109,'EXPOSES',-2,NULL,NULL,NULL,'DIALOG','Already Done','http://img267.imageshack.us/img267/4886/slide1j.gif','http://img262.imageshack.us/img262/6873/slide01.gif','Tu as déjà participé au Mamba Lab.'),
	(110,'NONEXPOSED',-1,NULL,NULL,NULL,'DIALOG','Timeout','http://img262.imageshack.us/img262/6873/slide01.gif','http://img262.imageshack.us/img262/6873/slide01.gif','La session est expirée, relance Mamba Lab pour gagner 100 000 vibes et participer au tirage au sort pour remporter un iPad'),
	(111,'NONEXPOSED',-2,NULL,NULL,NULL,'DIALOG','Already Done','http://img267.imageshack.us/img267/4886/slide1j.gif','http://img262.imageshack.us/img262/6873/slide01.gif','Tu as déjà participé au Mamba Lab.'),
	(79,'NONEXPOSED',1000,NULL,NULL,'','DIALOG','Congrats','http://img194.imageshack.us/img194/8007/slide46.gif','http://img262.imageshack.us/img262/6873/slide01.gif','Merci'),
	(84,'NONEXPOSED',190,NULL,NULL,'/panel1 /panel2','QCM','Avis SFR Innovante','http://img801.imageshack.us/img801/6330/slide2t.gif','http://img708.imageshack.us/img708/6330/slide2t.gif','Clique sur l\'écran de ton choix'),
	(85,'NONEXPOSED',200,NULL,NULL,'/panel1 /panel2','QCM','Avis SFR Cool','http://img801.imageshack.us/img801/6330/slide2t.gif','http://img402.imageshack.us/img402/5440/slide13o.gif','Clique sur l\'écran de ton choix'),
	(86,'NONEXPOSED',210,NULL,NULL,'/panel1 /panel2','QCM','Avis SFR Digne de confiance','http://img801.imageshack.us/img801/6330/slide2t.gif','http://img853.imageshack.us/img853/1340/slide14.gif','Clique sur l\'écran de ton choix'),
	(87,'NONEXPOSED',220,NULL,NULL,'/panel1 /panel2','QCM','Avis SFR Proche de mes attentes','http://img801.imageshack.us/img801/6330/slide2t.gif','http://img641.imageshack.us/img641/936/slide15.gif','Clique sur l\'écran de ton choix'),
	(94,'NONEXPOSED',280,NULL,NULL,'/panel1 /panel2','QCM','Transition','http://img88.imageshack.us/img88/848/slide33.gif','http://img820.imageshack.us/img820/4121/slide34v.gif','Clique sur l\'écran'),
	(96,'NONEXPOSED',310,NULL,NULL,'1 2 3','QCM','Sponsorisation Winter XGames','http://img256.imageshack.us/img256/5299/slide3h.gif','http://img4.imageshack.us/img4/3817/slide35.gif','Réponds par 1, 2 ou 3'),
	(97,'NONEXPOSED',320,NULL,NULL,'1 2 3','QCM','Sponsorisation Cinema','http://img152.imageshack.us/img152/5047/slide36c.gif','http://img29.imageshack.us/img29/5204/slide6.gif','Réponds par 1, 2 ou 3'),
	(98,'NONEXPOSED',330,NULL,NULL,'1 2 3','QCM','Espace Rooftop','http://img440.imageshack.us/img440/7080/slide4.gif','http://img825.imageshack.us/img825/4087/slide38.gif','Réponds par 1, 2 ou 3'),
	(99,'NONEXPOSED',340,NULL,NULL,'1 2 3','QCM','Espace Stadium','http://img840.imageshack.us/img840/1466/slide37.gif','http://img407.imageshack.us/img407/7796/slide5.gif','Réponds par 1, 2 ou 3'),
	(100,'NONEXPOSED',350,NULL,NULL,'1 2 3','QCM','Messagerie','http://img52.imageshack.us/img52/3064/slide7w.gif','http://img13.imageshack.us/img13/5779/slide39.gif','Réponds par 1, 2 ou 3'),
	(101,'NONEXPOSED',360,NULL,NULL,'1 2 3 4 5','QCM','Intégration Marque','http://img844.imageshack.us/img844/9262/slide40.gif','http://img801.imageshack.us/img801/2239/slide41.gif','Réponds par 1, 2, 3, 4 ou 5'),
	(102,'NONEXPOSED',370,NULL,NULL,'1 2 3 4 5','QCM','Page Facebook','http://img528.imageshack.us/img528/7825/slide42.gif','http://img404.imageshack.us/img404/8/slide43.gif','Réponds par 1, 2 ou 3'),
	(103,'NONEXPOSED',390,NULL,NULL,'1 2 3 4 5 6','QCM','Operateur','http://img528.imageshack.us/img528/8044/slide44.gif','http://img220.imageshack.us/img220/8933/slide45.gif','Réponds par 1, 2, 3, 4, 5 ou 6');

/*!40000 ALTER TABLE `quizz` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table room_quizz
# ------------------------------------------------------------

DROP TABLE IF EXISTS `room_quizz`;

CREATE TABLE `room_quizz` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `quizz_id` varchar(255) DEFAULT NULL,
  `room_name` varchar(255) DEFAULT NULL,
  `activated` int(11) DEFAULT NULL,
  `panel1_code` varchar(255) DEFAULT NULL,
  `panel2_code` varchar(255) DEFAULT NULL,
  `room_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

LOCK TABLES `room_quizz` WRITE;
/*!40000 ALTER TABLE `room_quizz` DISABLE KEYS */;

INSERT INTO `room_quizz` (`id`, `quizz_id`, `room_name`, `activated`, `panel1_code`, `panel2_code`, `room_id`)
VALUES
	(5,'NONEXPOSED','mambalab',1,'panel_mambalab01','panel_mambalab02',46),
	(3,'EXPOSES','mambalabB',1,'panel_mambalab01','panel_mambalab02',48);

/*!40000 ALTER TABLE `room_quizz` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

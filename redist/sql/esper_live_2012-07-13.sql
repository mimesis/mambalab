# ************************************************************
# Sequel Pro SQL dump
# Version 3408
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: groupm.caqjxg9bpn6g.eu-west-1.rds.amazonaws.com (MySQL 5.5.20-log)
# Database: esper_live
# Generation Time: 2012-07-13 08:01:00 +0000
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
	(137,'EXPOSES',15,360,'2','2',1,'2012-07-13 07:50:24','2012-07-13 07:50:24'),
	(34,'NONEXPOSED',11,190,'/panel1','/panel1',1,'2012-07-12 16:13:29','2012-07-12 16:13:29'),
	(33,'NONEXPOSED',11,105,'/panel1','/panel1',1,'2012-07-12 16:13:25','2012-07-12 16:13:25'),
	(32,'NONEXPOSED',11,100,'OK','OK',1,'2012-07-12 16:13:21','2012-07-12 16:13:21'),
	(136,'EXPOSES',15,350,'2','2',1,'2012-07-13 07:50:22','2012-07-13 07:50:22'),
	(135,'EXPOSES',15,340,'1','1',1,'2012-07-13 07:50:21','2012-07-13 07:50:21'),
	(134,'EXPOSES',15,330,'3','3',1,'2012-07-13 07:50:19','2012-07-13 07:50:19'),
	(131,'EXPOSES',15,300,'/panel2','2|3|/panel2',3,'2012-07-13 07:50:12','2012-07-13 07:50:12'),
	(132,'EXPOSES',15,310,'1','1',1,'2012-07-13 07:50:15','2012-07-13 07:50:15'),
	(133,'EXPOSES',15,320,'2','2',1,'2012-07-13 07:50:17','2012-07-13 07:50:17'),
	(129,'EXPOSES',15,280,'/panel2','/panel2',1,'2012-07-13 07:49:59','2012-07-13 07:49:59'),
	(79,'NONEXPOSED',15,220,'/panel1','/panel1',1,'2012-07-12 19:17:29','2012-07-12 19:17:29'),
	(80,'NONEXPOSED',15,280,'/panel2','/panel2',1,'2012-07-12 19:17:31','2012-07-12 19:17:31'),
	(17,'NONEXPOSED',176957,100,'OK','OK',1,'2012-07-12 14:38:48','2012-07-12 14:38:48'),
	(18,'EXPOSES',11,100,'OK','OK',1,'2012-07-12 16:06:35','2012-07-12 16:06:35'),
	(19,'EXPOSES',11,105,'/panel2','*|*|*|*|*|/panel2',1,'2012-07-12 16:09:10','2012-07-12 16:09:10'),
	(20,'EXPOSES',11,120,'/panel2','sfr|/panel2',2,'2012-07-12 16:10:11','2012-07-12 16:10:11'),
	(21,'EXPOSES',11,130,'/panel2','/panel2',1,'2012-07-12 16:10:15','2012-07-12 16:10:15'),
	(36,'NONEXPOSED',11,200,'/panel2','/panel2',1,'2012-07-12 16:13:31','2012-07-12 16:13:31'),
	(37,'NONEXPOSED',11,210,'/panel1','/panel1',1,'2012-07-12 16:13:33','2012-07-12 16:13:33'),
	(38,'NONEXPOSED',11,220,'/panel2','/panel2',1,'2012-07-12 16:13:35','2012-07-12 16:13:35'),
	(78,'NONEXPOSED',15,210,'/panel2','/panel2',1,'2012-07-12 19:17:25','2012-07-12 19:17:25'),
	(40,'NONEXPOSED',11,280,'/panel2','/panel2',1,'2012-07-12 16:13:39','2012-07-12 16:13:39'),
	(77,'NONEXPOSED',15,200,'/panel2','/panel2',1,'2012-07-12 19:17:22','2012-07-12 19:17:22'),
	(44,'NONEXPOSED',11,310,'1','1',1,'2012-07-12 16:13:50','2012-07-12 16:13:50'),
	(76,'NONEXPOSED',15,190,'/panel2','/panel2',1,'2012-07-12 19:17:17','2012-07-12 19:17:17'),
	(46,'NONEXPOSED',11,320,'2','2',1,'2012-07-12 16:13:54','2012-07-12 16:13:54'),
	(49,'NONEXPOSED',11,330,'3','3',1,'2012-07-12 16:14:00','2012-07-12 16:14:00'),
	(50,'NONEXPOSED',11,340,'3','3',1,'2012-07-12 16:14:09','2012-07-12 16:14:09'),
	(51,'NONEXPOSED',11,350,'2','2',1,'2012-07-12 16:14:14','2012-07-12 16:14:14'),
	(52,'NONEXPOSED',11,360,'1','1',1,'2012-07-12 16:14:22','2012-07-12 16:14:22'),
	(53,'NONEXPOSED',11,370,'2','2',1,'2012-07-12 16:14:26','2012-07-12 16:14:26'),
	(54,'NONEXPOSED',11,390,'2','2',1,'2012-07-12 16:14:30','2012-07-12 16:14:30'),
	(55,'NONEXPOSED',11,1000,'OK','OK',1,'2012-07-12 16:14:30','2012-07-12 16:14:30'),
	(75,'NONEXPOSED',15,105,'/panel1','/panel1',1,'2012-07-12 19:17:11','2012-07-12 19:17:11'),
	(74,'NONEXPOSED',15,100,'OK','OK',1,'2012-07-12 19:17:07','2012-07-12 19:17:07'),
	(130,'EXPOSES',15,290,'1','1',1,'2012-07-13 07:50:05','2012-07-13 07:50:05'),
	(128,'EXPOSES',15,270,'/panel2','/panel2',1,'2012-07-13 07:49:57','2012-07-13 07:49:57'),
	(127,'EXPOSES',15,260,'/panel1','/panel1',1,'2012-07-13 07:49:55','2012-07-13 07:49:55'),
	(126,'EXPOSES',15,250,'/panel2','/panel2',1,'2012-07-13 07:49:53','2012-07-13 07:49:53'),
	(125,'EXPOSES',15,240,'/panel1','/panel1',1,'2012-07-13 07:49:52','2012-07-13 07:49:52'),
	(124,'EXPOSES',15,230,'/panel2','/panel2',1,'2012-07-13 07:49:50','2012-07-13 07:49:50'),
	(123,'EXPOSES',15,220,'/panel1','/panel1',1,'2012-07-13 07:49:43','2012-07-13 07:49:43'),
	(122,'EXPOSES',15,210,'/panel2','/panel2',1,'2012-07-13 07:49:42','2012-07-13 07:49:42'),
	(121,'EXPOSES',15,200,'/panel1','/panel1',1,'2012-07-13 07:49:41','2012-07-13 07:49:41'),
	(120,'EXPOSES',15,190,'/panel2','/panel2',1,'2012-07-13 07:49:39','2012-07-13 07:49:39'),
	(119,'EXPOSES',15,180,'/panel1','/panel1',1,'2012-07-13 07:49:37','2012-07-13 07:49:37'),
	(118,'EXPOSES',15,170,'/panel2','/panel2',1,'2012-07-13 07:49:35','2012-07-13 07:49:35'),
	(117,'EXPOSES',15,160,'/panel1','/panel1',1,'2012-07-13 07:49:34','2012-07-13 07:49:34'),
	(116,'EXPOSES',15,150,'/panel2','/panel2',1,'2012-07-13 07:49:32','2012-07-13 07:49:32'),
	(115,'EXPOSES',15,140,'/panel1','/panel1',1,'2012-07-13 07:49:30','2012-07-13 07:49:30'),
	(114,'EXPOSES',15,130,'/panel1','/panel1',1,'2012-07-13 07:49:28','2012-07-13 07:49:28'),
	(113,'EXPOSES',15,120,'/panel2','puma|sfr|toto|/panel2',4,'2012-07-13 07:49:26','2012-07-13 07:49:26'),
	(112,'EXPOSES',15,105,'/panel2','/panel2',1,'2012-07-13 07:49:17','2012-07-13 07:49:17'),
	(111,'EXPOSES',15,100,'OK','OK',1,'2012-07-13 07:49:11','2012-07-13 07:49:11'),
	(138,'EXPOSES',15,370,'1','1',1,'2012-07-13 07:50:26','2012-07-13 07:50:26'),
	(139,'EXPOSES',15,380,'2','2',1,'2012-07-13 07:50:28','2012-07-13 07:50:28'),
	(140,'EXPOSES',15,1000,'OK','OK',1,'2012-07-13 07:50:28','2012-07-13 07:50:28');

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
	(40,'EXPOSES',140,NULL,NULL,'/panel1 /panel2','QCM','PUMA','http://img820.imageshack.us/img820/9379/slide02.gif','http://img580.imageshack.us/img580/7965/slide03z.gif','Clique sur l\'écran de ton choix'),
	(37,'EXPOSES',100,NULL,NULL,NULL,'DIALOG','Bienvenue','http://img262.imageshack.us/img262/6873/slide01.gif','http://img262.imageshack.us/img262/6873/slide01.gif','Merci de participer au 1er Mamba Lab ! Nous allons te poser quelques questions (environ 5mn). Complète l\'intégralité du questionnaire, gagne 100 000 vibes et participe au tirage au sort pour remporter un iPad ! C\'est parti !'),
	(36,'EXPOSES',105,NULL,NULL,'ready /panel1 /panel2','QCM','Clic sur Ready','http://img812.imageshack.us/img812/7002/slide03.gif','http://img262.imageshack.us/img262/6873/slide01.gif','Clique sur  l\'écran pour démarrer'),
	(39,'EXPOSES',120,NULL,NULL,'fin /panel1 /panel2','OPEN','Cites les marques','http://img600.imageshack.us/img600/6873/slide01.gif','http://img32.imageshack.us/img32/6928/slide05.gif','Clique sur l\'écran quand tu auras terminé'),
	(35,'EXPOSES',130,NULL,NULL,'/panel1 /panel2','QCM','SFR','http://img820.imageshack.us/img820/9379/slide02.gif','http://img694.imageshack.us/img694/6928/slide05.gif','Clique sur l\'écran de ton choix'),
	(38,'EXPOSES',1000,NULL,NULL,'','DIALOG','Congrats','http://img839.imageshack.us/img839/848/slide33.gif','http://img31.imageshack.us/img31/6853/slide34.gif','Merci'),
	(41,'EXPOSES',150,NULL,NULL,'/panel1 /panel2','QCM','DAILYMOTION','http://img820.imageshack.us/img820/9379/slide02.gif','http://img193.imageshack.us/img193/3913/slide04.gif','Clique sur l\'écran de ton choix'),
	(42,'EXPOSES',160,NULL,NULL,'/panel1 /panel2','QCM','TraceTV','http://img820.imageshack.us/img820/9379/slide02.gif','http://img88.imageshack.us/img88/3913/slide04.gif','Clique sur l\'écran de ton choix'),
	(43,'EXPOSES',170,NULL,NULL,'/panel1 /panel2','QCM','CocaCola','http://img820.imageshack.us/img820/9379/slide02.gif','http://img440.imageshack.us/img440/6392/slide07.gif','Clique sur l\'écran de ton choix'),
	(44,'EXPOSES',180,NULL,NULL,'/panel1 /panel2','QCM','FNAC','http://img820.imageshack.us/img820/9379/slide02.gif','http://img32.imageshack.us/img32/650/slide06.gif','Clique sur l\'écran de ton choix'),
	(45,'EXPOSES',190,NULL,NULL,'/panel1 /panel2','QCM','Avis SFR Innovante','http://img856.imageshack.us/img856/7669/slide08.gif','http://img339.imageshack.us/img339/1781/slide09.gif','Clique sur l\'écran de ton choix'),
	(47,'EXPOSES',200,NULL,NULL,'/panel1 /panel2','QCM','Avis SFR Cool','http://img856.imageshack.us/img856/7669/slide08.gif','http://img546.imageshack.us/img546/2354/slide10.gif','Clique sur l\'écran de ton choix'),
	(48,'EXPOSES',210,NULL,NULL,'/panel1 /panel2','QCM','Avis SFR Digne de confiance','http://img856.imageshack.us/img856/7669/slide08.gif','http://img72.imageshack.us/img72/9160/slide11v.gif','Clique sur l\'écran de ton choix'),
	(49,'EXPOSES',220,NULL,NULL,'/panel1 /panel2','QCM','Avis SFR Proche de mes attentes','http://img856.imageshack.us/img856/7669/slide08.gif','http://img444.imageshack.us/img444/9837/slide12.gif','Clique sur l\'écran de ton choix'),
	(50,'EXPOSES',230,NULL,NULL,'/panel1 /panel2','QCM','SFR Agora Winter X Games','http://img411.imageshack.us/img411/6435/slide13.gif','http://img820.imageshack.us/img820/1340/slide14.gif','Clique sur l\'écran de ton choix'),
	(51,'EXPOSES',240,NULL,NULL,'/panel1 /panel2','QCM','SFR Rooftop','http://img411.imageshack.us/img411/6435/slide13.gif','http://img843.imageshack.us/img843/7391/slide15a.gif','Clique sur l\'écran de ton choix'),
	(52,'EXPOSES',250,NULL,NULL,'/panel1 /panel2','QCM','SFR Mambawood','http://img411.imageshack.us/img411/6435/slide13.gif','http://img853.imageshack.us/img853/8559/slide17.gif','Clique sur l\'écran de ton choix'),
	(53,'EXPOSES',260,NULL,NULL,'/panel1 /panel2','QCM','SFR Mamba stadium','http://img411.imageshack.us/img411/6435/slide13.gif','http://img705.imageshack.us/img705/3641/slide16.gif','Clique sur l\'écran de ton choix'),
	(55,'EXPOSES',270,NULL,NULL,'/panel1 /panel2','QCM','SFR Messagerie','http://img411.imageshack.us/img411/6435/slide13.gif','http://img23.imageshack.us/img23/1514/slide18.gif','Clique sur l\'écran de ton choix'),
	(58,'EXPOSES',290,NULL,NULL,'1 2 3','QCM','Plaisir à retourner room SFR','http://img195.imageshack.us/img195/834/slide21k.gif','http://img853.imageshack.us/img853/7681/slide22.gif','Réponds par 1, 2 ou 3 dans la barre de chat'),
	(57,'EXPOSES',280,NULL,NULL,'/panel1 /panel2','QCM','Originalite','http://img32.imageshack.us/img32/9410/slide20t.gif','http://img43.imageshack.us/img43/8756/slide20f.gif','Clique sur l\'écran de ton choix'),
	(59,'EXPOSES',300,NULL,NULL,'/panel1 /panel2','QCM','Transition','http://img155.imageshack.us/img155/8103/slide23.gif','http://img543.imageshack.us/img543/2898/slide24.gif','Clique sur l\'écran pour passer'),
	(60,'EXPOSES',310,NULL,NULL,'1 2 3','QCM','Sponsorisation Winter XGames','http://img256.imageshack.us/img256/5299/slide3h.gif','http://img16.imageshack.us/img16/7463/slide28.gif','Réponds par 1, 2 ou 3 dans la barre de chat'),
	(61,'EXPOSES',320,NULL,NULL,'1 2 3','QCM','Sponsorisation Cinema','http://img29.imageshack.us/img29/5204/slide6.gif','http://img16.imageshack.us/img16/7463/slide28.gif','Réponds par 1, 2 ou 3 dans la barre de chat'),
	(62,'EXPOSES',330,NULL,NULL,'1 2 3','QCM','Espace Rooftop','http://img194.imageshack.us/img194/2382/slide36.gif','http://img16.imageshack.us/img16/7463/slide28.gif','Réponds par 1, 2 ou 3 dans la barre de chat'),
	(63,'EXPOSES',340,NULL,NULL,'1 2 3','QCM','Espace Stadium','http://img826.imageshack.us/img826/3817/slide35.gif','http://img16.imageshack.us/img16/7463/slide28.gif','Réponds par 1, 2 ou 3 dans la barre de chat'),
	(64,'EXPOSES',350,NULL,NULL,'1 2 3','QCM','Messagerie','http://img845.imageshack.us/img845/1466/slide37.gif','http://img16.imageshack.us/img16/7463/slide28.gif','Réponds par 1, 2 ou 3 dans la barre de chat'),
	(65,'EXPOSES',360,NULL,NULL,'1 2 3 4','QCM','Intégration Marque','http://img834.imageshack.us/img834/8029/slide27.gif','http://img220.imageshack.us/img220/8029/slide27.gif','Réponds par 1, 2, 3 ou 4 dans la barre de chat'),
	(66,'EXPOSES',370,NULL,NULL,'1 2 3','QCM','Page Facebook','http://img837.imageshack.us/img837/2505/slide31.gif','http://img43.imageshack.us/img43/3450/slide29w.gif','Réponds par 1, 2 ou 3 dans la barre de chat'),
	(67,'EXPOSES',380,NULL,NULL,'1 2 3 4 5 6','QCM','Operateur','http://img818.imageshack.us/img818/848/slide33.gif','http://img59.imageshack.us/img59/6853/slide34.gif','Réponds par 1, 2, 3, 4, 5 ou 6 dans la barre de chat'),
	(75,'NONEXPOSED',100,NULL,NULL,NULL,'DIALOG','Bienvenue','http://img262.imageshack.us/img262/6873/slide01.gif','http://img262.imageshack.us/img262/6873/slide01.gif','Merci de participer au 1er Mamba Lab ! Nous allons te poser quelques questions (environ 5mn). Complète l\'intégralité du questionnaire, gagne 100 000 vibes et participe au tirage au sort pour remporter un iPad ! C\'est parti !'),
	(76,'NONEXPOSED',105,NULL,NULL,'/panel1 /panel2','QCM','Clic sur Ready','http://img52.imageshack.us/img52/8902/slide1g.gif','http://img262.imageshack.us/img262/6873/slide01.gif','Clique sur  l\'écran pour démarrer'),
	(108,'EXPOSES',-1,NULL,NULL,NULL,'DIALOG','Timeout','http://img262.imageshack.us/img262/6873/slide01.gif','http://img262.imageshack.us/img262/6873/slide01.gif','La session est expirée, relance Mamba Lab pour gagner 100 000 vibes et participer au tirage au sort pour remporter un iPad'),
	(109,'EXPOSES',-2,NULL,NULL,NULL,'DIALOG','Already Done','http://img337.imageshack.us/img337/9379/slide02.gif','http://img262.imageshack.us/img262/6873/slide01.gif','Tu as déjà participé au Mamba Lab.'),
	(110,'NONEXPOSED',-1,NULL,NULL,NULL,'DIALOG','Timeout','http://img262.imageshack.us/img262/6873/slide01.gif','http://img262.imageshack.us/img262/6873/slide01.gif','La session est expirée, relance Mamba Lab pour gagner 100 000 vibes et participer au tirage au sort pour remporter un iPad'),
	(111,'NONEXPOSED',-2,NULL,NULL,NULL,'DIALOG','Already Done','http://img337.imageshack.us/img337/9379/slide02.gif','http://img262.imageshack.us/img262/6873/slide01.gif','Tu as déjà participé au Mamba Lab.'),
	(79,'NONEXPOSED',1000,NULL,NULL,'','DIALOG','Congrats','http://img839.imageshack.us/img839/848/slide33.gif','http://img31.imageshack.us/img31/6853/slide34.gif','Merci'),
	(84,'NONEXPOSED',190,NULL,NULL,'/panel1 /panel2','QCM','Avis SFR Innovante','http://img856.imageshack.us/img856/7669/slide08.gif','http://img339.imageshack.us/img339/1781/slide09.gif','Clique sur l\'écran de ton choix'),
	(85,'NONEXPOSED',200,NULL,NULL,'/panel1 /panel2','QCM','Avis SFR Cool','http://img856.imageshack.us/img856/7669/slide08.gif','http://img546.imageshack.us/img546/2354/slide10.gif','Clique sur l\'écran de ton choix'),
	(86,'NONEXPOSED',210,NULL,NULL,'/panel1 /panel2','QCM','Avis SFR Digne de confiance','http://img856.imageshack.us/img856/7669/slide08.gif','http://img72.imageshack.us/img72/9160/slide11v.gif','Clique sur l\'écran de ton choix'),
	(87,'NONEXPOSED',220,NULL,NULL,'/panel1 /panel2','QCM','Avis SFR Proche de mes attentes','http://img856.imageshack.us/img856/7669/slide08.gif','http://img444.imageshack.us/img444/9837/slide12.gif','Clique sur l\'écran de ton choix'),
	(94,'NONEXPOSED',280,NULL,NULL,'/panel1 /panel2','QCM','Transition','http://img155.imageshack.us/img155/8103/slide23.gif','http://img543.imageshack.us/img543/2898/slide24.gif','Clique sur l\'écran'),
	(96,'NONEXPOSED',310,NULL,NULL,'1 2 3','QCM','Sponsorisation Winter XGames','http://img256.imageshack.us/img256/5299/slide3h.gif','http://img16.imageshack.us/img16/7463/slide28.gif','Réponds par 1, 2 ou 3 dans la barre de chat'),
	(97,'NONEXPOSED',320,NULL,NULL,'1 2 3','QCM','Sponsorisation Cinema','http://img29.imageshack.us/img29/5204/slide6.gif','http://img16.imageshack.us/img16/7463/slide28.gif','Réponds par 1, 2 ou 3 dans la barre de chat'),
	(98,'NONEXPOSED',330,NULL,NULL,'1 2 3','QCM','Espace Rooftop','http://img194.imageshack.us/img194/2382/slide36.gif','http://img16.imageshack.us/img16/7463/slide28.gif','Réponds par 1, 2 ou 3 dans la barre de chat'),
	(99,'NONEXPOSED',340,NULL,NULL,'1 2 3','QCM','Espace Stadium','http://img826.imageshack.us/img826/3817/slide35.gif','http://img16.imageshack.us/img16/7463/slide28.gif','Réponds par 1, 2 ou 3 dans la barre de chat'),
	(100,'NONEXPOSED',350,NULL,NULL,'1 2 3','QCM','Messagerie','http://img845.imageshack.us/img845/1466/slide37.gif','http://img16.imageshack.us/img16/7463/slide28.gif','Réponds par 1, 2 ou 3 dans la barre de chat'),
	(101,'NONEXPOSED',360,NULL,NULL,'1 2 3 4','QCM','Intégration Marque','http://img534.imageshack.us/img534/5254/slide29.gif','http://img220.imageshack.us/img220/8029/slide27.gif','Réponds par 1, 2, 3 ou 4 dans la barre de chat'),
	(102,'NONEXPOSED',370,NULL,NULL,'1 2 3','QCM','Page Facebook','http://img837.imageshack.us/img837/2505/slide31.gif','http://img43.imageshack.us/img43/3450/slide29w.gif','Réponds par 1, 2 ou 3 dans la barre de chat'),
	(103,'NONEXPOSED',390,NULL,NULL,'1 2 3 4 5 6','QCM','Operateur','http://img818.imageshack.us/img818/848/slide33.gif','http://img59.imageshack.us/img59/6853/slide34.gif','Réponds par 1, 2, 3, 4, 5 ou 6 dans la barre de chat');

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
	(5,'NONEXPOSED','mambalab',1,'panel_mambalab01','panel_mambalab02',21968),
	(3,'EXPOSES','mambalabB',1,'panel_mambalab01','panel_mambalab02',23103);

/*!40000 ALTER TABLE `room_quizz` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

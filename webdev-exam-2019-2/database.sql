-- MySQL dump 10.13  Distrib 5.7.28, for Linux (x86_64)
--
-- Host: std-mysql    Database: std_868
-- ------------------------------------------------------
-- Server version	5.7.26-0ubuntu0.16.04.1

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
-- Table structure for table `PEOPLE`
--

DROP TABLE IF EXISTS `PEOPLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PEOPLE` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_n` varchar(50) NOT NULL,
  `first_n` varchar(50) NOT NULL,
  `middle_n` varchar(50) NOT NULL,
  `birthdate` date NOT NULL,
  `sex` varchar(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PEOPLE`
--

LOCK TABLES `PEOPLE` WRITE;
/*!40000 ALTER TABLE `PEOPLE` DISABLE KEYS */;
INSERT INTO `PEOPLE` VALUES (1,'Иванов','Иван','Иванович','1976-05-15','м'),(2,'Иванова','Нина','Сергеевна','1978-08-11','ж');
/*!40000 ALTER TABLE `PEOPLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PEOPLE_POST`
--

DROP TABLE IF EXISTS `PEOPLE_POST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PEOPLE_POST` (
  `person_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `salary` int(11) NOT NULL,
  KEY `fk_post_id` (`post_id`),
  KEY `fk_people_id` (`person_id`),
  CONSTRAINT `fk_people_id` FOREIGN KEY (`person_id`) REFERENCES `PEOPLE` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_post_id` FOREIGN KEY (`post_id`) REFERENCES `POST` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PEOPLE_POST`
--

LOCK TABLES `PEOPLE_POST` WRITE;
/*!40000 ALTER TABLE `PEOPLE_POST` DISABLE KEYS */;
INSERT INTO `PEOPLE_POST` VALUES (1,1,8000),(2,2,11000);
/*!40000 ALTER TABLE `PEOPLE_POST` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `POST`
--

DROP TABLE IF EXISTS `POST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `POST` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `short_name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `POST`
--

LOCK TABLES `POST` WRITE;
/*!40000 ALTER TABLE `POST` DISABLE KEYS */;
INSERT INTO `POST` VALUES (1,'Менеджер ','NULL'),(2,'Администратор','NULL');
/*!40000 ALTER TABLE `POST` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appeal`
--

DROP TABLE IF EXISTS `appeal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appeal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `user` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `status` int(11) DEFAULT NULL,
  `message` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `type` (`type`),
  KEY `user` (`user`),
  CONSTRAINT `appeal_ibfk_1` FOREIGN KEY (`status`) REFERENCES `status` (`id`),
  CONSTRAINT `appeal_ibfk_2` FOREIGN KEY (`type`) REFERENCES `type of treatment` (`id`),
  CONSTRAINT `appeal_ibfk_3` FOREIGN KEY (`user`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appeal`
--

LOCK TABLES `appeal` WRITE;
/*!40000 ALTER TABLE `appeal` DISABLE KEYS */;
INSERT INTO `appeal` VALUES (1,'2020-01-25',23,1,1,'sadafafasfasfasfasfasfasfasfsafasadafafasfasfasfasfasfasfasfsafasadafafasfasfasfasfasfasfasfsafasadafafasfasfasfasfasfasfasfsafasadafafasfasfasfasfasfasfasfsafasadafafasfasfasfasfasfasfasfsafasadafafasfasfasfasfasfasfasfsafasadafafasfasfasfasfasfasfasfsafasadafafasfasfasfasfasfasfasfsafasadafafasfasfasfasfasfasfasfsafasadafafasfasfasfasfasfasfasfsafa');
/*!40000 ALTER TABLE `appeal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_description`
--

DROP TABLE IF EXISTS `category_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category_description` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) DEFAULT NULL,
  `position` decimal(3,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_description`
--

LOCK TABLES `category_description` WRITE;
/*!40000 ALTER TABLE `category_description` DISABLE KEYS */;
INSERT INTO `category_description` VALUES (1,'Food',1.00),(2,'textile',2.00),(3,'hygiene_products',3.00),(4,'Appliances',4.00),(5,'medical_preparations',5.00),(6,'furniture',6.00),(7,'taburet',6.10),(8,'table',6.20);
/*!40000 ALTER TABLE `category_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clients_description`
--

DROP TABLE IF EXISTS `clients_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clients_description` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) DEFAULT NULL,
  `phone_number` varchar(30) DEFAULT NULL,
  `home_address` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients_description`
--

LOCK TABLES `clients_description` WRITE;
/*!40000 ALTER TABLE `clients_description` DISABLE KEYS */;
INSERT INTO `clients_description` VALUES (1,'Ivan Ivanov','888888888888','Russia,Moscow','ivan@gmail.com'),(2,'Sidirov Sidr','777777777777','Russia,Bryansk','sidr@mail.ru'),(3,'Greg Grigory','666666666666','Russia, Moscow','greg@ya.ru'),(4,'Maks Maksimov','5555555555555','Russia,Belgorod','maks@mail.ru');
/*!40000 ALTER TABLE `clients_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commits`
--

DROP TABLE IF EXISTS `commits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` varchar(1024) NOT NULL,
  `author` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commits`
--

LOCK TABLES `commits` WRITE;
/*!40000 ALTER TABLE `commits` DISABLE KEYS */;
INSERT INTO `commits` VALUES (1,'Проверка',1,'2019-12-26 15:00:00'),(2,'Привет ',33,'2019-12-26 15:59:30');
/*!40000 ALTER TABLE `commits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `incidents`
--

DROP TABLE IF EXISTS `incidents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `incidents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` text NOT NULL,
  `priority` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `incidents_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `incidents`
--

LOCK TABLES `incidents` WRITE;
/*!40000 ALTER TABLE `incidents` DISABLE KEYS */;
INSERT INTO `incidents` VALUES (1,'Инцидент 1',1,1),(2,'Инцидент 2',2,1),(3,'Инцидент 3',1,2),(4,'Инцидент 4',2,2),(5,'Инцидент 5',1,23),(6,'Инцидент 6',2,23),(7,'Инцидент 7',1,3),(8,'Инцидент 8',2,3);
/*!40000 ALTER TABLE `incidents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `list_color`
--

DROP TABLE IF EXISTS `list_color`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `list_color` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_product` int(11) NOT NULL,
  `color` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_product` (`id_product`),
  CONSTRAINT `list_color_ibfk_1` FOREIGN KEY (`id_product`) REFERENCES `products_description` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `list_color`
--

LOCK TABLES `list_color` WRITE;
/*!40000 ALTER TABLE `list_color` DISABLE KEYS */;
INSERT INTO `list_color` VALUES (1,1,'red'),(2,1,'blue'),(3,2,'red'),(4,2,'blue'),(5,3,'red');
/*!40000 ALTER TABLE `list_color` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `list_image`
--

DROP TABLE IF EXISTS `list_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `list_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_product` int(11) NOT NULL,
  `image` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_product` (`id_product`),
  CONSTRAINT `list_image_ibfk_1` FOREIGN KEY (`id_product`) REFERENCES `products_description` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `list_image`
--

LOCK TABLES `list_image` WRITE;
/*!40000 ALTER TABLE `list_image` DISABLE KEYS */;
INSERT INTO `list_image` VALUES (1,1,'1.png'),(2,1,'2.png'),(3,1,'3.png'),(4,2,'4.png'),(5,2,'5.png');
/*!40000 ALTER TABLE `list_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `list_size`
--

DROP TABLE IF EXISTS `list_size`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `list_size` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_product` int(11) NOT NULL,
  `size` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_product` (`id_product`),
  CONSTRAINT `list_size_ibfk_1` FOREIGN KEY (`id_product`) REFERENCES `products_description` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `list_size`
--

LOCK TABLES `list_size` WRITE;
/*!40000 ALTER TABLE `list_size` DISABLE KEYS */;
INSERT INTO `list_size` VALUES (1,1,'100x100'),(2,1,'200x200'),(3,1,'300x300'),(4,2,'100x100'),(5,3,'150x150');
/*!40000 ALTER TABLE `list_size` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_description`
--

DROP TABLE IF EXISTS `orders_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders_description` (
  `rec_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_number` int(11) NOT NULL,
  `id_client` int(11) NOT NULL,
  `pay_method` varchar(60) DEFAULT NULL,
  `delivery_method` varchar(60) DEFAULT NULL,
  `id_product` int(11) NOT NULL,
  `cost_product` decimal(19,2) DEFAULT NULL,
  `count_product` int(11) DEFAULT NULL,
  `total_cost` decimal(19,2) DEFAULT NULL,
  `order_date` datetime DEFAULT NULL,
  PRIMARY KEY (`rec_id`),
  KEY `id_client` (`id_client`),
  KEY `id_product` (`id_product`),
  CONSTRAINT `orders_description_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `clients_description` (`id`),
  CONSTRAINT `orders_description_ibfk_2` FOREIGN KEY (`id_product`) REFERENCES `products_description` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_description`
--

LOCK TABLES `orders_description` WRITE;
/*!40000 ALTER TABLE `orders_description` DISABLE KEYS */;
INSERT INTO `orders_description` VALUES (1,123,1,'cashless payments','pickup',1,10000.00,1,10000.00,'2020-01-04 20:00:02'),(2,124,1,'cashless payments','pickup',2,40.00,500,25000.00,'2020-01-04 20:00:02'),(3,125,2,'cash','pickup',2,10000.00,1,10000.00,'2020-01-04 20:00:02'),(4,126,3,'cashless payments','home delivery',2,30000.00,1,30999.00,'2020-01-04 20:00:02'),(5,127,4,'cashless payments','home delivery',2,50000.00,1,50500.00,'2020-01-04 20:00:02');
/*!40000 ALTER TABLE `orders_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_category`
--

DROP TABLE IF EXISTS `product_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_category` (
  `rec_id` int(11) NOT NULL AUTO_INCREMENT,
  `id_product` int(11) NOT NULL,
  `id_category` int(11) NOT NULL,
  PRIMARY KEY (`rec_id`),
  UNIQUE KEY `id` (`id_product`,`id_category`),
  KEY `id_category` (`id_category`),
  CONSTRAINT `product_category_ibfk_1` FOREIGN KEY (`id_product`) REFERENCES `products_description` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `product_category_ibfk_2` FOREIGN KEY (`id_category`) REFERENCES `category_description` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_category`
--

LOCK TABLES `product_category` WRITE;
/*!40000 ALTER TABLE `product_category` DISABLE KEYS */;
INSERT INTO `product_category` VALUES (1,1,1),(2,2,4),(3,3,4),(4,4,4),(5,4,6);
/*!40000 ALTER TABLE `product_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_description`
--

DROP TABLE IF EXISTS `products_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products_description` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) DEFAULT NULL,
  `short_descript` varchar(200) DEFAULT NULL,
  `full_descript` varchar(500) DEFAULT NULL,
  `basic_price` decimal(19,2) DEFAULT NULL,
  `current_price` decimal(19,2) DEFAULT NULL,
  `count_stock` int(11) DEFAULT NULL,
  `article` varchar(20) DEFAULT NULL,
  `min_quantity` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_description`
--

LOCK TABLES `products_description` WRITE;
/*!40000 ALTER TABLE `products_description` DISABLE KEYS */;
INSERT INTO `products_description` VALUES (1,'Snickers','snickers','ne tormozi snikersni',55.00,40.00,100000,'Snick',500),(2,'TV samsung 4k','SmartTV','super good TV 4k',30000.00,30000.00,13,'sm-7214',1),(3,'LG smart','LG','super TV',50000.00,49999.00,23,'lg-458',1),(4,'smart_chair','chair','nichego ydobnee ne videl',10000.00,9999.00,17,'biggi-2670',1);
/*!40000 ALTER TABLE `products_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'admin','administrator'),(2,'user','user...');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(25) NOT NULL,
  `description` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (11,'Администратор','суперпользователь, имеет полный доступ к системе, в том числе к удалению обращений'),(12,'техническая поддержка','может производить манипуляции с состоянием обращений — изменением статуса'),(13,'пользователь','может оставлять обращения');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles_list`
--

DROP TABLE IF EXISTS `roles_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `роль` varchar(32) NOT NULL,
  `описание` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles_list`
--

LOCK TABLES `roles_list` WRITE;
/*!40000 ALTER TABLE `roles_list` DISABLE KEYS */;
INSERT INTO `roles_list` VALUES (1,'администратор','суперпользователь, имеет полный доступ к системе, в том числе к удалению обращений'),(2,'специалист технической поддержки','может производить манипуляции с состоянием обращений — изменением статуса'),(3,'пользователь','может оставлять обращения');
/*!40000 ALTER TABLE `roles_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles_users`
--

DROP TABLE IF EXISTS `roles_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles_users` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `roles_users_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users_list` (`id`),
  CONSTRAINT `roles_users_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles_users`
--

LOCK TABLES `roles_users` WRITE;
/*!40000 ALTER TABLE `roles_users` DISABLE KEYS */;
INSERT INTO `roles_users` VALUES (1,1),(32,1),(33,2),(34,2),(35,2);
/*!40000 ALTER TABLE `roles_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `статус` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
INSERT INTO `status` VALUES (1,'Новое'),(2,'В работе'),(3,'Ошибочное'),(4,'Отказано'),(5,'Решено');
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type of treatment`
--

DROP TABLE IF EXISTS `type of treatment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `type of treatment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `тип` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type of treatment`
--

LOCK TABLES `type of treatment` WRITE;
/*!40000 ALTER TABLE `type of treatment` DISABLE KEYS */;
INSERT INTO `type of treatment` VALUES (1,'Проблемы с компьютером'),(2,'Доступ в интернет'),(3,'Доступ к общим ресурсам организации'),(4,'предоставление доступа'),(5,'другое');
/*!40000 ALTER TABLE `type of treatment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_list`
--

DROP TABLE IF EXISTS `user_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `логин` varchar(32) NOT NULL,
  `пароль` varchar(32) NOT NULL,
  `ФИО` varchar(255) NOT NULL,
  `роль` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_list`
--

LOCK TABLES `user_list` WRITE;
/*!40000 ALTER TABLE `user_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `FIO` varchar(255) DEFAULT NULL,
  `role_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_username` (`username`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','qwerty','Иванов Иван Иванович',11,'2019-11-12 09:30:26'),(2,'support','qwerty','Сидоров Сергей Георгиевич',12,'2019-11-12 09:30:26'),(3,'user','user','Осипцов Игорь Евгеньевич',13,'2019-11-12 09:34:15'),(23,'galka','admin','Иванова Галина Ивановна',13,'2019-12-17 11:56:14');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_list`
--

DROP TABLE IF EXISTS `users_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(100) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `lastname` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_list`
--

LOCK TABLES `users_list` WRITE;
/*!40000 ALTER TABLE `users_list` DISABLE KEYS */;
INSERT INTO `users_list` VALUES (1,'timur.chikishev@mail.ru','Timur','Chikishev','$6$rounds=656000$gcs0srjXVqkbMMBG$EFvFpXywHVA/hTnFTkF7YXWow472FRb5txs2woLXQZYcZ79nkJv48xU56f/tEMnrtcTLmGhpSgx0bu9.N83do0',1),(32,'admin@gmail.com','Demid','Gerasimenko','$6$rounds=656000$KAnt5tNBmwXn/Yvk$ym7C4BzODOsDY3jTbeO6G1K086C2aHtTtY9Z7vOp2r8HzaL5Ck0Wr1ppUqF13TtMixfH78ow.ZQsKlapTQqg.0',1),(33,'lol@kek.ru','Lol','kek','$6$rounds=656000$9.7.z/qRQx59x8l3$O4o2UMzx58m2uO8Rd2ePZdmGgWjP71ZFlx.awkcTyuKdLMsQiO2S5gA3DmEVhwViTwC5y5Vv.ccc9x8OR5c3E/',1),(34,'serzh.sharipov.01@mail.ru','Сергей','Шарипов','$6$rounds=656000$QlrUsN.DClT.u31l$.BlIU8ITC8GnPHRY.6W.j.OAI4uJbslB5xoYasC.37N3wonc5nLzaav6citaNqkrD7cHP4hpX56pRZqKrdbif1',1),(35,'111@yandex.ru','1234','1234','111111111',1);
/*!40000 ALTER TABLE `users_list` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-01-25 14:27:08

/*
SQLyog Community v13.1.6 (64 bit)
MySQL - 10.4.17-MariaDB : Database - vexere
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`vexere` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `vexere`;

/*Table structure for table `passengercarcompanies` */

DROP TABLE IF EXISTS `passengercarcompanies`;

CREATE TABLE `passengercarcompanies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `trip_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `trip_id` (`trip_id`),
  CONSTRAINT `passengercarcompanies_ibfk_1` FOREIGN KEY (`trip_id`) REFERENCES `trips` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

/*Data for the table `passengercarcompanies` */

insert  into `passengercarcompanies`(`id`,`name`,`image`,`description`,`createdAt`,`updatedAt`,`trip_id`) values 
(1,'Điểm Màu',NULL,'xe chat luong','2021-04-30 08:30:30','2021-04-30 08:30:30',1),
(2,'Đệ Nhất',NULL,'xe chat luong','2021-04-30 08:30:30','2021-04-30 08:30:30',1),
(3,'Hùng Nga',NULL,'xe chat luong','2021-04-30 08:30:30','2021-04-30 08:30:30',2),
(4,'Bảy Vinh',NULL,'xe chat luong','2021-04-30 08:30:30','2021-04-30 08:30:30',3);

/*Table structure for table `seats` */

DROP TABLE IF EXISTS `seats`;

CREATE TABLE `seats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `vehicled_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `vehicled_id` (`vehicled_id`),
  CONSTRAINT `seats_ibfk_1` FOREIGN KEY (`vehicled_id`) REFERENCES `vehicles` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4;

/*Data for the table `seats` */

insert  into `seats`(`id`,`name`,`status`,`createdAt`,`updatedAt`,`vehicled_id`) values 
(1,'Ghế 1','\"OPEN\"','0000-00-00 00:00:00','0000-00-00 00:00:00',1),
(2,'Ghế 3','empty','2021-04-30 08:30:30','2021-04-30 08:30:30',1),
(3,'Ghế 3','empty','2021-04-30 08:30:30','2021-04-30 08:30:30',1),
(4,'Ghế 4','empty','2021-04-30 08:30:30','2021-04-30 08:30:30',1),
(5,'Ghế 5','empty','2021-04-30 08:30:30','2021-04-30 08:30:30',1),
(6,'Ghế 6','empty','2021-04-30 08:30:30','2021-04-30 08:30:30',1),
(7,'Ghế 7','empty','2021-04-30 08:30:30','2021-04-30 08:30:30',1),
(8,'Ghế 7','empty','2021-04-30 08:30:30','2021-04-30 08:30:30',1),
(9,'Ghế 8','empty','2021-04-30 08:30:30','2021-04-30 08:30:30',1),
(10,'Ghế 9','empty','2021-04-30 08:30:30','2021-04-30 08:30:30',1),
(11,'Ghế 10','empty','2021-04-30 08:30:30','2021-04-30 08:30:30',1),
(12,'Ghế 11','empty','2021-04-30 08:30:30','2021-04-30 08:30:30',1),
(13,'Ghế 12','empty','2021-04-30 08:30:30','2021-04-30 08:30:30',1),
(14,'Ghế 13','empty','2021-04-30 08:30:30','2021-04-30 08:30:30',1),
(15,'Ghế 14','empty','2021-04-30 08:30:30','2021-04-30 08:30:30',1),
(16,'Ghế 15','empty','2021-04-30 08:30:30','2021-04-30 08:30:30',1),
(17,'Ghế 3','empty','2021-04-30 08:30:30','2021-04-30 08:30:30',1),
(18,'Ghế 4','empty','2021-04-30 08:30:30','2021-04-30 08:30:30',1),
(19,'Ghế 5','empty','2021-04-30 08:30:30','2021-04-30 08:30:30',1),
(20,'Ghế 6','empty','2021-04-30 08:30:30','2021-04-30 08:30:30',1),
(21,'Ghế 7','empty','2021-04-30 08:30:30','2021-04-30 08:30:30',1),
(22,'Ghế 7','empty','2021-04-30 08:30:30','2021-04-30 08:30:30',1),
(23,'Ghế 8','empty','2021-04-30 08:30:30','2021-04-30 08:30:30',1),
(24,'Ghế 9','empty','2021-04-30 08:30:30','2021-04-30 08:30:30',1),
(25,'Ghế 10','empty','2021-04-30 08:30:30','2021-04-30 08:30:30',1),
(26,'Ghế 11','empty','2021-04-30 08:30:30','2021-04-30 08:30:30',1),
(27,'Ghế 12','empty','2021-04-30 08:30:30','2021-04-30 08:30:30',1),
(28,'Ghế 13','empty','2021-04-30 08:30:30','2021-04-30 08:30:30',1),
(29,'Ghế 14','empty','2021-04-30 08:30:30','2021-04-30 08:30:30',1),
(30,'Ghế 15','empty','2021-04-30 08:30:30','2021-04-30 08:30:30',1),
(31,'Ghế 1','empty','2021-04-30 08:30:30','2021-04-30 08:30:30',1),
(32,'Ghế 2','empty','2021-04-30 08:30:30','2021-04-30 08:30:30',1),
(33,'Limousein(cao cấp)',NULL,'2021-04-30 08:30:30','2021-04-30 08:30:30',1),
(34,'Xe Gường nằm thường',NULL,'2021-04-30 08:30:30','2021-04-30 08:30:30',1),
(35,'Xe Travel',NULL,'2021-04-30 08:30:30','2021-04-30 08:30:30',1);

/*Table structure for table `sequelizemeta` */

DROP TABLE IF EXISTS `sequelizemeta`;

CREATE TABLE `sequelizemeta` (
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `sequelizemeta` */

insert  into `sequelizemeta`(`name`) values 
('20211024035549-create-user.js'),
('20211024093308-create-trip.js');

/*Table structure for table `stations` */

DROP TABLE IF EXISTS `stations`;

CREATE TABLE `stations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `province` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;

/*Data for the table `stations` */

insert  into `stations`(`id`,`name`,`address`,`province`,`createdAt`,`updatedAt`) values 
(1,'Bến xe Miền Đông','Bến xe  Miền Đông, thành phố Hồ Chí Minh','Thành Phố Hồ Chí Minh','2021-10-25 01:35:27','2021-10-25 01:35:27'),
(2,'Chơ Phước Sơn, Tuy Phước,Bình Định','Chơ Phước Sơn, Tuy Phước,Bình Định','Bình Định','2021-10-25 01:37:17','2021-10-25 01:37:17'),
(3,'Đà Lạt,Lâm Đồng','Đà Lạt,Lâm Đồng','Lâm Đồng','2021-10-25 01:38:44','2021-10-25 01:38:44'),
(4,'Sơn Trà,Đà Nẵng','Sơn Trà,Đà Nẵng','Đà Nẵng','2021-10-25 01:39:19','2021-10-25 01:39:19'),
(5,'Đông Anh,Hà Nội','Đông Anh,Hà Nội','Hà Nội','2021-10-25 01:39:58','2021-10-25 01:39:58'),
(6,'Biến xe miền Tây, Hồ Chí Minh','Hồ Chí Minh','Hồ Chí Minh','2021-10-25 01:41:01','2021-10-25 01:41:01'),
(7,'Đông chương,Vĩnh Long','Đông chương,Vĩnh Long','Vĩnh Long','2021-10-25 01:41:38','2021-10-25 01:41:38'),
(8,'Tiền Giang','Tiền Giang','Tiền Giang','2021-10-25 01:42:31','2021-10-25 01:42:31'),
(9,'An Giang','An Giang','An Giang','2021-10-25 01:43:23','2021-10-25 01:43:23'),
(10,'Hậu Giang','Hậu Giang','Hậu Giang','2021-10-25 01:43:36','2021-10-25 01:43:36'),
(11,'Quảng Ngãi','Quảng Ngãi','Quảng Ngãi','2021-10-25 01:43:58','2021-10-25 01:43:58'),
(12,'Quảng Nam','Quảng Nam','Quảng Nam','2021-10-25 01:44:10','2021-10-25 01:44:10'),
(13,'Quảng Bình','Quảng Bình','Quảng Bình','2021-10-25 01:44:18','2021-10-25 01:44:18'),
(14,'Bình Thuận','Bình Thuận','Bình Thuận','2021-10-25 01:44:36','2021-10-25 01:44:36'),
(15,'Bình Phước','Bình Phước','Bình Phước','2021-10-25 01:44:43','2021-10-25 01:44:43'),
(16,'Bình Dương','Bình Dương','Bình Dương','2021-10-25 01:44:49','2021-10-25 01:44:49');

/*Table structure for table `tickets` */

DROP TABLE IF EXISTS `tickets`;

CREATE TABLE `tickets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `trip_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `trip_id` (`trip_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `tickets_ibfk_1` FOREIGN KEY (`trip_id`) REFERENCES `trips` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `tickets_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `tickets` */

/*Table structure for table `trips` */

DROP TABLE IF EXISTS `trips`;

CREATE TABLE `trips` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `startTime` datetime DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `fromStation` int(11) DEFAULT NULL,
  `toStation` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fromStation` (`fromStation`),
  KEY `toStation` (`toStation`),
  CONSTRAINT `trips_ibfk_1` FOREIGN KEY (`fromStation`) REFERENCES `stations` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `trips_ibfk_2` FOREIGN KEY (`toStation`) REFERENCES `stations` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

/*Data for the table `trips` */

insert  into `trips`(`id`,`startTime`,`price`,`createdAt`,`updatedAt`,`fromStation`,`toStation`) values 
(1,'2021-04-30 01:30:30',250000,'2021-10-25 01:45:53','2021-10-25 01:45:53',1,2),
(2,'2021-04-30 01:30:30',260000,'2021-10-25 01:46:20','2021-10-25 01:46:20',1,11),
(3,'2021-04-30 01:30:30',270000,'2021-10-25 01:46:29','2021-10-25 01:46:29',1,12),
(4,'2021-05-01 01:30:30',300000,'2021-10-25 01:47:32','2021-10-25 01:47:32',1,13),
(5,'2021-04-02 01:30:30',200000,'2021-10-25 01:47:57','2021-10-25 01:47:57',1,15),
(6,'2021-05-30 01:30:30',220000,'2021-10-25 01:48:05','2021-10-25 01:48:05',1,14);

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `numberPhone` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT 'client',
  `avatar` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

/*Data for the table `users` */

insert  into `users`(`id`,`name`,`email`,`password`,`numberPhone`,`type`,`avatar`,`createdAt`,`updatedAt`) values 
(1,'Trần Đỗ Đaị Phong','tranphong180798@gmail.com','$2b$10$U6WF5uKbWQm50m3nQ.fpWuPxCCpSZ7s3Dp0i5WIQYnVaVsT.4znRC','0364730704','ADMIN',NULL,'2021-10-25 01:34:19','2021-10-25 01:34:19');

/*Table structure for table `vehicles` */

DROP TABLE IF EXISTS `vehicles`;

CREATE TABLE `vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `passengerCarCompanies_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `passengerCarCompanies_id` (`passengerCarCompanies_id`),
  CONSTRAINT `vehicles_ibfk_1` FOREIGN KEY (`passengerCarCompanies_id`) REFERENCES `passengercarcompanies` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;

/*Data for the table `vehicles` */

insert  into `vehicles`(`id`,`name`,`createdAt`,`updatedAt`,`passengerCarCompanies_id`) values 
(1,'Xe Limousin(Cao cấp)','2021-04-30 08:30:30','2021-04-30 08:30:30',1),
(2,'Xe Thường','2021-04-30 08:30:30','2021-04-30 08:30:30',1),
(3,'Xe Travel','2021-04-30 08:30:30','2021-04-30 08:30:30',1),
(4,'Xe Limousin(Cao cấp)','2021-04-30 08:30:30','2021-04-30 08:30:30',2),
(5,'Xe Thường','2021-04-30 08:30:30','2021-04-30 08:30:30',2),
(6,'Xe Limousin(Cao cấp)','2021-04-30 08:30:30','2021-04-30 08:30:30',3),
(7,'Xe Limousin(Cao cấp)','2021-04-30 08:30:30','2021-04-30 08:30:30',4),
(8,'Xe Thường','2021-04-30 08:30:30','2021-04-30 08:30:30',3),
(9,'Xe Thường','2021-04-30 08:30:30','2021-04-30 08:30:30',4),
(10,'Xe Thường','2021-04-30 08:30:30','2021-04-30 08:30:30',NULL),
(11,'Xe Travel','2021-04-30 08:30:30','2021-04-30 08:30:30',2),
(12,'Xe Travel','2021-04-30 08:30:30','2021-04-30 08:30:30',3),
(13,'Xe Travel','2021-04-30 08:30:30','2021-04-30 08:30:30',4);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

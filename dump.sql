-- --------------------------------------------------------
-- Host:                         localhost
-- Server version:               8.0.28-0ubuntu0.20.04.3 - (Ubuntu)
-- Server OS:                    Linux
-- HeidiSQL Version:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for Car_repair
DROP DATABASE IF EXISTS `Car_repair`;
CREATE DATABASE IF NOT EXISTS `Car_repair` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `Car_repair`;

-- Dumping structure for table Car_repair.branches
DROP TABLE IF EXISTS `branches`;
CREATE TABLE IF NOT EXISTS `branches` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '0',
  `city_id` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `city_id` (`city_id`),
  CONSTRAINT `branches_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `location` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table Car_repair.branches: ~7 rows (approximately)
/*!40000 ALTER TABLE `branches` DISABLE KEYS */;
INSERT INTO `branches` (`id`, `name`, `city_id`) VALUES
	(2, 'zaodi', 2),
	(5, 'zastava', 2),
	(8, 'digomi', 1),
	(9, 'vake', 1),
	(11, 'piv', 4),
	(12, 'bulvari', 4),
	(13, 'balaxvani', 2);
/*!40000 ALTER TABLE `branches` ENABLE KEYS */;

-- Dumping structure for table Car_repair.customers
DROP TABLE IF EXISTS `customers`;
CREATE TABLE IF NOT EXISTS `customers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '0',
  `surname` varchar(50) NOT NULL DEFAULT '0',
  `personal_id` varchar(50) NOT NULL DEFAULT '0',
  `phone_number` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table Car_repair.customers: ~12 rows (approximately)
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` (`id`, `name`, `surname`, `personal_id`, `phone_number`) VALUES
	(1, 'bacho', 'mindiashvili', '2222222', '555555555'),
	(2, 'giorgi', 'loria', '10203040', '598123451'),
	(3, 'guram', 'kashia', '98414141', '9884124'),
	(4, 'levan', 'azarovi', '20012412', '5977144122'),
	(5, 'giorgi', 'kiteishvili', '010120301', '512414124'),
	(6, 'zuriko', 'davitashvili', '62000400', '987752932'),
	(7, 'lasha', 'qvilitaia', '01020304', '951124122'),
	(8, 'budu', 'zivzivadze', '9581124', '010204011'),
	(9, 'vako', 'gvilia', '622312312', '597715124'),
	(10, 'lazare', 'kupatadze', '01020304', '514411123'),
	(11, 'gocha', 'mutidze', '600030040', '512123123'),
	(12, 'givi', 'melia', '515151', '151515');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;

-- Dumping structure for table Car_repair.employees
DROP TABLE IF EXISTS `employees`;
CREATE TABLE IF NOT EXISTS `employees` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '0',
  `surname` varchar(50) NOT NULL DEFAULT '0',
  `gender` int NOT NULL DEFAULT '0',
  `branches_id` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `city_id` (`branches_id`) USING BTREE,
  CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`branches_id`) REFERENCES `branches` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table Car_repair.employees: ~17 rows (approximately)
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` (`id`, `name`, `surname`, `gender`, `branches_id`) VALUES
	(3, 'genadi', 'janelidze', 1, 5),
	(4, 'mixeil', 'giorgadze', 1, 13),
	(5, 'ramaz', 'nutsubidze', 1, 2),
	(6, 'giorgi', 'melia', 1, 2),
	(7, 'nika', 'kuxalahsvili', 1, 5),
	(8, 'jemali', 'abdaladze', 1, 13),
	(9, 'otar', 'gvadzabia', 1, 13),
	(11, 'gedevan', 'fofxadze', 1, 8),
	(12, 'mari', 'kobaxidze', 2, 8),
	(13, 'ana', 'wereteli', 2, 8),
	(14, 'elene', 'zurabishvili', 2, 9),
	(15, 'dato', 'kodua', 1, 9),
	(16, 'gubaz', 'sanikidze', 1, 2),
	(17, 'emzar', 'jgerenaia', 1, 11),
	(18, 'luka', 'gegenava', 1, 11),
	(19, 'nodar', 'kakushadze', 1, 12),
	(20, 'vaxtang', 'tatishvili', 1, 12);
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;

-- Dumping structure for table Car_repair.employees_quality
DROP TABLE IF EXISTS `employees_quality`;
CREATE TABLE IF NOT EXISTS `employees_quality` (
  `employee_id` int DEFAULT NULL,
  `type_id` int DEFAULT NULL,
  KEY `employee_id` (`employee_id`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `employees_quality_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `employees_quality_ibfk_2` FOREIGN KEY (`type_id`) REFERENCES `workers_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table Car_repair.employees_quality: ~26 rows (approximately)
/*!40000 ALTER TABLE `employees_quality` DISABLE KEYS */;
INSERT INTO `employees_quality` (`employee_id`, `type_id`) VALUES
	(13, 1),
	(15, 4),
	(14, 1),
	(17, 2),
	(17, 4),
	(11, 2),
	(3, 3),
	(3, 4),
	(6, 2),
	(16, 4),
	(16, 3),
	(16, 2),
	(8, 2),
	(18, 4),
	(12, 1),
	(4, 3),
	(7, 1),
	(19, 4),
	(19, 2),
	(9, 3),
	(5, 4),
	(20, 3),
	(5, 1),
	(18, 1),
	(20, 1),
	(8, 1);
/*!40000 ALTER TABLE `employees_quality` ENABLE KEYS */;

-- Dumping structure for table Car_repair.location
DROP TABLE IF EXISTS `location`;
CREATE TABLE IF NOT EXISTS `location` (
  `id` int NOT NULL AUTO_INCREMENT,
  `city` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table Car_repair.location: ~3 rows (approximately)
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` (`id`, `city`) VALUES
	(1, 'tbilisi'),
	(2, 'kutaisi'),
	(4, 'batumi');
/*!40000 ALTER TABLE `location` ENABLE KEYS */;

-- Dumping structure for table Car_repair.orders
DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL DEFAULT '0',
  `cost` float DEFAULT NULL,
  `input_date` datetime DEFAULT NULL,
  `output_date` datetime DEFAULT NULL,
  `operator_id` int DEFAULT NULL,
  `branches_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `operator_id` (`operator_id`),
  KEY `branches_id` (`branches_id`),
  KEY `customer_id` (`customer_id`),
  KEY `cost_info_id` (`cost`) USING BTREE,
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`operator_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`branches_id`) REFERENCES `branches` (`id`),
  CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table Car_repair.orders: ~12 rows (approximately)
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` (`id`, `customer_id`, `cost`, `input_date`, `output_date`, `operator_id`, `branches_id`) VALUES
	(1, 1, 1500, '2022-04-16 19:41:03', NULL, 13, 8),
	(2, 2, 2300, '2022-03-24 19:54:32', NULL, 14, 13),
	(3, 3, 3250, '2022-04-27 19:55:58', NULL, 12, 8),
	(4, 4, 1970, '2022-04-18 19:56:34', NULL, 7, 5),
	(5, 5, 5200, '2022-03-25 19:57:13', NULL, 20, 12),
	(6, 6, 4250, '2022-02-27 19:57:46', NULL, 18, 11),
	(7, 7, 7510, '2022-04-25 19:58:49', NULL, 5, 2),
	(8, 8, 1570, '2022-04-22 20:00:05', NULL, 8, 13),
	(9, 9, 9820, '2022-04-18 20:00:37', NULL, 14, 9),
	(10, 10, 520, '2022-04-27 20:01:30', NULL, 20, 12),
	(11, 11, 120000, '2022-04-28 00:49:15', NULL, 5, 13),
	(12, 12, 65000, '2022-04-29 05:07:27', NULL, 14, 13);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;

-- Dumping structure for table Car_repair.order_details
DROP TABLE IF EXISTS `order_details`;
CREATE TABLE IF NOT EXISTS `order_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `color` varchar(50) DEFAULT NULL,
  `brand` varchar(50) DEFAULT NULL,
  `year` varchar(50) DEFAULT NULL,
  `cur_number` varchar(50) DEFAULT NULL,
  `customer_id` int DEFAULT NULL,
  `order_id` int DEFAULT NULL,
  `employee_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `customer_id` (`customer_id`),
  KEY `employee_id` (`employee_id`),
  CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `order_details_ibfk_3` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`),
  CONSTRAINT `order_details_ibfk_4` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`),
  CONSTRAINT `order_details_ibfk_5` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `order_details_ibfk_6` FOREIGN KEY (`employee_id`) REFERENCES `employees_quality` (`employee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table Car_repair.order_details: ~12 rows (approximately)
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;
INSERT INTO `order_details` (`id`, `color`, `brand`, `year`, `cur_number`, `customer_id`, `order_id`, `employee_id`) VALUES
	(1, 'black', 'bmw', '2011', 'bi-001-mi', 1, 1, 11),
	(2, 'white', 'opel', '2003', 'op-002-el', 2, 2, 16),
	(3, 'yellow', 'opel', '2006', 'bg-125-bg', 3, 3, 11),
	(4, 'black', 'nissan', '2015', 'ni-195-sa', 4, 4, 3),
	(5, 'white', 'ford', '2012', 'fo-241-rd', 5, 5, 19),
	(6, 'black', 'bmw', '2021', 'bm-222-ww', 6, 6, 17),
	(7, 'red', 'mercedes', '2015', 'ba-999-ba', 7, 7, 6),
	(8, 'white', 'bmw', '2005', 'aa-222-aa', 8, 8, 4),
	(9, 'black', 'ford', '2010', 'ba-555-ba', 9, 9, 15),
	(10, 'black', 'bmw', '2012', 'sa-125-sa', 10, 10, 19),
	(11, 'black', 'opel', '1995', 'ba-111-ca', 11, 11, 16),
	(12, 'white', 'opel', '2004', '1dada', 12, 12, 16);
/*!40000 ALTER TABLE `order_details` ENABLE KEYS */;

-- Dumping structure for table Car_repair.workers_type
DROP TABLE IF EXISTS `workers_type`;
CREATE TABLE IF NOT EXISTS `workers_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table Car_repair.workers_type: ~4 rows (approximately)
/*!40000 ALTER TABLE `workers_type` DISABLE KEYS */;
INSERT INTO `workers_type` (`id`, `type`) VALUES
	(1, 'operator'),
	(2, 'Electrician'),
	(3, 'iron_craftsman'),
	(4, 'engine_craftsman');
/*!40000 ALTER TABLE `workers_type` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;

-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.0.0.6468
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for online_store
CREATE DATABASE IF NOT EXISTS `online_store` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `online_store`;

-- Dumping structure for table online_store.customers
CREATE TABLE IF NOT EXISTS `customers` (
  `customer_ID` int NOT NULL,
  `cust_name` varchar(100) DEFAULT NULL,
  `cust_email` varchar(60) DEFAULT NULL,
  `cust_address` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`customer_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table online_store.customers: ~4 rows (approximately)
INSERT INTO `customers` (`customer_ID`, `cust_name`, `cust_email`, `cust_address`) VALUES
	(4001, 'James Perez', 'jamesperez@yahoo.com', 'Los Angeles'),
	(4002, 'Ella Young', 'ellayoung@gmail.com', 'New York'),
	(4003, 'Emily Adams', 'emilyadams@yahoo.com', 'Bucharest'),
	(4004, 'Lucas Collins', 'lucascollins@gmail.com', 'London');

-- Dumping structure for table online_store.employees
CREATE TABLE IF NOT EXISTS `employees` (
  `employee_ID` int NOT NULL,
  `emp_name` varchar(100) DEFAULT NULL,
  `working_area` varchar(70) DEFAULT NULL,
  `employment_date` date DEFAULT NULL,
  `emp_email` varchar(60) DEFAULT NULL,
  `salary` int DEFAULT NULL,
  PRIMARY KEY (`employee_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table online_store.employees: ~5 rows (approximately)
INSERT INTO `employees` (`employee_ID`, `emp_name`, `working_area`, `employment_date`, `emp_email`, `salary`) VALUES
	(3001, 'Olivia White', 'manager', '2008-08-27', 'oliviawhite@gmail.com', 20000),
	(3002, 'Mia Smith', 'sales agent', '2010-05-15', 'miasmith@gmail.com', 8000),
	(3003, 'Sophia Brown', 'sales agent', '2018-09-01', 'sophiabrown@gmail.com', 4000),
	(3004, 'Liam Wilson', 'security', '2020-10-01', 'liamwilson@gmail.com', 3600),
	(3005, 'Oliver Thompson', 'cleaning staff', '2021-03-14', 'oliverthompson@yahoo.com', 2000);

-- Dumping structure for table online_store.orders
CREATE TABLE IF NOT EXISTS `orders` (
  `order_ID` int NOT NULL,
  `customer_ID` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `order_date` date DEFAULT NULL,
  PRIMARY KEY (`order_ID`),
  KEY `customer_ID` (`customer_ID`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `stock` (`product_ID`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`customer_ID`) REFERENCES `customers` (`customer_ID`),
  CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`product_id`) REFERENCES `stock` (`product_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table online_store.orders: ~7 rows (approximately)
INSERT INTO `orders` (`order_ID`, `customer_ID`, `product_id`, `quantity`, `order_date`) VALUES
	(2001, 4001, 1003, 1, '2020-07-23'),
	(2002, 4004, 1005, 2, '2021-09-12'),
	(2003, 4002, 1009, 4, '2021-12-23'),
	(2004, 4002, 1001, 1, '2021-12-23'),
	(2005, 4003, 1008, 1, '2022-01-25'),
	(2006, 4001, 1002, 2, '2022-03-17'),
	(2007, 4003, 1006, 1, '2022-07-11');

-- Dumping structure for table online_store.stock
CREATE TABLE IF NOT EXISTS `stock` (
  `product_ID` int NOT NULL,
  `products_list` varchar(100) DEFAULT NULL,
  `inventory` int DEFAULT NULL,
  `product_price` int DEFAULT NULL,
  PRIMARY KEY (`product_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table online_store.stock: ~9 rows (approximately)
INSERT INTO `stock` (`product_ID`, `products_list`, `inventory`, `product_price`) VALUES
	(1001, 'blouse', 27, 80),
	(1002, 'tshirt', 39, 50),
	(1003, 'shirt', 15, 95),
	(1004, 'hat', 21, 44),
	(1005, 'trousers', 43, 77),
	(1006, 'shoes', 50, 145),
	(1007, 'cap', 11, 48),
	(1008, 'jacket', 23, 87),
	(1009, 'scarf', 20, 30);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;

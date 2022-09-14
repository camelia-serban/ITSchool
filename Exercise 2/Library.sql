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


-- Dumping database structure for library
CREATE DATABASE IF NOT EXISTS `library` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `library`;

-- Dumping structure for table library.authors
CREATE TABLE IF NOT EXISTS `authors` (
  `author_id` int NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `middle_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  PRIMARY KEY (`author_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table library.authors: ~2 rows (approximately)
INSERT INTO `authors` (`author_id`, `first_name`, `middle_name`, `last_name`) VALUES
	(1001, 'Emily', '', 'Bronte'),
	(1002, 'Jane', '', 'Austen');

-- Dumping structure for table library.books
CREATE TABLE IF NOT EXISTS `books` (
  `book_id` int NOT NULL,
  `title` varchar(100) NOT NULL,
  `total_pages` int NOT NULL,
  `rating` double(10,2) NOT NULL,
  `isbn` varchar(13) NOT NULL,
  `published_date` varchar(20) NOT NULL,
  `publisher_id` int NOT NULL,
  PRIMARY KEY (`book_id`),
  KEY `publisher_id` (`publisher_id`),
  CONSTRAINT `books_ibfk_1` FOREIGN KEY (`publisher_id`) REFERENCES `publishers` (`publisher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table library.books: ~2 rows (approximately)
INSERT INTO `books` (`book_id`, `title`, `total_pages`, `rating`, `isbn`, `published_date`, `publisher_id`) VALUES
	(2001, 'Wuthering Heights', 420, 4.80, '0-486-29256-8', 'December 1847', 6001),
	(2002, 'Emma', 1036, 4.70, '0-579-32044-7', 'December 1815', 6002);

-- Dumping structure for table library.book_authors
CREATE TABLE IF NOT EXISTS `book_authors` (
  `book_id` int NOT NULL,
  `author_id` int NOT NULL,
  KEY `book_id` (`book_id`),
  KEY `author_id` (`author_id`),
  CONSTRAINT `book_authors_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`),
  CONSTRAINT `book_authors_ibfk_2` FOREIGN KEY (`author_id`) REFERENCES `authors` (`author_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table library.book_authors: ~2 rows (approximately)
INSERT INTO `book_authors` (`book_id`, `author_id`) VALUES
	(2001, 1001),
	(2002, 1002);

-- Dumping structure for table library.book_genres
CREATE TABLE IF NOT EXISTS `book_genres` (
  `book_id` int NOT NULL,
  `genre_id` int NOT NULL,
  KEY `book_id` (`book_id`),
  KEY `genre_id` (`genre_id`),
  CONSTRAINT `book_genres_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`),
  CONSTRAINT `book_genres_ibfk_2` FOREIGN KEY (`genre_id`) REFERENCES `genres` (`genre_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table library.book_genres: ~2 rows (approximately)
INSERT INTO `book_genres` (`book_id`, `genre_id`) VALUES
	(2001, 5001),
	(2002, 5001);

-- Dumping structure for table library.genres
CREATE TABLE IF NOT EXISTS `genres` (
  `genre_id` int NOT NULL,
  `genre` varchar(35) NOT NULL,
  `parent_id` int NOT NULL,
  PRIMARY KEY (`genre_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table library.genres: ~3 rows (approximately)
INSERT INTO `genres` (`genre_id`, `genre`, `parent_id`) VALUES
	(5001, 'romance', 7001),
	(5002, 'mistery', 7002),
	(5003, 'fiction', 7003);

-- Dumping structure for table library.publishers
CREATE TABLE IF NOT EXISTS `publishers` (
  `publisher_id` int NOT NULL,
  `publisher_name` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`publisher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table library.publishers: ~2 rows (approximately)
INSERT INTO `publishers` (`publisher_id`, `publisher_name`) VALUES
	(6001, 'Thomas Cautley Newby'),
	(6002, 'John Murray');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;

-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 13, 2021 at 11:03 PM
-- Server version: 8.0.21
-- PHP Version: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `metube`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
CREATE TABLE IF NOT EXISTS `account` (
  `username` varchar(50) NOT NULL,
  `password` varchar(128) NOT NULL,
  `email` varchar(60) DEFAULT NULL,
  `id` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`username`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`username`, `password`, `email`, `id`) VALUES
('metube', '123456', 'ldong@clemson.edu', 1),
('test', '1234', 'a@a', 2),
('test2', '123', 'a@a', 3);

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
CREATE TABLE IF NOT EXISTS `comment` (
  `cid` int NOT NULL AUTO_INCREMENT,
  `vidid` int NOT NULL,
  `userid` int NOT NULL,
  `comments` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`cid`, `vidid`, `userid`, `comments`) VALUES
(4, 3, 2, 'Comment here'),
(5, 3, 2, 'Comment here');

-- --------------------------------------------------------

--
-- Table structure for table `download`
--

DROP TABLE IF EXISTS `download`;
CREATE TABLE IF NOT EXISTS `download` (
  `downloadid` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `mediaid` int NOT NULL,
  `downloadtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`downloadid`),
  KEY `username` (`username`),
  KEY `mediaid` (`mediaid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `download`
--

INSERT INTO `download` (`downloadid`, `username`, `mediaid`, `downloadtime`) VALUES
(1, 'metube', 5, '2008-09-06 16:48:21'),
(2, 'metube', 4, '2008-09-06 16:49:36'),
(3, 'metube', 4, '2008-09-06 17:18:44'),
(4, 'test', 3, '2021-04-05 22:35:57');

-- --------------------------------------------------------

--
-- Table structure for table `keywords`
--

DROP TABLE IF EXISTS `keywords`;
CREATE TABLE IF NOT EXISTS `keywords` (
  `id` int NOT NULL AUTO_INCREMENT,
  `videoid` int NOT NULL,
  `keyword` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `keyid` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
CREATE TABLE IF NOT EXISTS `media` (
  `mediaid` int NOT NULL AUTO_INCREMENT,
  `filename` varchar(64) NOT NULL,
  `filepath` varchar(256) NOT NULL,
  `type` varchar(30) DEFAULT '0',
  `lastaccesstime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`mediaid`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `media`
--

INSERT INTO `media` (`mediaid`, `filename`, `filepath`, `type`, `lastaccesstime`) VALUES
(3, 'sample2.wmv', 'uploads/metube/', 'video/x-ms-wmv', '2021-04-09 03:52:31'),
(4, 'sample3.wmv', 'uploads/metube/', 'video/x-ms-wmv', '2021-04-12 23:30:41'),
(5, 'sample1.wmv', 'uploads/metube/', 'video/x-ms-wmv', '2021-04-08 01:30:46'),
(9, 'nintendogs_wallcoo.com_6.jpg', 'uploads/metube/', 'image/jpeg', '2021-04-08 00:11:45');

-- --------------------------------------------------------

--
-- Table structure for table `mediainfo`
--

DROP TABLE IF EXISTS `mediainfo`;
CREATE TABLE IF NOT EXISTS `mediainfo` (
  `mediainfoid` int NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` varchar(5000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`mediainfoid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `mediainfo`
--

INSERT INTO `mediainfo` (`mediainfoid`, `title`, `description`) VALUES
(3, 'sample 2', 'this is sample 2'),
(4, 'sample 3', 'sample 3 infp'),
(5, 'sample 1', 'this is sample 1'),
(9, 'nintendogs', 'this is nintendogs');

-- --------------------------------------------------------

--
-- Table structure for table `upload`
--

DROP TABLE IF EXISTS `upload`;
CREATE TABLE IF NOT EXISTS `upload` (
  `uploadid` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `mediaid` int NOT NULL,
  `uploadtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`uploadid`),
  KEY `username` (`username`),
  KEY `mediaid` (`mediaid`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `upload`
--

INSERT INTO `upload` (`uploadid`, `username`, `mediaid`, `uploadtime`) VALUES
(3, 'metube', 3, '2008-09-05 19:52:19'),
(4, 'metube', 4, '2008-09-05 19:53:10'),
(5, 'metube', 5, '2008-09-05 19:53:47'),
(9, 'metube', 9, '2008-09-05 20:28:36');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

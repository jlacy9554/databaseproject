-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 03, 2021 at 10:55 PM
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
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`username`, `password`, `email`, `id`) VALUES
('metube', '123456', 'ldong@clemson.edu', 1),
('test', '1234', 'a@a', 2);

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `download`
--

INSERT INTO `download` (`downloadid`, `username`, `mediaid`, `downloadtime`) VALUES
(1, 'metube', 5, '2008-09-06 16:48:21'),
(2, 'metube', 4, '2008-09-06 16:49:36'),
(3, 'metube', 4, '2008-09-06 17:18:44');

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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `media`
--

INSERT INTO `media` (`mediaid`, `filename`, `filepath`, `type`, `lastaccesstime`) VALUES
(3, 'sample2.wmv', 'uploads/metube/', 'video/x-ms-wmv', '2010-01-28 15:58:45'),
(4, 'sample3.wmv', 'uploads/metube/', 'video/x-ms-wmv', '2010-01-28 15:58:58'),
(5, 'sample1.wmv', 'uploads/metube/', 'video/x-ms-wmv', '2010-01-28 15:59:11'),
(9, 'nintendogs_wallcoo.com_6.jpg', 'uploads/metube/', 'image/jpeg', '2010-01-28 15:59:05');

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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

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

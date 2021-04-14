-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 14, 2021 at 09:50 PM
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
('cme', 'cme', 'cme@gmail.com', 4),
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
  `comments` varchar(500) NOT NULL,
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
-- Table structure for table `dms`
--

DROP TABLE IF EXISTS `dms`;
CREATE TABLE IF NOT EXISTS `dms` (
  `comid` int NOT NULL AUTO_INCREMENT,
  `sendid` varchar(50) NOT NULL,
  `recid` varchar(50) NOT NULL,
  `dm` varchar(500) NOT NULL,
  PRIMARY KEY (`comid`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `dms`
--

INSERT INTO `dms` (`comid`, `sendid`, `recid`, `dm`) VALUES
(13, 'test', 'metube', 'Message here');

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
  `description` varchar(5000) NOT NULL,
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
-- Table structure for table `playlists`
--

DROP TABLE IF EXISTS `playlists`;
CREATE TABLE IF NOT EXISTS `playlists` (
  `playlistid` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `userid` int DEFAULT NULL,
  PRIMARY KEY (`playlistid`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `playlists`
--

INSERT INTO `playlists` (`playlistid`, `name`, `userid`) VALUES
(2, 'test', 1),
(3, 'new playlist', 1),
(4, 'Cole', 1),
(5, 'coles playlist', 1),
(10, 'funny videos', 2),
(11, 'new', 2),
(12, 'coles videos', 2),
(13, 'new video', 2),
(18, 'test playlist', 2),
(19, 'test playlist', 3),
(20, 'playlist', 3),
(21, 'test playlist', 1),
(22, 'cme\'s playlist', 4),
(23, '2nd playlist', 4),
(24, 'test playlist', 4),
(25, 'test2', 4),
(26, 'test playlist', 2),
(27, 'test', 4),
(28, 'newest ', 4);

-- --------------------------------------------------------

--
-- Table structure for table `playlist_media`
--

DROP TABLE IF EXISTS `playlist_media`;
CREATE TABLE IF NOT EXISTS `playlist_media` (
  `playlistid` int NOT NULL,
  `mediaid` int NOT NULL,
  KEY `playlist_idx` (`playlistid`),
  KEY `media_idx` (`mediaid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `playlist_media`
--

INSERT INTO `playlist_media` (`playlistid`, `mediaid`) VALUES
(3, 3),
(3, 3),
(3, 3),
(3, 4),
(3, 5),
(3, 3),
(3, 4),
(3, 5),
(3, 3),
(3, 3),
(3, 4),
(3, 4),
(3, 4),
(3, 4),
(3, 4),
(3, 3),
(3, 3),
(3, 3),
(3, 3),
(3, 4),
(3, 4),
(4, 3),
(4, 4),
(4, 3),
(3, 4),
(4, 3),
(4, 4),
(4, 5),
(4, 5),
(4, 5),
(4, 5),
(4, 5),
(2, 5),
(2, 5),
(2, 4),
(10, 4),
(5, 9),
(5, 5),
(5, 9),
(3, 4),
(18, 4),
(18, 5),
(11, 3),
(11, 3),
(11, 4),
(11, 3),
(20, 4),
(22, 5),
(22, 9),
(22, 5),
(22, 3),
(22, 9),
(22, 5),
(23, 5),
(23, 4),
(23, 9),
(25, 5),
(3, 9),
(5, 4),
(21, 3),
(21, 9),
(24, 5),
(28, 4),
(28, 5);

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

--
-- Constraints for dumped tables
--

--
-- Constraints for table `playlist_media`
--
ALTER TABLE `playlist_media`
  ADD CONSTRAINT `media` FOREIGN KEY (`mediaid`) REFERENCES `media` (`mediaid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `playlist` FOREIGN KEY (`playlistid`) REFERENCES `playlists` (`playlistid`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

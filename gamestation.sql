-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 20, 2018 at 10:35 AM
-- Server version: 5.7.21
-- PHP Version: 5.6.35

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gamestation`
--

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

DROP TABLE IF EXISTS `contact`;
CREATE TABLE IF NOT EXISTS `contact` (
  `messageid` varchar(10) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `message` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`messageid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contact`
--

-- --------------------------------------------------------

--
-- Table structure for table `favourite`
--

DROP TABLE IF EXISTS `favourite`;
CREATE TABLE IF NOT EXISTS `favourite` (
  `userID` varchar(10) NOT NULL,
  `gameID` varchar(10) NOT NULL,
  PRIMARY KEY (`userID`,`gameID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `favourite`
--

-- --------------------------------------------------------

--
-- Table structure for table `game`
--

DROP TABLE IF EXISTS `game`;
CREATE TABLE IF NOT EXISTS `game` (
  `gameID` varchar(10) NOT NULL,
  `gameName` varchar(20) NOT NULL,
  `category` varchar(10) NOT NULL,
  `tag` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `game`
--

INSERT INTO `game` (`gameID`, `gameName`, `category`, `tag`) VALUES
('G001', 'bloxorz', 'puzzle', 'puzzle game'),
('G002', 'Twisted Lines', 'puzzle', 'puzzle game'),
('G003', 'Euro Soccer Forever', 'sports', 'soccer'),
('G004', 'Basketball Stars', 'sports', 'basketball'),
('G005', 'Sportbike Champion', 'racing', 'bike game'),
('G006', 'Commando: Rush', 'action', 'shooting'),
('G007', 'Diablo Valley Rally', 'racing', 'off Road'),
('G008', 'Assault Course 2', 'action', 'shooting'),
('G009', 'RotorStorm', 'action', 'helicopter game'),
('G010', 'Supercar Showdown', 'racing', 'car game'),
('G011', 'ProBaseball', 'sports', 'baseball'),
('G012', 'Magic Balls', 'puzzle', 'patten'),
('G013', 'Stealth Sniper 2', 'action', 'sniper');

-- --------------------------------------------------------

--
-- Table structure for table `gameurl`
--

DROP TABLE IF EXISTS `gameurl`;
CREATE TABLE IF NOT EXISTS `gameurl` (
  `GameID` varchar(10) NOT NULL,
  `code` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `gameurl`
--

INSERT INTO `gameurl` (`GameID`, `code`) VALUES
('G001', 'bloxorz'),
('G002', 'twisted-lines'),
('G003', 'euro-soccer-forever'),
('G004', 'basketball-stars'),
('G005', 'sportbike-champion'),
('G006', 'commando-rush'),
('G007', 'diablo-valley-rally'),
('G008', 'assault-course-2'),
('G009', 'rotorstorm'),
('G010', 'supercar-showdown'),
('G011', 'probaseball'),
('G012', 'magic-balls'),
('G013', 'stealth-sniper-2');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `userID` varchar(10) NOT NULL,
  `firstName` varchar(20) DEFAULT NULL,
  `lastName` varchar(20) DEFAULT NULL,
  `gender` varchar(7) DEFAULT 'Male',
  `country` varchar(20) DEFAULT NULL,
  `platform` varchar(20) DEFAULT NULL,
  `userName` varchar(20) NOT NULL,
  `email` varchar(30) NOT NULL,
  `type` varchar(10) NOT NULL DEFAULT 'user',
  PRIMARY KEY (`userID`,`userName`,`email`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userID`, `firstName`, `lastName`, `gender`, `country`, `platform`, `userName`, `email`, `type`) VALUES
('P1001', 'Admin', 'Admin', 'Male', 'Sri Lanka', 'PC', 'admin', 'admin@gamestation.com', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `useraccount`
--

DROP TABLE IF EXISTS `useraccount`;
CREATE TABLE IF NOT EXISTS `useraccount` (
  `userID` varchar(10) NOT NULL,
  `userName` varchar(20) NOT NULL,
  `password` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`userID`,`userName`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `useraccount`
--

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 24, 2017 at 04:05 AM
-- Server version: 5.7.19
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `flight db`
--

DELIMITER $$
--
-- Procedures
--
DROP PROCEDURE IF EXISTS `getFlightsByCity`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `getFlightsByCity` (IN `ORIGIN` VARCHAR(45))  BEGIN
	SELECT a1.city, d_date, a1.name as origin, d_time, 
			a2.name as destination, arr_time, airline.name as airline
	FROM flight, route, airport as a1, airport as a2, airline
	WHERE a1.city = ORIGIN
	AND flight.r_id = route.rid
	AND route.d_airport = a1.airport_id
	AND route.arr_airport = a2.airport_id
	AND flight.al_id = airline.alid;
END$$

DROP PROCEDURE IF EXISTS `ticket`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ticket` (IN `email` VARCHAR(20))  NO SQL
SELECT fname,lname,ticketid,date,a1.city as origin, a2.city as destination from booking,airport as a1,airport AS a2,flight,route
WHERE booking.fid=flight.fid
AND flight.r_id=route.rid
AND route.arr_airport=a1.airport_id
AND route.d_airport=a2.airport_id
AND
booking.email=email$$

DROP PROCEDURE IF EXISTS `update1`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `update1` (IN `flightid` INT)  NO SQL
UPDATE flight
set flight.seats = flight.seats-1 where flight.fid=flightid$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `airline`
--

DROP TABLE IF EXISTS `airline`;
CREATE TABLE IF NOT EXISTS `airline` (
  `alid` int(10) NOT NULL,
  `name` varchar(10) NOT NULL,
  `code` int(10) NOT NULL,
  `country` varchar(10) NOT NULL,
  PRIMARY KEY (`alid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `airline`
--

INSERT INTO `airline` (`alid`, `name`, `code`, `country`) VALUES
(900, 'lufthansa', 9, 'germany'),
(901, 'airasia', 6, 'malaysia'),
(902, 'jetairways', 11, 'India'),
(903, 'indigo', 12, 'India'),
(904, 'etihad', 265, 'uae');

-- --------------------------------------------------------

--
-- Table structure for table `airport`
--

DROP TABLE IF EXISTS `airport`;
CREATE TABLE IF NOT EXISTS `airport` (
  `airport_id` int(5) NOT NULL,
  `name` varchar(20) NOT NULL,
  `city` varchar(20) NOT NULL,
  `country` varchar(20) NOT NULL,
  PRIMARY KEY (`airport_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `airport`
--

INSERT INTO `airport` (`airport_id`, `name`, `city`, `country`) VALUES
(700, 'kempegowda', 'bangalore', 'india'),
(701, 'rajiv gandhi', 'hyderabad', 'india'),
(702, 'changi', 'singapore', 'singapore'),
(703, 'kennedy', 'newyork', 'usa'),
(704, 'heathrow', 'london', 'uk'),
(705, 'tullamarine', 'melbourne', 'australia');

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
CREATE TABLE IF NOT EXISTS `booking` (
  `ticketid` int(10) NOT NULL AUTO_INCREMENT,
  `fid` int(10) NOT NULL,
  `fname` varchar(30) NOT NULL,
  `lname` varchar(30) NOT NULL,
  `date` date NOT NULL,
  `seatno` int(11) NOT NULL,
  `email` varchar(30) NOT NULL,
  PRIMARY KEY (`ticketid`),
  UNIQUE KEY `uni` (`seatno`),
  UNIQUE KEY `mail` (`email`),
  KEY `jimmy` (`fid`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`ticketid`, `fid`, `fname`, `lname`, `date`, `seatno`, `email`) VALUES
(24, 200, 'pk', 'k', '2017-11-08', 20, 'dell'),
(25, 200, 'pavan', 'kirageri', '2017-11-16', 100, 'skpavan2@gmail.com'),
(26, 200, 'pavan', 'kirageri', '2017-11-16', 102, 'skpavan22@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `flight`
--

DROP TABLE IF EXISTS `flight`;
CREATE TABLE IF NOT EXISTS `flight` (
  `fid` int(10) NOT NULL,
  `d_time` time NOT NULL,
  `d_date` date NOT NULL,
  `arr_time` time NOT NULL,
  `arr_date` date NOT NULL,
  `r_id` int(10) NOT NULL,
  `seats` int(20) NOT NULL,
  `al_id` int(10) NOT NULL,
  PRIMARY KEY (`fid`),
  KEY `alid` (`al_id`),
  KEY `ridd` (`r_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `flight`
--

INSERT INTO `flight` (`fid`, `d_time`, `d_date`, `arr_time`, `arr_date`, `r_id`, `seats`, `al_id`) VALUES
(200, '07:16:00', '2017-11-13', '10:29:00', '2017-11-14', 100, 180, 900),
(201, '09:34:11', '2017-11-13', '09:35:00', '2017-11-14', 102, 300, 901),
(202, '10:30:00', '2017-11-15', '22:30:00', '2017-11-16', 103, 200, 903),
(203, '13:20:00', '2017-11-26', '22:30:00', '2017-11-26', 101, 148, 904);

-- --------------------------------------------------------

--
-- Table structure for table `passenger`
--

DROP TABLE IF EXISTS `passenger`;
CREATE TABLE IF NOT EXISTS `passenger` (
  `fname` varchar(20) NOT NULL,
  `lname` varchar(20) NOT NULL,
  `mail` varchar(30) NOT NULL,
  `password` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `passenger`
--

INSERT INTO `passenger` (`fname`, `lname`, `mail`, `password`) VALUES
('pavan', 'KIRIGERI', 'skpavan2@gmail.com', ''),
('fer', 'd', 'vtf', ''),
('pavan', 'kirageri', 'pavank', '1234');

-- --------------------------------------------------------

--
-- Table structure for table `route`
--

DROP TABLE IF EXISTS `route`;
CREATE TABLE IF NOT EXISTS `route` (
  `rid` int(10) NOT NULL,
  `fid` int(10) NOT NULL,
  `d_airport` int(10) NOT NULL,
  `arr_airport` int(10) NOT NULL,
  PRIMARY KEY (`rid`),
  KEY `index` (`fid`),
  KEY `dair` (`d_airport`),
  KEY `aar` (`arr_airport`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `route`
--

INSERT INTO `route` (`rid`, `fid`, `d_airport`, `arr_airport`) VALUES
(100, 200, 700, 703),
(101, 203, 702, 701),
(102, 201, 705, 704),
(103, 202, 700, 704);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `id` int(100) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`email`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1235 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`email`, `password`, `id`) VALUES
('skpavan2@gmail.com', 'Pavan12345', 1234);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `fid_fk` FOREIGN KEY (`fid`) REFERENCES `flight` (`fid`) ON DELETE CASCADE;

--
-- Constraints for table `flight`
--
ALTER TABLE `flight`
  ADD CONSTRAINT `aid` FOREIGN KEY (`al_id`) REFERENCES `airline` (`alid`);

--
-- Constraints for table `route`
--
ALTER TABLE `route`
  ADD CONSTRAINT `air` FOREIGN KEY (`d_airport`) REFERENCES `airport` (`airport_id`),
  ADD CONSTRAINT `airport` FOREIGN KEY (`arr_airport`) REFERENCES `airport` (`airport_id`),
  ADD CONSTRAINT `fk` FOREIGN KEY (`fid`) REFERENCES `flight` (`fid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

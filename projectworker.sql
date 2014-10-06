-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- Φιλοξενητής: localhost
-- Χρόνος δημιουργίας: 09 Ιουλ 2012 στις 12:04:23
-- Έκδοση Διακομιστή: 5.5.16
-- Έκδοση PHP: 5.3.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Βάση: `ted`
--

-- --------------------------------------------------------

--
-- Δομή Πίνακα για τον Πίνακα `project`
--

CREATE TABLE IF NOT EXISTS `project` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `view` varchar(50) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `manager` varchar(50) DEFAULT NULL,
  `stuff` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=527 ;

--
-- Άδειασμα δεδομένων του πίνακα `project`
--

INSERT INTO `project` (`id`, `name`, `view`, `description`, `manager`, `stuff`) VALUES
(516, 'Spearfishing in Greece', 'public', 'It''s time to catch a few fish ....', 'manager2', 'stuff ,stuff2 ,stuff3 '),
(517, 'University of Athens', 'private', 'Department of Informatics and Telecommunications', 'manager3', 'stuff ,stuff1 ,stuff2 '),
(515, 'WRC', 'public', 'World Rally Championship in Greece. Well known as rally acropolis !', 'manager1', 'stuff1 ,stuff2 '),
(518, 'Opel Corsa', 'private', 'The new Opel Corsa is here. With the powerful engine of 1.400 cc and 100hp !', 'manager2', 'stuff2 ,stuff3 ,stuff4 '),
(520, 'Drupal', 'public', 'A powerful CMS. But very difficult.', 'manager', 'stuff1 ,stuff2 '),
(523, 'Opel Astra 2000', 'private', 'The Car of the year 1999', 'manager2', 'stuff1 ,stuff2 ,stuff3 '),
(524, 'Subaru M80', 'public', 'It''s also called "Mini Jumbo". It has an engine of 758 cc and it''s power is 42ps... ', 'manager1', 'stuff ,stuff1 ,stuff2 ,stuff3 ');

-- --------------------------------------------------------

--
-- Δομή Πίνακα για τον Πίνακα `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `surname` varchar(50) DEFAULT NULL,
  `type` varchar(50) DEFAULT 'visitor',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=126 ;

--
-- Άδειασμα δεδομένων του πίνακα `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `email`, `name`, `surname`, `type`) VALUES
(100, 'admin', 'admin', 'n.maniakoudakis@gmail.com', 'Nikos', 'Maniakoudakis', 'administrator'),
(116, 'visitor', 'visitor', 'visitor@visitor.com', 'visitor', 'visitor', 'visitor'),
(117, 'manager', 'manager', 'man@man.gr', 'Giorgos', 'Papadakis', 'manager'),
(118, 'stuff', 'stuff', 'stuff@stuff.com', 'vaso', 'paulou', 'stuff'),
(119, 'manager1', 'manager1', 'man@kalod.gr', 'nikos', 'papas', 'manager'),
(120, 'manager2', 'manager2', 'kalos@giorgo.eu', 'vasilis', 'kalos', 'manager'),
(121, 'manager3', 'manager3', 'kaka@kala.com', 'niki', 'vlaxou', 'manager'),
(122, 'stuff1', 'stuff1', 'sako@kopa.com', 'vasilis', 'kapos', 'stuff'),
(123, 'stuff2', 'stuff2', 'ntina@kpo.com', 'ntina', 'magoli', 'stuff'),
(124, 'stuff3', 'stuff3', 'mania@sag.com', 'aggi', 'manakou', 'stuff'),
(125, 'stuff4', 'stuff4', 'fotr@kola.gr', 'giannis', 'maniacos', 'stuff');

-- --------------------------------------------------------

--
-- Δομή Πίνακα για τον Πίνακα `work`
--

CREATE TABLE IF NOT EXISTS `work` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `start` varchar(50) DEFAULT NULL,
  `finish` varchar(50) DEFAULT NULL,
  `run` varchar(500) DEFAULT NULL,
  `project` varchar(50) DEFAULT NULL,
  `done` varchar(50) DEFAULT 'no',
  `comments` varchar(500) DEFAULT 'none',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1013 ;

--
-- Άδειασμα δεδομένων του πίνακα `work`
--

INSERT INTO `work` (`id`, `name`, `description`, `start`, `finish`, `run`, `project`, `done`, `comments`) VALUES
(1006, 'Oil Change', 'The car has done 50000 kilometers. We have to change his oil.', '16/6/2012', '17/6/2012', 'stuff \r\n,stuff2 \r\n,stuff3 \r\n', 'Subaru M80', 'no', 'none'),
(1005, 'Change Wheels', 'We have to change the wheels.', '15/6/2012', '17/6/2012', 'stuff1  ,stuff2  ', 'WRC', 'no', 'none'),
(1004, 'Change Tyres', 'We have to change tyres for the race cars.', '8/6/2012', '9/6/2012', 'stuff1  ', 'WRC', 'no', 'none'),
(1010, 'Change Oil Filter', 'We have to change the oil filter', '16/5/2012', '16/6/2012', 'stuff3 \r\n,stuff4 \r\n', 'Opel Corsa', 'no', 'ta sxolia mou'),
(1011, 'Water Bump', 'Change the water bump', '15/5/2012', '16/5/2012', 'stuff2  ,stuff3  ', 'Opel Corsa', 'yes', 'none'),
(1012, 'Gas Filter', 'We have to change the gas filter', '14/5/2012', '16/5/2012', 'stuff2  ,stuff3  ,stuff4  ', 'Opel Corsa', 'yes', 'none');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

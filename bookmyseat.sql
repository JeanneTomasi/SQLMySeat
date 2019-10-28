-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Client: localhost
-- Généré le: Lun 28 Octobre 2019 à 14:40
-- Version du serveur: 5.6.12-log
-- Version de PHP: 5.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `bookmyseat`
--
CREATE DATABASE IF NOT EXISTS `bookmyseat` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `bookmyseat`;

-- --------------------------------------------------------

--
-- Structure de la table `collectivity`
--

CREATE TABLE IF NOT EXISTS `collectivity` (
  `id_collectivity` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `operation_area` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_collectivity`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `collectivity`
--

INSERT INTO `collectivity` (`id_collectivity`, `name`, `operation_area`) VALUES
(1, 'Lyon', 'Aire métropolitaine lyonnaise ');

-- --------------------------------------------------------

--
-- Structure de la table `hibernate_sequence`
--

CREATE TABLE IF NOT EXISTS `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `hibernate_sequence`
--

INSERT INTO `hibernate_sequence` (`next_val`) VALUES
(41),
(41),
(41),
(41),
(41),
(41),
(41),
(41),
(41);

-- --------------------------------------------------------

--
-- Structure de la table `line`
--

CREATE TABLE IF NOT EXISTS `line` (
  `id_line` int(11) NOT NULL,
  `localisation` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_line`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `line`
--

INSERT INTO `line` (`id_line`, `localisation`, `name`) VALUES
(18, 'Lyon-Villeurbanne', 'C3'),
(19, 'Quais de saône', '40');

-- --------------------------------------------------------

--
-- Structure de la table `seat`
--

CREATE TABLE IF NOT EXISTS `seat` (
  `id_seat` int(11) NOT NULL,
  `is_reserved` bit(1) NOT NULL,
  `placement` varchar(255) DEFAULT NULL,
  `reservable` bit(1) NOT NULL,
  `id_vehicle` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_seat`),
  KEY `FKb7no10eviopyq24qhlbfecnkt` (`id_vehicle`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `seat`
--

INSERT INTO `seat` (`id_seat`, `is_reserved`, `placement`, `reservable`, `id_vehicle`) VALUES
(4, b'1', '1A', b'1', 23),
(5, b'1', '1B', b'1', 12),
(7, b'1', '2A', b'1', 11),
(24, b'0', '2B', b'0', 12);

-- --------------------------------------------------------

--
-- Structure de la table `seat_reservation`
--

CREATE TABLE IF NOT EXISTS `seat_reservation` (
  `id_seat_reservation` int(11) NOT NULL,
  `release_time` varchar(255) DEFAULT NULL,
  `starting_time` varchar(255) DEFAULT NULL,
  `id_seat` int(11) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_seat_reservation`),
  KEY `FKi7y14k93cc08ruxf7kdhcrnpj` (`id_seat`),
  KEY `FKd8rr7mfnpqbq20ld5u16u9ek0` (`id_user`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `seat_reservation`
--

INSERT INTO `seat_reservation` (`id_seat_reservation`, `release_time`, `starting_time`, `id_seat`, `id_user`) VALUES
(6, '19:57', '19:45', 4, 2),
(8, '20:35', '20:12', 7, 3),
(9, '20:30', '20:10', 4, 2),
(10, '20:43', '20:18', 5, 23),
(37, '20:36', '20:18', 5, 3),
(38, '21:18', '20:35', 7, 36),
(39, '15:02', '14:23', 5, 3);

-- --------------------------------------------------------

--
-- Structure de la table `station`
--

CREATE TABLE IF NOT EXISTS `station` (
  `id_station` int(11) NOT NULL,
  `localisation` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `id_transit_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_station`),
  KEY `FK7woigsxh2gqq933l427nna2k7` (`id_transit_time`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `station`
--

INSERT INTO `station` (`id_station`, `localisation`, `name`, `id_transit_time`) VALUES
(20, 'Lyon 4', 'Lyon Plage', 13),
(21, 'Place Bellecour', 'Bellecour le Viste', 14),
(22, 'Villeurbanne', 'Grandclément', 15);

-- --------------------------------------------------------

--
-- Structure de la table `transit_time`
--

CREATE TABLE IF NOT EXISTS `transit_time` (
  `id_transit_time` int(11) NOT NULL,
  `transit_time` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_transit_time`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `transit_time`
--

INSERT INTO `transit_time` (`id_transit_time`, `transit_time`) VALUES
(13, '20:18'),
(14, '20:22'),
(15, '20:37'),
(16, '20:38');

-- --------------------------------------------------------

--
-- Structure de la table `transport_entreprise`
--

CREATE TABLE IF NOT EXISTS `transport_entreprise` (
  `id_transport_entreprise` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `id_collectivity` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_transport_entreprise`),
  KEY `id_collectivity` (`id_collectivity`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `transport_entreprise`
--

INSERT INTO `transport_entreprise` (`id_transport_entreprise`, `name`, `id_collectivity`) VALUES
(17, 'TCL', 1);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id_user` int(11) NOT NULL,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `date_de_naissance` date DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `handicap` varchar(255) DEFAULT 'Valid',
  `name` varchar(255) DEFAULT NULL,
  `num` int(11) NOT NULL,
  `postal_code` int(11) NOT NULL,
  `street` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `user`
--

INSERT INTO `user` (`id_user`, `city`, `country`, `date_de_naissance`, `email`, `first_name`, `handicap`, `name`, `num`, `postal_code`, `street`, `username`) VALUES
(2, 'Lyon', 'France', '1992-01-22', 'jeanne.zoe.tomasi@gmail.com', 'Jeanne', 'DisabledInIndustrialAccidents', 'Tomasi', 11, 69007, 'rue Sébastien Gryphe', 'Peloute2000'),
(3, 'Lyon', 'France', '1988-03-22', 'vincent.ruby@gmx.fr', 'Vincent', 'Elderly', 'Ruby', 18, 69003, 'rue Mystère', 'vinceleGossBo'),
(23, 'Lyon', 'France', '1994-07-12', 'robin.muller12@gmail.com', 'Robin', 'Pregnant', 'Muller', 38, 69002, 'rue du lol', 'Robyn'),
(36, 'Bourgoin-Jallieu', 'France', '1954-05-17', 'gilbuze@mdr.lol', 'Gilbert', 'Valid', 'Montagné', 0, 38000, 'des Poulets', 'Gilbouzedu38');

-- --------------------------------------------------------

--
-- Structure de la table `vehicle`
--

CREATE TABLE IF NOT EXISTS `vehicle` (
  `id_vehicle` int(11) NOT NULL,
  `capacity` int(11) NOT NULL,
  `full_rate` double NOT NULL,
  `immatriculation` varchar(255) DEFAULT NULL,
  `passengers` int(11) NOT NULL,
  `places_left` int(11) NOT NULL,
  `id_line` int(11) DEFAULT NULL,
  `id_transit_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_vehicle`),
  KEY `FKqyxuc0o9tamao8tvynwl1debj` (`id_line`),
  KEY `FK84vbuieht50vm6j3phuq7da0r` (`id_transit_time`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `vehicle`
--

INSERT INTO `vehicle` (`id_vehicle`, `capacity`, `full_rate`, `immatriculation`, `passengers`, `places_left`, `id_line`, `id_transit_time`) VALUES
(23, 5, 40, 'DT-841-VX', 2, 3, 19, 14),
(11, 80, 62.5, 'DS-536-UX', 30, 50, 18, 15),
(12, 54, 40.7, 'AE-365-TE', 22, 32, 19, 13);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

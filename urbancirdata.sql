-- phpMyAdmin SQL Dump
-- version OVH
-- http://www.phpmyadmin.net
--
-- Client: mysql51-84.perso
-- Généré le : Sam 25 Mai 2013 à 19:25
-- Version du serveur: 5.1.66
-- Version de PHP: 5.3.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `urbancirdata`
--

-- --------------------------------------------------------

--
-- Structure de la table `Localisation`
--

CREATE TABLE IF NOT EXISTS `Localisation` (
  `id_loc` int(11) NOT NULL AUTO_INCREMENT,
  `city` varchar(20) NOT NULL,
  `zipcode` int(11) NOT NULL,
  `address` varchar(255) NOT NULL,
  PRIMARY KEY (`id_loc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `MusicBand`
--

CREATE TABLE IF NOT EXISTS `MusicBand` (
  `band-name` varchar(255) NOT NULL,
  `style` varchar(40) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`band-name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `MusicMember`
--

CREATE TABLE IF NOT EXISTS `MusicMember` (
  `pseudo` varchar(11) NOT NULL,
  `band_name` varchar(255) NOT NULL,
  `travelCard` varchar(255) NOT NULL,
  `secuNumber` int(11) NOT NULL,
  PRIMARY KEY (`pseudo`),
  KEY `band_name` (`band_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `UserInfo`
--

CREATE TABLE IF NOT EXISTS `UserInfo` (
  `firstname` varchar(25) NOT NULL,
  `lastname` varchar(30) NOT NULL,
  `pseudo` varchar(11) NOT NULL,
  `password` varchar(15) NOT NULL,
  `email` varchar(255) NOT NULL,
  `tel` int(11) NOT NULL,
  `id_localisation` int(11) NOT NULL,
  `user_category` varchar(255) NOT NULL,
  PRIMARY KEY (`pseudo`),
  KEY `id_localisation` (`id_localisation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `MusicMember`
--
ALTER TABLE `MusicMember`
  ADD CONSTRAINT `MusicMember_ibfk_2` FOREIGN KEY (`band_name`) REFERENCES `MusicBand` (`band-name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `MusicMember_ibfk_1` FOREIGN KEY (`pseudo`) REFERENCES `UserInfo` (`pseudo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `UserInfo`
--
ALTER TABLE `UserInfo`
  ADD CONSTRAINT `UserInfo_ibfk_1` FOREIGN KEY (`id_localisation`) REFERENCES `Localisation` (`id_loc`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

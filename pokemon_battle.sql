-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  mer. 22 mai 2019 à 13:20
-- Version du serveur :  5.7.19
-- Version de PHP :  5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `pokemon_battle`
--

-- --------------------------------------------------------

--
-- Structure de la table `attack`
--

DROP TABLE IF EXISTS `attack`;
CREATE TABLE IF NOT EXISTS `attack` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `power` int(11) DEFAULT NULL,
  `type` smallint(6) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `is_enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `attack`
--

INSERT INTO `attack` (`id`, `name`, `power`, `type`, `created_at`, `updated_at`, `deleted_at`, `is_enabled`) VALUES
(35, 'Billic', 50, 2, '2019-05-21 13:31:56', '2019-05-21 13:31:56', NULL, 1),
(36, 'Volvic', 60, 3, '2019-05-21 13:31:56', '2019-05-21 13:31:56', NULL, 1),
(37, 'Agriculture', 40, 1, '2019-05-21 13:31:56', '2019-05-21 13:31:56', NULL, 1),
(38, 'Charge', 40, 4, '2019-05-21 13:31:56', '2019-05-21 13:31:56', NULL, 1);

-- --------------------------------------------------------

--
-- Structure de la table `migration_versions`
--

DROP TABLE IF EXISTS `migration_versions`;
CREATE TABLE IF NOT EXISTS `migration_versions` (
  `version` varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL,
  `executed_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migration_versions`
--

INSERT INTO `migration_versions` (`version`, `executed_at`) VALUES
('20190321141218', '2019-03-21 14:16:45'),
('20190321142827', '2019-03-21 14:28:35'),
('20190326133510', '2019-03-26 13:35:20'),
('20190411091204', '2019-04-11 09:12:36'),
('20190521133135', '2019-05-21 13:31:46');

-- --------------------------------------------------------

--
-- Structure de la table `pokemon`
--

DROP TABLE IF EXISTS `pokemon`;
CREATE TABLE IF NOT EXISTS `pokemon` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` smallint(6) NOT NULL,
  `hp` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `is_enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `pokemon`
--

INSERT INTO `pokemon` (`id`, `name`, `type`, `hp`, `created_at`, `updated_at`, `deleted_at`, `is_enabled`) VALUES
(22, 'Ouisticram', 2, 200, '2019-05-21 13:31:56', '2019-05-21 13:31:56', NULL, 1),
(23, 'Tiplouf', 3, 200, '2019-05-21 13:31:56', '2019-05-21 13:31:56', NULL, 1),
(24, 'Tortipouss', 1, 200, '2019-05-21 13:31:56', '2019-05-21 13:31:56', NULL, 1);

-- --------------------------------------------------------

--
-- Structure de la table `pokemon_attack`
--

DROP TABLE IF EXISTS `pokemon_attack`;
CREATE TABLE IF NOT EXISTS `pokemon_attack` (
  `pokemon_id` int(11) NOT NULL,
  `attack_id` int(11) NOT NULL,
  PRIMARY KEY (`pokemon_id`,`attack_id`),
  KEY `IDX_2B29516F2FE71C3E` (`pokemon_id`),
  KEY `IDX_2B29516FF5315759` (`attack_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `pokemon_attack`
--

INSERT INTO `pokemon_attack` (`pokemon_id`, `attack_id`) VALUES
(22, 35),
(22, 38),
(23, 36),
(23, 38),
(24, 37),
(24, 38);

-- --------------------------------------------------------

--
-- Structure de la table `potion`
--

DROP TABLE IF EXISTS `potion`;
CREATE TABLE IF NOT EXISTS `potion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `strength` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `potion`
--

INSERT INTO `potion` (`id`, `name`, `strength`) VALUES
(16, 'Potion', 20),
(17, 'Super Potion', 50),
(18, 'Hyper Potion', 100);

-- --------------------------------------------------------

--
-- Structure de la table `trainer`
--

DROP TABLE IF EXISTS `trainer`;
CREATE TABLE IF NOT EXISTS `trainer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `starter_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_C51508205E237E06` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `trainer`
--

INSERT INTO `trainer` (`id`, `name`, `roles`, `password`, `starter_at`) VALUES
(5, 'Admin', '[\"ROLE_ADMIN\"]', '$2y$10$Gr3Qac.6.OPV/gShSqGIt.Q83aHWcGSDJaPaEm3uIMpHI1/ajqgAy', NULL),
(6, 'Sacha', '[\"ROLE_USER\"]', '$2y$10$nCaVAhw23db9l4I4dWcB4uMW287z1LHii3JvSoM2oPJPFLNIzuDRS', NULL);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `pokemon_attack`
--
ALTER TABLE `pokemon_attack`
  ADD CONSTRAINT `FK_2B29516F2FE71C3E` FOREIGN KEY (`pokemon_id`) REFERENCES `pokemon` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_2B29516FF5315759` FOREIGN KEY (`attack_id`) REFERENCES `attack` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

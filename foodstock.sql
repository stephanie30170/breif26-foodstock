-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : ven. 08 jan. 2021 à 14:31
-- Version du serveur :  8.0.22-0ubuntu0.20.04.3
-- Version de PHP : 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `foodstock`
--

-- --------------------------------------------------------

--
-- Structure de la table `assoc_info_produit`
--

CREATE TABLE `assoc_info_produit` (
  `id_stock` int NOT NULL,
  `id_type` int NOT NULL,
  `id_saison` int NOT NULL,
  `id_prix` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `nom_du_produit`
--

CREATE TABLE `nom_du_produit` (
  `id` int NOT NULL,
  `nom` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `prix`
--

CREATE TABLE `prix` (
  `id_prix` int NOT NULL,
  `prix` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `saisons`
--

CREATE TABLE `saisons` (
  `id_saisons` int NOT NULL,
  `nom_saison` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `stock`
--

CREATE TABLE `stock` (
  `id_stock` int NOT NULL,
  `date_entree` date NOT NULL,
  `date_de_peramption` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `type_produit`
--

CREATE TABLE `type_produit` (
  `id_produit` int NOT NULL,
  `nom_type` varchar(40) NOT NULL,
  `type_id nom` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `assoc_info_produit`
--
ALTER TABLE `assoc_info_produit`
  ADD KEY `id_stock` (`id_stock`),
  ADD KEY `id_type` (`id_type`),
  ADD KEY `id_saison` (`id_saison`),
  ADD KEY `id_prix` (`id_prix`);

--
-- Index pour la table `nom_du_produit`
--
ALTER TABLE `nom_du_produit`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `prix`
--
ALTER TABLE `prix`
  ADD PRIMARY KEY (`id_prix`);

--
-- Index pour la table `saisons`
--
ALTER TABLE `saisons`
  ADD PRIMARY KEY (`id_saisons`);

--
-- Index pour la table `stock`
--
ALTER TABLE `stock`
  ADD PRIMARY KEY (`id_stock`);

--
-- Index pour la table `type_produit`
--
ALTER TABLE `type_produit`
  ADD PRIMARY KEY (`id_produit`),
  ADD KEY `type_id nom` (`type_id nom`);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `nom_du_produit`
--
ALTER TABLE `nom_du_produit`
  ADD CONSTRAINT `nom_du_produit_ibfk_1` FOREIGN KEY (`id`) REFERENCES `type_produit` (`type_id nom`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `prix`
--
ALTER TABLE `prix`
  ADD CONSTRAINT `prix_ibfk_1` FOREIGN KEY (`id_prix`) REFERENCES `assoc_info_produit` (`id_prix`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `saisons`
--
ALTER TABLE `saisons`
  ADD CONSTRAINT `saisons_ibfk_1` FOREIGN KEY (`id_saisons`) REFERENCES `assoc_info_produit` (`id_saison`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `stock`
--
ALTER TABLE `stock`
  ADD CONSTRAINT `stock_ibfk_1` FOREIGN KEY (`id_stock`) REFERENCES `assoc_info_produit` (`id_stock`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `type_produit`
--
ALTER TABLE `type_produit`
  ADD CONSTRAINT `type_produit_ibfk_1` FOREIGN KEY (`id_produit`) REFERENCES `assoc_info_produit` (`id_type`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

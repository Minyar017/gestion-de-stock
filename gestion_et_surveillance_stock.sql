-- phpMyAdmin SQL Dump
-- version 2.6.1
-- http://www.phpmyadmin.net
-- 
-- Serveur: localhost
-- Généré le : Lundi 18 Novembre 2024 à 23:02
-- Version du serveur: 4.1.9
-- Version de PHP: 4.3.10
-- 
-- Base de données: `gestion_et_surveillance_stock`
-- 

-- --------------------------------------------------------

-- 
-- Structure de la table `alertes`
-- 

CREATE TABLE `alertes` (
  `id` int(11) NOT NULL auto_increment,
  `produit_id` int(11) default NULL,
  `type` varchar(50) NOT NULL default '',
  `message` text NOT NULL,
  `date_heure` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`id`),
  KEY `produit_id` (`produit_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- 
-- Contenu de la table `alertes`
-- 


-- --------------------------------------------------------

-- 
-- Structure de la table `capteurs`
-- 

CREATE TABLE `capteurs` (
  `id` int(11) NOT NULL auto_increment,
  `type` varchar(50) NOT NULL default '',
  `emplacement` varchar(100) NOT NULL default '',
  `produit_id` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `produit_id` (`produit_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- 
-- Contenu de la table `capteurs`
-- 


-- --------------------------------------------------------

-- 
-- Structure de la table `commandes`
-- 

CREATE TABLE `commandes` (
  `id` int(11) NOT NULL auto_increment,
  `produit_id` int(11) default NULL,
  `quantite` int(11) NOT NULL default '0',
  `date_commande` datetime NOT NULL default '0000-00-00 00:00:00',
  `status` varchar(50) NOT NULL default '',
  PRIMARY KEY  (`id`),
  KEY `produit_id` (`produit_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- 
-- Contenu de la table `commandes`
-- 


-- --------------------------------------------------------

-- 
-- Structure de la table `données_capteurs`
-- 

CREATE TABLE `données_capteurs` (
  `id` int(11) NOT NULL auto_increment,
  `capteur_id` int(11) NOT NULL default '0',
  `valeur` decimal(10,2) NOT NULL default '0.00',
  `date_heure` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- 
-- Contenu de la table `données_capteurs`
-- 


-- --------------------------------------------------------

-- 
-- Structure de la table `produits`
-- 

CREATE TABLE `produits` (
  `id` int(11) NOT NULL auto_increment,
  `nom` varchar(100) NOT NULL default '',
  `description` text,
  `prix` decimal(10,2) default NULL,
  `categorie` varchar(50) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- 
-- Contenu de la table `produits`
-- 


-- --------------------------------------------------------

-- 
-- Structure de la table `stocks`
-- 

CREATE TABLE `stocks` (
  `id` int(11) NOT NULL auto_increment,
  `produit_id` int(11) default NULL,
  `quantite` int(11) NOT NULL default '0',
  `niveau_min` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `produit_id` (`produit_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- 
-- Contenu de la table `stocks`
-- 


-- --------------------------------------------------------

-- 
-- Structure de la table `utilisateurs`
-- 

CREATE TABLE `utilisateurs` (
  `id` int(11) NOT NULL auto_increment,
  `nom` varchar(100) NOT NULL default '',
  `email` varchar(100) NOT NULL default '',
  `mot_de_passe` varchar(255) NOT NULL default '',
  `role` varchar(50) NOT NULL default '',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- 
-- Contenu de la table `utilisateurs`
-- 


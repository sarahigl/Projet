CREATE DATABASE IF NOT EXISTS RECIPEPEDIA;

USE RECIPEPEDIA;

CREATE TABLE IF NOT EXISTS UTILISATEURS(
	id_utilisateur INT PRIMARY KEY AUTO_INCREMENT,
    pseudo_utilisateur VARCHAR(25) UNIQUE,
    email_utilisateur VARCHAR(255) UNIQUE,
    nom_utilisateur VARCHAR(50) NOT NULL,
    prenom_utilisateur VARCHAR(50) NOT NULL,
    mot_de_passe_utilisateur VARCHAR(255) NOT NULL
) Engine=InnoDB;

CREATE TABLE IF NOT EXISTS RECETTES(
	id_recette INT PRIMARY KEY AUTO_INCREMENT,
    titre_recette VARCHAR(150) NOT NULL,
    ingredients_recette TEXT NOT NULL,
    description_recette TEXT NOT NULL,
	temp_preparation_recette VARCHAR(20) NOT NULL,
    temp_cuisson_recette VARCHAR(20) NOT NULL,
    id_utilisateur INT(11),
    FOREIGN KEY (id_utilisateur) REFERENCES UTILISATEURS(id_utilisateur)
)Engine=InnoDB;

CREATE TABLE IF NOT EXISTS FAVORISER(
	id_favoris INT PRIMARY KEY AUTO_INCREMENT,
    id_utilisateur INT(11),
    id_recette INT(11),
    FOREIGN KEY (id_utilisateur) REFERENCES UTILISATEURS(id_utilisateur),
    FOREIGN KEY (id_recette) REFERENCES RECETTES(id_recette)
)Engine=InnoDB;

CREATE TABLE IF NOT EXISTS SUIVRE(
	id_suivis INT PRIMARY KEY AUTO_INCREMENT,
    id_utilisateur_suiveur INT(11),
    id_utilisateur_suivi INT(11),
    FOREIGN KEY (id_utilisateur) REFERENCES UTILISATEURS(id_utilisateur)
)Engine=InnoDB;

CREATE TABLE IF NOT EXISTS PARTAGER(
	id_partage INT PRIMARY KEY AUTO_INCREMENT,
	droit_acces VARCHAR(20) NOT NULL,
	lien_acces VARCHAR(255) NOT NULL,
	id_recette INT(11),
	id_utilisateur INT(11),
    FOREIGN KEY (id_utilisateur) REFERENCES UTILISATEURS(id_utilisateur),
    FOREIGN KEY (id_recette) REFERENCES RECETTES(id_recette)
)Engine=InnoDB;
    
    
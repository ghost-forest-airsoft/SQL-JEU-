CREATE DATABASE rpg_db;
USE rpg_db;

CREATE TABLE IF NOT EXISTS CLASSE(
    idClasse INT NOT NULL AUTO_INCREMENT,
    nomClasse VARCHAR(100) NOT NULL,
    PRIMARY KEY (idClasse)
);

CREATE TABLE IF NOT EXISTS RACE(
    idRace INT NOT NULL AUTO_INCREMENT,
    nomRace VARCHAR(100) NOT NULL,
    PRIMARY KEY (idRace)
);

CREATE TABLE IF NOT EXISTS COMPETENCE(
    idCompetence INT NOT NULL AUTO_INCREMENT,
    competence VARCHAR(100) NOT NULL,
    PRIMARY KEY (idCompetence)
);

CREATE TABLE IF NOT EXISTS JOUEUR(
    idJoueur INT NOT NULL AUTO_INCREMENT,
    pseudo VARCHAR(100) NOT NULL,
    motDePasse VARCHAR(100) NOT NULL,
    adresseMail VARCHAR(100) NOT NULL,
    PRIMARY KEY (idJoueur)
);

CREATE TABLE IF NOT EXISTS TYPE_OBJET(
    idTypeObjet INT NOT NULL AUTO_INCREMENT,
    libelleType VARCHAR(100) NOT NULL,
    PRIMARY KEY (idTypeObjet)
);

CREATE TABLE IF NOT EXISTS OBJET(
    idObjet INT NOT NULL AUTO_INCREMENT,
    nomObjet VARCHAR(100) NOT NULL,
    valeurObjet INT NOT NULL,
    fk_idTypeObjet INT NOT NULL,
    PRIMARY KEY (idObjet),
    FOREIGN KEY (fk_idTypeObjet) REFERENCES TYPE_OBJET(idTypeObjet)
);

CREATE TABLE IF NOT EXISTS PERSONNAGE(
    idPersonnage INT NOT NULL AUTO_INCREMENT,
    nomPersonnage VARCHAR(100) NOT NULL,
    taillePersonnage INT NOT NULL,
    poidsPersonnage INT NOT NULL,
    puissance INT NOT NULL,
    intelligence INT NOT NULL,
    dexterite INT NOT NULL,
    charisme INT NOT NULL,
    vie INT NOT NULL,
    energie INT NOT NULL,
    argent INT NOT NULL,
    fk_idClasse INT NOT NULL,
    fk_idJoueur INT NOT NULL,
    fk_idRace INT NOT NULL,
    PRIMARY KEY (idPersonnage),
    FOREIGN KEY (fk_idClasse) REFERENCES CLASSE(idClasse),
    FOREIGN KEY (fk_idJoueur) REFERENCES JOUEUR(idJoueur),
    FOREIGN KEY (fk_idRace) REFERENCES RACE(idRace)
);

CREATE TABLE IF NOT EXISTS TRIMBALLE(
    idTrimballe INT NOT NULL AUTO_INCREMENT,
    fk_idPersonnage INT NOT NULL,
    fk_idObjet INT NOT NULL,
    PRIMARY KEY (idTrimballe),
    FOREIGN KEY (fk_idPersonnage) REFERENCES PERSONNAGE(idPersonnage),
    FOREIGN KEY (fk_idObjet) REFERENCES OBJET(idObjet)
);

CREATE TABLE IF NOT EXISTS MAITRISE(
    idMaitrise INT NOT NULL AUTO_INCREMENT,
    fk_idPersonnage INT NOT NULL,
    fk_idCompetence INT NOT NULL,
    PRIMARY KEY (idMaitrise),
    FOREIGN KEY (fk_idPersonnage) REFERENCES PERSONNAGE(idPersonnage),
    FOREIGN KEY (fk_idCompetence) REFERENCES COMPETENCE(idCompetence)
);

CREATE TABLE IF NOT EXISTS AJOUTE(
    idAjoute INT NOT NULL AUTO_INCREMENT,
    fk_idJoueur1 INT NOT NULL,
    fk_idJoueur2 INT NOT NULL,
    PRIMARY KEY (idAjoute),
    FOREIGN KEY (fk_idJoueur1) REFERENCES JOUEUR(idJoueur),
    FOREIGN KEY (fk_idJoueur2) REFERENCES JOUEUR(idJoueur)
);

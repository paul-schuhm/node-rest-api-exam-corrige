-- Script de création du schéma de la base de données du SI de réservation
-- de places de concerts (DDL: Data Definition Language)

USE mydb

CREATE TABLE IF NOT EXISTS Concert(
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    nb_places INT NOT NULL,
    date_debut DATETIME NOT NULL,
    lieu TEXT NOT NULL,
    artiste VARCHAR(120) NOT NULL,
    description TEXT NOT NULL,
    CONSTRAINT ck_nb_places CHECK (nb_places > 0)
);


CREATE TABLE IF NOT EXISTS Utilisateur(
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    pseudo VARCHAR(36) NOT NULL,
    password VARCHAR(36) NULL DEFAULT '',
    role ENUM('admin','visitor') NULL DEFAULT 'visitor',
    CONSTRAINT un_pseudo UNIQUE(pseudo),
    INDEX (pseudo)
);

CREATE TABLE IF NOT EXISTS Reservation(
    id_concert INTEGER NOT NULL,
    id_utilisateur INTEGER NOT NULL,
    statut ENUM('a_confirme','confirme','annule') NOT NULL,
    date_reservation DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT pk_reservation PRIMARY KEY(id_concert, id_utilisateur, statut),
    CONSTRAINT fk_reservation_concert FOREIGN KEY (id_concert) REFERENCES Concert(id),
    CONSTRAINT fk_reservation_utilisateur FOREIGN KEY (id_utilisateur) REFERENCES Utilisateur(id)
);


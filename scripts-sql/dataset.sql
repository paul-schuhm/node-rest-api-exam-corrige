-- Insertion d'un jeu de données test
-- Insérer les données en batchmode avec la commande mysql -uroot -proot -h127.0.0.1 -P5002 < ../data.sql
-- Format standard de la chaine de caractère d'un datetime 'YYYY-mm-dd hh:mm:ss'
USE mydb;

-- Concerts
INSERT INTO
    Concert (
        artiste,
        nb_places,
        date_debut,
        lieu,
        description
    )
VALUES
    (
        'Eels',
        1000,
        '2023-12-24 21:00:00',
        'Rennes, Salle de la Cité',
        'Lore ipsum'
    ),
    (
        'Cat Stevens',
        750,
        '2024-01-17 19:00:00',
        'Nantes, Stéréolux',
        'Lore ipsum'
    ) (
        'Foo Bar',
        2,
        '2024-01-23 21:00:00',
        'Rennes, dans une toute petite pièce',
        'Lore ipsum'
    ),

-- Utilisateurs et gestionnaire de site 'ed'
INSERT INTO
    Utilisateur (pseudo, role, password)
VALUES
    ('john', 'visitor', ''),
    ('eve44', 'visitor', ''),
    ('jenny', 'visitor', ''),
    ('ed', 'admin', 'password');

-- Reservations
INSERT INTO
    Reservation (id_concert, id_utilisateur, statut)
VALUES
    (1, 1, 'a_confirme'),
    (1, 1, 'annule'),
    (1, 2, 'confirme'),
    (2, 1, 'confirme');
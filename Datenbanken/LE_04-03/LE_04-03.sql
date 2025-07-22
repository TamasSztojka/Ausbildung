CREATE DATABASE constraints_datenbank;
USE constraints_datenbank;

CREATE TABLE productionsmaschinen(
	maschinenID INT,
    variante INT,
    bezeichnung VARCHAR(200),
    PRIMARY KEY(maschinenID, variante)
);

INSERT INTO productionsmaschinen(maschinenID, variante, bezeichnung)
VALUES(1, 1, 'Maschine Alpha'), (1, 2, 'Maschine Alpha Plus'), (2, 1, 'Maschine Beta'),(2, 2, 'Maschine Beta Plus');

DROP TABLE productionsmaschinen;

CREATE TABLE Productionsmaschinen(
	globalID INT AUTO_INCREMENT PRIMARY KEY,
    maschinenID INT,
    variante INT,
    bezeichnung VARCHAR(200),
    UNIQUE(maschinenID, variante)
);

INSERT INTO productionsmaschinen(maschinenID, variante, bezeichnung)
VALUES (1, 1, 'Maschine Alpha'), (1, 2, 'Maschine Alpha Plus'), (2, 1, 'Maschine Beta'), (2, 2, 'Maschine Beta Plus');

DROP TABLE productionsmaschinen;

CREATE TABLE Productionsmaschinen(
	globalID INT AUTO_INCREMENT PRIMARY KEY,
    laufzeit INT,
    maxlaufzeit INT,
    maschinenID INT,
    variante INT,
    bezeichnung VARCHAR(200),
    UNIQUE(maschinenID, variante),
    CONSTRAINT Productionsmaschinen CHECK(laufzeit < maxlaufzeit)
);

INSERT INTO productionsmaschinen(maschinenID, variante, bezeichnung)
VALUES (1, 1, 'Maschine Alpha'), (1, 2, 'Maschine Alpha Plus')


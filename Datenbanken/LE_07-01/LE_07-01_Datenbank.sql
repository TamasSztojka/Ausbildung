CREATE DATABASE bibliothek;
USE bibliothek;

CREATE TABLE verlag(
	verlagID INT AUTO_INCREMENT PRIMARY KEY,
    verlag VARCHAR(150)
);

CREATE TABLE fachbereich(
	fachbereichID INT AUTO_INCREMENT PRIMARY KEY,
    fachbereich VARCHAR(150)
);

CREATE TABLE fachbuch(
	fachbuchID INT AUTO_INCREMENT PRIMARY KEY,
    isbn INT,
    titel VARCHAR(200),
    verlagID INT,
    FOREIGN KEY(verlagID) REFERENCES verlag(verlagID)
);

CREATE TABLE fachbereichfachbuch(
	fachbereichID INT,
    fachbuchID INT,
    PRIMARY KEY(fachbereichID, fachbuchID),
    FOREIGN KEY(fachbereichID) REFERENCES fachbereich(fachbereichID),
    FOREIGN KEY (fachbuchID) REFERENCES fachbuch(fachbuchID)
);

INSERT INTO verlag(verlag) VALUES
('Programmier Verlag'), 
('IT - Technik Verlag'),
('Elektrotechnik Verlag'),
('Automatisierung Veralg'),
('Medien Verlag');

INSERT INTO fachbereich(fachbereich) VALUES
('Applikationsentwicklung'),
('IT-Technik'),
('Elektrotechnik'),
('Automatisierungstechnik');

INSERT INTO fachbuch(isbn, titel, verlagID) VALUES
('1111', 'Applikationsentwicklung Fundamentals', 1),
('2222', 'Applikationsentwicklung Advanced', 1),
('3333', 'IT Technik-Betriebstechnik Fundamentals', '2'),
('4444', 'IT Technik-Betriebstechnik Advanced', '2'),
('5555', 'IT Technik-Systemtechnik Fundamentals', '2'),
('6666', 'IT Technik-Systemtechnik Advanced', '2'),
('6666', 'IT Technik-Systemtechnik Advanced', '2'),
('7777', 'Elektrotechnik I', '3'),
('8888', 'Elektrotechnik II', '3'),
('9999', 'Robotik', '4');

INSERT INTO fachbereichfachbuch(fachbereichID, fachbuchID) VALUES
('1', '1'),
('1', '2'),
('2', '3'),
('2', '4'),
('2', '5'),
('2', '6'),
('3', '7'),
('3', '8'),
('4', '9');

SELECT 
    fachbuch.titel,
    verlag.verlag,
    fachbereich.fachbereich
FROM 
    fachbuch
JOIN 
    verlag ON fachbuch.verlagID = verlag.verlagID
JOIN 
    fachbereichfachbuch ON fachbuch.fachbuchID = fachbereichfachbuch.fachbuchID
JOIN 
    fachbereich ON fachbereichfachbuch.fachbereichID = fachbereich.fachbereichID;
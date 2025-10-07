CREATE DATABASE CDDatenbank;
USE CDDatenbank;

CREATE TABLE Interpreten (
  InterpretID INT AUTO_INCREMENT PRIMARY KEY,
  Interpret VARCHAR(100) NOT NULL
);

CREATE TABLE Musikrichtung (
  MRID INT AUTO_INCREMENT PRIMARY KEY,
  Musikrichtung VARCHAR(50) NOT NULL
);

CREATE TABLE CD (
  CDNr INT AUTO_INCREMENT PRIMARY KEY,
  CDName VARCHAR(100) NOT NULL,
  InterpretNr INT,
  Musikrichtung INT,
  FOREIGN KEY (InterpretNr) REFERENCES Interpreten(InterpretID),
  FOREIGN KEY (Musikrichtung) REFERENCES Musikrichtung(MRID)
);

CREATE TABLE Titel (
  TitelNr INT AUTO_INCREMENT PRIMARY KEY,
  Titel VARCHAR(100) NOT NULL,
  CDNr INT,
  IntNr INT,
  Beurteilung DECIMAL(2,1),
  FOREIGN KEY (CDNr) REFERENCES CD(CDNr),
  FOREIGN KEY (IntNr) REFERENCES Interpreten(InterpretID)
);

INSERT INTO Interpreten (Interpret) VALUES
('Queen'),
('Adele'),
('Metallica');

INSERT INTO Musikrichtung (Musikrichtung) VALUES
('Rock'),
('Pop'),
('Metal');

INSERT INTO CD (CDName, InterpretNr, Musikrichtung) VALUES
('Greatest Hits', 1, 1),
('25', 2, 2),
('Master of Puppets', 3, 3);

INSERT INTO Titel (CDNr, Titel, IntNr, Beurteilung) VALUES
(1, 'Bohemian Rhapsody', 1, 5.0),
(1, 'Another One Bites The Dust', 1, 4.5),
(2, 'Hello', 2, 4.8),
(3, 'Battery', 3, 4.7);

SELECT * FROM Interpreten;
SELECT * FROM Musikrichtung;
SELECT * FROM CD;
SELECT * FROM Titel;

CREATE TABLE TitelBewertung3Plus AS
SELECT *
FROM Titel
WHERE Beurteilung >= 3
ORDER BY Beurteilung DESC, Titel ASC;

CREATE TABLE SchlechteTitel_CD1 AS
SELECT t.TitelNr, t.Titel, t.Beurteilung, c.CDName
FROM Titel t
JOIN CD c ON t.CDNr = c.CDNr
WHERE t.CDNr = 1 AND t.Beurteilung < 3;

CREATE TABLE Gesamtliste AS
SELECT 
    c.CDName,
    t.Titel,
    i.Interpret,
    m.Musikrichtung
FROM Titel t
JOIN CD c ON t.CDNr = c.CDNr
JOIN Interpreten i ON c.InterpretNr = i.InterpretID
JOIN Musikrichtung m ON c.Musikrichtung = m.MRID
ORDER BY c.CDName ASC;

CREATE TABLE AnzahlSongsProMusikrichtung AS
SELECT 
    m.Musikrichtung,
    COUNT(t.TitelNr) AS Anzahl_Songs
FROM Titel t
JOIN CD c ON t.CDNr = c.CDNr
JOIN Musikrichtung m ON c.Musikrichtung = m.MRID
GROUP BY m.Musikrichtung;

SET SQL_SAFE_UPDATES = 0;
UPDATE Musikrichtung
SET Musikrichtung = 'Classic'
WHERE Musikrichtung = 'Klassik';
SET SQL_SAFE_UPDATES = 1;

SET SQL_SAFE_UPDATES = 0;
UPDATE Musikrichtung
SET Musikrichtung = 'deutsche Schlager'
WHERE Musikrichtung = 'Schlager';
SET SQL_SAFE_UPDATES = 1;

DELETE FROM CD
WHERE Musikrichtung IS NULL;


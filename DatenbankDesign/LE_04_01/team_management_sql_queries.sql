CREATE DATABASE team_management_datenbank;
USE team_management_datenbank;

CREATE TABLE Teams (
  TeamID INT AUTO_INCREMENT PRIMARY KEY,
  Teamname VARCHAR(100) NOT NULL
);

CREATE TABLE Trainer (
  TrainerID INT AUTO_INCREMENT PRIMARY KEY,
  Nachname VARCHAR(100) NOT NULL,
  Vorname VARCHAR(100),
  Gehalt DECIMAL(10,2)
);

CREATE TABLE Ausbildung (
  AusbildungID INT AUTO_INCREMENT PRIMARY KEY,
  AusbildungName VARCHAR(100) NOT NULL
);

CREATE TABLE Trainer_Ausbildung (
  TrainerID INT,
  AusbildungID INT,
  PRIMARY KEY (TrainerID, AusbildungID),
  FOREIGN KEY (TrainerID) REFERENCES Trainer(TrainerID),
  FOREIGN KEY (AusbildungID) REFERENCES Ausbildung(AusbildungID)
);

CREATE TABLE Spieler (
  SpielerID INT AUTO_INCREMENT PRIMARY KEY,
  Nachname VARCHAR(100) NOT NULL,
  Vorname VARCHAR(100),
  TeamID INT,
  TrainerID INT,
  FOREIGN KEY (TeamID) REFERENCES Teams(TeamID),
  FOREIGN KEY (TrainerID) REFERENCES Trainer(TrainerID)
);

INSERT INTO Teams (Teamname) VALUES
('Herren'), ('Damen'), ('U18');

INSERT INTO Trainer (Nachname, Vorname, Gehalt) VALUES
('Müller', 'Peter', 3000.00),
('Schmidt', 'Sabine', 3200.00);

INSERT INTO Ausbildung (AusbildungName) VALUES
('C-Lizenz'), ('B-Lizenz'), ('A-Lizenz');

INSERT INTO Trainer_Ausbildung VALUES
(1, 1), (1, 2), (2, 3);

INSERT INTO Spieler (Nachname, Vorname, TeamID, TrainerID) VALUES
('Becker', 'Lena', 2, 2),
('Krause', 'Tom', 1, 1),
('Fischer', 'Max', 1, 1),
('Lehmann', 'Sophie', 3, 2);

CREATE TABLE Spieler_Team AS
SELECT 
  s.SpielerID,
  CONCAT(s.Vorname, ' ', s.Nachname) AS Spielername,
  t.Teamname
FROM Spieler s
JOIN Teams t ON s.TeamID = t.TeamID
ORDER BY s.Nachname ASC;

CREATE TABLE Trainer_nach_Ausbildung AS
SELECT 
  a.AusbildungName,
  CONCAT(tr.Vorname, ' ', tr.Nachname) AS Trainername
FROM Trainer tr
JOIN Trainer_Ausbildung ta ON tr.TrainerID = ta.TrainerID
JOIN Ausbildung a ON ta.AusbildungID = a.AusbildungID
ORDER BY a.AusbildungName ASC, tr.Nachname ASC;

CREATE TABLE Spieler_Trainer AS
SELECT 
  CONCAT(s.Vorname, ' ', s.Nachname) AS Spielername,
  CONCAT(t.Vorname, ' ', t.Nachname) AS Trainername
FROM Spieler s
JOIN Trainer t ON s.TrainerID = t.TrainerID
ORDER BY s.Nachname;

SET SQL_SAFE_UPDATES = 0;
UPDATE Trainer
SET Gehalt = Gehalt * 1.25;
SET SQL_SAFE_UPDATES = 1;
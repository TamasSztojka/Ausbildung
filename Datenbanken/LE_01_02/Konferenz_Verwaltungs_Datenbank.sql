CREATE DATABASE konferenz_verwaltungs_datenbank;
USE konferenz_verwaltungs_datenbank;

CREATE TABLE ReferentInnen (
    ReferentInID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(150) NOT NULL,
    Email VARCHAR(254) NOT NULL,
    Organisation VARCHAR(200) NOT NULL
);

CREATE TABLE TeilnehmerInnen (
    TeilnehmerInID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(150) NOT NULL,
    Email VARCHAR(254) NOT NULL,
    Organisation VARCHAR(200) NOT NULL
);

CREATE TABLE Themen (
    ThemenID INT AUTO_INCREMENT PRIMARY KEY,
    Themen VARCHAR(200) NOT NULL,
    Kurzbeschreibung TEXT,
    ReferentInID INT,
    FOREIGN KEY (ReferentInID) REFERENCES ReferentInnen(ReferentInID)
);

CREATE TABLE Themen_nach_TeilnehmerInnen (
    TeilnehmerInID INT,
    ThemenID INT,
    PRIMARY KEY (TeilnehmerInID, ThemenID),
    FOREIGN KEY (TeilnehmerInID) REFERENCES TeilnehmerInnen(TeilnehmerInID),
    FOREIGN KEY (ThemenID) REFERENCES Themen(ThemenID)
);

INSERT INTO ReferentInnen (Name, Email, Organisation)
VALUES ('Nina Musterfrau', 'Nina@example.com', 'Bethesda');

INSERT INTO TeilnehmerInnen (Name, Email, Organisation)
VALUES ('Max Mustermann', 'Max@example.com', 'CD Project Red');

INSERT INTO Themen (Themen, Kurzbeschreibung, ReferentInID)
VALUES ('KI', 'KI in der Spieleprogrammierung', 1);

INSERT INTO Themen_nach_TeilnehmerInnen (TeilnehmerInID, ThemenID)
VALUES (1, 1);


CREATE DATABASE IF NOT EXISTS Shop_DB_Sztojka;
USE Shop_DB_Sztojka;

CREATE TABLE Kunden (
    kunden_id INT AUTO_INCREMENT PRIMARY KEY,
    vorname VARCHAR(50) NOT NULL,
    nachname VARCHAR(50) NOT NULL,
    strasse VARCHAR(100),
    hausnummer VARCHAR(10),
    postleitzahl VARCHAR(10),
    stadt VARCHAR(50),
    telefonnummer VARCHAR(20),
    email VARCHAR(100) UNIQUE
);

CREATE TABLE Lieferanten (
    lieferanten_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    strasse VARCHAR(100),
    hausnummer VARCHAR(10),
    postleitzahl VARCHAR(10),
    stadt VARCHAR(50),
    telefonnummer VARCHAR(20),
    email VARCHAR(100) UNIQUE
);

CREATE TABLE Artikel (
    artikel_id INT AUTO_INCREMENT PRIMARY KEY,
    bezeichnung VARCHAR(100) NOT NULL,
    beschreibung TEXT,
    preis DECIMAL(10,2) NOT NULL,
    lagerbestand INT NOT NULL
);

CREATE TABLE Verkauf (
    verkauf_id INT AUTO_INCREMENT PRIMARY KEY,
    kunden_id INT,
    lieferanten_id INT,
    artikel_id INT,
    menge INT NOT NULL,
    datum DATE NOT NULL,
    FOREIGN KEY (kunden_id) REFERENCES Kunden(kunden_id),
    FOREIGN KEY (lieferanten_id) REFERENCES Lieferanten(lieferanten_id),
    FOREIGN KEY (artikel_id) REFERENCES Artikel(artikel_id)
);

-- Beispiel Daten
INSERT INTO Kunden (vorname, nachname, strasse, hausnummer, postleitzahl, stadt, telefonnummer, email)
VALUES
('Max', 'Müller', 'Hauptstraße', '12', '10115', 'Berlin', '030123456', 'max.mueller@example.com'),
('Anna', 'Schmidt', 'Bahnhofstraße', '45', '20095', 'Hamburg', '040987654', 'anna.schmidt@example.com'),
('Lukas', 'Weber', 'Ringstraße', '7A', '80331', 'München', '089654321', 'lukas.weber@example.com');

INSERT INTO Lieferanten (name, strasse, hausnummer, postleitzahl, stadt, telefonnummer, email)
VALUES
('Tech GmbH', 'Industriestraße', '5', '40210', 'Düsseldorf', '021112345', 'info@techgmbh.de'),
('Office Supplies AG', 'Handelsweg', '23', '50667', 'Köln', '022198765', 'kontakt@officeag.de');

INSERT INTO Artikel (bezeichnung, beschreibung, preis, lagerbestand)
VALUES
('Laptop', '15 Zoll Business-Laptop mit 16GB RAM', 899.99, 20),
('Drucker', 'Multifunktionsdrucker mit WLAN', 199.50, 50),
('Bürostuhl', 'Ergonomischer Drehstuhl mit Armlehnen', 149.00, 100),
('Monitor', '27 Zoll Full-HD Bildschirm', 229.90, 40);

INSERT INTO Verkauf (kunden_id, lieferanten_id, artikel_id, menge, datum)
VALUES
(1, 1, 1, 1, '2025-08-01'),  
(2, 2, 2, 2, '2025-08-05'),  
(3, 1, 4, 1, '2025-08-10'),  
(1, 2, 3, 4, '2025-08-15');

-- Abfragen

-- Abfrage 1
SELECT * FROM Kunden;

-- Abfrage 2
SELECT * FROM Lieferanten;

-- Abfrage 3
SELECT * FROM Artikel;

-- Abfrage 4
SELECT 
	lagerbestand,
    bezeichnung
FROM Artikel
WHERE artikel_id = 1;

-- Abfrage 5
SELECT *
FROM Verkauf
WHERE kunden_id = 1;

-- Abfrage 6
SELECT *
FROM Verkauf
WHERE lieferanten_id = 2;

-- Abfrage 7
SELECT *
FROM Artikel
WHERE preis < 200;

-- Abfrage 8
SELECT
    SUM(a.preis * v.menge) AS gesamtumsatz
FROM Verkauf v
JOIN Artikel a
	ON v.artikel_id = a.artikel_id;

-- Abfrage 9
UPDATE Artikel
SET lagerbestand = lagerbestand - 3
WHERE artikel_id = 1;

-- Abfrage 10
DELETE FROM Verkauf
WHERE kunden_id = 1;

DELETE FROM Kunden
WHERE kunden_id = 1;

-- Abfrage 11

DELETE FROM Verkauf
WHERE lieferanten_id = 3;

DELETE FROM Verkauf
WHERE lieferanten_id = 3;

-- Abfrage 12
SELECT 
	v.verkauf_id, v.datum, v.menge,
    k.vorname, k.nachname,
    l.name,
    a.bezeichnung, a.preis
FROM Verkauf v
JOIN Kunden k ON v.kunden_id = k.kunden_id
JOIN Lieferanten l ON v.lieferanten_id = l.lieferanten_id
JOIN Artikel a ON v.artikel_id = a.artikel_id;

-- Abfrage 13
SELECT
	a.bezeichnung, 
    a.preis, 
    l.name
FROM Artikel a
JOIN Verkauf v ON a.artikel_id = v.artikel_id
JOIN Lieferanten l on v.lieferanten_id = l.lieferanten_id;

-- View

CREATE VIEW v_kunden_umsatz 
AS
SELECT
	k.kunden_id,
    k.vorname,
    k.nachname,
	SUM(a.preis * v.menge) AS umsatz
FROM Kunden k
JOIN Verkauf v ON v.kunden_id = k.kunden_id
JOIN Artikel a ON a.artikel_id = v.artikel_id
GROUP BY k.kunden_id, k.vorname, k.nachname;

SELECT * FROM v_kunden_umsatz;

-- Transaktionen

-- Transaktion 1
DELIMITER //

CREATE PROCEDURE mache_verkauf(
	IN p_kunde INT,
    IN p_lieferant INT,
    IN p_artikel INT,
    IN p_menge INT
)
BEGIN
	DECLARE lb INT;
    
	START TRANSACTION;

	SELECT lagerbestand INTO lb
	FROM ARTIKEL 
	WHERE artikel_id = p_artikel
	FOR UPDATE;

	IF lb < p_menge THEN
		ROLLBACK;
	ELSE
		UPDATE Artikel
		SET lagerbestand = lagerbestand - p_menge
		WHERE artikel_id = p_artikel;
		
		INSERT INTO Verkauf (kunden_id, lieferanten_id, artikel_id, menge, datum)
		VALUES (p_kunde, p_lieferant, p_artikel, p_menge, '2025-08-20');
		
		COMMIT;
	END IF;
END //


DELIMITER ;

CALL mache_verkauf(1, 1, 1, 2);

-- Transaktion 2

START TRANSACTION;

INSERT INTO Kunden (vorname, nachname, strasse, hausnummer, postleitzahl, stadt, telefonnummer, email)
VALUES ('Julia', 'Kraus', 'Marktplatz', '9', '70173', 'Stuttgart', '0711-12345', 'julia.kraus@example.com');

SET @new_kunde := LAST_INSERT_ID();

INSERT INTO Verkauf (kunden_id, lieferanten_id, artikel_id, menge, datum)
VALUES (@new_kunde, 1, 3, 1, '2025-08-20');

COMMIT;

-- Transaktion 3

START TRANSACTION;

UPDATE Artikel
SET preis = 219.90
WHERE artikel_id = 2;

COMMIT;

-- Sinnvolle Indizes

CREATE INDEX idx_verkauf_kunde      ON Verkauf(kunden_id);
CREATE INDEX idx_verkauf_lieferant  ON Verkauf(lieferanten_id);
CREATE INDEX idx_verkauf_artikel    ON Verkauf(artikel_id);
CREATE INDEX idx_artikel_preis      ON Artikel(preis);
CREATE INDEX idx_verkauf_datum      ON Verkauf(datum);


    
		






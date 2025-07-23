USE bibliothek;

CREATE TABLE ausleihe(
	ausleiheID INT AUTO_INCREMENT,
    exemplarID INT,
    von DATE,
    bis DATE,
    isbn INT,
    titel VARCHAR(200),
    fachbuchID INT,
	PRIMARY KEY(ausleiheID, exemplarID)
);

SELECT 
	fachbuch.isbn AS fachbuch_isbn,
    fachbuch.titel AS fachbuch_titel,
    ausleihe.isbn AS ausleihe_isbn,
    ausleihe.titel AS ausleihe_titel,
    ausleihe.von,
    ausleihe.bis
FROM fachbuch
LEFT JOIN ausleihe ON fachbuch.fachbuchID = ausleihe.fachbuchID


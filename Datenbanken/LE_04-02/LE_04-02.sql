CREATE DATABASE geschenks_datenbank;
USE geschenks_datenbank;

-- Initial Table. Irrelevent
CREATE TABLE mageschenk(
	geschenkID SMALLINT PRIMARY KEY,
    artikel VARCHAR(200) NOT NULL,
    preis DECIMAL(5,2) NOT NULL,
    jahrzugehörigkeit SMALLINT NOT NULL
);

DROP TABLE mageschenk;

-- Relevent tables
CREATE TABLE mageschenk(
    geschenkID SMALLINT AUTO_INCREMENT PRIMARY KEY,
    artikel VARCHAR(200) NOT NULL,
    preis DECIMAL(5,2) NOT NULL,
    jahrzugehoerigkeit SMALLINT NOT NULL,
    UNIQUE(artikel)
);



INSERT INTO mageschenk(artikel, preis, jahrzugehoerigkeit)
VALUES ('PS5', '499.99', '5'), ('XBOX Series X', '499.99', '10'); -- ('PS5', '499.99', '15'); Duplicate entry 'PS5' for key mageschenk.artikel.

ALTER TABLE mageschenk
ALTER preis SET DEFAULT '0.00';

ALTER TABLE mageschenk
ADD CONSTRAINT CHK_jahrzugehoerigkeit CHECK (
    jahrzugehoerigkeit IN (5, 10, 15, 20)
);

INSERT INTO mageschenk(artikel, preis, jahrzugehoerigkeit)
VALUES ('Nintendo Switch', '399.99', '15'), ('Gaming PC', '999.99', '20');

-- Check constraint CHK_jahrzugehoerigkeit is violated.
INSERT INTO mageschenk(artikel, preis, jahrzugehoerigkeit)
VALUES ('Nothing', '0.00', '1');
                                        
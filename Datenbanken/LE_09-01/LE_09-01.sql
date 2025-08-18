-- Punkt 1
ALTER TABLE artikel
RENAME TO artikelaktuell;

-- Punkt 2
ALTER TABLE artikelaktuell
CHANGE bezeichnung_artikel bezeichnung VARCHAR(150);

-- Punkt 3
ALTER TABLE artikelaktuell
MODIFY COLUMN status VARCHAR(300);

-- Punkt 4
ALTER TABLE artikelaktuell
ADD PRIMARY KEY(artikelid);

-- PUNKT 5
ALTER TABLE artikelinfo DROP PRIMARY KEY;

-- Punkt 6
ALTER TABLE artikelinfo
MODIFY tiefe INT NOT NULL;

-- Punkt 7
ALTER TABLE artikelinfo
MODIFY tiefe INT NULL;

-- Punkt 8
ALTER TABLE artikelinfo
MODIFY COLUMN preis DECIMAL(10,2) DEFAULT 0.00;

-- Punkt 9
ALTER TABLE artikelinfo
ALTER COlUMN preis DROP DEFAULT;

-- Punkt 10
ALTER TABLE artikelinfo
ADD CONSTRAINT bezeichnung UNIQUE (bezeichnung);

-- Punkt 11
ALTER TABLE artikelinfo
ADD CONSTRAINT check_preis CHECK(preis < 1000);

-- Punkt 12
ALTER TABLE artikelinfo
DROP CONSTRAINT check_prei;

-- Punkt 13
ALTER TABLE artikelaktuell
ADD COLUMN kommentar VARCHAR(300);

-- Punkt 14
ALTER TABLE artikelaktuell
DROP COLUMN kommentar;

-- Punkt 15
ALTER TABLE positionartikel
ADD artikelid INT;

ALTER TABLE positionartikel
ADD CONSTRAINT foreign_key
FOREIGN KEY (artikelid)
REFERENCES artikelinfo(artikelid);

-- Punkt 16
ALTER TABLE positionartikel
DROP FOREIGN KEY foreign_key


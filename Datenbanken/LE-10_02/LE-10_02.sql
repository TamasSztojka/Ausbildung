-- Punkt 1
CREATE VIEW v_urlaub
AS
SELECT 
	name,
    vorname,
    urlaubstage,
    urlaubgenommen
FROM mitarbeiter;

SELECT * FROM v_urlaub;

-- Punkt 2
CREATE VIEW v_praemie
AS
SELECT
	m.name,
    m.vorname,
    sp.praemie,
    sp.grund
FROM mitarbeiter m
JOIN sachpraemie sp
	ON m.mitarbeiterid = sp.mitarbeiterid;
    
SELECT * FROM v_praemie;

-- Punkt 3
CREATE VIEW v_mitarbeiterbonus AS
SELECT 
    m.name,
    m.vorname,
    b.bonuszahlung
FROM mitarbeiter m
JOIN bonus b
    ON m.mitarbeiterid = b.mitarbeiterid
ORDER BY b.bonuszahlung ASC;

SELECT * FROM v_mitarbeiterbonus;

-- Punkt 4
CREATE VIEW v_mitarbeiterkrankenkasse AS
    SELECT 
        name, vorname, krankenversicherung
    FROM
        mitarbeiter;

INSERT INTO mitarbeiter (mitarbeiterid, name, vorname, krankenversicherung)
VALUES ('51', 'Müller', 'Sabine', 'AOK Köln');

SELECT * FROM v_mitarbeiterkrankenkasse;

-- Punkt 5

DROP VIEW IF EXISTS v_mitarbeiterkrankenkasse;

    
    

    
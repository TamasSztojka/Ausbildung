-- Punkt 1
ALTER TABLE sachpraemie
ADD CONSTRAINT foreign_key
FOREIGN KEY (mitarbeiterid) REFERENCES mitarbeiter(mitarbeiterid);

SELECT DISTINCT 
    mitarbeiter.vorname, 
    mitarbeiter.name
FROM sachpraemie
JOIN mitarbeiter
    ON sachpraemie.mitarbeiterid = mitarbeiter.mitarbeiterid;
    
-- Punkt 2
SELECT 
    m.name,
    m.vorname,
    sp.summepreis
FROM mitarbeiter m
JOIN (
    SELECT 
        mitarbeiterid,
        SUM(preis) AS summepreis
    FROM sachpraemie
    GROUP BY mitarbeiterid
) sp
ON m.MitarbeiterID = sp.mitarbeiterid;

-- Punkt 3
SELECT 
    m.vorname,
    m.name,
    m.steuerklasse
FROM mitarbeiter m
LEFT JOIN steuerklasse 
       ON m.steuerklasse = s.steuerklassezahl
WHERE s.steuerklassezahl IS NULL;

-- Punk 4
SELECT 
    m.vorname,
    m.name,
    m.steuerklasse
FROM mitarbeiter AS m
WHERE m.steuerklasse IS NOT NULL
  AND NOT EXISTS (
    SELECT s.steuerklassezahl
    FROM steuerklasse s
    WHERE s.steuerklassezahl = m.steuerklasse
);

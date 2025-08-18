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


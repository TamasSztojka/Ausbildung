ALTER TABLE qualifikationen
MODIFY COLUMN qid INT NOT NULL AUTO_INCREMENT;

INSERT INTO qualifikationen (bezeichnung, kuerzel, kategorie)
VALUES ('Sys-Admin', 'ADA', 'Support')
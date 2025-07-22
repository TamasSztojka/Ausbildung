ALTER TABLE qualifikationen
MODIFY COLUMN qid INT NOT NULL AUTO_INCREMENT,
ADD PRIMARY KEY (qid);

INSERT INTO qualifikationen (bezeichnung, kuerzel, kategorie)
VALUES ('SQL', 'ITE', 'Informatik');
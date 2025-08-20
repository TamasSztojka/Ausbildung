-- Punkt 1
CREATE INDEX index_arbeitszeit_mitarbeiter
ON arbeitszeit(mitarbeiterid);

-- Punkt 2
SELECT *
FROM kreditinstitutneu
WHERE ort = 'Berlin' AND plz = 10789;

CREATE INDEX index_plzort
ON kreditinstitutneu(ort, plz);

DROP INDEX index_arbeitszeit_mitarbeiter ON arbeitszeit;
DROP INDEX index_plzort ON kreditinstitutneu;
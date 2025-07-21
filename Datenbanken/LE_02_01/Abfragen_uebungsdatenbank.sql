-- Punkt 1:
SELECT name, vorname, eintrittsdatum, austrittsdatum FROM mitarbeiter;

-- Punkt 2:
SELECT name, vorname, eintrittsdatum, austrittsdatum, austrittsgrund FROM mitarbeiter;

-- Punkt 3:
SELECT * FROM mitarbeiter;

-- Punkt 4:
SELECT * FROM mitarbeiter WHERE abteilung = 'Vertrieb';

-- Punkt 5:
SELECT * FROM mitarbeiter WHERE urlaubgenommen = '30';

-- Punkt 6:
SELECT * FROM mitarbeiter WHERE anzahlkinder >= '1';

-- Punkt 7:
SELECT * FROM mitarbeiter WHERE eintrittsdatum BETWEEN '1990-01-01' AND '2000-01-01';

-- Punkt 8:
SELECT * FROM mitarbeiter WHERE geschlecht = 'w' AND abteilung = 'Vertrieb';

-- Punkt 9:
SELECT * FROM mitarbeiter WHERE krankenversicherung = 'MH Plus Bonn' OR krankenversicherung = 'IKK gesund plus';

-- Punkt 10:
SELECT * FROM mitarbeiter WHERE geschlecht = 'w' AND verheiratet = 'nein' AND anzahlkinder >= '1';

-- Punkt 11:
SELECT * FROM krankenkasse LIMIT 10;

-- Punkt 12:
SELECT name, vorname, abteilung
FROM mitarbeiter
ORDER BY abteilung, name, vorname ASC;

-- Punkt 13:
SELECT name, vorname, abteilung, bonus
FROM mitarbeiter
ORDER BY abteilung, bonus ASC;

-- Punkt 14:
SELECT name As Name,
vorname AS Vorname,
strasse AS Strasse,
hausnummer AS Hausnummer,
plz AS Postleitzahl,
ort AS Ort
FROM mitarbeiter;

-- Punkt 15:
SELECT ort, COUNT(*) AS anzahl
FROM mitarbeiter
GROUP BY ort;



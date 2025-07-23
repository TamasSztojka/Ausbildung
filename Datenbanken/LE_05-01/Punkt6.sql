SELECT name, vorname, status
FROM niederlassungholland
WHERE status = 'aktiv'
UNION
SELECT name, vorname, status
FROM niederlassungbelgien
WHERE status = 'aktiv';
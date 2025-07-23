SELECT holland.name, holland.vorname
FROM niederlassungholland holland
INNER JOIN niederlassungbelgien belgien
ON holland.name = belgien.name AND holland.vorname = belgien.vorname
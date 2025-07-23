SELECT holland.name, holland.vorname
FROM niederlassungholland holland
LEFT JOIN niederlassungbelgien belgien
ON holland.name = belgien.name AND holland.vorname = belgien.vorname
WHERE belgien.name IS NULL AND belgien.vorname IS NULL;
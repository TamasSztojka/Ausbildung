SELECT
	fachbuch.titel,
    fachbereich.fachbereich
FROM fachbuch
INNER JOIN fachbereichfachbuch ON fachbuch.fachbuchID = fachbereichfachbuch.fachbuchID
INNER JOIN fachbereich ON fachbereichfachbuch.fachbereichID = fachbereich.fachbereichID
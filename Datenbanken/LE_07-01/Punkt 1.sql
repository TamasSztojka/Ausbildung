SELECT
	fachbuch.titel,
	fachbuch.isbn,
	fachbuch.verlagID,
	verlag.verlag,
	verlag.verlagID
FROM fachbuch
JOIN verlag
ON fachbuch.verlagID = verlag.verlagID
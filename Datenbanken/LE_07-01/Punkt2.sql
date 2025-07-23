SELECT
    fachbuch.titel,
    fachbuch.isbn,
    verlag.verlag,
    verlag.verlagID
FROM fachbuch
RIGHT JOIN verlag ON fachbuch.verlagID = verlag.verlagID;
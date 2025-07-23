SELECT
    fachbuch.titel,
    fachbuch.isbn,
    fachbuch.verlagID,
    verlag.verlag,
    verlag.verlagID
FROM fachbuch
CROSS JOIN verlag
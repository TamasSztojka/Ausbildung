CREATE USER Tamas@localhost IDENTIFIED BY 'secret';

GRANT SELECT, INSERT, UPDATE ON uebungsdatenbank.artikel TO Tamas@localhost;

REVOKE ALL PRIVILEGES, GRANT OPTION FROM Tamas@localhost;

DROP USER Tamas@localhost;

CREATE ROLE vertrieb;
GRANT SELECT, INSERT, UPDATE ON uebungsdatenbank.artikel TO vertrieb;

CREATE USER franz@localhost IDENTIFIED BY '123456';
CREATE USER maria@localhost IDENTIFIED BY '12345678';

GRANT vertrieb
TO franz@localhost, maria@localhost;

SET DEFAULT ROLE vertrieb TO franz@localhost;
SET DEFAULT ROLE vertrieb TO maria@localhost;

REVOKE INSERT, UPDATE ON uebungsdatenbank.artikel FROM vertrieb;

REVOKE vertrieb FROM franz@localhost;
REVOKE vertrieb FROM maria@localhost;

DROP ROLE vertrieb;
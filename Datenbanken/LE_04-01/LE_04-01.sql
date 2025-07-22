CREATE DATABASE table_practice;
USE table_practice;

CREATE TABLE test_table(
	Kunden_ID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(150),
    Vorname VARCHAR(150),
    Email VARCHAR(254),
    Telefon VARCHAR(17),
    Geburtsdatum DATE
);

DROP TABLE test_table
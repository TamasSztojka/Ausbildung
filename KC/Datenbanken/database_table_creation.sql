CREATE DATABASE vet;
USE vet;

CREATE TABLE IF NOT EXISTS petowner(
	petowner_id INT AUTO_INCREMENT PRIMARY KEY,
	fist_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	adress VARCHAR(100) NOT NULL,
	phonenumber VARCHAR(100),
	email VARCHAR(100) UNIQUE
);

CREATE TABLE IF NOT EXISTS pets(
	pet_id INT AUTO_INCREMENT PRIMARY KEY,
	petowner_id INT NOT NULL,
	name VARCHAR (50) NOT NULL,
	species VARCHAR (50) NOT NULL,
	breed VARCHAR(50),
	birthday DATE,
	FOREIGN KEY (petowner_id) REFERENCES petowner (petowner_id)
);

CREATE TABLE IF NOT EXISTS vet(
	vet_id INT AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
	specialization VARCHAR(50) NOT NULL,
	phonenumber VARCHAR(50) NOT NULL,
	email VARCHAR(50) UNIQUE NOT NULL,
	license_number VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS treatment(
	treatment_id INT AUTO_INCREMENT PRIMARY KEY,
	pet_id INT NOT NULL,
	vet_id INT NOT NULL,
	date DATE NOT NULL,
	diagnosis VARCHAR(255) NOT NULL,
	therapie VARCHAR(255) NOT NULL,
	costs DECIMAL (8,2) NOT NULL CHECK (costs > 0),
	FOREIGN KEY (pet_id) REFERENCES pets(pet_id),
	FOREIGN KEY (vet_id) REFERENCES vet(vet_id)
);












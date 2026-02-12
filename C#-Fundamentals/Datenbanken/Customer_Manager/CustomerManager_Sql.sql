CREATE DATABASE customer_manager;
USE customer_manager;

CREATE TABLE users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(100) UNIQUE NOT NULL,
  password VARCHAR(100) NOT NULL
);

CREATE TABLE customers (
  id INT AUTO_INCREMENT PRIMARY KEY,
  firstName VARCHAR(100),
  lastName VARCHAR(100),
  street VARCHAR(100),
  houseNumber VARCHAR(20),
  zipCode VARCHAR(20),
  city VARCHAR(100),
  email VARCHAR(150)
);
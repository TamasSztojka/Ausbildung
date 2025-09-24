CREATE TABLE Product(
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    preis DECIMAL(10,2) NOT NULL,
    gewicht DECIMAL(10,2)
);

CREATE TABLE Electronics(
	product_id INT PRIMARY KEY,
    brand VARCHAR(100),
    warranty_years INT,
    FOREIGN KEY (product_id) REFERENCES Product(id)
);

CREATE TABLE Clothes(
	product_id INT PRIMARY KEY,
    size VARCHAR(10),
    color VARCHAR(50),
    FOREIGN KEY (product_id) REFERENCES Product(id)
);
    
CREATE TABLE Buch(
	product_id INT PRIMARY KEY,
    author VARCHAR(255),
    page_amount INT,
    FOREIGN KEY (product_id) REFERENCES Product(id)
);

CREATE TABLE Customer (
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    address VARCHAR(255)NOT NULL,
    email VARCHAR(255) UNIQUe NOT NULL,
    phone_number VARCHAR(50),
    password VARCHAR(255) NOT NULL
);

CREATE TABLE PrivateCustomer(
	customer_id INT PRIMARY KEY,
    geburtsdatum DATE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customer(id)
);

CREATE TABLE CompanyCustomer(
	customer_id INT PRIMARY KEY,
    company_number VARCHAR(15) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customer(id)
);

INSERT INTO products (name, price, weight) VALUES ('Laptop', 1200.00, 2.5);
INSERT INTO products (name, price, weight) VALUES ('Mouse', 25.00, 0.2);
INSERT INTO products (name, price, weight) VALUES ('Keyboard', 75.00, 0.8);

CREATE TABLE shopping_carts (
	id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    total DECIMAL(10,2) DEFAULT 0.00,
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);

CREATE TABLE cart_products (
	id INT AUTO_INCREMENT PRIMARY KEY,
    cart_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (cart_id) REFERENCES shopping_carts(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

CREATE TABLE orders (
	id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_time DATETIME NOT NULL,
    total DECIMAL (10,2) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);

CREATE TABLE order_products (
	id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL (10,2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

INSERT INTO products (name, price, weight)
VALUES ('Apple', 0.50, 0.2);

INSERT INTO products (name, price, weight)
VALUES ('Banana', 0.30, 0.15);


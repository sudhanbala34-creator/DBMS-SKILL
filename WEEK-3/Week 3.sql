CREATE DATABASE IF NOT EXISTS inventory_db;

USE inventory_db;

DROP TABLE IF EXISTS Inventory;

DROP TABLE IF EXISTS Seller;

CREATE TABLE Seller (
    seller_id INT PRIMARY KEY,
    seller_name VARCHAR(100) NOT NULL,
    phone VARCHAR(15)
);

CREATE TABLE Inventory (
    inventory_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(10,2),
    seller_id INT,
    FOREIGN KEY (seller_id) REFERENCES Seller(seller_id)
);

INSERT INTO Seller VALUES
(1, 'ABC Traders', '9876543210'),
(2, 'Sri Stores', '9876543211'),
(3, 'Kumar Enterprises', '9876543212');

INSERT INTO Inventory VALUES
(101, 'Laptop', 25, 55000.00, 1),
(102, 'Keyboard', 40, 1200.00, 1),
(103, 'Mouse', 60, 700.00, 2),
(104, 'Monitor', 15, 12000.00, 2),
(105, 'Printer', 0, 8500.00, 3),
(106, 'Headphones', 35, 1800.00, 3),
(107, 'Webcam', 10, 2500.00, 1),
(108, 'USB Cable', 50, 300.00, 2);

INSERT INTO Inventory
VALUES (109, 'Power Bank', 20, 1500.00, 1);

SELECT * FROM Inventory;

UPDATE Inventory
SET quantity = 30
WHERE inventory_id = 109;

DELETE FROM Inventory
WHERE inventory_id = 109;

SELECT * FROM Seller;

SELECT * FROM Inventory;

SELECT COUNT(*) AS total_products_available
FROM Inventory;

SELECT product_name, quantity
FROM Inventory
WHERE quantity = 0;

SELECT product_name, quantity
FROM Inventory
WHERE quantity = (
    SELECT MAX(quantity)
    FROM Inventory
);

SELECT ROUND(AVG(quantity), 2) AS average_inventory_quantity
FROM Inventory;

SELECT
    i.inventory_id,
    i.product_name,
    i.quantity,
    i.price,
    s.seller_name
FROM Inventory i
JOIN Seller s
ON i.seller_id = s.seller_id;

SELECT SUM(quantity) AS total_inventory_quantity
FROM Inventory;

SELECT product_name, price
FROM Inventory
WHERE price = (
    SELECT MAX(price)
    FROM Inventory
);
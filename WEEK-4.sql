CREATE DATABASE ecommerce_db;
USE ecommerce_db;

CREATE TABLE Customer (
    Customer_ID INT PRIMARY KEY,
    Customer_Name VARCHAR(100) NOT NULL
);

CREATE TABLE Product (
    Product_ID INT PRIMARY KEY,
    Product_Name VARCHAR(100) NOT NULL,
    Price DECIMAL(10,2) NOT NULL CHECK (Price >= 0)
);

CREATE TABLE Orders (
    Order_ID INT PRIMARY KEY,
    Customer_ID INT NOT NULL,
    Order_Date DATE NOT NULL,
    Total_Amount DECIMAL(10,2) NOT NULL CHECK (Total_Amount >= 0),
    Order_Status VARCHAR(20) NOT NULL,
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
);

CREATE TABLE Order_Details (
    Order_Detail_ID INT PRIMARY KEY,
    Order_ID INT NOT NULL,
    Product_ID INT NOT NULL,
    Quantity INT NOT NULL CHECK (Quantity > 0),
    Price DECIMAL(10,2) NOT NULL CHECK (Price >= 0),
    FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID),
    FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID)
);

INSERT INTO Customer VALUES
(101, 'Rahul'),
(102, 'Arun'),
(103, 'Priya'),
(104, 'Kavin'),
(105, 'Divya');

INSERT INTO Product VALUES
(201, 'Laptop', 50000),
(202, 'Mouse', 800),
(203, 'Keyboard', 1500),
(204, 'Mobile Phone', 20000),
(205, 'Headphones', 2500);

INSERT INTO Orders VALUES
(5001, 101, '2026-09-01', 51600, 'Delivered'),
(5002, 102, '2026-09-05', 20000, 'Shipped'),
(5003, 101, '2026-09-10', 3100, 'Pending'),
(5004, 103, '2026-09-12', 2500, 'Delivered'),
(5005, 104, '2026-09-15', 20800, 'Pending');

INSERT INTO Order_Details VALUES
(1, 5001, 201, 1, 50000),
(2, 5001, 202, 2, 800),
(3, 5002, 204, 1, 20000),
(4, 5003, 203, 1, 1500),
(5, 5003, 202, 2, 800),
(6, 5004, 205, 1, 2500),
(7, 5005, 204, 1, 20000),
(8, 5005, 202, 1, 800);

SELECT * FROM Customer;
SELECT * FROM Product;
SELECT * FROM Orders;
SELECT * FROM Order_Details;

-- Customer Order History
SELECT
    c.Customer_Name,
    o.Order_ID,
    o.Order_Date,
    o.Total_Amount,
    o.Order_Status
FROM Customer c
JOIN Orders o
ON c.Customer_ID = o.Customer_ID;

-- Complete Order Details
SELECT
    c.Customer_Name,
    o.Order_ID,
    p.Product_Name,
    od.Quantity,
    od.Price,
    od.Quantity * od.Price AS Subtotal,
    o.Order_Status
FROM Customer c
JOIN Orders o
ON c.Customer_ID = o.Customer_ID
JOIN Order_Details od
ON o.Order_ID = od.Order_ID
JOIN Product p
ON od.Product_ID = p.Product_ID;

-- Total Sales
SELECT SUM(Total_Amount) AS Total_Sales
FROM Orders;

-- Product-wise Order Report
SELECT
    p.Product_Name,
    COUNT(od.Order_ID) AS Times_Ordered,
    SUM(od.Quantity) AS Total_Quantity_Sold
FROM Product p
LEFT JOIN Order_Details od
ON p.Product_ID = od.Product_ID
GROUP BY p.Product_ID, p.Product_Name;

-- Customer Purchase Analysis
SELECT
    c.Customer_Name,
    COUNT(o.Order_ID) AS Total_Orders,
    SUM(o.Total_Amount) AS Total_Spending,
    AVG(o.Total_Amount) AS Average_Order_Value
FROM Customer c
JOIN Orders o
ON c.Customer_ID = o.Customer_ID
GROUP BY c.Customer_ID, c.Customer_Name;

-- Update Order Status
UPDATE Orders
SET Order_Status = 'Delivered'
WHERE Order_ID = 5003;

SELECT * FROM Orders
WHERE Order_ID = 5003;

-- Update Product Quantity
UPDATE Order_Details
SET Quantity = 3
WHERE Order_Detail_ID = 5;

SELECT * FROM Order_Details
WHERE Order_Detail_ID = 5;
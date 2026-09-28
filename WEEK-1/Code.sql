DROP DATABASE IF EXISTS ecommerce_db;
CREATE DATABASE ecommerce_db;
USE ecommerce_db;

DROP TABLE IF EXISTS Customer;

CREATE TABLE Customer (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(15) NOT NULL UNIQUE,
    gender CHAR(1) CHECK (gender IN ('M','F','O')),
    date_of_birth DATE,
    address VARCHAR(255),
    city VARCHAR(50),
    state VARCHAR(50),
    pincode VARCHAR(10),
    registration_date DATE NOT NULL DEFAULT (CURRENT_DATE),
    password VARCHAR(255) NOT NULL,
    status VARCHAR(10) DEFAULT 'ACTIVE' CHECK (status IN ('ACTIVE','INACTIVE'))
);

INSERT INTO Customer
(first_name, last_name, email, phone, gender, date_of_birth, address, city, state, pincode, password)
VALUES
('Arun','Kumar','arun.kumar@gmail.com','9876543210','M','1998-05-14','12 Gandhi Street','Madurai','Tamil Nadu','625001','arun@123'),
('Priya','Raman','priya.raman@gmail.com','9876543211','F','2000-11-02','45 Anna Nagar','Chennai','Tamil Nadu','600040','priya@123'),
('Suresh','Babu','suresh.babu@gmail.com','9876543212','M','1995-03-21','7 MG Road','Bengaluru','Karnataka','560001','suresh@123'),
('Divya','Shree','divya.shree@gmail.com','9876543213','F','1999-07-09','23 Nehru Street','Coimbatore','Tamil Nadu','641001','divya@123'),
('Karthik','Raja','karthik.raja@gmail.com','9876543214','M','1997-01-30','9 Lake View Road','Trichy','Tamil Nadu','620001','karthik@123');

SELECT * FROM Customer;

SELECT customer_id, first_name, last_name, email, city
FROM Customer;

SELECT * FROM Customer
WHERE city = 'Madurai';

SELECT customer_id, first_name, last_name, registration_date
FROM Customer
ORDER BY registration_date DESC;

SELECT COUNT(*) AS total_customers
FROM Customer;

UPDATE Customer
SET phone = '9998887770',
    address = '56 New Colony'
WHERE customer_id = 1;

SELECT * FROM Customer
WHERE customer_id = 1;

UPDATE Customer
SET status = 'INACTIVE'
WHERE customer_id = 5;

DELETE FROM Customer
WHERE customer_id = 3;

SELECT * FROM Customer;
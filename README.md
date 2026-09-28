# Week 4 - Order Management System

## Objective

The objective of this project is to develop an Order Management System for an e-commerce company using MySQL.

The system manages customers, products, orders, and order details.

## Tables Used

### 1. Customer

Stores customer information.

* Customer_ID
* Customer_Name
* Email
* Phone

### 2. Product

Stores product information.

* Product_ID
* Product_Name
* Price
* Stock

### 3. Orders

Stores overall order information.

* Order_ID
* Customer_ID
* Order_Date
* Total_Amount
* Order_Status

### 4. Order_Details

Stores individual products included in an order.

* Order_Detail_ID
* Order_ID
* Product_ID
* Quantity
* Price

## Relationships

* One customer can place many orders.
* Each order belongs to one customer.
* One order can contain many products.
* One product can appear in many orders.
* Order_Details is used to implement the many-to-many relationship between Orders and Products.

## Operations Performed

1. Created Customer, Product, Orders and Order_Details tables.
2. Applied Primary Key and Foreign Key constraints.
3. Applied NOT NULL and CHECK constraints.
4. Inserted customer, product and order records.
5. Added multiple products to orders.
6. Displayed complete order details.
7. Calculated total sales.
8. Generated customer order history.
9. Generated product-wise order reports.
10. Calculated customer spending and average order value.
11. Updated order status.
12. Updated product quantity.
13. Included delete operation for cancelled orders.

## Reports Generated

### Customer Order History

Displays customer name, order ID, order date, total amount and order status.

### Product-wise Order Report

Displays the number of times each product was ordered and the total quantity sold.

### Customer Purchase Analysis

Displays customer order count, total spending and average order value.

## Tools Used

* MySQL
* MySQL Workbench
* GitHub

## Files

`order_management.sql` contains the complete SQL script for the Week 4 Order Management System.

## Conclusion

The Order Management System successfully connects customers, products and orders. It demonstrates table creation, relationships, constraints, CRUD operations, joins, aggregate functions and report generation using MySQL.

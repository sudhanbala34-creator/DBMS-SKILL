# Week 5 – Payment Transaction Management System

## Project Overview

This project implements a Payment Transaction Management System for an E-Commerce Database using SQL.

The system stores customer payment details, tracks transaction status, manages successful and failed payments, and generates payment reports.

## Objectives

* Create a Payment table.
* Establish a one-to-one relationship between Orders and Payment.
* Store different payment methods.
* Manage successful, failed, and pending transactions.
* Generate payment analysis reports.

## Table Structure

**Payment Table**

| Column             | Data Type     |
| ------------------ | ------------- |
| Payment_ID         | VARCHAR(10)   |
| Order_ID           | INT           |
| Payment_Date       | DATE          |
| Payment_Mode       | VARCHAR(30)   |
| Payment_Status     | VARCHAR(20)   |
| Transaction_Amount | DECIMAL(10,2) |

## SQL Concepts Used

* CREATE TABLE
* PRIMARY KEY
* FOREIGN KEY
* UNIQUE
* NOT NULL
* CHECK Constraint
* INSERT
* UPDATE
* SELECT
* WHERE
* GROUP BY
* COUNT()
* SUM()
* AVG()
* JOIN

## Reports Generated

1. Successful Payment Report
2. Failed Transaction Report
3. Pending Transaction Report
4. Payment Mode Analysis
5. Total Revenue Analysis
6. Customer Payment History

## Technology Used

* MySQL
* SQL
* MySQL Workbench

## Author

Bala Suthan J
II BCA – Batch II
Kamaraj College, Thoothukudi

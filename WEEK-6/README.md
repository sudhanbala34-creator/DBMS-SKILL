# Week 6 – Product Review and Rating Management System

## Project Overview

This project implements a Product Review and Rating Management System for an E-Commerce Database using SQL.

The system allows customers to submit product reviews and ratings. It stores customer feedback and analyzes product performance based on ratings.

## Objectives

* Create Review and Rating tables.
* Establish relationships between Customer, Product, and Review.
* Store customer feedback and ratings.
* Update and delete reviews.
* Calculate average product ratings.
* Identify highly rated products.

## Table Structure

**Review Table**

| Column      | Data Type    |
| ----------- | ------------ |
| Review_ID   | VARCHAR(10)  |
| Customer_ID | INT          |
| Product_ID  | INT          |
| Rating      | INT          |
| Review_Text | VARCHAR(500) |
| Review_Date | DATE         |

## SQL Concepts Used

* CREATE TABLE
* PRIMARY KEY
* FOREIGN KEY
* CHECK Constraint
* NOT NULL
* INSERT
* UPDATE
* DELETE
* SELECT
* JOIN
* GROUP BY
* HAVING
* COUNT()
* AVG()
* ORDER BY

## Reports Generated

1. Product Review Details
2. Customer Feedback Report
3. Average Product Rating
4. Highest-Rated Products
5. Most Reviewed Products
6. Rating Distribution
7. Low-Rated Product Report

## Technology Used

* MySQL
* SQL
* MySQL Workbench

## Author

Bala Suthan J
II BCA – Batch II
Kamaraj College, Thoothukudi

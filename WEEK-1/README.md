# E-Commerce Database Management System – Week 1

## What We Did

In Week 1, we started developing an **E-Commerce Database Management System using MySQL**.

The main focus of Week 1 was to understand the requirements of an e-commerce system and create the **Customer Database Module**.

## 1. Requirement Analysis

First, we analyzed what information an e-commerce website needs to store.

We identified the following main entities:

* **Customer** – Stores customer details.
* **Product** – Stores product information.
* **Seller** – Stores seller details.
* **Order** – Stores customer orders.
* **Payment** – Stores payment information.
* **Review** – Stores customer reviews and ratings.

These entities will be used to develop the complete e-commerce database in future weeks.

## 2. Customer Table Design

For Week 1, we focused on the **Customer** entity.

We designed a Customer table with the following fields:

* `customer_id`
* `first_name`
* `last_name`
* `email`
* `phone`
* `address`
* `city`
* `state`
* `pincode`
* `created_at`

The `customer_id` is used as the **Primary Key** to uniquely identify each customer.

## 3. Database Creation

We created a MySQL database named:

```sql
ecommerce_db
```

Then, we created the `Customer` table inside this database.

## 4. Constraints Used

We used different SQL constraints to maintain data accuracy.

### PRIMARY KEY

```sql
customer_id INT AUTO_INCREMENT PRIMARY KEY
```

It gives every customer a unique ID.

### NOT NULL

Used for fields that must contain data:

```text
first_name
last_name
email
address
city
state
pincode
```

### UNIQUE

Used for:

```text
email
phone
```

This prevents duplicate email addresses and phone numbers.

### AUTO_INCREMENT

Automatically generates customer IDs:

```text
1
2
3
4
5
```

### DEFAULT

The `created_at` field automatically stores the date and time when a customer is added.

## 5. Insert Operation

We inserted sample customer records into the Customer table using the `INSERT` command.

Example:

```sql
INSERT INTO Customer
(first_name, last_name, email, phone, address, city, state, pincode)
VALUES
('Bala', 'Suthan', 'bala@gmail.com', '9876543210',
 'Main Road', 'Thoothukudi', 'Tamil Nadu', '628001');
```

We added multiple customers to test the database.

## 6. Read Operation

We used the `SELECT` command to display customer records.

```sql
SELECT * FROM Customer;
```

This allowed us to check whether the inserted data was stored correctly.

## 7. Update Operation

We used the `UPDATE` command to modify existing customer information.

For example:

```sql
UPDATE Customer
SET phone = '9000000001',
    city = 'Madurai'
WHERE customer_id = 1;
```

Then, we used `SELECT` to verify the changes.

## 8. Delete Operation

We used the `DELETE` command to remove a customer record.

```sql
DELETE FROM Customer
WHERE customer_id = 5;
```

After deleting the record, we used:

```sql
SELECT * FROM Customer;
```

to verify that the record was removed.

## 9. CRUD Operations

We implemented the four basic database operations:

| Operation  | SQL Command | Purpose              |
| ---------- | ----------- | -------------------- |
| **Create** | `INSERT`    | Add new customer     |
| **Read**   | `SELECT`    | View customer data   |
| **Update** | `UPDATE`    | Modify customer data |
| **Delete** | `DELETE`    | Remove customer data |

## Week 1 Output

We generated sample outputs for:

1. Customer table structure
2. Inserted customer records
3. Updated customer record
4. Deleted customer record

These outputs were captured as screenshots for the project submission.

## What We Learned

Through this module, we learned:

* How to analyze database requirements
* How to identify entities
* How to design a database table
* How to create a database using MySQL
* How to create tables with constraints
* How to insert records
* How to retrieve records
* How to update records
* How to delete records
* How CRUD operations work in a database

## Future Development

In the upcoming modules, the database can be expanded by adding:

* Product Management
* Seller Management
* Order Management
* Payment Management
* Review Management
* Relationships between tables
* Foreign Keys
* Advanced SQL Queries

## Conclusion

In Week 1, we successfully completed the **Requirement Analysis and Customer Database Module**. We designed the Customer table, created the e-commerce database, inserted sample data, and performed all four CRUD operations using MySQL.

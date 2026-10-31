USE EcommerceDB;

-- 1. CREATE PAYMENT TABLE

CREATE TABLE Payment (
    Payment_ID VARCHAR(10) PRIMARY KEY,
    Order_ID INT UNIQUE,
    Payment_Date DATE,
    Payment_Mode VARCHAR(30) NOT NULL,
    Payment_Status VARCHAR(20) NOT NULL,
    Transaction_Amount DECIMAL(10,2),
    
    FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID),
    CHECK (Transaction_Amount > 0),
    CHECK (Payment_Status IN ('Success','Failed','Pending'))
);

-- 2. INSERT PAYMENT RECORDS

INSERT INTO Payment VALUES
('P101',5001,'2026-08-01','UPI','Success',2500),
('P102',5002,'2026-08-05','Credit Card','Failed',4500),
('P103',5003,'2026-08-10','Debit Card','Success',18000),
('P104',5004,'2026-08-15','Net Banking','Pending',3200),
('P105',5005,'2026-09-01','Cash on Delivery','Success',2200);

-- 3. UPDATE PAYMENT STATUS

UPDATE Payment
SET Payment_Status = 'Success'
WHERE Payment_ID = 'P102';

-- 4. RETRIEVE PAYMENT FOR SPECIFIC ORDER

SELECT *
FROM Payment
WHERE Order_ID = 5001;

-- 5. DISPLAY SUCCESSFUL PAYMENTS

SELECT *
FROM Payment
WHERE Payment_Status = 'Success';

-- 6. DISPLAY FAILED PAYMENTS

SELECT *
FROM Payment
WHERE Payment_Status = 'Failed';

-- 7. COUNT SUCCESSFUL AND FAILED PAYMENTS

SELECT Payment_Status, COUNT(*) AS Total
FROM Payment
GROUP BY Payment_Status;

-- 8. DISPLAY PENDING TRANSACTIONS

SELECT *
FROM Payment
WHERE Payment_Status = 'Pending';

-- 9. PAYMENT MODE ANALYSIS

SELECT Payment_Mode, COUNT(*) AS Total_Transactions
FROM Payment
GROUP BY Payment_Mode;

-- 10. TOTAL REVENUE

SELECT SUM(Transaction_Amount) AS Total_Revenue
FROM Payment
WHERE Payment_Status = 'Success';

-- 11. REVENUE BY PAYMENT METHOD

SELECT Payment_Mode,
SUM(Transaction_Amount) AS Revenue
FROM Payment
WHERE Payment_Status = 'Success'
GROUP BY Payment_Mode;

-- 12. AVERAGE TRANSACTION AMOUNT

SELECT AVG(Transaction_Amount) AS Average_Amount
FROM Payment;

-- 13. CUSTOMER PAYMENT HISTORY

SELECT
Customer.Customer_Name,
Orders.Order_ID,
Payment.Payment_Mode,
Payment.Transaction_Amount,
Payment.Payment_Status
FROM Customer
JOIN Orders
ON Customer.Customer_ID = Orders.Customer_ID
JOIN Payment
ON Orders.Order_ID = Payment.Order_ID;
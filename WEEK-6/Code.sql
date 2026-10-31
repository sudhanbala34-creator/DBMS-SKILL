USE EcommerceDB;

-- 1. CREATE REVIEW TABLE

CREATE TABLE Review (
    Review_ID VARCHAR(10) PRIMARY KEY,
    Customer_ID INT,
    Product_ID INT,
    Rating INT NOT NULL,
    Review_Text VARCHAR(500),
    Review_Date DATE NOT NULL,

    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID),
    FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID),
    CHECK (Rating BETWEEN 1 AND 5)
);

-- 2. INSERT REVIEW RECORDS

INSERT INTO Review VALUES
('R101',1,101,5,'Excellent performance','2026-08-12'),
('R102',2,102,4,'Good battery life','2026-08-18'),
('R103',3,103,3,'Average sound quality','2026-08-20'),
('R104',4,101,4,'Good value for money','2026-09-02'),
('R105',5,104,5,'Very comfortable shoes','2026-09-10'),
('R106',2,105,2,'Battery needs improvement','2026-09-12'),
('R107',1,106,4,'Good product','2026-09-15');

-- 3. UPDATE REVIEW

UPDATE Review
SET Review_Text = 'Excellent product'
WHERE Review_ID = 'R101';

-- 4. DELETE REVIEW

-- Example:
-- DELETE FROM Review WHERE Review_ID = 'R107';

-- 5. DISPLAY ALL REVIEWS FOR A PRODUCT

SELECT Product.Product_Name,
Review.Rating,
Review.Review_Text
FROM Product
JOIN Review
ON Product.Product_ID = Review.Product_ID
WHERE Product.Product_ID = 101;

-- 6. DISPLAY CUSTOMER NAME WITH REVIEWS

SELECT
Customer.Customer_Name,
Product.Product_Name,
Review.Rating,
Review.Review_Text
FROM Review
JOIN Customer
ON Review.Customer_ID = Customer.Customer_ID
JOIN Product
ON Review.Product_ID = Product.Product_ID;

-- 7. FIND PRODUCTS HAVING MAXIMUM REVIEWS

SELECT Product.Product_Name,
COUNT(Review.Review_ID) AS Total_Reviews
FROM Product
JOIN Review
ON Product.Product_ID = Review.Product_ID
GROUP BY Product.Product_ID, Product.Product_Name
ORDER BY Total_Reviews DESC
LIMIT 1;

-- 8. DISPLAY RECENT CUSTOMER FEEDBACK

SELECT *
FROM Review
ORDER BY Review_Date DESC
LIMIT 5;

-- 9. REVIEWS WITH RATINGS ABOVE 4

SELECT *
FROM Review
WHERE Rating > 4;

-- 10. AVERAGE PRODUCT RATING

SELECT Product.Product_Name,
AVG(Review.Rating) AS Average_Rating
FROM Product
JOIN Review
ON Product.Product_ID = Review.Product_ID
GROUP BY Product.Product_ID, Product.Product_Name;

-- 11. COUNT NUMBER OF REVIEWS PER PRODUCT

SELECT Product_ID,
COUNT(*) AS Total_Reviews
FROM Review
GROUP BY Product_ID;

-- 12. HIGHEST RATED PRODUCTS

SELECT Product.Product_Name,
AVG(Review.Rating) AS Average_Rating
FROM Product
JOIN Review
ON Product.Product_ID = Review.Product_ID
GROUP BY Product.Product_ID, Product.Product_Name
ORDER BY Average_Rating DESC;

-- 13. PRODUCTS WITH AVERAGE RATING ABOVE 4

SELECT Product.Product_Name,
AVG(Review.Rating) AS Average_Rating
FROM Product
JOIN Review
ON Product.Product_ID = Review.Product_ID
GROUP BY Product.Product_ID, Product.Product_Name
HAVING AVG(Review.Rating) > 4;

-- 14. RATING DISTRIBUTION

SELECT Rating,
COUNT(*) AS Total
FROM Review
GROUP BY Rating
ORDER BY Rating DESC;

-- 15. LOW RATED REVIEWS

SELECT *
FROM Review
WHERE Rating <= 2;
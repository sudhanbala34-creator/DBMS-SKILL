USE EcommerceDB;

-- 1. DISPLAY ALL CUSTOMER DETAILS

SELECT * FROM Customer;

-- 2. DISPLAY ALL PRODUCTS

SELECT * FROM Product;

-- 3. PRODUCT NAMES AND PRICES

SELECT Product_Name, Price
FROM Product;

-- 4. DISPLAY ALL ORDERS

SELECT * FROM Orders;

-- 5. DISPLAY PAYMENT DETAILS

SELECT * FROM Payment;

-- 6. PRODUCTS PRICE GREATER THAN 5000

SELECT *
FROM Product
WHERE Price > 5000;

-- 7. PRODUCTS AVAILABLE IN STOCK

SELECT Product.Product_Name,
Inventory.Stock_Quantity
FROM Product
JOIN Inventory
ON Product.Product_ID = Inventory.Product_ID
WHERE Stock_Quantity > 0;

-- 8. CUSTOMERS FROM CHENNAI

SELECT *
FROM Customer
WHERE City = 'Chennai';

-- 9. COMPLETED ORDERS

SELECT *
FROM Orders
WHERE Order_Status = 'Completed';

-- 10. PRODUCTS WITH RATING ABOVE 4

SELECT Product.Product_Name,
AVG(Review.Rating) AS Rating
FROM Product
JOIN Review
ON Product.Product_ID = Review.Product_ID
GROUP BY Product.Product_ID, Product.Product_Name
HAVING AVG(Review.Rating) > 4;

-- 11. SORT PRODUCTS BY PRICE

SELECT *
FROM Product
ORDER BY Price ASC;

-- 12. CUSTOMERS ALPHABETICALLY

SELECT *
FROM Customer
ORDER BY Customer_Name ASC;

-- 13. TOP EXPENSIVE PRODUCTS

SELECT *
FROM Product
ORDER BY Price DESC
LIMIT 5;

-- 14. LATEST ORDERS

SELECT *
FROM Orders
ORDER BY Order_Date DESC;

-- 15. UNIQUE PRODUCT CATEGORIES

SELECT DISTINCT Category_Name
FROM Category;

-- 16. DIFFERENT PAYMENT METHODS

SELECT DISTINCT Payment_Mode
FROM Payment;

-- 17. UNIQUE CUSTOMER LOCATIONS

SELECT DISTINCT City
FROM Customer;

-- 18. PRODUCTS BETWEEN 1000 AND 5000

SELECT *
FROM Product
WHERE Price BETWEEN 1000 AND 5000;

-- 19. PRODUCTS FROM ELECTRONICS CATEGORY

SELECT Product.*
FROM Product
JOIN Category
ON Product.Category_ID = Category.Category_ID
WHERE Category.Category_Name = 'Electronics';

-- 20. SEARCH PRODUCT BY NAME

SELECT *
FROM Product
WHERE Product_Name LIKE '%Mobile%';

-- 21. LOW STOCK PRODUCTS

SELECT Product.Product_Name,
Inventory.Stock_Quantity
FROM Product
JOIN Inventory
ON Product.Product_ID = Inventory.Product_ID
WHERE Inventory.Stock_Quantity <= 5;

-- 22. CUSTOMER DETAILS WITH ORDERS

SELECT Customer.Customer_Name,
Orders.Order_ID,
Orders.Order_Date,
Orders.Order_Status
FROM Customer
JOIN Orders
ON Customer.Customer_ID = Orders.Customer_ID;

-- 23. PRODUCT DETAILS WITH CATEGORY

SELECT Product.Product_Name,
Category.Category_Name,
Product.Price
FROM Product
JOIN Category
ON Product.Category_ID = Category.Category_ID;

-- 24. CUSTOMERS FROM CHENNAI OR BANGALORE

SELECT *
FROM Customer
WHERE City = 'Chennai'
OR City = 'Bangalore';

-- 25. SEARCH PRODUCTS CONTAINING MOBILE

SELECT *
FROM Product
WHERE Product_Name LIKE '%Mobile%';

-- 26. ORDERS WITHIN DATE RANGE

SELECT *
FROM Orders
WHERE Order_Date BETWEEN '2026-08-01'
AND '2026-09-30';

-- 27. ELECTRONICS PRODUCTS ABOVE 10000

SELECT Product.Product_Name,
Product.Price
FROM Product
JOIN Category
ON Product.Category_ID = Category.Category_ID
WHERE Category.Category_Name = 'Electronics'
AND Product.Price > 10000;

-- 28. TOTAL NUMBER OF CUSTOMERS

SELECT COUNT(*) AS Total_Customers
FROM Customer;

-- 29. CUSTOMER LIST BY CITY

SELECT City,
COUNT(*) AS Total_Customers
FROM Customer
GROUP BY City;

-- 30. NEW CUSTOMER REGISTRATIONS

SELECT *
FROM Customer
WHERE Registration_Date >= '2026-09-01';

-- 31. TOTAL ORDERS

SELECT COUNT(*) AS Total_Orders
FROM Orders;

-- 32. COMPLETED, PENDING AND CANCELLED ORDERS

SELECT Order_Status,
COUNT(*) AS Total
FROM Orders
GROUP BY Order_Status;

-- 33. HIGHEST PRICED PRODUCTS

SELECT *
FROM Product
ORDER BY Price DESC
LIMIT 5;

-- 34. MOST REVIEWED PRODUCTS

SELECT Product.Product_Name,
COUNT(Review.Review_ID) AS Total_Reviews
FROM Product
LEFT JOIN Review
ON Product.Product_ID = Review.Product_ID
GROUP BY Product.Product_ID, Product.Product_Name
ORDER BY Total_Reviews DESC;

-- 35. AVAILABLE PRODUCTS

SELECT Product.Product_Name,
Inventory.Stock_Quantity
FROM Product
JOIN Inventory
ON Product.Product_ID = Inventory.Product_ID
WHERE Inventory.Stock_Quantity > 0;
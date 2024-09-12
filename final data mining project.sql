-- create schema retailshop;

use retailshop;

select * from online_retail;

-- What is the distribution of order values across all customers in the dataset? 
SELECT CustomerID,
SUM(UnitPrice * Quantity) AS total_OrderValue
FROM online_retail
GROUP BY CustomerID
ORDER BY total_OrderValue DESC;

-- How many unique products has each customer purchased?
 SELECT CustomerID, COUNT(DISTINCT StockCode) AS Unique_products_purchased
 FROM online_retail
 GROUP BY CustomerID
 ORDER BY Unique_products_purchased;
 
  -- Which customers have only made a single purchase from the company? 
 SELECT CustomerID
 FROM online_retail
 GROUP BY CustomerID
 HAVING COUNT(DISTINCT InvoiceNo) = 1;
 
 
 -- Which pairs of products are most commonly purchased together by customers in the dataset? 
 SELECT 
    a.StockCode AS Product_A, 
    b.StockCode AS Product_B, 
    COUNT(*) AS Frequency
FROM 
    online_retail a
JOIN 
   online_retail b 
ON 
    a.InvoiceNo = b.InvoiceNo 
AND 
    a.StockCode < b.StockCode  -- each pair is counted only once (to avoid duplicates)
GROUP BY 
    a.StockCode, b.StockCode
ORDER BY 
    Frequency DESC
LIMIT 10;

-- ADVANCED QUERIES
-- 1. Customer Segmentation by Purchase Frequency
SELECT 
    CustomerID, 
    COUNT(DISTINCT InvoiceNo) AS purchase_frequency,
    CASE 
        WHEN COUNT(DISTINCT InvoiceNo) > 10 THEN 'High'
        WHEN COUNT(DISTINCT InvoiceNo) BETWEEN 5 AND 10 THEN 'Medium'
        ELSE 'Low'
    END AS frequency_segment
FROM online_retail
GROUP BY CustomerID;

-- 2. Average Order Value by Country 
SELECT country, avg(UnitPrice*Quantity) as average_OrderValue
FROM online_retail
GROUP BY country
ORDER BY average_OrderValue DESC;

-- 3. Customer Churn Analysis 
-- new dates need to run it(assigning random dates in sql)
UPDATE online_retail
SET InvoiceDate = CURDATE() - INTERVAL FLOOR(RAND() * 365) DAY;

SELECT DISTINCT CustomerID
FROM online_retail
WHERE CustomerID NOT IN (
    SELECT CustomerID
    FROM online_retail
    WHERE InvoiceDate >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH)
); 

SELECT DISTINCT CustomerID
FROM online_retail
WHERE CustomerID NOT IN (
    SELECT CustomerID
    FROM online_retail
    WHERE InvoiceDate >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH)
);

-- 4. Product Affinity Analysis 
SELECT 
    p1.StockCode AS Product1, 
    p2.StockCode AS Product2, 
    COUNT(*) AS CoOccurrenceCount
FROM 
    online_retail p1
JOIN 
    online_retail p2
ON 
    p1.InvoiceNo = p2.InvoiceNo 
    AND p1.StockCode < p2.StockCode  
GROUP BY 
    p1.StockCode, 
    p2.StockCode
ORDER BY 
    CoOccurrenceCount DESC;
    
    -- 5. Time-based Analysis 
-- monthly
SELECT 
    YEAR(InvoiceDate) AS Year, 
    MONTH(InvoiceDate) AS Month,
    SUM(Quantity * UnitPrice) AS TotalSales
FROM online_retail
GROUP BY Year, Month
ORDER BY Month;

-- Quarterly
SELECT 
    YEAR(InvoiceDate) AS Year, 
    QUARTER(InvoiceDate) as Quarter,
    SUM(Quantity * UnitPrice) AS TotalSales
FROM online_retail
GROUP BY Year, Quarter
ORDER BY Quarter;





















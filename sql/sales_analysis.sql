-- ============================================================
-- RETAIL SALES ANALYSIS -- SQL QUERIES
-- Database: MySQL | Dataset: Superstore Sales 2015-2018
-- ============================================================


-- ------------------------------------------------------------
-- 1. TOTAL REVENUE OVERVIEW
-- ------------------------------------------------------------
SELECT 
    ROUND(SUM(Sales), 2) AS total_revenue,
    COUNT(DISTINCT Order_ID) AS total_orders,
    COUNT(DISTINCT Customer_ID) AS total_customers
FROM sales_data;


-- ------------------------------------------------------------
-- 2. ANNUAL SALES TREND
-- ------------------------------------------------------------
SELECT 
    YEAR(Order_Date) AS year,
    ROUND(SUM(Sales), 2) AS total_sales
FROM sales_data
GROUP BY YEAR(Order_Date)
ORDER BY year;


-- ------------------------------------------------------------
-- 3. MONTHLY SALES TREND
-- ------------------------------------------------------------
SELECT 
    YEAR(Order_Date) AS year,
    MONTH(Order_Date) AS month,
    ROUND(SUM(Sales), 2) AS total_sales
FROM sales_data
GROUP BY YEAR(Order_Date), MONTH(Order_Date)
ORDER BY year, month;


-- ------------------------------------------------------------
-- 4. SALES BY CATEGORY
-- ------------------------------------------------------------
SELECT 
    Category,
    ROUND(SUM(Sales), 2) AS total_sales,
    COUNT(DISTINCT Order_ID) AS total_orders
FROM sales_data
GROUP BY Category
ORDER BY total_sales DESC;


-- ------------------------------------------------------------
-- 5. SALES BY REGION
-- ------------------------------------------------------------
SELECT 
    Region,
    ROUND(SUM(Sales), 2) AS total_sales,
    COUNT(DISTINCT Order_ID) AS total_orders
FROM sales_data
GROUP BY Region
ORDER BY total_sales DESC;


-- ------------------------------------------------------------
-- 6. TOP 10 PRODUCTS BY SALES
-- ------------------------------------------------------------
SELECT 
    Product_Name,
    Category,
    ROUND(SUM(Sales), 2) AS total_sales
FROM sales_data
GROUP BY Product_Name, Category
ORDER BY total_sales DESC
LIMIT 10;


-- ------------------------------------------------------------
-- 7. UNDERPERFORMING REGIONS (BELOW AVERAGE SALES)
-- ------------------------------------------------------------
SELECT 
    Region,
    ROUND(SUM(Sales), 2) AS total_sales
FROM sales_data
GROUP BY Region
HAVING total_sales < (
    SELECT AVG(region_total) 
    FROM (
        SELECT SUM(Sales) AS region_total 
        FROM sales_data 
        GROUP BY Region
    ) AS region_averages
)
ORDER BY total_sales;


-- ------------------------------------------------------------
-- 8. BEST PERFORMING MONTH ACROSS ALL YEARS
-- ------------------------------------------------------------
SELECT 
    MONTH(Order_Date) AS month,
    ROUND(SUM(Sales), 2) AS total_sales
FROM sales_data
GROUP BY MONTH(Order_Date)
ORDER BY total_sales DESC
LIMIT 1;
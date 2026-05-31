CREATE DATABASE superstore_db;
USE superstore_db;

-- 1. EXPLORE TABLE

-- View first 10 rows
SELECT * FROM superstore LIMIT 10;

-- Total number of records
SELECT COUNT(*) AS total_rows FROM superstore;

-- View table schema
DESCRIBE superstore;

-- 2. WHERE FILTERS

-- Orders from West region
SELECT * FROM superstore WHERE region = 'West';

-- Furniture category orders
SELECT * FROM superstore WHERE category = 'Furniture';

-- Sales greater than 1000
SELECT * FROM superstore WHERE sales > 1000;

-- Profit greater than 500
SELECT * FROM superstore WHERE profit > 500;

-- Orders placed in 2017
SELECT * FROM superstore WHERE `Order Date` LIKE '%2017';

-- 3. AGGREGATION FUNCTIONS

-- Total Sales
SELECT SUM(sales) AS total_sales FROM superstore;

-- Total Quantity Sold
SELECT SUM(quantity) AS total_quantity FROM superstore;

-- Average Sales
SELECT ROUND(AVG(sales),2) AS average_sales FROM superstore;

-- Maximum Sale
SELECT MAX(sales) AS highest_sale FROM superstore;

-- Minimum Sale
SELECT MIN(sales) AS lowest_sale FROM superstore;

-- Total Profit
SELECT ROUND(SUM(profit),2) AS total_profit FROM superstore;

-- 4. GROUP BY ANALYSIS

-- Sales by Region
SELECT
    region,
    ROUND(SUM(sales),2) AS total_sales
FROM superstore
GROUP BY region
ORDER BY total_sales DESC;

-- Profit by Region
SELECT
    region,
    ROUND(SUM(profit),2) AS total_profit
FROM superstore
GROUP BY region
ORDER BY total_profit DESC;

-- Sales by Category
SELECT
    category,
    ROUND(SUM(sales),2) AS total_sales
FROM superstore
GROUP BY category
ORDER BY total_sales DESC;

-- Average Sales by Category


-- Quantity Sold by Sub-Category
SELECT
    `Sub-Category`,
    SUM(Quantity) AS total_quantity
FROM superstore
GROUP BY `Sub-Category`
ORDER BY total_quantity DESC;

-- 5. SORTING AND LIMIT

-- Top 10 Products by Sales
SELECT
    `Product Name`,
    ROUND(SUM(sales),2) AS total_sales
FROM superstore
GROUP BY `Product Name`
ORDER BY total_sales DESC
LIMIT 10;

-- Top Categories by Sales
SELECT
    category,
    ROUND(SUM(sales),2) AS total_sales
FROM superstore
GROUP BY category
ORDER BY total_sales DESC;

-- Top 10 Customers by Sales
SELECT
    `Customer Name`,
    ROUND(SUM(sales),2) AS total_sales
FROM superstore
GROUP BY `Customer Name`
ORDER BY total_sales DESC
LIMIT 10;

-- 6. BUSINESS USE CASES

-- Monthly Sales Trend
SELECT
    DATE_FORMAT(`Order Date`,'%Y-%m') AS month,
    ROUND(SUM(sales),2) AS total_sales
FROM superstore
GROUP BY month
ORDER BY month;

-- Monthly Profit Trend
SELECT
    DATE_FORMAT(`Order Date`,'%Y-%m') AS month,
    ROUND(SUM(profit),2) AS total_profit
FROM superstore
GROUP BY month
ORDER BY month;

-- Top 5 Customers
SELECT
    `Customer Name`,
    ROUND(SUM(sales),2) AS total_sales
FROM superstore
GROUP BY `Customer Name`
ORDER BY total_sales DESC
LIMIT 5;

-- Most Profitable Products
SELECT
    `Product Name`,
    ROUND(SUM(profit),2) AS total_profit
FROM superstore
GROUP BY `Product Name`
ORDER BY total_profit DESC
LIMIT 10;

-- Top 10 States by Sales
SELECT
    state,
    ROUND(SUM(sales),2) AS total_sales
FROM superstore
GROUP BY state
ORDER BY total_sales DESC
LIMIT 10;

-- 7. DUPLICATE RECORD CHECK

SELECT
    `Order Id`,
    COUNT(*) AS duplicate_count
FROM superstore
GROUP BY `Order Id`
HAVING COUNT(*) > 1;

-- 8. DATA QUALITY CHECKS

-- Validate total rows
SELECT COUNT(*) AS total_rows FROM superstore;

-- Check NULL values
SELECT
    COUNT(*) AS total_rows,
    COUNT(`Order Id`) AS order_id_count,
    COUNT(`Customer Name`) AS customer_name_count,
    COUNT(`Product Name`) AS product_name_count,
    COUNT(sales) AS sales_count
FROM superstore;

-- Missing customer names
SELECT * FROM superstore WHERE `Customer Name` IS NULL;

-- Missing product names
SELECT * FROM superstore WHERE `Product Name` IS NULL;

-- Negative sales values
SELECT * FROM superstore WHERE sales < 0;

-- Negative profit values
SELECT * FROM superstore WHERE profit < 0;

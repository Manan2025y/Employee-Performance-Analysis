.cm-variable {
    color: #FF5733 !important; /* orange */
}


-- Sql retails sales project
CREATE DATABASE sql_project_1

-- create table
CREATE TABLE retail_sales (transactions_id INT PRIMARY KEY,
							sale_date DATE,
							sale_time TIME,
							customer_id INT,
							gender VARCHAR(15),
							age INT,
							category VARCHAR(15),
							quantiy	INT,
							price_per_unit FLOAT,
							cogs FLOAT,
							total_sale FLOAT
							);
--data cleaning							
SELECT   * FROM retail_sales
LIMIT 10

SELECT COUNT(*)FROM retail_sales

-- ==DELETING NULL ROWS==========
 DELETE FROM retail_sales
WHERE transactions_id IS NULL
OR
sale_date IS NULL
OR
 sale_time IS NULL
OR
customer_id IS NULL
OR
 gender IS NULL

OR
 category IS NULL
OR
 quantiy IS NULL
OR
 price_per_unit IS NULL
OR
 cogs IS NULL
OR
 total_sale IS NULL
 
 ---viewing data
 SELECT * FROM retail_sales
WHERE transactions_id IS NULL
OR
sale_date IS NULL
OR
 sale_time IS NULL
OR
customer_id IS NULL
OR
 gender IS NULL

OR
 category IS NULL
OR
 quantiy IS NULL
OR
 price_per_unit IS NULL
OR
 cogs IS NULL
OR
 total_sale IS NULL

---DATA EXPLOARATION 
SELECT   * FROM retail_sales


--HOW MANY SALES WE HAVE ?
SELECT COUNT(*) AS total_sales FROM retail_sales;

-- HOW MANY Unique CUSTOMERS WE HAVE ?
SELECT COUNT(DISTINCT customer_id) AS total_customers FROM retail_sales;

--- DISTINCT CATEGORY
SELECT DISTINCT Category  FROM retail_sales;


--DATA ANYALYSIS AND BUSINESS KEY QUESTIONS AND ANSWERS

--- MY anaylisis
-- My Analysis & Findings

-- Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05'
-- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity is greater than 3 for the month of Nov-2022
-- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.
-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.
-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.
-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.
-- Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year.
-- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales.
-- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.
-- Q.10 Write a SQL query to create each shift and number of orders (Example Morning <=12, Afternoon Between 12 & 17, Evening >17)



-- Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05'
SELECT *
FROM retail_sales
WHERE sale_date = '2022-11-05';

-- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity is greater and equal than 4 for the month of Nov-2022
SELECT *
FROM retail_sales
WHERE category= 'Clothing'
AND 
	To_CHAR(sale_date,'YYYY-MM') = '2022-11'
	AND
	quantiy >= 4


-- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.
SELECT 
	category,
	SUM(total_sale ) as net_sale,
	COUNT(*) as total_orders
FROM retail_sales
GROUP BY 1;

--Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.
SELECT  
		ROUND(AVG(age),2) as avg_age
FROM retail_sales
WHERE category = 'Beauty'


-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.
SELECT * 
FROM retail_sales
WHERE total_sale > 1000


-- Q.6 Write a SQL query to find the total number of transactions (transactions_id) made by each gender in each category.
SELECT 
		gender, 
		category,
		COUNT(transactions_id) AS total_transactions
FROM retail_sales
GROUP BY 
	gender, 
	category
ORDER BY 2;
 -- Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year.

SELECT
    DATE_PART('year', sale_date) AS year,
    TO_CHAR(sale_date, 'FMMonth') AS month_name,
    ROUND(AVG(total_sale)::numeric, 2) AS avg_sale
FROM retail_sales
GROUP BY year, month_name, DATE_PART('month', sale_date)
ORDER BY year, avg_sale DESC;


-- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales.

SELECT 
	customer_id,
	SUM(total_sale)
FROM retail_sales
GROUP BY customer_id
ORDER BY SUM(total_sale) DESC
LIMIT 5;

-- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.

SELECT 
	COUNT(DISTINCT customer_id),
	category
FROM retail_sales
GROUP BY category

-- Q.10 Write a SQL query to create each shift and number of orders (Example Morning <=12, Afternoon Between 12 & 17, Evening >17)
SELECT 
    CASE
        WHEN EXTRACT(HOUR FROM sale_time) < 12 THEN 'Morning'
        WHEN EXTRACT(HOUR FROM sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
        ELSE 'Evening'
    END AS shift,
    COUNT(*) AS total_orders
FROM retail_sales
GROUP BY shift
ORDER BY total_orders DESC;

--===-=====END OF PROJECT========================




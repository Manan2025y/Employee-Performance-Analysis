# **Project Overview**

## Project Title: Employee Performance Analysis

### Level: Beginner

##### Database: sql\_project\_1



This project is designed to demonstrate SQL skills and techniques typically used by data analysts to explore, clean, and analyze employee performance data. The project involves setting up an employee performance database, performing exploratory data analysis (EDA), and answering specific business questions through SQL queries. This project is ideal for those who are starting their journey in data analysis and want to build a strong foundation in SQL.



##### Objectives

Set up an employee performance database: Create and populate the database with provided employee performance data.



###### Data Cleaning:

&nbsp;Identify and remove any records with missing or invalid values.



###### Exploratory Data Analysis (EDA): 

Perform basic exploratory data analysis to understand employee performance trends.



###### Business Analysis:

&nbsp;Use SQL to answer specific business questions and derive insights from the performance data.



###### Project Structure

###### 1\. Database Setup

###### Database Creation:

&nbsp;The project starts by creating a database named sql\_project\_1.



Table Creation: A table named sql\_project\_1 is created to store the performance data. The table structure includes columns for employee ID, name, department, role, gender, age, hire date, review date, performance score, training hours, projects completed, and salary.



-- create table

CREATE TABLE retail\_sales (transactions\_id INT PRIMARY KEY,

&nbsp;					sale\_date DATE,

&nbsp;					sale\_time TIME,

&nbsp;					customer\_id INT,

&nbsp;					gender VARCHAR(15),

&nbsp;					age INT,

&nbsp;					category VARCHAR(15),

&nbsp;					quantiy	INT,

&nbsp;					price\_per\_unit FLOAT,

&nbsp;					cogs FLOAT,

&nbsp;					total\_sale FLOAT

&nbsp;							);

--data cleaning							

SELECT   \* FROM retail\_sales

LIMIT 10



SELECT COUNT(\*)FROM retail\_sales



-- ==DELETING NULL ROWS==========

&nbsp;DELETE FROM retail\_sales

WHERE transactions\_id IS NULL

OR

sale\_date IS NULL

OR

&nbsp;sale\_time IS NULL

OR

customer\_id IS NULL

OR

&nbsp;gender IS NULL



OR

&nbsp;category IS NULL

OR

&nbsp;quantiy IS NULL

OR

&nbsp;price\_per\_unit IS NULL

OR

&nbsp;cogs IS NULL

OR

&nbsp;total\_sale IS NULL

&nbsp;

&nbsp;---viewing data

&nbsp;SELECT \* FROM retail\_sales

WHERE transactions\_id IS NULL

OR

sale\_date IS NULL

OR

&nbsp;sale\_time IS NULL

OR

customer\_id IS NULL

OR

&nbsp;gender IS NULL



OR

&nbsp;category IS NULL

OR

&nbsp;quantiy IS NULL

OR

&nbsp;price\_per\_unit IS NULL

OR

&nbsp;cogs IS NULL

OR

&nbsp;total\_sale IS NULL



---DATA EXPLOARATION 

SELECT   \* FROM retail\_sales





--HOW MANY SALES WE HAVE ?

SELECT COUNT(\*) AS total\_sales FROM retail\_sales;



-- HOW MANY Unique CUSTOMERS WE HAVE ?

SELECT COUNT(DISTINCT customer\_id) AS total\_customers FROM retail\_sales;



--- DISTINCT CATEGORY

SELECT DISTINCT Category  FROM retail\_sales;





--DATA ANYALYSIS AND BUSINESS KEY QUESTIONS AND ANSWERS



--- MY anaylisis

-- My Analysis \& Findings





-- Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05'

SELECT \*

FROM retail\_sales

WHERE sale\_date = '2022-11-05';



-- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity is greater and equal than 4 for the month of Nov-2022

SELECT \*

FROM retail\_sales

WHERE category= 'Clothing'

AND 

&nbsp;	To\_CHAR(sale\_date,'YYYY-MM') = '2022-11'

&nbsp;	AND

&nbsp;	quantiy >= 4





-- Q.3 Write a SQL query to calculate the total sales (total\_sale) for each category.

SELECT 

&nbsp;	category,

&nbsp;	SUM(total\_sale ) as net\_sale,

&nbsp;	COUNT(\*) as total\_orders

FROM retail\_sales

GROUP BY 1;



--Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.

SELECT  

&nbsp;		ROUND(AVG(age),2) as avg\_age

FROM retail\_sales

WHERE category = 'Beauty'





-- Q.5 Write a SQL query to find all transactions where the total\_sale is greater than 1000.

SELECT \* 

FROM retail\_sales

WHERE total\_sale > 1000





-- Q.6 Write a SQL query to find the total number of transactions (transactions\_id) made by each gender in each category.

SELECT 

&nbsp;		gender, 

&nbsp;		category,

&nbsp;		COUNT(transactions\_id) AS total\_transactions

FROM retail\_sales

GROUP BY 

&nbsp;	gender, 

&nbsp;	category

ORDER BY 2;

&nbsp;-- Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year.



SELECT

&nbsp;   DATE\_PART('year', sale\_date) AS year,

&nbsp;   TO\_CHAR(sale\_date, 'FMMonth') AS month\_name,

&nbsp;   ROUND(AVG(total\_sale)::numeric, 2) AS avg\_sale

FROM retail\_sales

GROUP BY year, month\_name, DATE\_PART('month', sale\_date)

ORDER BY year, avg\_sale DESC;





-- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales.



SELECT 

&nbsp;	customer\_id,

&nbsp;	SUM(total\_sale)

FROM retail\_sales

GROUP BY customer\_id

ORDER BY SUM(total\_sale) DESC

LIMIT 5;



-- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.



SELECT 

&nbsp;	COUNT(DISTINCT customer\_id),

&nbsp;	category

FROM retail\_sales

GROUP BY category



-- Q.10 Write a SQL query to create each shift and number of orders (Example Morning <=12, Afternoon Between 12 \& 17, Evening >17)

SELECT 

&nbsp;   CASE

&nbsp;       WHEN EXTRACT(HOUR FROM sale\_time) < 12 THEN 'Morning'

&nbsp;       WHEN EXTRACT(HOUR FROM sale\_time) BETWEEN 12 AND 17 THEN 'Afternoon'

&nbsp;       ELSE 'Evening'

&nbsp;   END AS shift,

&nbsp;   COUNT(\*) AS total\_orders

FROM retail\_sales

GROUP BY shift

ORDER BY total\_orders DESC;



--===-=====END OF PROJECT========================












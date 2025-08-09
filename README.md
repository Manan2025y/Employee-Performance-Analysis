# **Project Overview**

## Project Title: Employee Performance Analysis

**Level:** Beginner  
**Database:** `sql_project_1`

This project demonstrates SQL skills and techniques used by data analysts to explore, clean, and analyze employee performance data. You'll set up a database, perform exploratory data analysis (EDA), and answer business questions through SQL queries.

---

## Objectives

- **Database Setup:** Create and populate the database with employee performance data.
- **Data Cleaning:** Identify and remove records with missing or invalid values.
- **Exploratory Data Analysis (EDA):** Understand employee performance trends.
- **Business Analysis:** Use SQL to answer business questions and derive insights.

---

## Project Structure

1. **Database Setup**

   - **Database Creation:**  
     Create a database named `sql_project_1`.

   - **Table Creation:**  
     Example table structure for `retail_sales`:

     ```sql
     CREATE TABLE retail_sales (
         transactions_id INT PRIMARY KEY,
         sale_date DATE,
         sale_time TIME,
         customer_id INT,
         gender VARCHAR(15),
         age INT,
         category VARCHAR(15),
         quantiy INT,
         price_per_unit FLOAT,
         cogs FLOAT,
         total_sale FLOAT
     );
     ```

---

## Data Cleaning

```sql
-- View first 10 rows
SELECT * FROM retail_sales LIMIT 10;

-- Count total rows
SELECT COUNT(*) FROM retail_sales;

-- Delete rows with NULL values
DELETE FROM retail_sales
WHERE transactions_id IS NULL
   OR sale_date IS NULL
   OR sale_time IS NULL
   OR customer_id IS NULL
   OR gender IS NULL
   OR category IS NULL
   OR quantiy IS NULL
   OR price_per_unit IS NULL
   OR cogs IS NULL
   OR total_sale IS NULL;

-- View rows with NULL values (should return 0 after cleaning)
SELECT * FROM retail_sales
WHERE transactions_id IS NULL
   OR sale_date IS NULL
   OR sale_time IS NULL
   OR customer_id IS NULL
   OR gender IS NULL
   OR category IS NULL
   OR quantiy IS NULL
   OR price_per_unit IS NULL
   OR cogs IS NULL
   OR total_sale IS NULL;
```

---

## Exploratory Data Analysis (EDA)

```sql
-- View all data
SELECT * FROM retail_sales;

-- Total number of sales
SELECT COUNT(*) AS total_sales FROM retail_sales;

-- Number of unique customers
SELECT COUNT(DISTINCT customer_id) AS total_customers FROM retail_sales;

-- Distinct categories
SELECT DISTINCT category FROM retail_sales;
```

---

## Business Analysis: Key Questions & Answers

### Q1. Retrieve all columns for sales made on '2022-11-05'
```sql
SELECT *
FROM retail_sales
WHERE sale_date = '2022-11-05';
```

### Q2. Transactions where category is 'Clothing' and quantity >= 4 for Nov-2022
```sql
SELECT *
FROM retail_sales
WHERE category = 'Clothing'
  AND TO_CHAR(sale_date, 'YYYY-MM') = '2022-11'
  AND quantiy >= 4;
```

### Q3. Total sales for each category
```sql
SELECT 
    category,
    SUM(total_sale) AS net_sale,
    COUNT(*) AS total_orders
FROM retail_sales
GROUP BY category;
```

### Q4. Average age of customers who purchased 'Beauty' category
```sql
SELECT ROUND(AVG(age), 2) AS avg_age
FROM retail_sales
WHERE category = 'Beauty';
```

### Q5. Transactions where total_sale > 1000
```sql
SELECT *
FROM retail_sales
WHERE total_sale > 1000;
```

### Q6. Total number of transactions by gender in each category
```sql
SELECT 
    gender, 
    category,
    COUNT(transactions_id) AS total_transactions
FROM retail_sales
GROUP BY gender, category
ORDER BY category;
```

### Q7. Average sale for each month; find best selling month in each year
```sql
SELECT
    DATE_PART('year', sale_date) AS year,
    TO_CHAR(sale_date, 'FMMonth') AS month_name,
    ROUND(AVG(total_sale)::numeric, 2) AS avg_sale
FROM retail_sales
GROUP BY year, month_name, DATE_PART('month', sale_date)
ORDER BY year, avg_sale DESC;
```

### Q8. Top 5 customers based on highest total sales
```sql
SELECT 
    customer_id,
    SUM(total_sale) AS total_sales
FROM retail_sales
GROUP BY customer_id
ORDER BY total_sales DESC
LIMIT 5;
```

### Q9. Number of unique customers who purchased from each category
```sql
SELECT 
    category,
    COUNT(DISTINCT customer_id) AS unique_customers
FROM retail_sales
GROUP BY category;
```

### Q10. Create each shift and number of orders (Morning <=12, Afternoon 12-17, Evening >17)
```sql
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
```

---

## End of Project

---

## Findings

- **Customer Demographics:** Customers span a wide range of age groups, with purchases spread across categories like Clothing and Beauty.
- **High-Value Transactions:** Multiple orders exceeded a total value of 1,000, suggesting premium or bulk purchases.
- **Sales Trends:** Monthly breakdowns highlight fluctuations in sales, making it easier to pinpoint high-demand periods.
- **Customer Insights:** Highlights the highest-spending customers and the most popular product categories.

## Reports

- **Sales Summary:** Comprehensive report covering overall sales figures, customer profiles, and performance by category.
- **Trend Analysis:** Detailed look at sales patterns across months and work shifts.
- **Customer Insights:** Overview of top customers and the number of unique buyers per category.

## Conclusion

This project offers a complete introduction to SQL for aspiring data analysts, including database setup, data cleaning, exploratory data analysis, and creating business-focused queries. The insights gained can help inform better decisions by uncovering patterns in sales, customer behavior, and product performance.

## How to Use

1. **Clone the Repository:** Download this repository from GitHub.
2. **Initialize the Database:** Run the SQL script in `database_setup.sql` to create and populate the database.
3. **Execute the Queries:** Use the queries in `analysis_queries.sql` to perform your analysis.
4. **Customize and Explore:** Adapt the queries to investigate additional questions or different aspects of the dataset.

---

**Author – Manan**  
This project is part of my personal portfolio, demonstrating SQL skills essential for data analyst roles. For questions, feedback, or potential collaborations, feel free to reach out.

--===-=====END OF PROJECT========================



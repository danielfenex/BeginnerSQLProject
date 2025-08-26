-- drop table if it exists
DROP TABLE IF EXISTS retail_sales;

-- create table
CREATE TABLE retail_sales (
    transaction_id INT PRIMARY KEY,
    sale_date DATE,
    sale_time TIME,
    customer_id INT,
    gender VARCHAR(15),
    age INT,
    category VARCHAR(15),
    quantity INT,
    price_per_unit FLOAT,
    cogs FLOAT,
    total_sale FLOAT
);

-- but how does having a .sql file help if I have to enter everything in
-- a terminal?

-- Import data from the .csv file using \copy (client-side)
\copy retail_sales (transaction_id, sale_date, sale_time, customer_id, gender, age, category, quantity, price_per_unit, cogs, total_sale) FROM '/Users/user/Desktop/BeginnerSQLProoject/Retail_Sales.csv' DELIMITER ',' CSV HEADER;

-- queries
-- SELECT * FROM retail_sales LIMIT 10;

-- SELECT COUNT(*) FROM retail_sales;

-- queries to clean data
SELECT * FROM retail_sales WHERE transaction_id IS NULL;

SELECT * FROM retail_sales WHERE sale_date IS NULL;

SELECT * FROM retail_sales WHERE sale_time IS NULL;

SELECT * FROM retail_sales
WHERE 
    transaction_id IS NULL
    OR
    sale_date IS NULL
    OR 
    sale_time IS NULL
    OR
    gender IS NULL
    OR
    category IS NULL
    OR
    quantity IS NULL
    OR
    cogs IS NULL
    OR
    total_sale IS NULL;

SELECT 
  *
FROM retail_sales
WHERE 
    category = 'Clothing'
    AND 
    TO_CHAR(sale_date, 'YYYY-MM') = '2022-11'
    AND
    quantity >= 4


SELECT 
    category,
    SUM(total_sale) as net_sale,
    COUNT(*) as total_orders
FROM retail_sales
GROUP BY 1

SELECT
    ROUND(AVG(age), 2) as avg_age


SELECT
    ROUND(AVG(age), 2) as avg_age
FROM retail_sales
WHERE category = 'Beauty'



SELECT * FROM retail_sales
WHERE total_sale > 1000



SELECT 
    category,
    gender,
    COUNT(*) as total_trans
FROM retail_sales
GROUP 
    BY 
    category,
    gender
ORDER BY 1


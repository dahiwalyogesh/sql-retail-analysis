-- Q1: Total revenue per category
SELECT category,
       SUM(quantity * unit_price) AS total_revenue
FROM sales
GROUP BY category
ORDER BY total_revenue DESC;

-- Q2: Total quantity and revenue per product
SELECT product_name,
       SUM(quantity) AS total_quantity,
       SUM(quantity * unit_price) AS total_revenue
FROM sales
GROUP BY product_name
ORDER BY total_revenue DESC;

-- Q3: Categories with total revenue above £20
SELECT category,
       SUM(quantity * unit_price) AS total_revenue
FROM sales
GROUP BY category
HAVING total_revenue > 20
ORDER BY total_revenue DESC;

-- Q4: Label each sale by performance
SELECT sale_id, product_name,
       quantity * unit_price AS revenue,
       CASE
           WHEN quantity * unit_price > 10 THEN 'High'
           WHEN quantity * unit_price BETWEEN 5 AND 10 THEN 'Medium'
           ELSE 'Low'
       END AS performance
FROM sales;

-- Q5: Top performing region by total revenue
WITH regional_revenue AS (
    SELECT region,
           SUM(quantity * unit_price) AS total_revenue
    FROM sales
    GROUP BY region
)
SELECT region, total_revenue
FROM regional_revenue
ORDER BY total_revenue DESC
LIMIT 1;

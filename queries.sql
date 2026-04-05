
-- Orders per country
SELECT cus.country, COUNT(DISTINCT ord.order_id) AS total_orders
FROM customers AS cus
INNER JOIN orders AS ord
	ON cus.customer_id = ord.customer_id
GROUP BY cus.country;

-- Total sales per customer
SELECT cus.name,
SUM(par.quantity * p.price) AS total_spent
FROM customers AS cus
INNER JOIN orders AS ord
	ON cus.customer_id = ord.customer_id
INNER JOIN order_items AS par
	ON ord.order_id = par.order_id
INNER JOIN products AS p
	ON par.product_id = p.product_id
GROUP BY cus.name;

-- Total revenue
SELECT SUM(par.quantity * p.price) AS total_revenue
FROM order_items AS par
INNER JOIN products AS p
	ON par.product_id = p.product_id;
    
-- Top customers

SELECT cus.name,
SUM(par.quantity * p.price) AS total_spent
FROM customers AS cus
INNER JOIN orders AS ord
	ON cus.customer_id = ord.customer_id
INNER JOIN order_items AS par
	ON ord.order_id = par.order_id
INNER JOIN products AS p
	ON par.product_id = p.product_id
GROUP BY cus.name
ORDER BY total_spent DESC
LIMIT 3;

-- Revenue by category?
SELECT category,
SUM(par.quantity * p.price) AS total_spent
FROM order_items AS par
INNER JOIN products AS p
	ON par.product_id = p.product_id
GROUP BY category
ORDER BY total_spent DESC
LIMIT 1;

-- Most popular product
SELECT p.product_name,
SUM(ord.quantity) AS total_sold
FROM products AS p
INNER JOIN order_items AS ord
	ON p.product_id = ord.product_id
GROUP BY p.product_name
ORDER BY total_sold DESC
LIMIT 1;

-- Customers above average spending
SELECT cus.name,
SUM(par.quantity * p.price) AS total_spent
FROM customers AS cus
INNER JOIN orders AS ord 
	ON cus.customer_id = ord.customer_id
INNER JOIN order_items AS par 
	ON ord.order_id = par.order_id
INNER JOIN products AS p 
	ON par.product_id = p.product_id
GROUP BY cus.name;

-- Calculate average 
SELECT AVG(customer_total) AS avg_customer_spending
FROM (
    SELECT cus.customer_id,
    SUM(par.quantity * p.price) AS customer_total
    FROM customers AS cus
    INNER JOIN orders AS ord 
        ON cus.customer_id = ord.customer_id
    INNER JOIN order_items AS par 
        ON ord.order_id = par.order_id
    INNER JOIN products AS p 
        ON par.product_id = p.product_id
    GROUP BY cus.customer_id
) AS sub;

-- Comparison 
SELECT cus.name,
SUM(par.quantity * p.price) AS total_spent
FROM customers AS cus
INNER JOIN orders AS ord 
	ON cus.customer_id = ord.customer_id
INNER JOIN order_items AS par 
	ON ord.order_id = par.order_id
INNER JOIN products AS p 
	ON par.product_id = p.product_id
GROUP BY cus.name
HAVING total_spent > (
    SELECT AVG(customer_total)
    FROM (
        SELECT cus.customer_id,
        SUM(par.quantity * p.price) AS customer_total
        FROM customers AS cus
        INNER JOIN orders AS ord 
            ON cus.customer_id = ord.customer_id
        INNER JOIN order_items AS par 
            ON ord.order_id = par.order_id
        INNER JOIN products AS p 
            ON par.product_id = p.product_id
        GROUP BY cus.customer_id
    ) AS sub
)
ORDER BY total_spent DESC;

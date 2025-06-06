
-- Select all customers
SELECT * FROM customers;

-- Calculate total revenue from all orders
SELECT SUM(total_amount) AS total_revenue FROM orders;

-- Count total orders per customer
SELECT 
    c.name, 
    COUNT(o.order_id) AS total_orders
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.name;

-- Find the best-selling product by quantity sold
SELECT 
    p.name, 
    SUM(oi.quantity) AS total_sold
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.name
ORDER BY total_sold DESC
LIMIT 1;

-- List all customers with their orders and total amount
SELECT 
    c.name, 
    o.order_date, 
    o.total_amount
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id;

-- Create a view to show customers and their total order amounts
CREATE VIEW customer_orders_view AS
SELECT 
    c.name, 
    o.total_amount
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id;

-- Select names of customers who have orders with total amount greater than 500
SELECT name FROM customers
WHERE customer_id IN (
    SELECT customer_id FROM orders
    WHERE total_amount > 500
);

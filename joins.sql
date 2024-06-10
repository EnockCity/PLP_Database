--INNER JOIN
SELECT customers.customer_name, orders.order_id
FROM customers
INNER JOIN orders
ON customers.customer_id = orders.customer_id;

-- LEFT JOIN
SELECT customers.customer_name, orders.order_id
FROM customers
LEFT JOIN orders
ON customers.customer_id = orders.customer_id;

-- RIGHT JOIN
SELECT customers.customer_name, orders.order_id
FROM customers
RIGHT JOIN orders
ON customers.customer_id = orders.customer_id;

-- FULL JOIN (Simulated using UNION)
SELECT customers.customer_name, orders.order_id
FROM customers
LEFT JOIN orders
ON customers.customer_id = orders.customer_id
UNION
SELECT customers.customer_name, orders.order_id
FROM customers
RIGHT JOIN orders
ON customers.customer_id = orders.customer_id;

-- Joining multiple tables
SELECT customers.customer_name, orders.order_id, products.product_name, order_details.quantity
FROM customers
INNER JOIN orders
ON customers.customer_id = orders.customer_id
INNER JOIN order_details
ON orders.order_id = order_details.order_id
INNER JOIN products
ON order_details.product_id = products.product_id;

-- Nested join with subquery
SELECT customer_name
FROM customers
WHERE customer_id IN (
    SELECT orders.customer_id
    FROM orders
    INNER JOIN order_details ON orders.order_id = order_details.order_id
    WHERE order_details.product_id = (SELECT product_id FROM products WHERE product_name = 'Laptop')
);

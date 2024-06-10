-- INNER JOIN
/*
INNER JOIN returns records that have matching values in both tables.
NULL values are discarded
*/
/*Retrieves customer names and their order IDs for
customers who have placed orders*/
SELECT customers.customer_name, orders.order_id
FROM customers
INNER JOIN orders
ON customers.customer_id = orders.order_id;


-- LEFT JOIN
/*
Returns all records from the left table, and the matched
records from the right table.
You would get all rows from the first table
that you've specified, and if there are no associated records with it
within the second table, you will get a NULL value
*/
/*
Retrieves all customers and their order IDs.
If a customer has not placed any orders, the order ID will be NULL
*/
SELECT customers.customer_name, orders.order_id
FROM customers
LEFT JOIN orders
ON customers.customer_id = orders.order_id;


-- RIGHT JOIN
/*
Returns all records from the right table, and the matched records from the left table.
It
will display all of the rows from the second table and give you a NULL
value in case that it does not match with an entry from the first table.
*/

/*
Retrieves all orders and their corresponding customer names. If an order does not have a corresponding customer, the customer name will be NULL
*/
SELECT customers.customer_name, orders.order_id
FROM customers
RIGHT JOIN orders
ON customers.customer_id = orders.order_id;


-- FULL JOIN
/*
 Returns all records when there is a match in either left or right table.
*/
/*
Retrieves all customers and orders, including those without a match.
*/
SELECT customers.customer_name, orders.order_id
FROM customers
FULL JOIN orders
ON customers.customer_id = orders.customer_id;


-- Joining multiple tables
/*
 Retrieves customer names, order IDs, product names, and
quantities for each order.
*/
SELECT customers.customer_name, orders.order_id, product.product_id, order_details.quantity
FROM customers
INNER JOIN orders
ON  customers.customer_id = orders.customer_id
INNER JOIN order_details
ON orders.order_id = order_details.order_id
INNER JOIN products
ON order_details.product_id = products.product_id;


-- Nested join with subquery
/*
Retrieves customer names for customers who have ordered
the product with ProductID = 201 (Laptop).
*/
SELECT customer_name
FROM customers
WHERE customer_id
IN (SELECT orders.customer_id
    FROM orders
    INNER JOIN order_details
    ON orders.order_id = order_details.order_id
    WHERE order_details.product_id = 201
);

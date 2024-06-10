-- Create Database
CREATE DATABASE IF NOT EXISTS joins;

-- Use the created database
USE joins;

-- Create customers table
CREATE TABLE IF NOT EXISTS customers
(
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(255),
    contact_name VARCHAR(255),
    country VARCHAR(255)
);

-- Create orders table
CREATE TABLE IF NOT EXISTS orders
(
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Create products table
CREATE TABLE IF NOT EXISTS products
(
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(255),
    price DECIMAL(10, 2)
);

-- Create order_details table
CREATE TABLE IF NOT EXISTS order_details
(
    order_detail_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Insert data into customers table
INSERT INTO customers (customer_name, contact_name, country) VALUES
('John Doe', 'John', 'USA'),
('Jane Smith', 'Jane', 'Canada'),
('Bob Johnson', 'Bob', 'USA'),
('Alice Brown', 'Alice', 'UK');

-- Insert data into orders table
INSERT INTO orders (customer_id, order_date) VALUES
((SELECT customer_id FROM customers WHERE customer_name = 'John Doe' LIMIT 1), '2024-01-01'),
((SELECT customer_id FROM customers WHERE customer_name = 'Jane Smith' LIMIT 1), '2024-02-01'),
((SELECT customer_id FROM customers WHERE customer_name = 'John Doe' LIMIT 1), '2024-03-01'),
((SELECT customer_id FROM customers WHERE customer_name = 'Bob Johnson' LIMIT 1), '2024-04-01');

-- Insert data into products table
INSERT INTO products (product_name, price) VALUES
('Laptop', 30000),
('Mouse', 500),
('Keyboard', 250);

-- Insert data into order_details table
INSERT INTO order_details (order_id, product_id, quantity) VALUES
((SELECT order_id FROM orders WHERE customer_id = (SELECT customer_id FROM customers WHERE customer_name = 'John Doe' LIMIT 1) AND order_date = '2024-01-01' LIMIT 1), (SELECT product_id FROM products WHERE product_name = 'Laptop' LIMIT 1), 1),
((SELECT order_id FROM orders WHERE customer_id = (SELECT customer_id FROM customers WHERE customer_name = 'John Doe' LIMIT 1) AND order_date = '2024-01-01' LIMIT 1), (SELECT product_id FROM products WHERE product_name = 'Mouse' LIMIT 1), 2),
((SELECT order_id FROM orders WHERE customer_id = (SELECT customer_id FROM customers WHERE customer_name = 'Jane Smith' LIMIT 1) AND order_date = '2024-02-01' LIMIT 1), (SELECT product_id FROM products WHERE product_name = 'Keyboard' LIMIT 1), 1),
((SELECT order_id FROM orders WHERE customer_id = (SELECT customer_id FROM customers WHERE customer_name = 'John Doe' LIMIT 1) AND order_date = '2024-03-01' LIMIT 1), (SELECT product_id FROM products WHERE product_name = 'Mouse' LIMIT 1), 3),
((SELECT order_id FROM orders WHERE customer_id = (SELECT customer_id FROM customers WHERE customer_name = 'Bob Johnson' LIMIT 1) AND order_date = '2024-04-01' LIMIT 1), (SELECT product_id FROM products WHERE product_name = 'Laptop' LIMIT 1), 2);

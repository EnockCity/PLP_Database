CREATE DATABASE IF NOT EXISTS joins;

USE joins;

CREATE TABLE IF NOT EXISTS customers
(
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name  VARCHAR(255),
    contact_name VARCHAR(255),
    country VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS orders
(
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers (customer_id)
);

CREATE TABLE IF NOT EXISTS products
(
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(255),
    price DECIMAL(10, 2)
);

CREATE TABLE IF NOT EXISTS order_details
(
    order_detail_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO customers
(customer_name, contact_name, country)
VALUES
('John Doe', 'John', 'USA'),
('Jane Smith', 'Jane', 'Canada'),
('BOb Johnson', 'Bob', 'USA'),
('Alice Brown', 'Alice', 'UK');

INSERT INTO orders
(customer_id, order_date)
VALUES
((SELECT customer_id FROM customers WHERE customer_name = 'John Doe' LIMIT 1), '2024-01-01'),
((SELECT customer_id FROM customers WHERE customer_name = 'Jane Smith' LIMIT 1), '2024-02-01'),
((SELECT customer_id FROM customers WHERE customer_name = 'John Doe' LIMIT 1), '2024-03-01'),
((SELECT customer_id FROM customers WHERE customer_name = 'Bob Johnson' LIMIT 1), '2024-04-01');

INSERT INTO products
(product_name, price)
VALUES
('laptop', 30000),
('mouse', 500),
('keyoard', 250);


INSERT INTO order_details
(order_id, product_id, quantity)
VALUES
  ((SELECT order_id FROM orders
    WHERE customer_id = (SELECT customer_id FROM customers
                         WHERE customer_name = 'John Doe' LIMIT 1)
      AND order_date = '2024-01-01' LIMIT 1),
   (SELECT product_id FROM products WHERE product_name = 'Laptop' LIMIT 1), 1),

  ((SELECT order_id FROM orders
    WHERE customer_id = (SELECT customer_id FROM customers

        WHERE customer_name = 'John Doe' LIMIT 1)
      AND order_date = '2024-01-01' LIMIT 1),
   (SELECT product_id FROM products WHERE product_name = 'Mouse' LIMIT 1), 2),

  ((SELECT order_id FROM orders
    WHERE customer_id = (SELECT customer_id FROM customers
                         WHERE customer_name = 'Jane Smith' LIMIT 1)
      AND order_date = '2024-02-01' LIMIT 1),
   (SELECT product_id FROM products WHERE product_name = 'Keyboard' LIMIT 1), 1),

  ((SELECT order_id FROM orders
    WHERE customer_id = (SELECT customer_id FROM customers
                         WHERE customer_name = 'John Doe' LIMIT 1)
      AND order_date = '2024-03-01' LIMIT 1),
   (SELECT product_id FROM products WHERE product_name = 'Mouse' LIMIT 1), 3),

  ((SELECT order_id FROM orders
    WHERE customer_id = (SELECT customer_id FROM customers
                         WHERE customer_name = 'Bob Johnson' LIMIT 1)
      AND order_date = '2024-04-01' LIMIT 1),
   (SELECT product_id FROM products WHERE product_name = 'Laptop' LIMIT 1), 2);

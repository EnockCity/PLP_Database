CREATE DATABASE IF NOT EXISTS mastersql;

USE mastersql;

CREATE TABLE IF NOT EXISTS users
(
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(255) NOT NULL,
    about TEXT,
    email VARCHAR(255),
    birthday DATE,
    active BOOL
);

INSERT INTO users
(username, email, active)
VALUES
('bobby', 'b@devdojo.com', true),
('devdojo', 'd@devdojo.com', false),
('tony', 't@devdojo.com', true);

DESCRIBE users;

SELECT username, active FROM users;

SELECT * FROM users LIMIT 1;

-- Agrregate functions
SELECT COUNT(*) FROM users;

SELECT MIN(id) FROM users;

SELECT MAX(id) FROM users;

SELECT AVG(id) FROM users;

SELECT SUM(id) FROM users;

INSERT INTO users
(username, email, active)
VALUES
('bobby', 'b@devdojo.com', true),
('devdojo', 'd@devdojo.com', false),
('tony', 't@devdojo.com', true);

SELECT COUNT(*) FROM users;

SELECT username FROM users;

SELECT DISTINCT username FROM users;

SELECT DISTINCT username, email, active
FROM users
WHERE active = true;

SELECT username, email, active
FROM users
WHERE username='bobby';

-- AND Operator
SELECT * FROM users
WHERE username = 'bobby'
AND active = true;

-- OR operator
SELECT * FROM users
WHERE username = 'bobby'
OR active = false;

-- LIKE operator %certain letter%
SELECT * FROM users
WHERE username LIKE '%y%';

-- IN operator
SELECT * FROM users
WHERE username IN('bobby', 'devdojo');

-- IS operator and IS NOT operator
-- is only used to check null values
SELECT * FROM users
WHERE about IS NULL;

/*
Sorting ORDER and GROUP BY
*/
/*
ORDER BY can be used without specifying a WHERE CLAUSE
But when used with WHERE Clause,it should come after WHERE CLAUSE.
*/
SELECT id, username
FROM users
ORDER BY username;

SELECT id, username FROM users
ORDER BY username DESC;

/*
GROUP BY allows one to use aggregate functions
with multiple cilumns
*/
SELECT  COUNT(username), username FROM users
GROUP BY username;

-- UPDATE
UPDATE users
SET username = 'bobbyiliev'
WHERE id = 1;

-- This updates all entries
UPDATE users
SET about = '404 bio not found';

UPDATE users
SET about='Hello World'
WHERE id = 1;

-- DELETE
DELETE FROM users
WHERE id = 5;

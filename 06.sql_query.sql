DROP TABLE IF EXISTS customers;

CREATE TABLE customers (
    customer_id INT,
    name VARCHAR(100),
    email VARCHAR(100)
);

CREATE TABLE orders4 (
    order_id INT ,
    customer_id INT,
    order_date DATE,
    amount DECIMAL(10, 2)
);

INSERT INTO customers (customer_id, name, email) VALUES
(1, 'John Doe', 'john@example.com'),
(2, 'Jane Smith', 'jane@example.com'),
(3, 'Alice Johnson', 'alice@example.com'),
(4, 'Sam B', 'sb@example.com'),
(5, 'John Smith', 'j@example.com')	

-- Inserting sample orders
INSERT INTO orders4 (order_id, customer_id, order_date, amount) VALUES
(1, 1, '2024-11-05', 50.00),
(2, 2, '2024-11-10', 75.00),
(5, 4, '2024-12-02', 45.00),
(5, 2, '2024-12-02', 45.00)	,
(3, 4, '2024-12-15', 100.00),
(4, 1, '2024-12-01', 60.00),
(5, 5, '2024-12-02', 45.00);

select * from customers; 

select * from orders4;

/*
Given tables customers (columns: customer_id, 
name, email) and orders (columns: order_id, 
customer_id, order_date, amount), 

Write an SQL query to find customers who 
haven't made any purchases in the last month, 
assuming today's date is April 2, 2024. 
*/

select * from  customers  where customer_id not in( 
select customer_id from orders4 where order_date >= '2024-11-01' and order_date <= '2024-12-01') ;

-----  Your task Find customer who has done purchase this month and also last month


SELECT customer_id 
FROM orders4
WHERE customer_id IN (
    SELECT customer_id
    FROM orders4
    WHERE order_date >= '2024-11-01' AND order_date < '2024-12-01'
)
AND order_date >= '2024-12-01' AND order_date < '2025-01-01';



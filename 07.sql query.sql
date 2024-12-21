
DROP TABLE IF EXISTS employees;

-- Create the employee_salary table
CREATE TABLE employees (
    emp_id INT,
    name VARCHAR(100),
    department VARCHAR(50),
    salary DECIMAL(10, 2)
);

-- Insert all records again to simulate duplicates
INSERT INTO employees(emp_id, name, department, salary) VALUES
(1, 'John Doe', 'Finance', 60000.00),
(2, 'Jane Smith', 'Finance', 65000.00), 
(2, 'Jane Smith', 'Finance', 65000.00),   -- Duplicate
(9, 'Lisa Anderson', 'Sales', 63000.00),
(9, 'Lisa Anderson', 'Sales', 63000.00),  -- Duplicate
(9, 'Lisa Anderson', 'Sales', 63000.00),  -- Duplicate
(10, 'Kevin Martinez', 'Sales', 61000.00);


/*
Question:

How would you identify duplicate entries in
a SQL in given table employees columns are 
emp_id, name, department, salary

*/

select  * from employees;

select emp_id, name , count(1) as total_frequency  from employees  group by emp_id , name having  count(1) > 2;

----- Approach 2 

select * from ( 
select *  , row_number() over(partition by name order by name  desc ) as rn  
from employees ) E where rn >3 ;

-- Identify employee details who is appearing more than twice in the table employees 

select emp_id, name , count(*) as total_frequency  from employees  group by emp_id , name having  count(*) > 2;




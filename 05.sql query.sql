DROP TABLE IF EXISTS Employees;

-- Create the Employee table

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    emp_name VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL(10, 2),
    HireDate DATE
);

-- Insert sample records into the Employee table

INSERT INTO Employees (EmployeeID, emp_name, Department, Salary, HireDate) VALUES
(101, 'John Smith', 'Sales', 60000.00, '2022-01-15'),
(102, 'Jane Doe', 'Marketing', 55000.00, '2022-02-20'),
(103, 'Michael Johnson', 'Finance', 70000.00, '2021-12-10'),
(104, 'Emily Brown', 'Sales', 62000.00, '2022-03-05'),
(106, 'Sam Brown', 'IT', 62000.00, '2022-03-05'),	
(105, 'Chris Wilson', 'Marketing', 58000.00, '2022-01-30');


/*

Write a SQL query to retrieve the 
third highest salary from the Employee table.

*/

select * from Employees;

select  Salary  as thrid_highest_salary from
( 
select * , dense_rank() over(order by Salary desc ) 
as rnk from Employees 
) E where rnk = 3 ;


-- Find the employee details who has highest salary from each department

with cte as ( select *,
row_number() 
over(partition by department order by Salary desc) as rnk
from Employees )

select * from cte where rnk = 1;
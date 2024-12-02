Select * from Employees;

Select max(Salary) from  Employees where Salary <(select max(Salary)from Employees) ;

select * from (select * ,DENSE_RANK() over(partition by Deparname order by Salary desc) As rnk from Employees )  A
where  rnk =2 ;

CREATE TABLE employees1 (
    employee_id int PRIMARY KEY,
    name VARCHAR(100),
    department VARCHAR(50),
    salary DECIMAL(10, 2)
);

INSERT INTO employees1 (employee_id,name, department, salary) VALUES 
(1,'John Doe', 'Engineering', 63000),
(2,'Jane Smith', 'Engineering', 55000),
(3,'Michael Johnson', 'Engineering', 64000),
(4,'Emily Davis', 'Marketing', 58000),
(5, 'Chris Brown', 'Marketing', 56000),
(6,'Emma Wilson', 'Marketing', 59000),
(7,'Alex Lee', 'Sales', 58000),
(8,'Sarah Adams', 'Sales', 58000),
(9,'Ryan Clark', 'Sales', 61000);

--- Write the SQl query find the second highest salary  ---- 

select * from employees1;

select max(salary) from employees1;

select max(salary) from employees1  where salary < (select max(salary) from employees ) ;

------ windows function 

select *  from ( select * , DENSE_RANK() over( order by salary desc) as rnk from employees1) A 
where rnk = 2 ;

select * from ( select * , Rank() over(order by salary desc ) as rnk from employees1 ) A  
where rnk = 2 ;

------- Using CTE  
with cte as 
( select * , RANK() over(order by salary desc) as rnk from employees1)

select * from cte 
where rnk = 3;

--- Get details find the second highest salary of employees from each department 

select * from employees1 ; 

select * from ( select * , Row_Number() over ( partition by department order by salary desc) as rnk from employees1 ) A 
where rnk = 2; 


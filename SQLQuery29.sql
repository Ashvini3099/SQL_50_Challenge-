
select * from emp2

select * from emp2 
where salary >(select avg(salary) from emp2)

--- With cte 

with avg_salary as ( select avg(salary)as avg_sal from emp2
),
Max_salary as (select max(avg_sal) as max_sal from avg_salary
) 

select  * from Max_salary 

---- Case When statement 

select * from emp2

select * , 
case 
when emp_age < 20 then 'kids' 
when emp_age >= 20 and emp_age <= 40 then 'Adults '
else 'old'
end as emp_age_ucket , 
case 
when salary <= 5000  then ' lowest salary ' 
when salary > 5000 and salary <= 10000 then ' medium salary ' 
else ' highest salary ' 
end as salary_bucket 
from emp2 order by emp_age 


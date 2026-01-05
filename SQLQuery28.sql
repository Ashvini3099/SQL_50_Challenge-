
----- How to calculate median 

select *  from employee

with cte as ( 
select * , ROW_NUMBER() over (order by emp_age asc ) as rn_asc , 
row_number() over(order by emp_age desc ) as rn_desc from employee 
where emp_id < 10 ) 
select avg(emp_age) from cte 
where abs(rn_asc - rn_desc) < = 1 

--- median using percentile _count 

select * , PERCENTILE_CONT(0.5) within group (order by emp_age ) over(partition by dept_id ) as median 
from employee 
where emp_id <10 
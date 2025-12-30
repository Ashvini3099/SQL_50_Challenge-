create table employee6(
    emp_id int,
    emp_name varchar(20),
    dept_id int,
    salary int
);
insert into employee6 values(1,'Ankit',100,10000);
insert into employee6 values(2,'Mohit',100,15000);
insert into employee6 values(3,'Vikas',100,10000);
insert into employee6 values(4,'Rohit',100,5000);
insert into employee6 values(5,'Mudit',200,12000);
insert into employee6 values(6,'Agam',200,12000);
insert into employee6 values(7,'Sanjay',200,9000);
insert into employee6 values(8,'Ashish',200,5000);

select * from employee6 

--- Rank() , Dense_Rank() , Row_number() 

select * , rank() over(partition by dept_id order by salary desc ) as rnk 
, DENSE_RANK() over(partition by dept_id order by salary desc ) as dense_rnk 
, ROW_NUMBER() over( partition by dept_id order by salary desc ) as rn  from employee6

select * from 
(select * , 
rank() over(partition by dept_id order by salary desc) as rnk from employee6 ) a 
where rnk = 1 


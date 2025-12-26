
create table emp2(
emp_id int,
emp_name varchar(20),
department_id int,
salary int,
manager_id int,
emp_age int);

insert into emp2
values
(1, 'Ankit', 100,10000, 4, 39);
insert into emp2
values (2, 'Mohit', 100, 15000, 5, 48);
insert into emp2
values (3, 'Vikas', 100, 10000,4,37);
insert into emp2
values (4, 'Rohit', 100, 5000, 2, 16);
insert into emp2
values (5, 'Mudit', 200, 12000, 6,55);
insert into emp2
values (6, 'Agam', 200, 12000,2, 14);
insert into emp2
values (7, 'Sanjay', 200, 9000, 2,13);
insert into emp2
values (8, 'Ashish', 200,5000,2,12);
insert into emp2
values (9, 'Mukesh',300,6000,6,51);
insert into emp2
values (10, 'Rakesh',300,7000,6,50);

create table department(
 
 dept_id int,
 dept_name varchar(10)
 );
 
insert into department values(100,'Analytics');
insert into department values(300,'IT');

-- employee who are not present in department table 
select * from emp2 where department_id not in (select dept_id from department);

select emp2. * , department.dept_id, dept_name from emp2 left join 
department on emp2.department_id = department.dept_id  
where dept_name is null

---- second highest salary from each department 
select emp2.* , rank() over(partition by department_id order by salary desc ) as rn1 from emp2;

select * from  (select emp2.* , dense_rank() over(partition by department_id order by salary desc ) as rn2 from emp2) a  
where rn2 = 2 ;


create table orders1(
 customer_name char(10),
 order_date date,
 order_amount int,
 customer_gender char(6)
 );
 
 insert into orders1 values('Shilpa','2020-01-01',10000,'Male');
 insert into orders1 values('Rahul','2020-01-02',12000,'Female');
 insert into orders1 values('Shilpa','2020-01-02',12000,'Male');
 insert into orders1 values('Rohit','2020-01-03',15000,'Female');
 insert into orders1 values('Shilpa','2020-01-03',14000,'Male');

 --- find all transaction done by shilpa 
 select * from orders1 where customer_name = 'Shilpa';

 --- update query to swap gender 
 update orders1 set customer_gender =  case when customer_gender = 'Male' then 'Female' 
          when customer_gender = 'Female' then 'Male' end 
 select * from orders1 

 --- find the employees whos salary more than their managers salary 
 select e.emp_id ,e.emp_name ,m.emp_name as manager_name , e.salary , m.salary as manager_salary from emp2 e
 inner join emp2 as m on e.manager_id= m.emp_id  where e.salary > m.salary 
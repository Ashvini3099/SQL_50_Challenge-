
/* Master SQL Update Statement */

create table dept1(
dep_id int,
dep_name varchar(20));

insert into dept1
values(100 , 'Analyst'), (200, 'IT'),(300, 'HR'),(400 , 'Text Analytics')

create table emp3(
emp_id int,
emp_name varchar(20),
department_id int,
salary int,
manager_id int,
emp_age int);

insert into emp3
values (1, 'Ankit', 100,10000, 4, 39),
       (2, 'Mohit', 100, 15000, 5, 48),
       (3, 'Vikas', 100, 10000,4,37),
	   (4, 'Rohit', 100, 5000, 2, 16),
       (5, 'Mudit', 200, 12000, 6,55),
       (6, 'Agam', 200, 12000,2, 14),
       (7, 'Sanjay', 200, 9000, 2,13),
       (8, 'Ashish', 200,5000,2,12),
       (9, 'Mukesh',300,6000,6,51),
       (10, 'Rakesh',300,7000,6,50),
       (11, 'Akhil',500,3000,1,31);

select * from dept1 
select * from emp3


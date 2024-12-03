drop table Employees;

Create Table Employees2 (Empid int  Not null ,Empname varchar(15), DepartmentId int ,
Deparname varchar (15),Salary int, Gender varchar(5));

insert into Employees (Empid,Empname,DepartmentId,Deparname,Salary,Gender) 
values( 101,'ashvini',2,'HR',20000,'F'),(102,'Madhu',3,'IT',30000,'M'),
(103,'mohini',4,'Data analyst',50000,'F')
, (104,'rupal',5,'Datascience',60000,'M'), (105,'Nilesh',6,'Tester',40000,'M')
, (106, 'Adity',7,'Project Manger',70000,'M');

Select * from  Employees;

select    sum(Salary) , Gender 
from Employees  group by  Gender  having sum(Salary)>50000;

select * from Employees;

select * from Employees where Empname like '%h';

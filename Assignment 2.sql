select * from orders 

--- Assignment 2 
---1.write a query to get number of business days between order_date and ship_date (exclude weekends). 
--Assume that all order date and ship date are on weekdays only
select order_id ,order_date , ship_date,
DATEDIFF(day,order_date,ship_date)-2 *DATEDIFF(week,order_date,ship_date)
as  business_days from orders 

---orders table can have multiple rows for a particular order_id when customers buys more than 1 product in an order.
--write a query to find order ids where there is only 1 product bought by the customer.

SELECT order_id
FROM orders
GROUP BY order_id
HAVING COUNT(2) = 1;

--3.write a query to get total profit, first order date and latest order date for each category
select sum(profit), min(order_date) as first_order_date , max(order_id) as latest_order_date , category
from orders group by category

select sum(profit) as total_profit ,category , order_date from orders 
group by category, order_date  order by order_date desc;

--- 4.write a query to find sub-categories where average profit is more than the half of the max profit in that sub-category
select sub_category,avg(profit),max(profit) as max_profit from orders 
group by sub_category
having  avg(profit)>(max(profit)/ 2)

select max(profit) /2 from orders group by sub_category

select avg(profit), sub_category from orders group by sub_category

---create the exams table with below script;
create table exams (student_id int, subject varchar(20), marks int);

insert into exams values (1,'Chemistry',91),(1,'Physics',91),(1,'Maths',92)
,(2,'Chemistry',80),(2,'Physics',90)
,(3,'Chemistry',80),(3,'Maths',80)
,(4,'Chemistry',71),(4,'Physics',54)
,(5,'Chemistry',79);

----write a query to find students who have got same marks in Physics and Chemistry.
select* from exams

select marks, student_id
from exams 
where subject in ('physics','chemistry')
group by subject,marks
having count(marks) = 2
--- using join 
select e1.student_id,e1.subject as physics_sub,e1.marks as physics_mark,
e2.subject as chemistry_sub,e2.marks as chemistry_mark
from exams e1  join exams e2 on e1.student_id=e2.student_id
where e1.subject = 'Physics' and e2.subject = 'Chemistry';

---6.---write a query to find total number of products in each category.
select count(distinct product_id) as total_product, category from orders 
group by category

--7.write a query to find top 5 sub categories in west region by total quantity sold
select top 5 sub_category,sum(quantity)as total_quantity  from orders 
where region='west'
group by sub_category
order by total_quantity desc

---8 write a query to find total sales for each region and ship mode combination for orders in year 2020
select region, ship_mode,sum(sales) as total_sales,order_date from orders 
where DATEPART(year,order_date)=2020
group by region,ship_mode,order_date


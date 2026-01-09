
use [Ecommerce_database]
select * from [dbo].[ecommerce_data]

select customer_id from ecommerce_data where customer_id is null 

use hospital 
select * from [dbo].patients 
select * from services_weekly

select * from patients order by patient_id offset 2 rows fetch next  2 rows only 

select * from patients order by patient_id offset 3 rows fetch next  1 rows only 

select ascii('customer')

select CHARINDEX('om','customer')

select replace('sql','s','T')

select RIGHT('sqlserver',3)

select left('sqlserver',3)

select concat('ashvini',' ','shinde')

select 'ashvini'+  'shinde'

select len('ashvin')

select lower('ASHVINI')
SELECT UPPER('ashvini')

select replicate('ashvini',5)

select reverse('ashvini')

select abs(-12.5)

select avg(3)

EXEC sp_spaceused 'ecommerce_data';

select * from Ashu30

delete Ashu30 where Ename= 'Ashvini'
select * from Emp 

drop Emp
select * from emp3

select * from hotel_bookings

SELECT *
FROM hotel_bookings
WHERE YEAR(booking_date) = 2022;

select * from hotel_bookings  where datepart (year, booking_date) = 2022;
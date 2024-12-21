create table orders2(
  	category varchar(20),
	product varchar(20),
	user_id int , 
  	spend int,
  	transaction_date DATE
);

Insert into orders2 values
('appliance','refrigerator',165,246.00,'2021/12/26'),
('appliance','refrigerator',123,299.99,'2022/03/02'),
('appliance','washingmachine',123,219.80,'2022/03/02'),
('electronics','vacuum',178,152.00,'2022/04/05'),
('electronics','wirelessheadset',156,	249.90,'2022/07/08'),
('electronics','TV',145,189.00,'2022/07/15'),
('Television','TV',165,129.00,'2022/07/15'),
('Television','TV',163,129.00,'2022/07/15'),
('Television','TV',141,129.00,'2022/07/15'),
('toys','Ben10',145,189.00,'2022/07/15'),
('toys','Ben10',145,189.00,'2022/07/15'),
('toys','yoyo',165,129.00,'2022/07/15'),
('toys','yoyo',163,129.00,'2022/07/15'),
('toys','yoyo',141,129.00,'2022/07/15'),
('toys','yoyo',145,189.00,'2022/07/15'),
('electronics','vacuum',145,189.00,'2022/07/15');


/*
Find the top 2 products in the top 2 categories based on spend amount?
*/

select * from orders2;

with categries as (

select   category ,Total_spend from (
select  category,  sum(spend) as Total_spend  , dense_rank() over ( order by sum(spend) desc) as drn 
from orders2  group by category 
) O  where drn <= 2 
)
select  category , product , total_spend_product  from
( 
select O.category , O.product , sum(O.spend) as total_spend_product , 
dense_rank() over( partition by O.category order by sum(O.spend) desc) as pdrn from orders2 as O join  categries as C 
on O.category = C.category group by O.category , O.product 
) subquery where pdrn <= 2;
    
   

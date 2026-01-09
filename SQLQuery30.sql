
use Ecommerce_database
SELECT * 
FROM [dbo].[ecommerce_data];

select top 5 * from  [dbo].[ecommerce_data];

select order_id , order_date ,sales_per_order from [dbo].ecommerce_data;

select order_id , order_date ,sales_per_order from [dbo].ecommerce_data order by order_date desc 

select*,profit_per_order /sales_per_order as profit_ratio from [dbo].ecommerce_data order by profit_ratio desc ;

select * from [dbo].ecommerce_data where customer_region = 'Central'
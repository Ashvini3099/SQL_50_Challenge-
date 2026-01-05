
--- how to delete duplicates from table in production enviorment 
CREATE TABLE Transactions (
    order_id INT,
    order_date DATE,
    product_name VARCHAR(10),
    order_amount INT,
    create_time DATETIME
);


INSERT INTO Transactions (order_id, order_date, product_name, order_amount, create_time)
VALUES
    (1, '2022-03-03', 'P1', 150, '2022-03-03 15:34:51.067'),
    (1, '2022-03-03', 'P1', 150, '2022-03-03 15:35:12.400'),
    (1, '2022-03-03', 'P2', 200, '2022-03-03 15:35:49.610'),
    (2, '2022-03-03', 'P2', 200, '2022-03-03 15:36:45.933'),
    (2, '2022-03-03', 'P2', 200, '2022-03-03 15:38:09.810'),
    (3, '2022-03-03', 'P3', 300, '2022-03-03 15:38:28.523');
	
	select * from  Transactions;

	--take backup of original table 
	select * into transaction_backup from Transactions;

	select * from transaction_backup

--- delete duplicates from original table with a unique timrstamp column 
delete from Transactions where (order_id, create_time) in (select order_id , min(create_time) from Transactions
group by order_id having COUNT(1)>1 )

DELETE t
FROM Transactions t
JOIN (
    SELECT order_id, MIN(create_time) AS min_time
    FROM Transactions
    GROUP BY order_id
    HAVING COUNT(*) > 1
) x
ON t.order_id = x.order_id
AND t.create_time > x.min_time;

select * from Transactions

--- Truncate original table and insert unique records 

insert into Transactions 
select order_id , order_date , product_name , order_amount, create_time from 
(select * , row_number() over (partition by order_id order by create_time desc) as rn from transaction_backup) a 
where rn = 1 
select * from Transactions update Transactions set create_time = getdate() 
-- Creating the hotel_bookings table
CREATE TABLE hotel_bookings (
    booking_id int PRIMARY KEY,
    booking_date DATE,
    hotel_name VARCHAR(100),
    total_guests INT,
    total_nights INT,
    total_price DECIMAL(10, 2)
);


-- Inserting sample data for hotel bookings for 2023 and 2022
INSERT INTO hotel_bookings ( booking_id, booking_date, hotel_name, total_guests, total_nights, total_price) VALUES
    (1,'2023-01-05', 'Hotel A', 2, 3, 300.00),
    (2,'2023-02-10', 'Hotel B', 3, 5, 600.00),
    (3,'2023-03-15', 'Hotel A', 4, 2, 400.00),
    (4,'2023-04-20', 'Hotel B', 2, 4, 500.00),
    (5,'2023-05-25', 'Hotel A', 3, 3, 450.00),
    (6,'2023-06-30', 'Hotel B', 5, 2, 350.00),
    (7,'2023-07-05', 'Hotel A', 2, 5, 550.00),
    (8,'2023-08-10', 'Hotel B', 3, 3, 450.00),
    (9,'2023-09-15', 'Hotel A', 4, 4, 500.00),
    (10,'2023-10-20', 'Hotel B', 2, 3, 300.00),
    (11,'2023-11-25', 'Hotel A', 3, 2, 350.00),
    (12,'2023-12-30', 'Hotel B', 5, 4, 600.00),
    (13,'2022-01-05', 'Hotel A', 2, 3, 300.00),
    (14,'2022-02-10', 'Hotel B', 3, 5, 600.00),
    (15,'2022-03-15', 'Hotel A', 4, 2, 400.00),
    (16,'2022-04-20', 'Hotel B', 2, 4, 500.00),
    (17,'2022-05-25', 'Hotel A', 3, 3, 450.00),
    (18,'2022-06-30', 'Hotel B', 5, 2, 350.00),
    (19,'2022-07-05', 'Hotel A', 2, 5, 550.00),
    (20,'2022-08-10', 'Hotel B', 3, 3, 450.00),
    (21,'2022-09-15', 'Hotel A', 4, 4, 500.00),
    (22,'2022-10-20', 'Hotel B', 2, 3, 300.00),
    (23,'2022-11-25', 'Hotel A', 3, 2, 350.00),
    (24,'2022-12-30', 'Hotel B', 5, 4, 600.00);

	/*
-- Write a SQL query to find out each hotal best 
performing months based on revenue 
*/

SELECT 
    *
FROM (    
    SELECT 
        year,
        month,
        hotel_name,
        revenue,
        RANK() OVER(PARTITION BY year, hotel_name ORDER BY revenue DESC) as rn
    FROM 
        (
        SELECT
            Format(YEAR FROM booking_date) as year,
            Format(MONTH FROM booking_date) as month,
            hotel_name,
            SUM(total_price) as revenue
        FROM hotel_bookings
        GROUP BY 1, 2, 3
        ORDER BY year ASC, revenue DESC
    ) as monthly_revenue
) as subquery
WHERE rn = 1
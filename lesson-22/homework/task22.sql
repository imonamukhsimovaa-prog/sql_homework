CREATE TABLE sales_data (
    sale_id INT PRIMARY KEY,
    customer_id INT,
    customer_name VARCHAR(100),
    product_category VARCHAR(50),
    product_name VARCHAR(100),
    quantity_sold INT,
    unit_price DECIMAL(10,2),
    total_amount DECIMAL(10,2),
    order_date DATE,
    region VARCHAR(50)
);

INSERT INTO sales_data VALUES
    (1, 101, 'Alice', 'Electronics', 'Laptop', 1, 1200.00, 1200.00, '2024-01-01', 'North'),
    (2, 102, 'Bob', 'Electronics', 'Phone', 2, 600.00, 1200.00, '2024-01-02', 'South'),
    (3, 103, 'Charlie', 'Clothing', 'T-Shirt', 5, 20.00, 100.00, '2024-01-03', 'East'),
    (4, 104, 'David', 'Furniture', 'Table', 1, 250.00, 250.00, '2024-01-04', 'West'),
    (5, 105, 'Eve', 'Electronics', 'Tablet', 1, 300.00, 300.00, '2024-01-05', 'North'),
    (6, 106, 'Frank', 'Clothing', 'Jacket', 2, 80.00, 160.00, '2024-01-06', 'South'),
    (7, 107, 'Grace', 'Electronics', 'Headphones', 3, 50.00, 150.00, '2024-01-07', 'East'),
    (8, 108, 'Hank', 'Furniture', 'Chair', 4, 75.00, 300.00, '2024-01-08', 'West'),
    (9, 109, 'Ivy', 'Clothing', 'Jeans', 1, 40.00, 40.00, '2024-01-09', 'North'),
    (10, 110, 'Jack', 'Electronics', 'Laptop', 2, 1200.00, 2400.00, '2024-01-10', 'South'),
    (11, 101, 'Alice', 'Electronics', 'Phone', 1, 600.00, 600.00, '2024-01-11', 'North'),
    (12, 102, 'Bob', 'Furniture', 'Sofa', 1, 500.00, 500.00, '2024-01-12', 'South'),
    (13, 103, 'Charlie', 'Electronics', 'Camera', 1, 400.00, 400.00, '2024-01-13', 'East'),
    (14, 104, 'David', 'Clothing', 'Sweater', 2, 60.00, 120.00, '2024-01-14', 'West'),
    (15, 105, 'Eve', 'Furniture', 'Bed', 1, 800.00, 800.00, '2024-01-15', 'North'),
    (16, 106, 'Frank', 'Electronics', 'Monitor', 1, 200.00, 200.00, '2024-01-16', 'South'),
    (17, 107, 'Grace', 'Clothing', 'Scarf', 3, 25.00, 75.00, '2024-01-17', 'East'),
    (18, 108, 'Hank', 'Furniture', 'Desk', 1, 350.00, 350.00, '2024-01-18', 'West'),
    (19, 109, 'Ivy', 'Electronics', 'Speaker', 2, 100.00, 200.00, '2024-01-19', 'North'),
    (20, 110, 'Jack', 'Clothing', 'Shoes', 1, 90.00, 90.00, '2024-01-20', 'South'),
    (21, 111, 'Kevin', 'Electronics', 'Mouse', 3, 25.00, 75.00, '2024-01-21', 'East'),
    (22, 112, 'Laura', 'Furniture', 'Couch', 1, 700.00, 700.00, '2024-01-22', 'West'),
    (23, 113, 'Mike', 'Clothing', 'Hat', 4, 15.00, 60.00, '2024-01-23', 'North'),
    (24, 114, 'Nancy', 'Electronics', 'Smartwatch', 1, 250.00, 250.00, '2024-01-24', 'South'),
    (25, 115, 'Oscar', 'Furniture', 'Wardrobe', 1, 1000.00, 1000.00, '2024-01-25', 'East')




	CREATE TABLE OneColumn (
    Value SMALLINT
);
INSERT INTO OneColumn VALUES (10), (20), (30), (40), (100);




CREATE TABLE MyData (
    Id INT, Grp INT, Val1 INT, Val2 INT
);
INSERT INTO MyData VALUES
(1,1,30,29), (2,1,19,0), (3,1,11,45), (4,2,0,0), (5,2,100,17);



CREATE TABLE TheSumPuzzle (
    ID INT, Cost INT, Quantity INT
);
INSERT INTO TheSumPuzzle VALUES
(1234,12,164), (1234,13,164), (1235,100,130), (1235,100,135), (1236,12,136);


CREATE TABLE Seats 
( 
SeatNumber INTEGER 
); 

INSERT INTO Seats VALUES 
(7),(13),(14),(15),(27),(28),(29),(30), 
(31),(32),(33),(34),(35),(52),(53),(54); 









select
    sale_id,
    customer_id,
    total_amount,
    sum(total_amount) over (partition by customer_id order by order_date) as running_total
from sales_data


select
    product_category,
    count(*) as order_count
from sales_data
group by product_category



select
    product_category,
    max(total_amount) as max_amount
from sales_data
group by product_category


select
    product_category,
    min(unit_price) as min_price
from sales_data
group by product_category



select
    sale_id,
    order_date,
    total_amount,
    avg(total_amount) over (order by order_date rows between 1 preceding and 1 following) as moving_avg
from sales_data




select
    region,
    sum(total_amount) as total_sales
from sales_data
group by region


select
    sale_id,
    customer_id,
    total_amount,
    total_amount - lag(total_amount) over (partition by customer_id order by order_date) as diff_prev
from sales_data



with cte as (
    select *,
    dense_rank() over (partition by product_category order by unit_price desc) as rn
    from sales_data
)
select *
from cte
where rn <= 3



select
    region,
    order_date,
    total_amount,
    sum(total_amount) over (partition by region order by order_date) as cumulative_sales
from sales_data



select
    value,
    sum(value) over (order by value) as sum_of_previous
from onecolumn


select customer_id, customer_name
from sales_data
group by customer_id, customer_name
having count(distinct product_category) > 1



select
    customer_id,
    customer_name,
    region,
    sum(total_amount) as total_spent,
    dense_rank() over (partition by region order by sum(total_amount) desc) as region_rank
from sales_data
group by customer_id, customer_name, region



select
    customer_id,
    order_date,
    total_amount,
    sum(total_amount) over (partition by customer_id order by order_date) as cumulative_sales
from sales_data


select
    sale_id,
    customer_id,
    total_amount,
    lag(total_amount) over (partition by customer_id order by order_date) as prev_amount
from sales_data
where total_amount > lag(total_amount) over (partition by customer_id order by order_date)



select *
from sales_data
where unit_price > (select avg(unit_price) from sales_data)



select
    id,
    sum(cost) as cost,
    sum(quantity) as quantity
from thesumpuzzle
group by id



select
    lag(seatnumber + 1) over (order by seatnumber) as gap_start,
    seatnumber - 1 as gap_end
from seats
where seatnumber - lag(seatnumber) over (order by seatnumber) > 1
















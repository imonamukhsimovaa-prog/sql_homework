CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2)
);

CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    ProductID INT,
    Quantity INT,
    SaleDate DATE,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO Products (ProductID, ProductName, Category, Price)
VALUES
(1, 'Samsung Galaxy S23', 'Electronics', 899.99),
(2, 'Apple iPhone 14', 'Electronics', 999.99),
(3, 'Sony WH-1000XM5 Headphones', 'Electronics', 349.99),
(4, 'Dell XPS 13 Laptop', 'Electronics', 1249.99),
(5, 'Organic Eggs (12 pack)', 'Groceries', 3.49),
(6, 'Whole Milk (1 gallon)', 'Groceries', 2.99),
(7, 'Alpen Cereal (500g)', 'Groceries', 4.75),
(8, 'Extra Virgin Olive Oil (1L)', 'Groceries', 8.99),
(9, 'Mens Cotton T-Shirt', 'Clothing', 12.99),
(10, 'Womens Jeans - Blue', 'Clothing', 39.99),
(11, 'Unisex Hoodie - Grey', 'Clothing', 29.99),
(12, 'Running Shoes - Black', 'Clothing', 59.95),
(13, 'Ceramic Dinner Plate Set (6 pcs)', 'Home & Kitchen', 24.99),
(14, 'Electric Kettle - 1.7L', 'Home & Kitchen', 34.90),
(15, 'Non-stick Frying Pan - 28cm', 'Home & Kitchen', 18.50),
(16, 'Atomic Habits - James Clear', 'Books', 15.20),
(17, 'Deep Work - Cal Newport', 'Books', 14.35),
(18, 'Rich Dad Poor Dad - Robert Kiyosaki', 'Books', 11.99),
(19, 'LEGO City Police Set', 'Toys', 49.99),
(20, 'Rubiks Cube 3x3', 'Toys', 7.99);

INSERT INTO Sales (SaleID, ProductID, Quantity, SaleDate)
VALUES
(1, 1, 2, '2025-04-01'),
(2, 1, 1, '2025-04-05'),
(3, 2, 1, '2025-04-10'),
(4, 2, 2, '2025-04-15'),
(5, 3, 3, '2025-04-18'),
(6, 3, 1, '2025-04-20'),
(7, 4, 2, '2025-04-21'),
(8, 5, 10, '2025-04-22'),
(9, 6, 5, '2025-04-01'),
(10, 6, 3, '2025-04-11'),
(11, 10, 2, '2025-04-08'),
(12, 12, 1, '2025-04-12'),
(13, 12, 3, '2025-04-14'),
(14, 19, 2, '2025-04-05'),
(15, 20, 4, '2025-04-19'),
(16, 1, 1, '2025-03-15'),
(17, 2, 1, '2025-03-10'),
(18, 5, 5, '2025-02-20'),
(19, 6, 6, '2025-01-18'),
(20, 10, 1, '2024-12-25'),
(21, 1, 1, '2024-04-20');





CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    city VARCHAR(50)
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT FOREIGN KEY REFERENCES Customers(customer_id),
    order_date DATE,
    amount DECIMAL(10,2)
);

-- Customers
INSERT INTO Customers (customer_id, name, city)
VALUES
(1, 'Alice Smith', 'New York'),
(2, 'Bob Jones', 'Chicago'),
(3, 'Carol White', 'Los Angeles');

-- Orders
INSERT INTO Orders (order_id, customer_id, order_date, amount)
VALUES
(101, 1, '2024-12-10', 120.00),
(102, 1, '2024-12-20', 200.00),
(103, 1, '2024-12-30', 220.00),
(104, 2, '2025-01-12', 120.00),
(105, 2, '2025-01-20', 180.00);




DROP TABLE IF EXISTS Gaps;

CREATE TABLE Gaps
(
RowNumber   INTEGER PRIMARY KEY,
TestCase    VARCHAR(100) NULL
);

INSERT INTO Gaps (RowNumber, TestCase) VALUES
(1,'Alpha'),(2,NULL),(3,NULL),(4,NULL),
(5,'Bravo'),(6,NULL),(7,NULL),(8,NULL),(9,NULL),(10,'Charlie'), (11, NULL), (12, NULL)





create table #monthlysales (
    productid int,
    totalquantity int,
    totalrevenue decimal(10,2)
)


insert into #monthlysales
select 
    p.productid,
    sum(s.quantity) as totalquantity,
    sum(s.quantity * p.price) as totalrevenue
from products p
join sales s on p.productid = s.productid
where month(s.saledate) = month(getdate())
  and year(s.saledate) = year(getdate())
group by p.productid;


create view vw_productsalessummary as
select 
    p.productid,
    p.productname,
    p.category,
    sum(s.quantity) as totalquantitysold
from products p
left join sales s on p.productid = s.productid
group by p.productid, p.productname, p.category




create function fn_gettotalrevenueforproduct (@productid int)
returns decimal(10,2)
as
begin
    declare @total decimal(10,2);

    select @total = sum(s.quantity * p.price)
    from sales s
    join products p on s.productid = p.productid
    where p.productid = @productid;

    return isnull(@total, 0);
end



create function fn_getsalesbycategory (@category varchar(50))
returns table
as
return
(
    select 
        p.productname,
        sum(s.quantity) as totalquantity,
        sum(s.quantity * p.price) as totalrevenue
    from products p
    join sales s on p.productid = s.productid
    where p.category = @category
    group by p.productname
)






create function fn_getnumbersbetween (@start int, @end int)
returns @numbers table (number int)
as
begin
    declare @i int = @start;
    while @i <= @end
    begin
        insert into @numbers values (@i);
        set @i = @i + 1;
    end
    return;
end



create function getnthhighestsalary (@n int)
returns int
as
begin
    declare @result int;

    select @result = (
        select distinct salary
        from employee
        order by salary desc
        offset (@n - 1) rows
        fetch next 1 rows only
    );

    return @result;
end



select top 1 id, count(*) as num
from (
    select requester_id as id from requestaccepted
    union all
    select accepter_id from requestaccepted
) all_friends
group by id
order by num desc



create view vw_customerordersummary as
select 
    c.customer_id,
    c.name,
    count(o.order_id) as total_orders,
    sum(o.amount) as total_amount,
    max(o.order_date) as last_order_date
from customers c
left join orders o on c.customer_id = o.customer_id
group by c.customer_id, c.name;















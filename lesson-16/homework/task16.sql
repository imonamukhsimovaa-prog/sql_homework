CREATE TABLE Numbers1(Number INT)

INSERT INTO Numbers1 VALUES (5),(9),(8),(6),(7)

CREATE TABLE FindSameCharacters
(
     Id INT
    ,Vals VARCHAR(10)
)
 
INSERT INTO FindSameCharacters VALUES
(1,'aa'),
(2,'cccc'),
(3,'abc'),
(4,'aabc'),
(5,NULL),
(6,'a'),
(7,'zzz'),
(8,'abc')



CREATE TABLE RemoveDuplicateIntsFromNames
(
      PawanName INT
    , Pawan_slug_name VARCHAR(1000)
)
 
 
INSERT INTO RemoveDuplicateIntsFromNames VALUES
(1,  'PawanA-111'  ),
(2, 'PawanB-123'   ),
(3, 'PawanB-32'    ),
(4, 'PawanC-4444' ),
(5, 'PawanD-3'  )





CREATE TABLE Example
(
Id       INTEGER IDENTITY(1,1) PRIMARY KEY,
String VARCHAR(30) NOT NULL
);


INSERT INTO Example VALUES('123456789'),('abcdefghi');


CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    DepartmentID INT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Salary DECIMAL(10, 2)
);

INSERT INTO Employees (EmployeeID, DepartmentID, FirstName, LastName, Salary) VALUES
(1, 1, 'John', 'Doe', 60000.00),
(2, 1, 'Jane', 'Smith', 65000.00),
(3, 2, 'James', 'Brown', 70000.00),
(4, 3, 'Mary', 'Johnson', 75000.00),
(5, 4, 'Linda', 'Williams', 80000.00),
(6, 2, 'Michael', 'Jones', 85000.00),
(7, 1, 'Robert', 'Miller', 55000.00),
(8, 3, 'Patricia', 'Davis', 72000.00),
(9, 4, 'Jennifer', 'García', 77000.00),
(10, 1, 'William', 'Martínez', 69000.00);

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

INSERT INTO Departments (DepartmentID, DepartmentName) VALUES
(1, 'HR'),
(2, 'Sales'),
(3, 'Marketing'),
(4, 'Finance'),
(5, 'IT'),
(6, 'Operations'),
(7, 'Customer Service'),
(8, 'R&D'),
(9, 'Legal'),
(10, 'Logistics');

CREATE TABLE Sales (
    SalesID INT PRIMARY KEY,
    EmployeeID INT,
    ProductID INT,
    SalesAmount DECIMAL(10, 2),
    SaleDate DATE
);
INSERT INTO Sales (SalesID, EmployeeID, ProductID, SalesAmount, SaleDate) VALUES
-- January 2025
(1, 1, 1, 1550.00, '2025-01-02'),
(2, 2, 2, 2050.00, '2025-01-04'),
(3, 3, 3, 1250.00, '2025-01-06'),
(4, 4, 4, 1850.00, '2025-01-08'),
(5, 5, 5, 2250.00, '2025-01-10'),
(6, 6, 6, 1450.00, '2025-01-12'),
(7, 7, 1, 2550.00, '2025-01-14'),
(8, 8, 2, 1750.00, '2025-01-16'),
(9, 9, 3, 1650.00, '2025-01-18'),
(10, 10, 4, 1950.00, '2025-01-20'),
(11, 1, 5, 2150.00, '2025-02-01'),
(12, 2, 6, 1350.00, '2025-02-03'),
(13, 3, 1, 2050.00, '2025-02-05'),
(14, 4, 2, 1850.00, '2025-02-07'),
(15, 5, 3, 1550.00, '2025-02-09'),
(16, 6, 4, 2250.00, '2025-02-11'),
(17, 7, 5, 1750.00, '2025-02-13'),
(18, 8, 6, 1650.00, '2025-02-15'),
(19, 9, 1, 2550.00, '2025-02-17'),
(20, 10, 2, 1850.00, '2025-02-19'),
(21, 1, 3, 1450.00, '2025-03-02'),
(22, 2, 4, 1950.00, '2025-03-05'),
(23, 3, 5, 2150.00, '2025-03-08'),
(24, 4, 6, 1700.00, '2025-03-11'),
(25, 5, 1, 1600.00, '2025-03-14'),
(26, 6, 2, 2050.00, '2025-03-17'),
(27, 7, 3, 2250.00, '2025-03-20'),
(28, 8, 4, 1350.00, '2025-03-23'),
(29, 9, 5, 2550.00, '2025-03-26'),
(30, 10, 6, 1850.00, '2025-03-29'),
(31, 1, 1, 2150.00, '2025-04-02'),
(32, 2, 2, 1750.00, '2025-04-05'),
(33, 3, 3, 1650.00, '2025-04-08'),
(34, 4, 4, 1950.00, '2025-04-11'),
(35, 5, 5, 2050.00, '2025-04-14'),
(36, 6, 6, 2250.00, '2025-04-17'),
(37, 7, 1, 2350.00, '2025-04-20'),
(38, 8, 2, 1800.00, '2025-04-23'),
(39, 9, 3, 1700.00, '2025-04-26'),
(40, 10, 4, 2000.00, '2025-04-29'),
(41, 1, 5, 2200.00, '2025-05-03'),
(42, 2, 6, 1650.00, '2025-05-07'),
(43, 3, 1, 2250.00, '2025-05-11'),
(44, 4, 2, 1800.00, '2025-05-15'),
(45, 5, 3, 1900.00, '2025-05-19'),
(46, 6, 4, 2000.00, '2025-05-23'),
(47, 7, 5, 2400.00, '2025-05-27'),
(48, 8, 6, 2450.00, '2025-05-31'),
(49, 9, 1, 2600.00, '2025-06-04'),
(50, 10, 2, 2050.00, '2025-06-08'),
(51, 1, 3, 1550.00, '2025-06-12'),
(52, 2, 4, 1850.00, '2025-06-16'),
(53, 3, 5, 1950.00, '2025-06-20'),
(54, 4, 6, 1900.00, '2025-06-24'),
(55, 5, 1, 2000.00, '2025-07-01'),
(56, 6, 2, 2100.00, '2025-07-05'),
(57, 7, 3, 2200.00, '2025-07-09'),
(58, 8, 4, 2300.00, '2025-07-13'),
(59, 9, 5, 2350.00, '2025-07-17'),
(60, 10, 6, 2450.00, '2025-08-01');

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    CategoryID INT,
    ProductName VARCHAR(100),
    Price DECIMAL(10, 2)
);

INSERT INTO Products (ProductID, CategoryID, ProductName, Price) VALUES
(1, 1, 'Laptop', 1000.00),
(2, 1, 'Smartphone', 800.00),
(3, 2, 'Tablet', 500.00),
(4, 2, 'Monitor', 300.00),
(5, 3, 'Headphones', 150.00),
(6, 3, 'Mouse', 25.00),
(7, 4, 'Keyboard', 50.00),
(8, 4, 'Speaker', 200.00),
(9, 5, 'Smartwatch', 250.00),
(10, 5, 'Camera', 700.00);



with numbers as (
    select 1 as num
    union all
    select num + 1
    from numbers
    where num < 1000
)
select num
from numbers
option (maxrecursion 1000)

select e.firstname, e.lastname, s.total_sales
from employees e
join (
    select employeeid, sum(salesamount) as total_sales
    from sales
    group by employeeid
) s on e.employeeid = s.employeeid


with avg_salary as (
    select avg(salary) as avg_sal from employees
)
select e.firstname, e.lastname, e.salary
from employees e, avg_salary
where e.salary > avg_salary.avg_sal


select p.productname, t.max_sale
from products p
join (
    select productid, max(salesamount) as max_sale
    from sales
    group by productid
) t on p.productid = t.productid



with doubles as (
    select 1 as num
    union all
    select num * 2
    from doubles
    where num * 2 < 1000000
)
select num from doubles


with sales_count as (
    select employeeid, count(*) as total_sales
    from sales
    group by employeeid
)
select e.firstname, e.lastname
from employees e
join sales_count s on e.employeeid = s.employeeid
where s.total_sales > 5



with product_sales as (
    select productid, sum(salesamount) as total_sales
    from sales
    group by productid
)
select p.productname, total_sales
from products p
join product_sales ps on p.productid = ps.productid
where ps.total_sales > 500




with avg_sal as (
    select avg(salary) as avg_salary from employees
)
select firstname, lastname, salary
from employees, avg_sal
where salary > avg_salary




select top 5 e.firstname, e.lastname, t.total_orders
from employees e
join (
    select employeeid, count(*) as total_orders
    from sales
    group by employeeid
) t on e.employeeid = t.employeeid
order by t.total_orders desc



select p.categoryid, sum(s.salesamount) as total_sales
from sales s
join products p on s.productid = p.productid
group by p.categoryid



with factorial as (
    select number, cast(number as bigint) as fact, 1 as step
    from numbers1
    union all
    select f.number, f.fact * (f.step + 1), f.step + 1
    from factorial f
    where f.step + 1 < f.number
)
select number, max(fact) as factorial
from factorial
group by number
option (maxrecursion 1000)


with split as (
    select id, left(string, 1) as ch, substring(string, 2, len(string)) as rest
    from example
    union all
    select id, left(rest, 1), substring(rest, 2, len(rest))
    from split
    where len(rest) > 0
)
select id, ch
from split
where ch <> ''


select e.firstname, e.lastname, q.quarter, q.total_sales
from employees e
join (
    select 
        employeeid, 
        datepart(quarter, saledate) as quarter,
        sum(salesamount) as total_sales
    from sales
    group by employeeid, datepart(quarter, saledate)
) q on e.employeeid = q.employeeid
where q.total_sales > 45000



with fib (n, a, b) as (
    select 1, 0, 1
    union all
    select n + 1, b, a + b
    from fib
    where n < 20
)
select n, a as fib_number
from fib



select vals
from findsamecharacters
where vals is not null
and len(vals) > 1
and len(replace(vals, left(vals,1), '')) = 0




with seq as (
    select 1 as n, cast('1' as varchar(50)) as pattern
    union all
    select n + 1, pattern + cast(n + 1 as varchar(10))
    from seq
    where n < 5
)
select pattern from seq


update removeduplicateintsfromnames
set pawan_slug_name = 
    trim(replace(replace(pawan_slug_name, '-', ''), right(pawan_slug_name,1), ''))
where len(replace(pawan_slug_name, '-', '')) > 3















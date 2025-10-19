DROP TABLE IF EXISTS #RegionSales;
GO
CREATE TABLE #RegionSales (
  Region      VARCHAR(100),
  Distributor VARCHAR(100),
  Sales       INTEGER NOT NULL,
  PRIMARY KEY (Region, Distributor)
);
GO
INSERT INTO #RegionSales (Region, Distributor, Sales) VALUES
('North','ACE',10), ('South','ACE',67), ('East','ACE',54),
('North','ACME',65), ('South','ACME',9), ('East','ACME',1), ('West','ACME',7),
('North','Direct Parts',8), ('South','Direct Parts',7), ('West','Direct Parts',12);




CREATE TABLE Employee (id INT, name VARCHAR(255), department VARCHAR(255), managerId INT);
TRUNCATE TABLE Employee;
INSERT INTO Employee VALUES
(101, 'John', 'A', NULL), (102, 'Dan', 'A', 101), (103, 'James', 'A', 101),
(104, 'Amy', 'A', 101), (105, 'Anne', 'A', 101), (106, 'Ron', 'B', 101);





CREATE TABLE Products (product_id INT, product_name VARCHAR(40), product_category VARCHAR(40));
CREATE TABLE Orders (product_id INT, order_date DATE, unit INT);
TRUNCATE TABLE Products;
INSERT INTO Products VALUES
(1, 'Leetcode Solutions', 'Book'),
(2, 'Jewels of Stringology', 'Book'),
(3, 'HP', 'Laptop'), (4, 'Lenovo', 'Laptop'), (5, 'Leetcode Kit', 'T-shirt');
TRUNCATE TABLE Orders;
INSERT INTO Orders VALUES
(1,'2020-02-05',60),(1,'2020-02-10',70),
(2,'2020-01-18',30),(2,'2020-02-11',80),
(3,'2020-02-17',2),(3,'2020-02-24',3),
(4,'2020-03-01',20),(4,'2020-03-04',30),(4,'2020-03-04',60),
(5,'2020-02-25',50),(5,'2020-02-27',50),(5,'2020-03-01',50);




DROP TABLE IF EXISTS Orders;
CREATE TABLE Orders (
  OrderID    INTEGER PRIMARY KEY,
  CustomerID INTEGER NOT NULL,
  [Count]    MONEY NOT NULL,
  Vendor     VARCHAR(100) NOT NULL
);
INSERT INTO Orders VALUES
(1,1001,12,'Direct Parts'), (2,1001,54,'Direct Parts'), (3,1001,32,'ACME'),
(4,2002,7,'ACME'), (5,2002,16,'ACME'), (6,2002,5,'Direct Parts');





CREATE TABLE Device(
  Device_id INT,
  Locations VARCHAR(25)
);
INSERT INTO Device VALUES
(12,'Bangalore'), (12,'Bangalore'), (12,'Bangalore'), (12,'Bangalore'),
(12,'Hosur'), (12,'Hosur'),
(13,'Hyderabad'), (13,'Hyderabad'), (13,'Secunderabad'),
(13,'Secunderabad'), (13,'Secunderabad');




CREATE TABLE Employee (
  EmpID INT,
  EmpName VARCHAR(30),
  Salary FLOAT,
  DeptID INT
);
INSERT INTO Employee VALUES
(1001,'Mark',60000,2), (1002,'Antony',40000,2), (1003,'Andrew',15000,1),
(1004,'Peter',35000,1), (1005,'John',55000,1), (1006,'Albert',25000,3), (1007,'Donald',35000,3);



CREATE TABLE Spending (
  User_id INT,
  Spend_date DATE,
  Platform VARCHAR(10),
  Amount INT
);
INSERT INTO Spending VALUES
(1,'2019-07-01','Mobile',100),
(1,'2019-07-01','Desktop',100),
(2,'2019-07-01','Mobile',100),
(2,'2019-07-02','Mobile',100),
(3,'2019-07-01','Desktop',100),
(3,'2019-07-02','Desktop',100);






DROP TABLE IF EXISTS Grouped;
CREATE TABLE Grouped
(
  Product  VARCHAR(100) PRIMARY KEY,
  Quantity INTEGER NOT NULL
);
INSERT INTO Grouped (Product, Quantity) VALUES
('Pencil', 3), ('Eraser', 4), ('Notebook', 2);





select e.name
from employee e
join employee m on e.id = m.managerid
group by e.name
having count(m.id) >= 5



select p.product_name, sum(o.unit) as unit
from products p
join orders o on p.product_id = o.product_id
where year(o.order_date) = 2020 and month(o.order_date) = 2
group by p.product_name
having sum(o.unit) >= 100




with vendor_count as (
    select customerid, vendor, count(*) as order_count
    from orders
    group by customerid, vendor
),
ranked as (
    select customerid, vendor, order_count,
           rank() over(partition by customerid order by order_count desc) as rnk
    from vendor_count
)
select customerid, vendor
from ranked
where rnk = 1



declare @check_prime int = 91;
declare @i int = 2;
declare @is_prime bit = 1;

while @i <= sqrt(@check_prime)
begin
    if @check_prime % @i = 0
    begin
        set @is_prime = 0;
        break;
    end
    set @i = @i + 1;
end

if @is_prime = 1
    print 'this number is prime';
else
    print 'this number is not prime'



	with signal_count as (
    select device_id, locations, count(*) as signal_count
    from device
    group by device_id, locations
),
max_signal as (
    select device_id, 
           max(signal_count) as max_signal
    from signal_count
    group by device_id
)
select s.device_id,
       count(distinct s.locations) as no_of_location,
       (select top 1 locations 
        from signal_count sc 
        where sc.device_id = s.device_id 
        order by sc.signal_count desc) as max_signal_location,
       sum(s.signal_count) as no_of_signals
from signal_count s
group by s.device_id





select e.empid, e.empname, e.salary
from employee e
where e.salary > (
    select avg(salary)
    from employee
    where deptid = e.deptid )


	with ticket_match as (
    select t.ticketid, count(*) as matched
    from tickets t
    join numbers n on t.number = n.number
    group by t.ticketid
),
reward as (
    select ticketid,
           case 
                when matched = (select count(*) from numbers) then 100
                when matched > 0 then 10
                else 0
           end as prize
    from ticket_match
)
select concat('$', sum(prize)) as total_winnings
from reward




with cte as (
    select product, quantity
    from grouped
),
numbers as (
    select top (select max(quantity) from grouped) row_number() over(order by (select null)) as n
    from sys.objects
)
select c.product, 1 as quantity
from cte c
join numbers n on n.n <= c.quantity
order by c.product












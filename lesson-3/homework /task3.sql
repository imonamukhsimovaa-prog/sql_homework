1. Define and explain the purpose of BULK INSERT in SQL Server

Definition:
BULK INSERT is a command in SQL Server that allows fast importing of large volumes of data from a file (like .txt or .csv) directly into a SQL Server table.

Purpose:
It improves performance compared to inserting row-by-row, making it ideal for loading big datasets quickly.


---

2. Four file formats that can be imported into SQL Server

CSV (Comma-Separated Values)

TXT (Text files with delimiters)

XML (Extensible Markup Language)

JSON (JavaScript Object Notation)


  
 

create table Table_unique2 (id int unique not null, name varchar(20) unique)
insert into Table_unique2 values (1, 'josh')
insert into table_unique values (2, 'john'),(4 'Tom')
select * from table_unique2 
where id>=2

create table Table_check (id int unique, name varchar(20), check(id>4))
insert into Table_check values(null,'John')
select * from Table_check
   







   /*
Jobs
Regions
countries
locations
departments
Employees
dependents
*/
--1
create table Jobs(Job_id int primary key, job_title varchar(50), min_salary decimal(10,2), max_salary decimal(10,2))
--2
create table regions( region_id int primary key, region_name varchar(50))
--3
create table countries(country_id int primary key, country_name varchar(50), region_id int, foreign key(region_id) references regions(region_id))
--4
create table locations(locations_id int primary key, street_address varchar(50), postal_code int, foreign key(city) references locations(state_province))
--5
create table departments(departments_id int primary key, department_name varchar(50), location_name varchar(50))
--6
create table Employees(employees_id int primary key, first_name varchar(50), last_name varchar(20), email int, foreign key(phone_number) references (hire_date date), salary decimal (10,2), manager_id int, department_id varchar(50))
--7
create table dependents ( dependents_id int primary key, first_name varchar(50)), last_name int, foreign key(relationship) references dependents(employee_id) 





5. Difference between NULL and NOT NULL

NULL = No value assigned (unknown or missing).

NOT NULL = Ensures a column must always have a value (cannot be empty).





6. Add a UNIQUE constraint to ProductName

ALTER TABLE Products
ADD CONSTRAINT UQ_ProductName UNIQUE (ProductName);



7. Write a comment in a SQL query


SELECT * FROM Products;


---

8. Add CategoryID column to Products

ALTER TABLE Products
ADD CategoryID INT;




9. Create Categories table

CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(50) UNIQUE




10. Explain purpose of IDENTITY

IDENTITY automatically generates sequential numeric values for a column.

Useful for auto-incrementing primary keys (e.g., 1, 2, 3...).







1. BULK INSERT example

BULK INSERT Products
FROM 'C:\Data\products.txt'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);

(Imports CSV file into Products table)


---

2. Create a FOREIGN KEY

ALTER TABLE Products
ADD CONSTRAINT FK_Category FOREIGN KEY (CategoryID)
REFERENCES Categories(CategoryID);









/*
bulk insert 
*/

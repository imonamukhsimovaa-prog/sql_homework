create database lesson15homework




create table employees (
    id int primary key,
    name varchar(100),
    salary decimal(10,2)
);

insert into employees values
(1, 'alice', 50000),
(2, 'bob', 60000),
(3, 'charlie', 50000);

select *
from employees
where salary = (select min(salary) from employees);



create table products (
    id int primary key,
    product_name varchar(100),
    price decimal(10,2)
);

insert into products values
(1, 'laptop', 1200),
(2, 'tablet', 400),
(3, 'smartphone', 800),
(4, 'monitor', 300);

select *
from products
where price > (select avg(price) from products);



create table departments (
    id int primary key,
    department_name varchar(100)
);

create table employees (
    id int primary key,
    name varchar(100),
    department_id int,
    foreign key (department_id) references departments(id)
);

insert into departments values
(1, 'sales'),
(2, 'hr');

insert into employees values
(1, 'david', 1),
(2, 'eve', 2),
(3, 'frank', 1);

select *
from employees
where department_id = (
    select id from departments where department_name = 'sales'
)



create table customers (
    customer_id int primary key,
    name varchar(100)
);

create table orders (
    order_id int primary key,
    customer_id int,
    foreign key (customer_id) references customers(customer_id)
);

insert into customers values
(1, 'grace'),
(2, 'heidi'),
(3, 'ivan');

insert into orders values
(1, 1),
(2, 1);

select *
from customers
where customer_id not in (select customer_id from orders);


create table products (
    id int primary key,
    product_name varchar(100),
    price decimal(10,2),
    category_id int
);

insert into products values
(1, 'tablet', 400, 1),
(2, 'laptop', 1500, 1),
(3, 'headphones', 200, 2),
(4, 'speakers', 300, 2);

select *
from products p
where price = (
    select max(price)
    from products
    where category_id = p.category_id
)


create table departments (
    id int primary key,
    department_name varchar(100)
);

create table employees (
    id int primary key,
    name varchar(100),
    salary decimal(10,2),
    department_id int,
    foreign key (department_id) references departments(id)
);

insert into departments values
(1, 'it'),
(2, 'sales');

insert into employees values
(1, 'jack', 80000, 1),
(2, 'karen', 70000, 1),
(3, 'leo', 60000, 2);

select *
from employees
where department_id = (
    select top 1 department_id
    from employees
    group by department_id
    order by avg(salary) desc




create table students (
    student_id int primary key,
    name varchar(100)
)

create table grades (
    student_id int,
    course_id int,
    grade decimal(4,2),
    foreign key (student_id) references students(student_id)
);

insert into students values
(1, 'sarah'),
(2, 'tom'),
(3, 'uma');

insert into grades values
(1, 101, 95),
(2, 101, 85),
(3, 102, 90),
(1, 102, 80);

select s.name, g.course_id, g.grade
from grades g
join students s on s.student_id = g.student_id
where grade = (
    select max(grade)
    from grades
    where course_id = g.course_id
)


create table products (
    id int primary key,
    product_name varchar(100),
    price decimal(10,2),
    category_id int
);

insert into products values
(1, 'phone', 800, 1),
(2, 'laptop', 1500, 1),
(3, 'tablet', 600, 1),
(4, 'smartwatch', 300, 1),
(5, 'headphones', 200, 2),
(6, 'speakers', 300, 2),
(7, 'earbuds', 100, 2);

select p1.*
from products p1
where 2 = (
    select count(distinct p2.price)
    from products p2
    where p2.category_id = p1.category_id
    and p2.price > p1.price
)



create table employees (
    id int primary key,
    name varchar(100),
    salary decimal(10,2),
    department_id int
);

insert into employees values
(1, 'alex', 70000, 1),
(2, 'blake', 90000, 1),
(3, 'casey', 50000, 2),
(4, 'dana', 60000, 2),
(5, 'evan', 75000, 1);

select *
from employees e
where salary > (select avg(salary) from employees)
and salary < 
    (select min(salary)
    from employees
    where department_id = e.department_id

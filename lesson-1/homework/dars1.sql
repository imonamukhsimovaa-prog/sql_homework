1. Define the terms

Data → Raw facts and figures (e.g., 42, Ali, 2003-05-01), no meaning on their own.

Database → An organized collection of data, stored and accessed electronically.

Relational database → A type of database that organizes data into tables with relationships (using keys). Example: SQL Server, MySQL.

Table → A structured set of rows (records) and columns (fields) inside a database.

2. Five key features of SQL Server

High security (role-based, encryption).

Scalability (works from small apps to enterprise systems).

Supports transactions (ensures ACID: Atomicity, Consistency, Isolation, Durability).

Integration with tools like SSMS, Power BI, Azure.

Backup and restore features for data protection.

3. Authentication modes in SQL Server

Windows Authentication → Uses your Windows login.

SQL Server Authentication → Requires username + password created inside SQL Server.

(Optional extra: Mixed Mode = both of the above).




4. Create new database SchoolDB
In SSMS →

Connect to your server.

Right-click Databases → New Database… → name it SchoolDB → OK.

CREATE DATABASE SchoolIDB


5. Create the students table 
  
  CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT



6. Difference between SQL Server, SSMS, SQL

SQL Server → The actual database engine/software that stores and processes data.

SSMS (SQL Server Management Studio) → The GUI tool to manage SQL Server, write queries, and monitor databases.

SQL (Structured Query Language) → The language used to query and manipulate the database.



7. SQL command categories

DQL (Data Query Language) → Queries data. Example:

SELECT * FROM Students;


DML (Data Manipulation Language) → Insert, update, delete data. Example:

INSERT INTO Students VALUES (1, 'Ali', 20);


DDL (Data Definition Language) → Create/alter schema objects. Example:

CREATE TABLE Courses (CourseID INT PRIMARY KEY, Title VARCHAR(50));




8. Insert three records into Students table

INSERT INTO Students (StudentID, Name, Age)
VALUES
(1, 'bob', 20),
(2, 'john', 22),
(3, 'adam', 19);


9. Restore AdventureWorksDW2022.bak (steps you’d write in your submission)

Copy AdventureWorksDW2022.bak file to your machine (e.g., C:\Backups\).

In SSMS, right-click Databases → Restore Database…

Select Device → browse to the .bak file.

Choose destination database name (e.g., AdventureWorksDW2022).

Check Restore options (Overwrite if needed).

Click OK → Database is restored.

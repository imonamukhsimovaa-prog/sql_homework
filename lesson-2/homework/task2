CREATE TABLE Employees (
    EmpID INT,
    Name VARCHAR(50),
    Salary DECIMAL(10,2)


-- 2.

INSERT INTO Employees (EmpID, Name, Salary)
VALUES (1, 'Ali', 5000);


INSERT INTO Employees VALUES (2, 'Vali', 6000);


INSERT INTO Employees (EmpID, Name, Salary)
VALUES 
(3, 'Dilshod', 4500),
(4, 'Aziza', 5500);

-- 3. 
UPDATE Employees
SET Salary = 7000
WHERE EmpID = 1;

-- 4.
DELETE FROM Employees
WHERE EmpID = 2;

-- 5. Difference between DELETE, TRUNCATE, DROP:
-- DELETE – removes rows one by one, can use WHERE, keeps structure, can be rolled back.
-- TRUNCATE – removes ALL rows, faster than DELETE, cannot use WHERE, resets identity, keeps structure.
-- DROP – removes entire table with structure and data.

-- 6.
ALTER TABLE Employees
ALTER COLUMN Name VARCHAR(100);

-- 7.
ALTER TABLE Employees
ADD Department VARCHAR(50);

-- 8. 
ALTER TABLE Employees
ALTER COLUMN Salary FLOAT;

-- 9. Create Departments table
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)


-- 10. Remove all records from Employees but keep structure
TRUNCATE TABLE Employees; 


IntermediateLevel Tasks (6)



-- 2. Update Department of employees with Salary > 5000
UPDATE Employees
SET Department = 'Management'
WHERE Salary > 5000;

--3
TRUNCATE TABLE Employees;

--2
ALTER TABLE Employees
DROP COLUMN Department;




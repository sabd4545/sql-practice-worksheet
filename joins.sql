USE mydatabase;

CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(50) NOT NULL,
    DeptID INT,
    Salary INT
);

INSERT INTO Employees (EmpID, EmpName, DeptID, Salary)
VALUES
(1, 'tayar', 441, 50000),
(2, 'amanu', 442, 65000),
(3, 'hasanu', 443, 55000),
(4, 'sabdhar', 444, 70000),
(5, 'shazar', NULL, 45000),
(6, 'bagar', 445, 60000);

SELECT * FROM Employees;



CREATE TABLE Departments (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(50) NOT NULL
);

INSERT INTO Departments (DeptID, DeptName)
VALUES
(441, 'HR'),
(442, 'MARKETING'),
(443, 'DEVELOPING'),
(445, 'SALES');

SELECT * FROM Departments;

SELECT e.EmpName,
       d.DeptName,
       e.Salary
FROM Employees e
INNER JOIN Departments d
ON e.DeptID = d.DeptID;


SELECT e.EmpName,
       d.DeptName,
       e.Salary
FROM Employees e
LEFT JOIN Departments d
ON e.DeptID = d.DeptID;

SELECT e.EmpName,
       d.DeptName,
       e.Salary
FROM Employees e
RIGHT JOIN Departments d
ON e.DeptID = d.DeptID;

SELECT e.EmpName,
       d.DeptName,
       e.Salary
FROM Employees e
LEFT JOIN Departments d
ON e.DeptID = d.DeptID
UNION
SELECT e.EmpName,
       d.DeptName,
       e.Salary
FROM Employees e
RIGHT JOIN Departments d
ON e.DeptID = d.DeptID;

SELECT e.*
FROM Employees e
LEFT JOIN Departments d
ON e.DeptID = d.DeptID
WHERE d.DeptID IS NULL;

SELECT d.*
FROM Departments d
LEFT JOIN Employees e
ON d.DeptID = e.DeptID
WHERE e.EmpID IS NULL;

SELECT e.EmpName,
       d.DeptName,
       e.Salary
FROM Employees e,
     Departments d
WHERE e.DeptID = d.DeptID;

SELECT e.EmpName,
       d.DeptName,
       e.Salary
FROM Departments d
RIGHT JOIN Employees e
ON d.DeptID = e.DeptID;

SELECT e.EmpName,
       d.DeptName,
       e.Salary
FROM Departments d
LEFT JOIN Employees e
ON d.DeptID = e.DeptID;


SELECT e.EmpName,
       d.DeptName
FROM Employees e
CROSS JOIN Departments d;

ALTER TABLE Employees
ADD ManagerID INT;

UPDATE Employees
SET ManagerID = NULL
WHERE EmpID = 1;

UPDATE Employees
SET ManagerID = 1
WHERE EmpID = 2;

UPDATE Employees
SET ManagerID = 1
WHERE EmpID = 3;

UPDATE Employees
SET ManagerID = 2
WHERE EmpID = 4;

UPDATE Employees
SET ManagerID = 2
WHERE EmpID = 5;

UPDATE Employees
SET ManagerID = 3
WHERE EmpID = 6;


SELECT
e.EmpName AS Employee,
m.EmpName AS Manager
FROM Employees e
LEFT JOIN Employees m
ON e.ManagerID = m.EmpID;

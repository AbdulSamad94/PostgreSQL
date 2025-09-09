-- Manually

-- Constraints and Default Values

CREATE TABLE Employees(
    EmployeeID INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    department VARCHAR(50) NOT NULL DEFAULT 'General',
    age INT
);

INSERT INTO Employees(EmployeeID, name, age) 
VALUES
(1, 'John Doe', 30),
(2, 'Jane Smith', 25),
(3,'Alice', 30);

SELECT * FROM Employees;

-- Auto_increment

CREATE TABLE Departments(
    DepartmentID SERIAL PRIMARY KEY,
    DepartmentName VARCHAR(100) NOT NULL
);


INSERT INTO Departments(DepartmentName)
VALUES
('HR'),
('Finance'),
('IT');

SELECT * FROM Departments;


-- By using SERIAL datatype, DepartmentID is auto-incremented.
CREATE TABLE Employees(
    emp_id SERIAL PRIMARY KEY,
    fname VARCHAR(50) NOT NULL,
    lname VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    dept VARCHAR(50) NOT NULL,
    salary INT NOT NULL DEFAULT 30000,
    hire_date DATE NOT NULL
);

INSERT INTO Employees(fname, lname, email, dept, salary, hire_date)
VALUES (
    'John', 'Doe', 'HlV2k@example.com', 'HR', 50000, '2022-01-01'
),
(
    'Jane', 'Smith', '6YIwI@example.com', 'IT', 60000, '2022-02-01'
),
(
    'Alice', 'Johnson', 'F0KJQ@example.com', 'Finance', 55000, '2022-03-01'
);


SELECT * from Employees;

UPDATE Employees
    SET fname = 'Abdul Samad', lname = 'Siddiqui', email = 'abdulsamadwork109@gmail.com', dept = 'IT', salary = 100000000
    WHERE emp_id = 1;

SELECT * from Employees;
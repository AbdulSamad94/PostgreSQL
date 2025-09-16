-- AGGREGATE FUNCTIONS INCLUDE (COUNT, SUM, AVG, MIN, MAX)

-- COUNT: Returns the number of rows that matches a specified criterion.

SELECT COUNT(emp_id) FROM Employees;

-- SUM: Returns the total sum of a numeric column.

SELECT SUM(salary) FROM Employees;

-- AVG: Returns the average value of a numeric column.

SELECT AVG(salary) FROM Employees;

-- MIN: Returns the smallest value of the selected column.

SELECT MIN(salary) FROM Employees;

-- MAX: Returns the largest value of the selected column.

SELECT MAX(salary) FROM Employees;
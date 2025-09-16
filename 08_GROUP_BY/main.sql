-- GROUP BY is used to arrange identical data into groups.
-- This is often used with aggregate functions (COUNT, MAX, MIN, SUM, AVG)
-- to group similar data together.

SELECT * FROM Employees;

SELECT dept FROM Employees GROUP BY dept;
SELECT DISTINCT dept FROM Employees;

-- THEY ARE THE SAME!

-- BUT DISTINCT is used to remove duplicates from a single column,
-- while GROUP BY is used to arrange identical data into groups across multiple columns.

SELECT dept, COUNT(emp_id) from Employees GROUP BY dept;

SELECT dept, SUM(salary) from Employees GROUP BY dept;

SELECT dept, AVG(salary) from Employees GROUP BY dept;

SELECT dept, MAX(salary) from Employees GROUP BY dept;

SELECT dept, MIN(salary) from Employees GROUP BY dept;
-- TASK 1: Find total number of employees in the database
SELECT COUNT(emp_id) AS total_employees
FROM Employees;


-- TASK 2: Find number of employees in each department
SELECT dept,
       COUNT(emp_id) AS employees_per_dept
FROM Employees
GROUP BY dept;


-- TASK 3: Find the employee(s) with the lowest salary

-- Way 1 (Best – handles multiple employees with same minimum salary)
SELECT *
FROM Employees
WHERE salary = (SELECT MIN(salary) FROM Employees);

-- Way 2 (Returns only one row even if multiple employees share min salary)
SELECT *
FROM Employees
ORDER BY salary ASC
LIMIT 1;


-- TASK 4: Find the employee(s) with the highest salary

-- Way 1 (Best – handles multiple employees with same maximum salary)
SELECT *
FROM Employees
WHERE salary = (SELECT MAX(salary) FROM Employees);

-- Way 2 (Returns only one row even if multiple employees share max salary)
SELECT *
FROM Employees
ORDER BY salary DESC
LIMIT 1;


-- TASK 5: Find total salary paid in the IT department
SELECT SUM(salary) AS total_it_salary
FROM Employees
WHERE dept = 'IT';


-- TASK 6: Find average salary in each department
SELECT dept,
       AVG(salary) AS avg_salary
FROM Employees
GROUP BY dept;

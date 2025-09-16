-- TASK 1:  Find Different type of departments in database?

-- SOLUTION:

SELECT DISTINCT dept FROM Employees;

-- TASK 2: Display records with High-low salary

-- SOLUTION:

SELECT * FROM Employees ORDER BY salary DESC;

-- TASK 3: How to see only top 3 records from a table?

-- SOLUTION:

SELECT * FROM Employees LIMIT 3;


-- TASK 4: Show records where first name start with letter 'A'

-- SOLUTION:

SELECT * FROM Employees WHERE fname LIKE 'A%'


-- TASK 5: Show records where length of the lname is 4 characters

-- SOLUTION:

SELECT * FROM Employees WHERE LENGTH(lname) <= 4;
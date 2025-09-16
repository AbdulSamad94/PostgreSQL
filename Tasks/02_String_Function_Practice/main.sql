-- TASK 1, get this output : 1:Abdul Samad:Siddiqui:IT

SELECT * FROM Employees;

-- TASK 1, SOLUTION:

SELECT CONCAT_WS(':', emp_id, fname, dept) FROM Employees WHERE emp_id = 1;

-- TAST 2, get this output : 1:Abul Samad Siddqiui:IT

-- TASK 2, SOLUTION

SELECT CONCAT_WS(':', emp_id, CONCAT_WS(' ', fname, lname), dept) FROM Employees WHERE emp_id = 1;

-- TAST 3, get this output : 4:John:hr

-- TASK 3, SOLUTION

SELECT CONCAT_WS(':', emp_id, fname, LOWER(dept)) FROM Employees WHERE emp_id = 4;

-- TAST 4, get this output : I1 Abdul Samad\n I2 Jane

-- TAST 4. SOLUTION

SELECT CONCAT(LEFT(dept, 1), emp_id), fname FROM Employees WHERE emp_id = 1 or emp_id = 2;
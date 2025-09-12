-- =========================================
-- PostgreSQL Data Refining Practice
-- Clauses Covered: WHERE, DISTINCT, ORDER BY, LIMIT, LIKE
-- =========================================

-- Preview all data
SELECT * FROM Employees;

-- =========================================
-- 1) WHERE Clause
--    Filter rows using relational, logical, or special operators
-- =========================================

-- Using relational operators
SELECT * FROM Employees WHERE emp_id = 2;
SELECT * FROM Employees WHERE dept = 'IT';
SELECT * FROM Employees WHERE salary >= 60000;

-- Using logical operators
SELECT * FROM Employees WHERE dept = 'IT' OR dept = 'HR';
SELECT * FROM Employees WHERE dept = 'IT' AND salary >= 100000;

-- Special operators (IN, NOT IN)
SELECT * FROM Employees WHERE dept IN ('IT', 'HR');
SELECT * FROM Employees WHERE dept NOT IN ('IT', 'HR');

-- BETWEEN (inclusive of both ends)
SELECT * FROM Employees
WHERE salary BETWEEN 50000 AND 60000;  -- same as >=50000 AND <=60000


-- =========================================
-- 2) DISTINCT Clause
--    Return only unique rows/values
-- =========================================
SELECT dept FROM Employees;
SELECT DISTINCT dept FROM Employees;


-- =========================================
-- 3) ORDER BY Clause
--    Sort rows (ASC is default, use DESC for reverse)
-- =========================================
SELECT * FROM Employees ORDER BY fname;        -- ascending by default
SELECT * FROM Employees ORDER BY fname DESC;   -- descending
SELECT * FROM Employees ORDER BY emp_id;


-- =========================================
-- 4) LIMIT Clause
--    Restrict number of rows returned
-- =========================================
SELECT * FROM Employees LIMIT 3;


-- =========================================
-- 5) LIKE Clause
--    Pattern matching with % (any chars) and _ (single char)
-- =========================================
SELECT * FROM Employees WHERE fname LIKE 'A%';    -- starts with A
SELECT * FROM Employees WHERE fname LIKE '%e';    -- ends with e
SELECT * FROM Employees WHERE fname LIKE '%i%';   -- contains i
SELECT * FROM Employees WHERE dept LIKE '__';     -- exactly 2 chars
SELECT * FROM Employees WHERE fname LIKE '_b%';   -- 2nd char is b

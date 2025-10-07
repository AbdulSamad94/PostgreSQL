-- ==========================================
-- CASE Expressions in PostgreSQL
-- ==========================================

-- First, let's look at our sample Employees table
SELECT * FROM Employees;

-- ==========================================
-- 1. Basic CASE Example: Categorizing Salaries
-- ==========================================

-- This example demonstrates how to categorize employees based on their salary ranges
SELECT 
    emp_id,
    fname,
    lname,
    salary,
    CASE
        WHEN salary < 40000 THEN 'Low Income'
        WHEN salary BETWEEN 40000 AND 70000 THEN 'Middle Income'
        WHEN salary BETWEEN 70001 AND 100000 THEN 'High Income'
        ELSE 'Executive Level'
    END AS Income_Category
FROM Employees;

-- ==========================================
-- 2. CASE with Calculations: Dynamic Bonuses
-- ==========================================

-- This example shows how to calculate different bonus percentages based on salary
SELECT 
    emp_id,
    fname,
    salary,
    CASE
        WHEN salary < 40000 THEN salary * 0.15  -- 15% bonus for low income
        WHEN salary BETWEEN 40000 AND 70000 THEN salary * 0.10  -- 10% bonus for middle income
        WHEN salary BETWEEN 70001 AND 100000 THEN salary * 0.07  -- 7% bonus for high income
        ELSE salary * 0.05  -- 5% bonus for executive level (they get less percentage-wise)
    END AS Bonus_Amount,
    CASE
        WHEN salary < 40000 THEN '15%'
        WHEN salary BETWEEN 40000 AND 70000 THEN '10%'
        ELSE '7% or lower'
    END AS Bonus_Percentage
FROM Employees;

-- ==========================================
-- 3. CASE in WHERE Clause: Filtering with Conditions
-- ==========================================

-- Example of using CASE in WHERE clause to filter data conditionally
SELECT 
    emp_id,
    fname,
    salary,
    CASE
        WHEN salary > 60000 THEN 'Senior Staff'
        ELSE 'Regular Staff'
    END AS Staff_Level
FROM Employees
WHERE 
    CASE
        WHEN fname = 'John' THEN salary > 50000  -- If name is John, only show high salary
        ELSE salary > 30000  -- For all other employees, show those with salary > 30000
    END;

-- ==========================================
-- 4. CASE in ORDER BY: Custom Sorting
-- ==========================================

-- This example shows how to customize sorting order using CASE
SELECT 
    emp_id,
    fname,
    lname,
    salary,
    CASE
        WHEN salary >= 100000 THEN 'Executive'
        WHEN salary >= 70000 THEN 'Manager'
        WHEN salary >= 40000 THEN 'Associate'
        ELSE 'Entry Level'
    END AS Position_Level
FROM Employees
ORDER BY 
    CASE 
        WHEN Position_Level = 'Executive' THEN 1
        WHEN Position_Level = 'Manager' THEN 2
        WHEN Position_Level = 'Associate' THEN 3
        ELSE 4
    END,
    salary DESC;

-- ==========================================
-- 5. CASE with Aggregations: Grouped Analysis
-- ==========================================

-- This example shows how to use CASE with GROUP BY and aggregate functions
SELECT
    CASE
        WHEN salary < 40000 THEN 'Low Income'
        WHEN salary BETWEEN 40000 AND 70000 THEN 'Middle Income'
        WHEN salary BETWEEN 70001 AND 100000 THEN 'High Income'
        ELSE 'Executive Level'
    END AS Income_Category,
    COUNT(*) AS Employee_Count,
    AVG(salary) AS Average_Salary,
    MIN(salary) AS Min_Salary,
    MAX(salary) AS Max_Salary
FROM Employees 
GROUP BY 
    CASE
        WHEN salary < 40000 THEN 'Low Income'
        WHEN salary BETWEEN 40000 AND 70000 THEN 'Middle Income'
        WHEN salary BETWEEN 70001 AND 100000 THEN 'High Income'
        ELSE 'Executive Level'
    END
ORDER BY Average_Salary DESC;

-- ==========================================
-- 6. Nested CASE: Complex Conditional Logic
-- ==========================================

-- Example of nested CASE statements for more complex conditions
SELECT 
    emp_id,
    fname,
    department,
    salary,
    CASE
        WHEN department = 'Sales' THEN
            CASE
                WHEN salary > 80000 THEN 'High-Performing Sales'
                WHEN salary > 50000 THEN 'Average Sales'
                ELSE 'Developing Sales'
            END
        WHEN department = 'Engineering' THEN
            CASE
                WHEN salary > 100000 THEN 'Senior Engineer'
                WHEN salary > 70000 THEN 'Mid-Level Engineer'
                ELSE 'Junior Engineer'
            END
        ELSE
            CASE
                WHEN salary > 70000 THEN 'Senior Staff'
                WHEN salary > 45000 THEN 'Mid-Level Staff'
                ELSE 'Entry-Level Staff'
            END
    END AS Role_Classification
FROM Employees;

-- ==========================================
-- 7. CASE for Handling NULL Values
-- ==========================================

-- Using CASE to handle NULL values and provide default values
SELECT 
    emp_id,
    fname,
    COALESCE(lname, 'No Last Name') AS lname,
    salary,
    CASE
        WHEN salary IS NULL THEN 'Salary Not Set'
        WHEN salary = 0 THEN 'Unpaid Position'
        ELSE ' || salary::TEXT
    END AS Salary_Display,
    CASE
        WHEN commission_pct IS NULL OR commission_pct = 0 THEN 
            CASE
                WHEN salary > 70000 THEN 'Fixed High Salary'
                ELSE 'Fixed Salary Only'
            END
        ELSE 'Commission Based'
    END AS Payment_Type
FROM Employees;
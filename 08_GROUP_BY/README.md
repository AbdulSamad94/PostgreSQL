# PostgreSQL `GROUP BY` Clause

This project explains the **GROUP BY** clause in PostgreSQL with examples using an `Employees` table.

## Overview

- **GROUP BY** arranges rows that have the same values into groups.
- Often used with aggregate functions (`COUNT`, `SUM`, `AVG`, `MIN`, `MAX`) to perform calculations per group.

## Example Table

`Employees` table with columns such as:

- `emp_id` (employee ID)
- `dept` (department)
- `salary` (employee salary)

## Basic Usage

```sql
SELECT * FROM Employees;
```

Shows all employee records.

### Grouping by a Single Column

```sql
SELECT dept FROM Employees GROUP BY dept;
```

### DISTINCT vs GROUP BY

```sql
SELECT DISTINCT dept FROM Employees;
```

Both return unique departments, but:

- **DISTINCT** removes duplicates from a single column.
- **GROUP BY** groups rows and allows aggregates across multiple columns.

## Aggregate Functions with GROUP BY

Run these queries to calculate department-wise data:

```sql
-- Count employees per department
SELECT dept, COUNT(emp_id) FROM Employees GROUP BY dept;

-- Total salary per department
SELECT dept, SUM(salary) FROM Employees GROUP BY dept;

-- Average salary per department
SELECT dept, AVG(salary) FROM Employees GROUP BY dept;

-- Highest salary per department
SELECT dept, MAX(salary) FROM Employees GROUP BY dept;

-- Lowest salary per department
SELECT dept, MIN(salary) FROM Employees GROUP BY dept;
```

## Notes

- You can group by multiple columns:

  ```sql
  SELECT dept, job_title, AVG(salary)
  FROM Employees
  GROUP BY dept, job_title;
  ```

- Use `HAVING` to filter groups after aggregation:

  ```sql
  SELECT dept, AVG(salary)
  FROM Employees
  GROUP BY dept
  HAVING AVG(salary) > 50000;
  ```

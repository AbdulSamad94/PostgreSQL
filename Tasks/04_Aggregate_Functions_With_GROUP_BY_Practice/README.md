# PostgreSQL Aggregate & Grouping Practice

This README documents exercises combining **aggregate functions** and **GROUP BY** clauses using an `Employees` table.

## Table Assumption

Columns:

- `emp_id`
- `fname`
- `lname`
- `dept`
- `salary`

---

## Task 1 – Total Employees

Find the total number of employees:

```sql
SELECT COUNT(emp_id) AS total_employees
FROM Employees;
```

---

## Task 2 – Employees per Department

Count employees in each department:

```sql
SELECT dept,
       COUNT(emp_id) AS employees_per_dept
FROM Employees
GROUP BY dept;
```

---

## Task 3 – Lowest Salary

Find employee(s) with the lowest salary.

**Way 1 (Recommended)** – works even if multiple employees share the minimum salary:

```sql
SELECT *
FROM Employees
WHERE salary = (SELECT MIN(salary) FROM Employees);
```

**Way 2** – returns only one row:

```sql
SELECT *
FROM Employees
ORDER BY salary ASC
LIMIT 1;
```

---

## Task 4 – Highest Salary

Find employee(s) with the highest salary.

**Way 1 (Recommended):**

```sql
SELECT *
FROM Employees
WHERE salary = (SELECT MAX(salary) FROM Employees);
```

**Way 2:**

```sql
SELECT *
FROM Employees
ORDER BY salary DESC
LIMIT 1;
```

---

## Task 5 – Total Salary in IT Department

```sql
SELECT SUM(salary) AS total_it_salary
FROM Employees
WHERE dept = 'IT';
```

---

## Task 6 – Average Salary per Department

```sql
SELECT dept,
       AVG(salary) AS avg_salary
FROM Employees
GROUP BY dept;
```

---

## Notes

- **Aggregate functions used:** `COUNT`, `SUM`, `AVG`, `MIN`, `MAX`.
- `GROUP BY` groups data so aggregates can be applied to each group.
- `ORDER BY` with `LIMIT` can fetch top or bottom rows but won’t capture all ties.

These queries give solid practice with PostgreSQL’s aggregate functions and grouping features.

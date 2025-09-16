# PostgreSQL String Functions – Practice Exercises

This README contains practice tasks using PostgreSQL **string functions** on an `Employees` table.

## Table Assumption

`Employees` table with columns:

- `emp_id`
- `fname`
- `lname`
- `dept`

---

## Task 1

**Goal Output:**

```

1\:Abdul Samad\:Siddiqui\:IT

```

**Solution:**

```sql
SELECT CONCAT_WS(':', emp_id, fname, dept)
FROM Employees
WHERE emp_id = 1;
```

> Uses `CONCAT_WS` to join `emp_id`, `fname`, and `dept` with a colon.

---

## Task 2

**Goal Output:**

```
1:Abdul Samad Siddiqui:IT
```

**Solution:**

```sql
SELECT CONCAT_WS(':', emp_id, CONCAT_WS(' ', fname, lname), dept)
FROM Employees
WHERE emp_id = 1;
```

> Inner `CONCAT_WS(' ', fname, lname)` joins first and last name with a space.

---

## Task 3

**Goal Output:**

```
4:John:hr
```

**Solution:**

```sql
SELECT CONCAT_WS(':', emp_id, fname, LOWER(dept))
FROM Employees
WHERE emp_id = 4;
```

> Uses `LOWER` to convert the department name to lowercase.

---

## Task 4

**Goal Output (two rows):**

```
I1 Abdul Samad
I2 Jane
```

**Solution:**

```sql
SELECT CONCAT(LEFT(dept, 1), emp_id) AS code,
       fname
FROM Employees
WHERE emp_id = 1 OR emp_id = 2;
```

> `LEFT(dept, 1)` extracts the first letter of the department,
> then `CONCAT` combines it with the employee ID.

---

## Notes

- You can adjust `WHERE` conditions to test with other employees.
- These exercises reinforce `CONCAT`, `CONCAT_WS`, `LOWER`, and `LEFT` usage.

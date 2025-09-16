# PostgreSQL Data Refining – Practice Tasks

This README includes basic SQL queries for **data filtering, sorting, and refining** using an `Employees` table.

## Table Assumption

Columns:

- `emp_id`
- `fname`
- `lname`
- `dept`
- `salary`

---

## Task 1

**Find different types of departments in the database**

```sql
SELECT DISTINCT dept
FROM Employees;
```

> `DISTINCT` removes duplicate department names.

---

## Task 2

**Display records with salaries from high to low**

```sql
SELECT *
FROM Employees
ORDER BY salary DESC;
```

> `ORDER BY salary DESC` sorts rows by salary in descending order.

---

## Task 3

**Show only the top 3 records**

```sql
SELECT *
FROM Employees
LIMIT 3;
```

> `LIMIT` restricts the result to the first 3 rows.

---

## Task 4

**Show records where first name starts with letter ‘A’**

```sql
SELECT *
FROM Employees
WHERE fname LIKE 'A%';
```

> `LIKE 'A%'` matches names beginning with `A`.

---

## Task 5

**Show records where last name length is 4 characters or less**

```sql
SELECT *
FROM Employees
WHERE LENGTH(lname) <= 4;
```

> Uses `LENGTH` to filter by character count.

---

## Notes

- Combine clauses for more control:

  ```sql
  SELECT DISTINCT dept
  FROM Employees
  ORDER BY dept ASC
  LIMIT 5;
  ```

- Use `ILIKE` (case-insensitive) instead of `LIKE` if needed.

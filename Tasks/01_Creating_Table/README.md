# Task 1: Creating the Employees Table

### Objective

In this task, you will practice:

- Creating a table with multiple columns.
- Adding constraints like `PRIMARY KEY`, `NOT NULL`, `UNIQUE`, and `DEFAULT`.
- Inserting multiple rows into the table.
- Selecting data from the table.

---

### Task Instructions

1. Create a table called **`Employees`** with the following columns:

   - `emp_id` → should auto-increment and act as the primary key.
   - `fname` → first name of the employee (required).
   - `lname` → last name of the employee (required).
   - `email` → must be unique and not null.
   - `dept` → employee's department.
   - `salary` → default value should be `30000`.
   - `hire_date` → date when the employee was hired.

2. Insert at least **3 employees** into the table with different values.

3. Select all the records from the table using:
   ```sql
   SELECT * FROM Employees;
   ```

---

### 💡 Hints

- Use `SERIAL` for auto-incrementing `emp_id`.
- Add constraints like `PRIMARY KEY`, `NOT NULL`, and `UNIQUE`.
- You can insert multiple rows in a single `INSERT INTO` query using commas.
- For date values, use the format `'YYYY-MM-DD'`.

---

Complete this task without looking at the solution. Once done, test your table by running `SELECT * FROM Employees;`.

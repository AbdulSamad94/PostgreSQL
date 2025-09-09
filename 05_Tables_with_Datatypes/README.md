# 📘 Primary Key and Auto-Increment in PostgreSQL

This folder explains the difference between **manual IDs** and **auto-increment IDs** in PostgreSQL tables.

---

## 1. Manual ID (Primary Key)

```sql
CREATE TABLE Employees(
    EmployeeID INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    department VARCHAR(50) NOT NULL DEFAULT 'General',
    age INT
);

INSERT INTO Employees(EmployeeID, name, age)
VALUES
(1, 'John Doe', 30),
(2, 'Jane Smith', 25),
(3, 'Alice', 30);

SELECT * FROM Employees;
```

### Explanation:

- Here `EmployeeID` is a **manual primary key**.
- You must enter the `EmployeeID` yourself while inserting data.
- `PRIMARY KEY` ensures uniqueness and prevents duplicate IDs.

Result example:

```
 employeeid |    name    | department | age
------------+------------+------------+-----
          1 | John Doe   | General    |  30
          2 | Jane Smith | General    |  25
          3 | Alice      | General    |  30
```

---

## 2. Auto-Increment ID (Using SERIAL)

```sql
CREATE TABLE Departments(
    DepartmentID SERIAL PRIMARY KEY,
    DepartmentName VARCHAR(100) NOT NULL
);

INSERT INTO Departments(DepartmentName)
VALUES
('HR'),
('Finance'),
('IT');

SELECT * FROM Departments;
```

### Explanation:

- `SERIAL` is used to make `DepartmentID` **auto-increment**.
- You don’t need to manually provide `DepartmentID`, PostgreSQL generates it automatically.

Result example:

```
 departmentid | departmentname
--------------+----------------
            1 | HR
            2 | Finance
            3 | IT
```

---

## 💡 Key Difference

| Feature            | Manual Primary Key        | Auto-Increment (SERIAL)            |
| ------------------ | ------------------------- | ---------------------------------- |
| ID assignment      | You provide manually      | PostgreSQL generates automatically |
| Risk of duplicates | Possible (if not careful) | Prevented automatically            |
| Common use case    | When you need custom IDs  | When you just need unique IDs      |

---

## ✅ Summary

- Use **manual primary keys** when you want full control over IDs.
- Use **`SERIAL` (auto-increment)** when you just need unique IDs without manual input.
- In modern SQL, `GENERATED AS IDENTITY` is recommended instead of `SERIAL`.

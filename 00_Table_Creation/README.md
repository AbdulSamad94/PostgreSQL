# 📘 Table Creation (Basic)

This folder contains simple SQL queries for **creating tables**.  
These are just to understand the basic structure, without going deep into datatypes (we will cover datatypes in another file).

## 1. `person` Table

```sql
CREATE TABLE person(
    id INT,
    name VARCHAR(100),
    city VARCHAR(100)
);
```

### Explanation:

- `person` is a table with 3 columns:

  - `id` → stores the unique number for each row.
  - `name` → stores the person's name.
  - `city` → stores the city of the person.

---

## 2. `person2` Table

```sql
CREATE TABLE person2(
    id INT,
    name VARCHAR(100),
    city VARCHAR(100)
);
```

### Explanation:

- `person2` is almost the same as `person`, just with a different table name.
- This shows how you can create multiple tables with the same structure.

## 💡 Note

These queries only define the **table structure**. They don’t include:

- Primary Key
- Auto Increment
- Constraints (NOT NULL, UNIQUE, etc.)

We will learn these advanced concepts in the next steps.

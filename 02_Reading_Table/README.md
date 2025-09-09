# 📘 Reading Data From Tables (Basic)

This folder contains simple SQL queries for **reading (selecting)** data from tables.  
These queries show how to fetch all columns or specific columns from a table.

---

## 1. Select all columns from `person`

```sql
SELECT * FROM person;
```

### Explanation:

- The `*` means **all columns**.
- This will return every row and every column in the `person` table.

---

## 2. Select all columns from `person2`

```sql
SELECT * FROM person2;
```

### Explanation:

- Similar to the first query, but it fetches all rows from the `person2` table.

---

## 3. Select specific columns (`name` and `city`)

```sql
SELECT name, city FROM person;
```

### Explanation:

- Only the `name` and `city` columns will be shown from the `person` table.
- The `id` column will be ignored in the result.

---

## 4. Select only `id`

```sql
SELECT id FROM person;
```

### Explanation:

- Fetches only the `id` column from the `person` table.
- Useful when you want to see just the identifiers of rows.

---

## 💡 Note

- `SELECT *` is good for quick checks, but in real projects you should **only select the columns you need** (for performance and clarity).
- You can filter results using `WHERE`, which we will cover later.

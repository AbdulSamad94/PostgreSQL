# 📘 Deleting Data From a Table (Basic)

This folder contains SQL queries for **deleting rows** from a table.  
The `DELETE` command is used to remove specific rows or even all rows.

---

## 1. View the table before deleting

```sql
SELECT * FROM person;
```

- Shows the current data before performing deletions.

---

## 2. Delete a row by `id`

```sql
DELETE FROM person
    WHERE id = 199;
```

- Deletes the row where the `id` is `199`.

---

## 3. Delete a row by `name`

```sql
DELETE FROM person
    WHERE name = 'Muhammad Ali';
```

- Deletes the row where the `name` is **Muhammad Ali**.

---

## 4. Delete multiple rows by condition

```sql
DELETE FROM person
    WHERE city = 'Karachi';
```

- Deletes **all rows** where the `city` is **Karachi**.

---

## 5. Delete all rows from the table

```sql
DELETE FROM person;
```

- Removes **every row** from the table.
- ⚠️ Use this very carefully because all data will be gone.

---

## 6. View the table after deletions

```sql
SELECT * FROM person;
```

- Shows the final result after rows have been deleted.

---

## 💡 Note

- Always use `WHERE` with `DELETE` to avoid removing all rows by mistake.
- If you want to remove the table structure itself (not just rows), use `DROP TABLE` instead of `DELETE`.

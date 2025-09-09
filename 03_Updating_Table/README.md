# 📘 Updating Data in a Table (Basic)

This folder contains SQL queries for **updating rows** in a table.  
The `UPDATE` command allows you to change existing values in one or more columns.

---

## 1. View the table

```sql
SELECT * FROM person;
```

- Shows all data in the `person` table before making any changes.

---

## 2. Update a single column

```sql
UPDATE person
    SET name = 'Abdul Samad Siddiqui'
    WHERE id = 191;
```

- Changes the `name` of the row where `id = 191`.
- Only the `name` column is updated.

---

## 3. Update another column

```sql
UPDATE person
    SET city = 'Lahore'
    WHERE id = 199;
```

- Updates the `city` of the row where `id = 199`.

---

## 4. Update multiple columns together

```sql
UPDATE person
    SET name = 'Muhammad Ali', city = 'Islamabad'
    WHERE id = 200;
```

- Updates both `name` and `city` for the row where `id = 200`.

---

## 5. Check the results

```sql
SELECT * FROM person;
```

- Displays the table again to confirm the changes.

---

## 💡 Note

- Always use `WHERE` with `UPDATE`.

  - Without `WHERE`, **all rows in the table will be updated** with the new values (which is usually a mistake).

- You can update one column, multiple columns, or even all columns of a row.

# 📘 ALTER TABLE Operations in PostgreSQL

This folder contains SQL queries demonstrating various **ALTER TABLE** operations in PostgreSQL. These operations allow you to modify the structure of an existing table after it has been created.

---

## 1. Adding a New Column

```sql
ALTER TABLE person
ADD COLUMN age INT;
```

### Explanation:
- Adds a new column called `age` of type `INTEGER` to the `person` table.
- Existing records will have `NULL` values in this new column unless a default value is specified.

---

## 2. Removing a Column

```sql
ALTER TABLE person
DROP COLUMN age;
```

### Explanation:
- Removes the `age` column from the `person` table.
- **Warning:** This will permanently delete the column and all its data.

---

## 3. Adding a Column with Default Value

```sql
ALTER TABLE person
ADD COLUMN age INT DEFAULT 18;
```

### Explanation:
- Adds a new column `age` with a default value of `18`.
- All existing records will automatically have `age = 18`.
- New records will use `18` if no value is provided for the `age` column.

---

## 4. Renaming a Column

```sql
ALTER TABLE person
RENAME COLUMN old_name TO new_name;
```

### Explanation:
- Changes the name of an existing column from `old_name` to `new_name`.
- This does not affect the data in the column, only its name.

---

## 5. Renaming a Table

```sql
ALTER TABLE old_table_name
RENAME TO new_table_name;
```

### Explanation:
- Changes the name of the entire table from `old_table_name` to `new_table_name`.

---

## 6. Modifying Column Data Type

```sql
ALTER TABLE person
ALTER COLUMN name
SET DATA TYPE VARCHAR(50);
```

### Explanation:
- Changes the data type of the `name` column from its current type to `VARCHAR(50)`.
- Be careful when changing data types - ensure existing data is compatible with the new type.

---

## 7. Setting a Default Value for an Existing Column

```sql
ALTER TABLE person
ALTER COLUMN city
SET DEFAULT 'Unknown';
```

### Explanation:
- Sets a default value of `'Unknown'` for the `city` column.
- Future inserts without a `city` value will automatically use `'Unknown'`.

---

## 8. Comprehensive Example with Multiple Operations

```sql
-- Add a new email column
ALTER TABLE person
ADD COLUMN email VARCHAR(100);

-- Update the new column with values
UPDATE person
SET email = 'samad@example.com'
WHERE name = 'Samad';

-- Change the size of an existing column
ALTER TABLE person
ALTER COLUMN name
SET DATA TYPE VARCHAR(50);

-- Set a default value for the age column
ALTER TABLE person
ALTER COLUMN age
SET DEFAULT 18;
```

### Explanation:
- Shows how multiple ALTER operations can be combined in a sequence.
- Demonstrates that ALTER operations can be followed by UPDATE operations to populate new fields.

---

## ⚠️ Important Notes

- **Performance Impact**: ALTER operations can be expensive on large tables as they may require rewriting the entire table.
- **Locking**: Some ALTER operations may lock the table, preventing other operations during execution.
- **Backup First**: Always backup important data before running ALTER operations in production.
- **Dependencies**: Be aware of foreign keys, views, or functions that depend on the table structure you're changing.
- **Transaction Safety**: Most ALTER operations in PostgreSQL are atomic and can be rolled back if needed.

---

## 💡 Best Practices

- Test ALTER operations on a development/staging environment first
- Plan for downtime if the operation involves large tables
- Use `SET DATA TYPE` carefully to avoid data loss
- Always consider the impact on applications using the database
- Document structural changes for future reference
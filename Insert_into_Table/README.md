# 📘 Inserting Data Into Tables (Basic)

This folder contains simple SQL queries for **inserting data** into tables.  
These queries show how to add rows into the `person` and `person2` tables that we created earlier.

---

## 1. Insert into `person`

```sql
INSERT INTO person(id, name, city)
VALUES(199, 'Samad', 'Karachi');
```

### Explanation:

- Adds a new row in the `person` table.
- `id = 199`, `name = Samad`, `city = Karachi`.

---

## 2. Insert into `person2`

```sql
INSERT INTO person2(id, name, city)
VALUES(200, 'Muhammed', 'Riyadh');
```

### Explanation:

- Adds a new row in the `person2` table.
- `id = 200`, `name = Muhammed`, `city = Riyadh`.

---

## 3. Insert without all columns

```sql
INSERT INTO person(id, name)
VALUES(200, 'Muhammed');
```

### Explanation:

- Inserts a new row in the `person` table but **without the `city` value**.
- The `city` will remain `NULL` (empty) because no value was provided.

---

## 💡 Note

- Always match the order of **columns** with the order of **values**.
- If you don’t insert data for a column, it will be `NULL` (unless a default value or constraint is defined).
- You can insert multiple rows at once by separating values with commas. Example:

```sql
INSERT INTO person(id, name, city)
VALUES
(201, 'Alice', 'London'),
(202, 'John', 'New York');
```

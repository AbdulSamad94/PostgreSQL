# PostgreSQL String Functions

This README covers common **PostgreSQL string functions** with simple examples using an `Employees` table.

## Overview

String functions help you manipulate and query text data.  
Below are commonly used functions:

---

## 1. Concatenation

### `CONCAT`

Combine two or more strings:

```sql
SELECT CONCAT('Hello', ' ', 'World');
SELECT emp_id, CONCAT(fname, ' ', lname) AS full_name, dept FROM Employees;
```

### `CONCAT_WS`

Concatenate strings with a separator:

```sql
SELECT CONCAT_WS('-', '2023', '09', '15') AS formatted_date;
SELECT CONCAT_WS(' ', fname, lname) AS full_name, dept FROM Employees;
```

---

## 2. Substring & Replacement

### `SUBSTR`

Extract a substring:

```sql
SELECT SUBSTR('Hello World', 1, 5) AS substring_example;
```

### `REPLACE`

Replace text inside a string:

```sql
SELECT REPLACE('Hello World', 'World', 'SQL') AS replaced_string;
SELECT REPLACE(fname, 'a', 'o') AS modified_fname FROM Employees;
SELECT REPLACE(dept, 'IT', 'TECH') AS modified_dept FROM Employees;
```

---

## 3. Reverse & Length

### `REVERSE`

Reverse text:

```sql
SELECT REVERSE('Hello World') AS reversed_string;
SELECT REVERSE(fname) AS reversed_fname FROM Employees;
```

### `LENGTH`

Get string length:

```sql
SELECT LENGTH('Hello World') AS string_length;
SELECT LENGTH(fname) AS fname_length FROM Employees;
SELECT * FROM Employees WHERE LENGTH(fname) > 4;
```

---

## 4. Case Conversion

### `UPPER` and `LOWER`

Change case:

```sql
SELECT UPPER('Hello World') AS uppercase_string;
SELECT UPPER(fname) AS uppercase_fname FROM Employees;

SELECT LOWER('Hello World') AS lowercase_string;
SELECT LOWER(fname) AS lowercase_fname FROM Employees;
```

---

## 5. Left & Right Substrings

### `LEFT` and `RIGHT`

Get characters from the start or end:

```sql
SELECT LEFT('Hello World', 5) AS left_substring;
SELECT LEFT(fname, 3) AS left_fname FROM Employees;

SELECT RIGHT('Hello World', 5) AS right_substring;
SELECT RIGHT(fname, 3) AS right_fname FROM Employees;
```

---

## 6. Trimming

### `TRIM`

Remove leading/trailing spaces:

```sql
SELECT LENGTH('   Hello World   ') AS original_length,
       LENGTH(TRIM('   Hello World   ')) AS trimmed_length;

SELECT TRIM('   Hello World   ') AS trimmed_string;
```

---

## 7. Position

### `POSITION`

Find a substring’s position:

```sql
SELECT POSITION('World' IN 'Hello World') AS position_example;
```

---

## Notes

- Most functions can be nested or combined with other SQL clauses (`WHERE`, `GROUP BY`, etc.).
- Use these functions to clean, format, and query text data effectively.

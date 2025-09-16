-- IN STRING FUNCTIONS WE USE :

-- CONCAT, CONCAT_WS, 
-- SUBSTR
-- LEFT, RIGHT
-- LENGTH
-- UPPER, LOWER
-- TRIM, LTRIM, RTRIM
-- REPLACE, REVERSE
-- POSITION
-- STRING_AGG

-- CONCAT : to concatenate two or more strings

SELECT CONCAT('Hello', ' ', 'World');

SELECT emp_id, CONCAT(fname, ' ', lname) AS full_name, dept FROM Employees;

-- CONCAT_WS : to concatenate strings with a separator

SELECT CONCAT_WS('-', '2023', '09', '15') AS formatted_date;

SELECT CONCAT_WS(' ', fname, lname) AS full_name, dept FROM Employees;

-- SUBSTR : to extract a substring from a string

SELECT SUBSTR('Hello World', 1, 5) AS substring_example;

-- REPLACE : as a substring from a string

SELECT REPLACE('Hello World', 'World', 'SQL') AS replaced_string;

SELECT REPLACE(fname, 'a', 'o') AS modified_fname FROM Employees;

SELECT REPLACE(dept, 'IT', 'TECH') AS modified_dept FROM Employees;

-- REVERSE : to reverse a string

SELECT REVERSE('Hello World') AS reversed_string;

SELECT REVERSE(fname) AS reversed_fname FROM Employees;

-- LENGTH : to get the length of a string

SELECT LENGTH('Hello World') AS string_length;

SELECT LENGTH(fname) AS fname_length FROM Employees;

SELECT * FROM Employees WHERE LENGTH(fname) > 4;

-- UPPER : to convert a string to uppercase

SELECT UPPER('Hello World') AS uppercase_string;

SELECT UPPER(fname) AS uppercase_fname FROM Employees;

-- LOWER : to convert a string to lowercase

SELECT LOWER('Hello World') AS lowercase_string;

SELECT LOWER(fname) AS lowercase

-- LEFT : to get the leftmost n characters from a string

SELECT LEFT('Hello World', 5) AS left_substring;

SELECT LEFT(fname, 3) AS left_fname FROM Employees;

-- RIGHT : to get the rightmost n characters from a string

SELECT RIGHT('Hello World', 5) AS right_substring;

SELECT RIGHT(fname, 3) AS right_fname FROM Employees;

-- TRIM : to remove leading and trailing spaces from a string

SELECT LENGTH('   Hello World   ') AS original_length,
       LENGTH(TRIM('   Hello World   ')) AS trimmed_length;

SELECT TRIM('   Hello World   ') AS trimmed_string;


-- POSITION : to find the position of a substring within a string

SELECT POSITION('World' IN 'Hello World') AS position_example;
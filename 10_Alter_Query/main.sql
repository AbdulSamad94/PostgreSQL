-- ========================================
-- PostgreSQL Learning: ALTER TABLE Operations
-- ========================================
-- This file demonstrates various ALTER TABLE operations in PostgreSQL
-- to modify table structure after creation.

-- First, let's see the current structure of our person table
SELECT * FROM person;

-- ========================================
-- 1. ADDING A NEW COLUMN
-- ========================================
-- Adding a new 'age' column of type INTEGER to the person table
ALTER TABLE person
ADD COLUMN age INT;

-- Verify the change
SELECT * FROM person;

-- ========================================
-- 2. UPDATING DATA IN THE NEW COLUMN
-- ========================================
-- Updating the age column for existing records
UPDATE person
SET age = 25
WHERE name = 'Samad';

UPDATE person
SET age = 30
WHERE name = 'Muhammed';

-- Verify the changes
SELECT * FROM person;

-- ========================================
-- 3. DROPPING A COLUMN
-- ========================================
-- Removing the 'age' column from the person table
ALTER TABLE person
DROP COLUMN age;

-- Verify the change
SELECT * FROM person;

-- ========================================
-- 4. ADDING A COLUMN WITH DEFAULT VALUE
-- ========================================
-- Adding age column again but with a default value
ALTER TABLE person
ADD COLUMN age INT DEFAULT 18;

-- Verify the change - all existing records will have age = 18
SELECT * FROM person;

-- ========================================
-- 5. RENAMING A COLUMN
-- ========================================
-- Renaming an existing column (if a column named 'person_id' existed)
-- ALTER TABLE person
-- RENAME COLUMN person_id TO id;

-- Note: The above command would fail if 'person_id' column doesn't exist

-- ========================================
-- 6. RENAMING A TABLE
-- ========================================
-- Renaming the entire table from 'person' to 'people'
ALTER TABLE person
RENAME TO people;

-- Verify the table rename - show all data from new table name
SELECT * FROM people;

-- Rename the table back to 'person' for consistency
ALTER TABLE people
RENAME TO person;

-- Verify the table rename back to original name
SELECT * FROM person;

-- ========================================
-- 7. MODIFYING COLUMN DATA TYPE
-- ========================================
-- Changing the data type of the 'name' column from VARCHAR(100) to VARCHAR(50)
ALTER TABLE person
ALTER COLUMN name
SET DATA TYPE VARCHAR(50);

-- Verify the change by checking table structure (optional)
-- \d person;

-- ========================================
-- 8. SETTING A DEFAULT VALUE FOR A COLUMN
-- ========================================
-- Adding a default value for the 'city' column
ALTER TABLE person
ALTER COLUMN city
SET DEFAULT 'Unknown';

-- Insert a new record without specifying city (to test the default)
INSERT INTO person(id, name)
VALUES(999, 'Default City Test');

-- Verify the insertion with default city value
SELECT * FROM person WHERE id = 999;

-- Clean up the test record
DELETE FROM person
WHERE id = 999;

-- ========================================
-- 9. ADDING A COLUMN AND POPULATING DATA
-- ========================================
-- Example of adding a column and populating it with values
ALTER TABLE person
ADD COLUMN email VARCHAR(100);

-- Update email for specific records
UPDATE person
SET email = 'samad@example.com'
WHERE name = 'Samad';

UPDATE person
SET email = 'muhammed@example.com'
WHERE name = 'Muhammed';

-- Verify all changes
SELECT * FROM person;

-- ========================================
-- Summary of ALTER TABLE Operations Covered:
-- - ADD COLUMN: Add a new column to the table
-- - DROP COLUMN: Remove a column from the table
-- - RENAME COLUMN: Change the name of an existing column
-- - RENAME TO: Change the name of the entire table
-- - ALTER COLUMN ... SET DATA TYPE: Change the data type of a column
-- - ALTER COLUMN ... SET DEFAULT: Set a default value for a column
-- ========================================

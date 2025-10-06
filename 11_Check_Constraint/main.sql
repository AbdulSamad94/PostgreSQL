-- ==========================================
-- CHECK CONSTRAINTS EXAMPLES
-- ==========================================

-- First, let's select all records to see the initial state
SELECT * FROM Person;

-- ==========================================
-- 1. ADDING A CHECK CONSTRAINT TO A NEW COLUMN
-- ==========================================
-- Adding a mobile number column with a constraint that ensures the length is at least 10 characters
ALTER TABLE Person
ADD COLUMN mob VARCHAR(15) CHECK (LENGTH(mob) >= 10) DEFAULT '+92 3132959809';

-- ==========================================
-- 2. DEMONSTRATING CONSTRAINT VIOLATION
-- ==========================================
-- This update will fail because '+92 3123' has only 8 characters, 
-- which violates our CHECK constraint requiring at least 10 characters
-- Uncomment the following lines to see the error:
/*
UPDATE Person
SET mob = '+92 3123'  -- This will fail the CHECK constraint
WHERE id = 192;
*/

-- This update will succeed because '+92 3142959809' has 12 characters (meets the 10+ requirement)
UPDATE Person
SET mob = '+92 3142959809' -- This will pass the CHECK constraint
WHERE id = 192;

-- View the updated record
SELECT id, mob FROM Person WHERE id = 192;

-- ==========================================
-- 3. DROPPING A CHECK CONSTRAINT
-- ==========================================
-- We can remove the constraint if needed (PostgreSQL generates a constraint name like "person_mob_check")
-- Note: The exact constraint name may vary depending on your PostgreSQL version
ALTER TABLE Person
DROP CONSTRAINT person_mob_check;

-- Now this update will succeed since the constraint has been removed
UPDATE Person
SET mob = '+92 441'  -- This will now succeed as the CHECK constraint has been dropped
WHERE id = 192;

-- View the record after update without constraint
SELECT id, mob FROM Person WHERE id = 192;

-- ==========================================
-- 4. ADDING A NAMED CHECK CONSTRAINT
-- ==========================================
-- Re-adding the constraint with a custom name for better management
ALTER TABLE Person
ADD CONSTRAINT mob_no_less_than_10
CHECK (LENGTH(mob) >= 10);

-- ==========================================
-- 5. DEMONSTRATING CONSTRAINT VALIDATION AGAIN
-- ==========================================
-- This update will fail again because '+92 441' has only 7 characters
-- Uncomment the following lines to see the error:
/*
UPDATE Person
SET mob = '+92 441'  -- This will fail the CHECK constraint again
WHERE id = 192;
*/

-- ==========================================
-- 6. ADDITIONAL CHECK CONSTRAINT EXAMPLES
-- ==========================================
-- Example: Adding an age column with a constraint for valid age range
ALTER TABLE Person
ADD COLUMN IF NOT EXISTS age INTEGER CHECK (age >= 0 AND age <= 150);

-- Example: Adding a salary column with minimum value constraint
ALTER TABLE Person
ADD COLUMN IF NOT EXISTS salary NUMERIC CHECK (salary > 0);

-- Example: Adding an email column with pattern validation
ALTER TABLE Person
ADD COLUMN IF NOT EXISTS email VARCHAR(255) 
CHECK (email ~* '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}
);

-- ==========================================
-- 7. VIEWING ALL CONSTRAINTS
-- ==========================================
-- Query to see all check constraints on the Person table
SELECT constraint_name, constraint_type, check_clause
FROM information_schema.check_constraints cc
JOIN information_schema.constraint_column_usage ccu 
  ON cc.constraint_name = ccu.constraint_name
WHERE ccu.table_name = 'person';

-- ==========================================
-- 8. CLEANUP (Optional)
-- ==========================================
-- If you want to remove all the added columns and constraints:
/*
ALTER TABLE Person 
DROP COLUMN IF EXISTS mob,
DROP COLUMN IF EXISTS age,
DROP COLUMN IF EXISTS salary,
DROP COLUMN IF EXISTS email;
*/

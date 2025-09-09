-- View the table before deleting
SELECT * FROM person;

-- Delete a single row using id
DELETE FROM person
    WHERE id = 199;

-- Delete another row using name
DELETE FROM person
    WHERE name = 'Muhammad Ali';

-- Delete multiple rows based on a condition
DELETE FROM person
    WHERE city = 'Karachi';

-- Delete all rows from the table (use with caution!)
DELETE FROM person;

-- View the table after deletions
SELECT * FROM person;

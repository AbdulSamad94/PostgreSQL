-- View all data in the person table
SELECT * FROM person;

-- Update the name of a specific person by id
UPDATE person
    SET name = 'Abdul Samad Siddiqui'
    WHERE id = 191;

-- Update the city of a specific person
UPDATE person
    SET city = 'Lahore'
    WHERE id = 199;

-- Update both name and city at the same time
UPDATE person
    SET name = 'Muhammad Ali', city = 'Islamabad'
    WHERE id = 200;

-- View the table again after updates
SELECT * FROM person;

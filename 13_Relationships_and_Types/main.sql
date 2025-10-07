-- ==========================================
-- Database Relationships and Their Types
-- ==========================================

-- In this directory, we'll demonstrate the three main types of relationships in databases:
-- 1. One-to-One (1:1)
-- 2. One-to-Many (1:N)
-- 3. Many-to-Many (N:M)

-- ==========================================
-- 1. ONE-TO-ONE RELATIONSHIP EXAMPLE
-- ==========================================

-- Drop tables if they exist (for clean demonstration)
DROP TABLE IF EXISTS employee_profiles CASCADE;
DROP TABLE IF EXISTS employees CASCADE;

-- Create main table: employees
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    hire_date DATE
);

-- Create related table: employee_profiles (one-to-one relationship)
CREATE TABLE employee_profiles (
    profile_id INT PRIMARY KEY,
    employee_id INT UNIQUE, -- Foreign key with unique constraint
    emergency_contact_name VARCHAR(100),
    emergency_contact_phone VARCHAR(20),
    medical_notes TEXT,
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

-- Insert sample data for one-to-one relationship
INSERT INTO employees (employee_id, first_name, last_name, email, hire_date) VALUES
(1, 'John', 'Smith', 'john.smith@company.com', '2022-01-15'),
(2, 'Jane', 'Doe', 'jane.doe@company.com', '2022-03-22'),
(3, 'Michael', 'Johnson', 'michael.j@company.com', '2021-11-05');

INSERT INTO employee_profiles (profile_id, employee_id, emergency_contact_name, emergency_contact_phone, medical_notes) VALUES
(1, 1, 'Sarah Smith', '555-1234', 'Allergic to penicillin'),
(2, 2, 'Robert Doe', '555-5678', 'None'),
(3, 3, 'Lisa Johnson', '555-9012', 'Requires ergonomic setup');

-- Query to demonstrate one-to-one relationship
SELECT 
    e.first_name,
    e.last_name,
    e.email,
    p.emergency_contact_name,
    p.medical_notes
FROM employees e
JOIN employee_profiles p ON e.employee_id = p.employee_id;

-- ==========================================
-- 2. ONE-TO-MANY RELATIONSHIP EXAMPLE
-- ==========================================

-- Drop tables if they exist (for clean demonstration)
DROP TABLE IF EXISTS orders CASCADE;
DROP TABLE IF EXISTS customers CASCADE;

-- Create main table: customers
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    email VARCHAR(100),
    city VARCHAR(50)
);

-- Create related table: orders (one-to-many relationship)
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT, -- Foreign key referencing customers
    order_date DATE,
    total_amount DECIMAL(10,2),
    status VARCHAR(20),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Insert sample data for one-to-many relationship
INSERT INTO customers (customer_id, customer_name, email, city) VALUES
(1, 'ABC Corporation', 'contact@abccorp.com', 'New York'),
(2, 'XYZ Ltd', 'info@xyz.com', 'Los Angeles'),
(3, 'Tech Solutions', 'support@techsol.com', 'Chicago');

INSERT INTO orders (order_id, customer_id, order_date, total_amount, status) VALUES
(101, 1, '2023-01-15', 1250.00, 'Completed'),
(102, 1, '2023-02-20', 890.50, 'Pending'),
(103, 2, '2023-01-30', 2100.75, 'Completed'),
(104, 3, '2023-02-10', 550.00, 'Completed'),
(105, 3, '2023-02-25', 1780.25, 'Shipped'),
(106, 3, '2023-03-01', 950.00, 'Pending');

-- Query to demonstrate one-to-many relationship
SELECT 
    c.customer_name,
    c.city,
    o.order_id,
    o.order_date,
    o.total_amount,
    o.status
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
ORDER BY c.customer_name, o.order_date;

-- Query showing how many orders each customer has
SELECT 
    c.customer_name,
    COUNT(o.order_id) AS total_orders,
    SUM(o.total_amount) AS total_spent
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
ORDER BY total_spent DESC;

-- ==========================================
-- 3. MANY-TO-MANY RELATIONSHIP EXAMPLE
-- ==========================================

-- Drop tables if they exist (for clean demonstration)
DROP TABLE IF EXISTS student_courses CASCADE;
DROP TABLE IF EXISTS students CASCADE;
DROP TABLE IF EXISTS courses CASCADE;

-- Create table: students
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100),
    email VARCHAR(100),
    enrollment_date DATE
);

-- Create table: courses
CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100),
    credits INT,
    instructor VARCHAR(100)
);

-- Junction table for many-to-many relationship: student_courses
CREATE TABLE student_courses (
    enrollment_id INT PRIMARY KEY,
    student_id INT, -- Foreign key referencing students
    course_id INT,  -- Foreign key referencing courses
    enrollment_date DATE,
    grade VARCHAR(2),
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id),
    UNIQUE(student_id, course_id) -- Prevent duplicate enrollments
);

-- Insert sample data for many-to-many relationship
INSERT INTO students (student_id, student_name, email, enrollment_date) VALUES
(1, 'Alice Johnson', 'alice@university.edu', '2022-08-15'),
(2, 'Bob Smith', 'bob@university.edu', '2022-08-15'),
(3, 'Carol Davis', 'carol@university.edu', '2022-08-15'),
(4, 'David Wilson', 'david@university.edu', '2022-08-15');

INSERT INTO courses (course_id, course_name, credits, instructor) VALUES
(101, 'Introduction to Computer Science', 3, 'Dr. Brown'),
(102, 'Database Systems', 4, 'Dr. Lee'),
(103, 'Calculus I', 4, 'Dr. Taylor'),
(104, 'English Composition', 3, 'Prof. Anderson'),
(105, 'Physics I', 4, 'Dr. Martinez');

INSERT INTO student_courses (enrollment_id, student_id, course_id, enrollment_date, grade) VALUES
(1, 1, 101, '2022-09-01', 'A'),
(2, 1, 102, '2022-09-01', 'A-'),
(3, 1, 104, '2022-09-01', 'B+'),
(4, 2, 101, '2022-09-01', 'B'),
(5, 2, 103, '2022-09-01', 'A'),
(6, 2, 105, '2022-09-01', 'B+'),
(7, 3, 102, '2022-09-01', 'A'),
(8, 3, 104, '2022-09-01', 'A-'),
(9, 3, 105, '2022-09-01', 'B'),
(10, 4, 101, '2022-09-01', 'B+'),
(11, 4, 103, '2022-09-01', 'B'),
(12, 4, 104, '2022-09-01', 'A-');

-- Query to demonstrate many-to-many relationship
SELECT 
    s.student_name,
    c.course_name,
    sc.grade,
    c.credits,
    c.instructor
FROM students s
JOIN student_courses sc ON s.student_id = sc.student_id
JOIN courses c ON sc.course_id = c.course_id
ORDER BY s.student_name, c.course_name;

-- Query showing which courses each student is taking
SELECT 
    s.student_name,
    STRING_AGG(c.course_name, ', ') AS enrolled_courses,
    COUNT(sc.course_id) AS total_courses
FROM students s
LEFT JOIN student_courses sc ON s.student_id = sc.student_id
LEFT JOIN courses c ON sc.course_id = c.course_id
GROUP BY s.student_id, s.student_name
ORDER BY s.student_name;

-- Query showing which students are enrolled in each course
SELECT 
    c.course_name,
    STRING_AGG(s.student_name, ', ') AS enrolled_students,
    COUNT(sc.student_id) AS total_students
FROM courses c
LEFT JOIN student_courses sc ON c.course_id = sc.course_id
LEFT JOIN students s ON sc.student_id = s.student_id
GROUP BY c.course_id, c.course_name
ORDER BY c.course_name;

-- ==========================================
-- FOREIGN KEY CONSTRAINTS AND ACTIONS
-- ==========================================

-- Example of creating a table with cascade options
-- This demonstrates what happens when referenced records are updated/deleted

-- Drop tables if they exist
DROP TABLE IF EXISTS orders_with_cascade CASCADE;
DROP TABLE IF EXISTS customers_with_cascade CASCADE;

CREATE TABLE customers_with_cascade (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100)
);

CREATE TABLE orders_with_cascade (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers_with_cascade(customer_id)
        ON DELETE CASCADE  -- When customer is deleted, their orders are also deleted
        ON UPDATE CASCADE  -- When customer_id is updated, it updates in orders too
);

-- Insert sample data
INSERT INTO customers_with_cascade (customer_id, customer_name) VALUES
(1, 'Test Customer');

INSERT INTO orders_with_cascade (order_id, customer_id, order_date, total_amount) VALUES
(1, 1, '2023-01-01', 100.00),
(2, 1, '2023-01-15', 200.00);

-- Show the data
SELECT * FROM customers_with_cascade;
SELECT * FROM orders_with_cascade;

-- ==========================================
-- SUMMARY OF RELATIONSHIP PATTERNS
-- ==========================================

-- 1. One-to-One (1:1):
--    - Foreign key with UNIQUE constraint
--    - Each record in Table A relates to exactly one record in Table B

-- 2. One-to-Many (1:N):
--    - Foreign key in the "many" table
--    - Each record in Table A can relate to multiple records in Table B

-- 3. Many-to-Many (N:M):
--    - Junction table with foreign keys to both related tables
--    - Allows multiple records in Table A to relate to multiple records in Table B
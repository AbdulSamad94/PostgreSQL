# PostgreSQL Aggregate Functions

This project demonstrates basic **PostgreSQL Aggregate Functions** using an example `Employees` table.  
Aggregate functions perform a calculation on a set of values and return a single value.

## Functions Covered

1. **COUNT**  
   Returns the number of rows that match a specified criterion.

   ```sql
   SELECT COUNT(emp_id) FROM Employees;
   ```

2. **SUM**
   Returns the total sum of a numeric column.

   ```sql
   SELECT SUM(salary) FROM Employees;
   ```

3. **AVG**
   Returns the average value of a numeric column.

   ```sql
   SELECT AVG(salary) FROM Employees;
   ```

4. **MIN**
   Returns the smallest value in a column.

   ```sql
   SELECT MIN(salary) FROM Employees;
   ```

5. **MAX**
   Returns the largest value in a column.

   ```sql
   SELECT MAX(salary) FROM Employees;
   ```

## How to Use

1. Create an `Employees` table with columns like `emp_id` and `salary`.
2. Insert some sample data.
3. Run the SQL queries above in your PostgreSQL client to see the results.

## Notes

- These functions can be combined with `WHERE` clauses for filtered results.
- You can also use them with `GROUP BY` to aggregate data per group.

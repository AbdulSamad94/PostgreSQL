# Check Constraints

This directory demonstrates the use of CHECK constraints in PostgreSQL, which are used to limit the values that can be stored in a column.

## What are Check Constraints?

Check constraints are database constraints that enforce conditions on the values in a column. They ensure that only data meeting specific criteria can be inserted or updated in a table.

## Key Concepts Demonstrated

- Adding CHECK constraints to columns during table creation or with ALTER TABLE
- Creating constraints based on expressions (e.g., LENGTH(mob) >= 10)
- Adding named constraints for easier management
- Handling constraint violations
- Dropping and re-adding constraints

## Why Use Check Constraints?

Check constraints provide:
- Data integrity by enforcing business rules at the database level
- Prevention of invalid data entry
- Automatic validation on both INSERT and UPDATE operations
- Clear, declarative rules that are maintained by the database engine

## Examples in this Directory

The SQL script demonstrates:
1. Adding a check constraint for mobile number length
2. Attempting to update with values that violate the constraint
3. Dropping and re-adding constraints
4. Working with named constraints vs. generated names

Check constraints are essential for maintaining data quality and enforcing business rules directly within the database.
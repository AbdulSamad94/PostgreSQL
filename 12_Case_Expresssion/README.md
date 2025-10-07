# CASE Expressions in PostgreSQL

The CASE expression is a powerful conditional expression in PostgreSQL that allows you to implement conditional logic within your SQL queries. It's similar to IF-THEN-ELSE statements in other programming languages.

## Basic Syntax

```sql
CASE
    WHEN condition1 THEN result1
    WHEN condition2 THEN result2
    ...
    ELSE result
END AS alias_name
```

## Types of CASE Expressions

### 1. Simple CASE Expression
Compares an expression against multiple values:

```sql
CASE expression
    WHEN value1 THEN result1
    WHEN value2 THEN result2
    ...
    ELSE result
END
```

### 2. Searched CASE Expression
Evaluates Boolean expressions:

```sql
CASE
    WHEN condition1 THEN result1
    WHEN condition2 THEN result2
    ...
    ELSE result
END
```

## Practical Examples

This directory contains examples demonstrating how to use CASE expressions in various scenarios:

1. **Categorizing data** - Classify employees based on their salary ranges
2. **Calculating conditional values** - Determine bonuses based on certain conditions
3. **Grouping with CASE** - Grouping results based on custom criteria

## Benefits of Using CASE

- Allows conditional logic directly in SQL queries
- Can be used in SELECT, WHERE, ORDER BY, and other clauses
- Helps transform data on-the-fly
- Provides a way to implement conditional formatting
- Enables complex business logic in queries
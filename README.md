# PostgreSQL Learning Journey

This repository contains my personal learning journey with PostgreSQL.  
I’m saving my queries, experiments, and examples step by step as I practice.  

## Purpose
- Helpful for beginners and students who want to learn SQL/PostgreSQL.  
- Each file covers a specific topic (tables, insert, select, joins, etc.).  

## Requirements
- PostgreSQL installed (latest version recommended)  
- VS Code with **PostgreSQL extension** (for auto-suggestions)  
- Basic SQL knowledge  

## ▶ How to Run
### Option 1: Using CLI
1. Create a database:
   ```sql
   CREATE DATABASE mydb;
``

2. Connect to it:

   ```bash
   psql -U postgres -d mydb
   ```
3. Run the file:

   ```bash
   \i main.sql
   ```

### Option 2: Using VS Code

1. Install the **PostgreSQL extension** (by Chris Kolkman)
2. Create a new connection (`Ctrl+Shift+P → PostgreSQL: New Connection`)
3. Open `main.sql` and run the queries (`Ctrl+Shift+E`)


If you’re also learning PostgreSQL, feel free to clone this repo and use it for your own practice.

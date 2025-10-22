# Drizzle ORM with PostgreSQL - Learning Project

This project serves as a learning playground for Drizzle ORM with PostgreSQL. It demonstrates the basic setup and usage of Drizzle ORM in a Node.js environment.

## Overview

This is a simple Drizzle ORM project that connects to a PostgreSQL database and demonstrates basic CRUD operations. The project uses:
- Drizzle ORM for database operations
- PostgreSQL as the database
- TypeScript for type safety
- Drizzle Kit for migration management

## Features

- Simple user table schema definition
- Database connection using Drizzle ORM
- Basic insert and query operations
- Development workflow with direct schema pushing using `db:push`
- Migration support for production deployments
- TypeScript support

## Project Structure

```
.
├── drizzle.config.ts          # Drizzle Kit configuration
├── package.json              # Project dependencies and scripts
├── tsconfig.json             # TypeScript configuration
├── src/
│   ├── main.ts              # Main application entry point
│   └── drizzle/
│       ├── drizzle.ts       # Database connection setup
│       ├── schema.ts        # Database schema definitions
│       └── migrations/      # Database migration files
└── node_modules/            # Dependencies (not tracked by git)
```

## Setup Instructions

1. **Clone or download this repository**

2. **Install dependencies:**
   ```bash
   npm install
   ```

3. **Set up environment variables:**
   Create a `.env` file in the root directory and add your PostgreSQL database URL:
   ```
   DATABASE_URL=your_postgresql_connection_string_here
   ```

4. **Push schema changes to the database (development):**
   ```bash
   npm run db:push
   ```

5. **Start the application:**
   ```bash
   npm run dev
   ```

## Available Scripts

- `npm run dev` - Start the application in development mode with auto-restart
- `npm run db:generate` - Generate new migration files based on schema changes (for production)
- `npm run db:push` - Push schema changes directly to the database (development workflow)
- `npm run db:migrate` - Run the database migrations (production workflow)

## Schema Definition

The project currently includes a simple user table:

```typescript
export const UserTable = pgTable("user", {
    id: uuid("id").primaryKey().defaultRandom(),
    name: varchar("name", { length: 225 }).notNull()
})
```

## Example Usage

The `main.ts` file demonstrates a basic insert and select operation:

```typescript
async function main() {
    // Insert a new user
    await db.insert(UserTable).values({
        name: "Abdul Samad Siddiqui"
    })
    
    // Query the first user
    const user = await db.query.UserTable.findFirst()
    console.log(user)
}
```

## Learning Points

This project covers:
- Setting up Drizzle ORM with PostgreSQL
- Creating database schemas using Drizzle's schema definition syntax
- Connecting to PostgreSQL and performing database operations
- Using Drizzle Kit for migration management
- Basic CRUD operations with Drizzle ORM

## Dependencies

- `drizzle-orm` - The main Drizzle ORM library
- `postgres` - PostgreSQL driver
- `dotenv` - Environment variable management
- `drizzle-kit` - Migration tooling (dev dependency)
- `tsx` - TypeScript runner (dev dependency)

## Next Steps

To extend this learning project, you could:
- Add more complex schemas with relationships
- Implement update and delete operations
- Add more advanced query examples
- Integrate with a web framework like Express or Fastify
- Use `db:generate` and `db:migrate` for production-ready deployments

## Author

Learning Drizzle ORM with PostgreSQL
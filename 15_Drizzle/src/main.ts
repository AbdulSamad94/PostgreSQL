import "dotenv/config"
import { db } from "./drizzle/drizzle.js"
import { UserTable } from "./drizzle/schema.js"
async function main() {
    await db.insert(UserTable).values({
        name: "Abdul Samad Siddiqui"
    })
    const user = await db.query.UserTable.findFirst()
    console.log(user)
}

main()
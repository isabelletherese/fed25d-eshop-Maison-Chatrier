import "server-only";
import postgres from "postgres";

const databaseUrl = process.env.DATABASE_URL;

if (!databaseUrl) {
  throw new Error("DATABASE_URL is required to connect to Postgres.");
}

// Supabase's transaction pooler does not support prepared statements.
export const sql = postgres(databaseUrl, { prepare: false });

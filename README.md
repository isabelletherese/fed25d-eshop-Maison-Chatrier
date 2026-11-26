# Maison Chatrier

## Local setup

1. Install dependencies with `npm ci`.
2. In your Supabase project, run [db/setup.sql](db/setup.sql) in the SQL Editor.
3. Copy `.env.example` to `.env` and fill in the database connection string and Supabase Auth settings. Use the connection string from the project's **Connect** dialog.
4. In Supabase, open **Authentication → Users → Add user** and create a customer with **Auto Confirm User** selected. Set `TEST_USER_EMAIL` and `TEST_USER_PASSWORD` in `.env` for the login tests in later tickets.
5. Run `npm run dev` and open [http://localhost:3000](http://localhost:3000). Check for the shipping banner, Maison Chatrier wordmark, Collection, Account and Bag links, and the footer. The destinations are built in later tickets.

Keep the dev server running and run `npm test` in a second terminal. Set `TEST_BASE_URL` in `.env` if the server uses a different port. The homepage test checks HTTP 200 and the shared header and footer.

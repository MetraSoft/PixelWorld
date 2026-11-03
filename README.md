# PixelWorld v0.1

A working browser pixel-art platform with registration/login, PostgreSQL cloud projects, publishing, discovery and a scene launcher. **v0.1 launches static pixel scenes, not scripted games.**

## Deploy online (Render + managed PostgreSQL)
1. Push this folder to a **private** GitHub repository (do not commit `.env`).
2. Create a managed PostgreSQL database. Copy its **external** connection URL for schema setup and its **internal** URL for your backend if on the same private network.
3. Run `schema.sql` against the database using `psql "$DATABASE_URL" -f schema.sql` or your provider's SQL console. The session table is created automatically on startup.
4. Create a Render Web Service connected to the repository. Runtime: Node. Build command: `npm install`. Start command: `npm start`.
5. Set `DATABASE_URL`, `SESSION_SECRET` (random 32+ characters), `NODE_ENV=production`, and `TRUST_PROXY=1` in the service environment. Do not set `PORT` unless needed; Render supplies it.
6. Open the HTTPS URL assigned by Render, register, create a project, save it, publish it, and launch from Discover.

Use a provider PostgreSQL connection URL that validates TLS certificates; do not disable TLS verification in production. If your provider requires a custom CA, configure Node trust appropriately. For local PostgreSQL, use `localhost` in `DATABASE_URL`.

## Local development
Install Node.js 20+ and PostgreSQL. Create database, run `psql -d pixelworld -f schema.sql`, copy `.env.example` to `.env`, update `DATABASE_URL` and `SESSION_SECRET`, set `NODE_ENV=development` and `TRUST_PROXY=0`, then run `npm install && npm run dev`. Visit http://localhost:3000.

## Important limits / next releases
- Accounts use bcrypt password hashing, server-side sessions, HTTP-only cookies, CSRF tokens, rate-limited login/registration, and parameterized SQL.
- Registration is open. Add email verification, account recovery, moderation/reporting, quotas, and abuse protection before promoting this to a broad public audience.
- Passwords must be 12–128 characters. There is no password reset in v0.1.
- Projects are 16×16 pixel scenes; there is no arbitrary user-code execution. Add sandboxed interactive games only after a security review.
- Each project records total launches; no invasive visitor tracking.
- Production requires HTTPS and durable managed PostgreSQL. Back up the database.

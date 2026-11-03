# PixelWorld Studio v0.5 (prototype)

Upgrades PixelWorld v0.1 with multi-level scene editing, draggable objects, sprite painting, per-object rules, a basic playable physics runtime, cloud save, and published game launching.

## Upgrade an existing live v0.1 installation

1. **Back up your Neon database.** Do not delete any tables or run destructive SQL.
2. In Neon SQL Editor, run **migration-v0.5.sql** once. This adds a nullable `game` column while preserving existing users, sessions, projects, and drawings.
3. Upload/commit the updated `server.js`, `public/index.html`, `public/style.css`, `public/app.js`, and `README.md` to the **same GitHub repository**. Do not upload `.env` or secrets.
4. Render will auto-deploy from `main` (or use Manual Deploy → Deploy latest commit). Keep your existing `DATABASE_URL`, `SESSION_SECRET`, `NODE_ENV=production`, `TRUST_PROXY=1` settings.
5. Log in, open an existing project, edit, Save to cloud, publish it, and open Discover. Existing v0.1 drawings still load, but are converted to a new game when first edited; keep a backup if the original layout matters.

## Fresh install

Run `schema.sql` in an empty PostgreSQL database. Use Node.js 20+, `npm install`, `npm start` with `DATABASE_URL` and `SESSION_SECRET` (32+ characters) in the server environment. For local development, copy `.env.example` to `.env`. Do not commit `.env`.

## Controls and editor

- Create a project; click `+ Add object` to add Sprite, Platform, Coin, Goal.
- Click an object in the scene tree or viewport; drag to position it. Edit properties in Inspector.
- Paint a selected sprite in the 16x16 sprite painter (white is treated as transparent in the game renderer).
- Add levels, behaviors: key held, key pressed, or touch object; actions: move, jump, change level, destroy, score, and animation name.
- Press Play for a local preview; publish + Save to cloud to make the game available in Discover.
- Default player: A/D to move and Space to jump; goal advances to the next level, coins increase score.

## Current limitations

This is a functional **prototype**, not a production-grade full game engine. Animation actions store animation names but there is **no frame-by-frame animation editor/player yet**. Physics is basic gravity and landing collision (no robust horizontal collision, networking, or sound). Scene editing is not an undoable history. Existing legacy drawings can be opened but are converted to the new project model when saved. The rules engine is declarative and doesn't execute arbitrary user-supplied JS.

Before inviting broad public registration, add email verification, password reset, moderation/reporting, quotas, stronger abuse protection, and more complete input validation. The existing v0.1 authentication/session implementation is preserved.

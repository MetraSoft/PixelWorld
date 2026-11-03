-- Safe additive migration; retains all v0.1 accounts and projects.
ALTER TABLE projects ADD COLUMN IF NOT EXISTS game JSONB;

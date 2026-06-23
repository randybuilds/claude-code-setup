# CLAUDE.md — Operating Rules (Template)

A generic, project-agnostic starting point. Copy this into your repo root and adapt.
The goal: make the agent fast *and* safe by encoding the few rules that actually prevent rework.

## 🧠 Mandatory first action (every session)

Read [`memory-bank/startHere.md`](./memory-bank/startHere.md) before anything else. It's the map to the
whole project — the ranked path list, the file-size guide, and which file wins when two disagree. The
agent that skips it starts from zero and re-asks what's already written down. (Codex/Cursor get the same
instruction via `AGENTS.md`; Antigravity via `GEMINI.md` — one brain, every agent.)

## Questions rule

Never ask an open-ended question when a best guess will do. Propose the most likely answer with a
one-line reason and let the human confirm or correct. Validating is faster than answering from scratch.

> ❌ "What database should I use?"
> ✅ "Best guess: Postgres — you already have a `pg` dependency. Correct?"

## Git workflow

- Never commit straight to `main` for application code — use a feature branch.
- Branch naming: `feature/`, `fix/`, or `chore/` + a short description.
- Confirm before push / commit / PR unless the human said "just do it."
- Reference issues in commits when one exists.

## Security (pre-commit, mandatory)

Run before every commit; abort if anything matches:

```bash
git diff --cached | grep -E "(AKIA[0-9A-Z]{16}|sk-[A-Za-z0-9]{20,}|ghp_[A-Za-z0-9]{36}|-----BEGIN [A-Z]+ PRIVATE KEY-----)" \
  && echo "❌ secret detected — aborting" && exit 1
```

Never commit `.env` files, API keys, tokens, or hardcoded credentials. Keep secrets in your OS
keychain or a gitignored `.env`.

## Subagents are consultants, not executors

Subagents propose plans and findings — they do not execute. Run their suggested actions with your own
tools, then verify independently. A subagent reporting "done" is not proof.

## Tool selection

- Known path → read it directly. Pattern → glob. Content/regex → grep. Unknown → search agent.
- Batch independent tool calls in one message — never serialize what can run in parallel.

## Task tracking

Use a todo list for any task of 3+ steps, git operations, or anything multi-file. One task
in-progress at a time; mark complete only when actually done and verified.

---

*This is a template, not a finished config. Delete what doesn't apply; add your project's build/test
commands and architecture notes.*

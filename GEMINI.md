# GEMINI.md — Antigravity / Gemini Agent Rules

Antigravity (the `agy` CLI, Gemini-lineage) reads this file. Claude Code reads `CLAUDE.md`;
Codex and Cursor read `AGENTS.md`. **All three point to the same memory bank.**

## 🧠 Mandatory first action (every session)

Read [`memory-bank/startHere.md`](./memory-bank/startHere.md) first — it's the master navigation index
for this project. Don't start a task without it.

## File size guide
- <400 lines: read directly
- 400–600 lines: navigate by section headers
- >600 lines (🔴): start with the `## Executive Summary` at the top, then drill in.

## Core rules
- Ask before destructive actions (`rm`, force-push, db resets).
- Never commit secrets, `.env` files, or credentials.
- Propose a best guess instead of asking open-ended questions.

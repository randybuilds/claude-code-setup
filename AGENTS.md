# AGENTS.md — Cross-Tool Agent Rules

Instruction file for any AI coding agent that reads `AGENTS.md` (Codex, Cursor, and others).
Claude Code reads `CLAUDE.md`; Antigravity reads `GEMINI.md`. **All three point to the same memory bank.**

## 🧠 Mandatory first action (every session)

Read [`memory-bank/startHere.md`](./memory-bank/startHere.md) first. It's the table of contents for this
project's context — the ranked path list, the size guide, and which file wins when two disagree. Never
start a task without it.

## File size guide
- <400 lines: read directly · 400–600: navigate by headers · >600 (🔴): start with the `## Executive Summary`.

## Core rules
- Subagents are consultants, not executors — they propose; you execute and verify independently.
- Never commit secrets; scan staged changes before every commit.
- Ask before destructive or irreversible actions (`rm`, force-push, db resets).
- Propose a best guess instead of asking open-ended questions.

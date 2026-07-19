# CLAUDE.md — Claude Code Rules

@AGENTS.md

All agent-agnostic rules (git workflow, security, subagents, tool selection, task tracking, the
mandatory `memory-bank/startHere.md` read) live in `AGENTS.md` above — edit them there, not here.
This file holds only what's specific to running in Claude Code.

## Quality chain

For any non-trivial change, use the skills in `.claude/skills/` instead of ad-hoc prompts:
`/plan-review` → implement → `/simplify` → `/verify` → `/pr-fix`. No self-review — a plan or a
finished change gets an independent pass before it ships.

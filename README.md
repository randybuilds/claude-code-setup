# claude-code-setup

The highest-leverage operating stack I run my businesses on — the exact skills, agents, and
rules that let one operator run like a 30-person team. Build it on yourself first; deploy it
for clients second.

The point isn't "AI." It's **leverage**: more output per person, so the business grows revenue
and margin without growing headcount.

## The philosophy

- **Skills over prompts.** Repeatable work becomes a `/skill` with a protocol, not a one-off prompt.
- **Subagents are consultants, not executors.** They propose; you execute and verify independently.
- **Every plan gets an independent review.** No self-review — that's how bugs ship.
- **Quality chain on every change:** plan-review → implement → simplify → verify → ship.

## What's inside

| Skill | What it does |
|---|---|
| `skill-factory` | Scaffold new skills/commands to spec (frontmatter, routing, budget) |
| `plan-review` | Independent senior-engineer review of a plan *before* you build |
| `implement` | Full chain: plan-review → implement → simplify → verify → PR-fix |
| `simplify` | Reuse/quality/efficiency cleanup pass on a diff |
| `verify` | Adversarial "prove it works" audit of completed work |
| `5-whys-fix` | Root-cause analysis → 3 solutions → review → fix → verify |
| `update-memory-bank` | Keep the shared brain current — route the change, sync startHere + sources-of-truth, prune stale context |

*(Sanitized: business-, client-, and personal-data skills are intentionally excluded. The generic, reusable core only.)*

## The shared brain (memory bank)

The `memory-bank/` folder is the context every agent reads so it never re-explains your project. One
file routes everything — [`memory-bank/startHere.md`](memory-bank/startHere.md):

- a **ranked table of contents** (the agent finds the right file instead of guessing),
- a **🟢🟡🔴 size guide** (big files get read summary-first, not loaded whole),
- **`sources_of_truth` frontmatter** (which file wins when two disagree).

**Wire any agent to it** — each tool reads a startup file, and all agent-agnostic rules (including
the mandatory `startHere.md` read) live in one place, `AGENTS.md`, so there's nothing to keep in sync:

| Agent | Startup file | What it says |
|---|---|---|
| Codex / Cursor | `AGENTS.md` | all cross-tool rules + "read `memory-bank/startHere.md` first" |
| Claude Code | `CLAUDE.md` | `@AGENTS.md` import, plus Claude-specific notes only |

`memory-bank/` ships with a small **fictional example project ("Beacon")** so you can see it work —
replace it with your own files and keep the structure.

## Install

```bash
git clone https://github.com/randybasics/claude-code-setup ~/.claude-randybasics
# copy the skills you want into your own .claude/skills/
```

## License

MIT — take it, fork it, make it yours.

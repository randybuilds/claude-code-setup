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

*(Sanitized: business-, client-, and personal-data skills are intentionally excluded. The generic, reusable core only.)*

## Install

```bash
git clone https://github.com/randybasics/claude-code-setup ~/.claude-randybasics
# copy the skills you want into your own .claude/skills/
```

## License

MIT — take it, fork it, make it yours.

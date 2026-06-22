---
name: skill-factory
description: Scaffold a new Claude Code skill or slash command to spec — valid frontmatter, clear triggers, tight protocol. Use when "new skill", "scaffold a skill", "create a command", "make a /skill".
---

# Skill Factory — Scaffold New Skills

## Purpose

Turn a repeatable workflow into a well-formed skill: correct frontmatter, sharp trigger phrases, and a
protocol tight enough that the agent actually follows it. Repeatable work should become a `/skill`, not
a re-typed prompt.

## When to Activate

- "new skill", "scaffold a skill", "create a slash command", "turn this into a skill"

## Protocol

### 1. Define the job in one sentence

What does this skill do, and when should it fire? If you can't say it in one sentence, it's two skills.

### 2. Write the frontmatter

```markdown
---
name: kebab-case-name
description: <what it does> + <the trigger phrases a user would actually say>. Use when "...", "...".
---
```

- `name`: kebab-case, matches the directory.
- `description`: this is what the router reads to auto-activate. Pack in the real trigger phrases —
  the words a user would actually type — not a vague summary.

### 3. Write the protocol

- Number the steps. One action per step.
- Put the decision rules in tables, not prose.
- State the hard rules at the bottom ("always X", "never Y").
- Keep it as short as it can be while still unambiguous. Long skills get skimmed.

### 4. Check for collisions

Does an existing skill already fire on these phrases? If so, add one line to your routing notes
clarifying which skill wins for the overlapping phrase, and why.

### 5. Place the file

```
.claude/skills/<name>/SKILL.md
```

Reference helper files relatively from the skill directory if the protocol needs them.

## Rules

- One concern per skill. If it has two unrelated trigger sets, split it.
- The `description` is the product — most skills fail because the triggers are vague, not because the
  body is wrong.
- Don't duplicate trigger phrases across skills; resolve the collision explicitly.

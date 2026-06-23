---
owner: "[Your Name]"
project: "Beacon (example — replace with your project)"
last_updated: 2026-06-23
sources_of_truth:
  pricing: memory-bank/pricing.md
  architecture: memory-bank/architecture.md
---

# Start Here — the Memory Bank

> **This is the file every AI agent reads first.** It's a table of contents for your project's brain,
> so the agent never starts from zero. "Beacon" below is a **fictional example** — replace it with your
> own project, but keep the three things that make this work: the ranked path list, the size guide, and
> the sources-of-truth.

## Most-Used Paths (ranked — the agent reads top-down)

| # | File | Use it for |
|---|------|-----------|
| 1 | [pricing.md](./pricing.md) 🟢 | **Pricing tiers + billing logic — the source of truth for any price** |
| 2 | [activeContext.md](./activeContext.md) 🟢 | What we're working on right now |
| 3 | [projectbrief.md](./projectbrief.md) 🟢 | What Beacon is and who it's for |
| 4 | [architecture.md](./architecture.md) 🔴 | System design, stack, data model (large — read the Executive Summary first) |

## File Size Guide

- 🟢 **<400 lines** — load it directly.
- 🟡 **400–600 lines** — navigate by section headers.
- 🔴 **>600 lines** — **start with the `## Executive Summary` at the top**, then drill into the section you need. Don't load the whole file.

## Sources of Truth (which file wins when two disagree)

- **Pricing / any dollar figure → [pricing.md](./pricing.md).** If another file shows a different price, it's stale — pricing.md is correct.
- **Architecture / stack → [architecture.md](./architecture.md).**

---
*Keep this map current and the agent stays current. Replace "Beacon" and these files with your project.*

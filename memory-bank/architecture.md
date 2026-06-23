---
size: 🔴
sources_of_truth: [pricing.md]   # any price referenced here is canonical in pricing.md
last_updated: 2026-06-23
---

# Architecture — Beacon

## Executive Summary
Beacon is a standard **Next.js + Postgres + Stripe** app. Frontend is Next.js (App Router) on Vercel;
data is Postgres via Prisma behind REST API routes; auth is Clerk; billing is Stripe (tiers live in
[pricing.md](./pricing.md)). The one non-obvious piece is the **changelog worker** — a nightly cron job
that aggregates shipped tasks into a public changelog. **If you only read this section:** it's a
conventional Next.js/Postgres/Stripe stack, and the only custom moving part is that nightly worker.

> 🔴 This file is large. Read the summary above first; only drill into a section below if you need its detail.

---

## Frontend
- **Framework:** Next.js (App Router), React Server Components where possible.
- **Hosting:** Vercel. Preview deploys per PR.
- **Styling:** Tailwind + a small design-token set.
- **State:** server components + a thin client store for the board drag-and-drop.
- **Key routes:** `/app/projects`, `/app/projects/[id]`, `/app/billing`, `/app/changelog`.

## Auth
- **Provider:** Clerk. Sessions are JWT-backed; middleware guards `/app/*`.
- **Org model:** one Clerk organization per customer; seats map to org members.

## Data model (Postgres via Prisma)
- `Organization` — the billing entity; has many `User`s and `Project`s.
- `User` — belongs to an Organization; role is `owner | admin | member`.
- `Project` — belongs to an Organization; has many `Task`s.
- `Task` — `title`, `status` (`todo | doing | shipped`), `shipped_at`.
- `ChangelogEntry` — generated from shipped tasks; immutable once published.
- Seat counting for billing reads `User` rows per Organization at cycle start.

## API
- REST under `/api/*`, thin handlers calling a `lib/services/*` layer.
- All mutations are validated with zod schemas before hitting Prisma.
- Rate limiting via Upstash on write endpoints.

## Background jobs
- **Changelog worker** (the custom piece): a Vercel cron at 02:00 UTC aggregates the day's
  `status = shipped` tasks per project into a `ChangelogEntry`. Idempotent — safe to re-run.
- **Billing sync:** a Stripe webhook handler reconciles seat counts on subscription events.

## Integrations
- **Slack:** posts a message when a changelog publishes.
- **CSV export:** streams changelog history for a project.

## Testing
- Unit: Vitest on the `lib/services` layer.
- E2E: Playwright on the core create-task → ship → changelog loop.

## Known sharp edges
- The changelog worker assumes UTC; teams in other zones see "yesterday's" entry until 02:00 UTC.
- Seat proration edge cases live in the Stripe webhook handler — change it carefully.

*(Fictional example — replace with your project's real architecture. The point is the structure:
a big file with an Executive Summary up top so an agent reads the summary, not all 80 lines.)*

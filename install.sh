#!/usr/bin/env bash
# install.sh — graft this operating stack into another project.
#
# Copies the reusable payload (.claude/, and the two agent instruction files)
# into a TARGET repo so its agents load the skills and read the same memory bank.
# Your project's own files are never overwritten without --force.
#
# Usage:
#   ./install.sh /path/to/target-repo          # copy skills + settings + instruction files
#   ./install.sh --force /path/to/target-repo  # overwrite existing files in target
#
# What it copies:
#   .claude/skills/     -> the 7 skills (auto-loaded by Claude Code)
#   .claude/settings.json
#   AGENTS.md CLAUDE.md   -> AGENTS.md holds all agent-agnostic rules; CLAUDE.md imports it via
#                            @AGENTS.md and adds Claude-specific notes only
#
# What it does NOT copy:
#   memory-bank/  (that's YOUR project's brain — start it with `startHere.md` as the template)
#   .claude/settings.local.json  (machine-local, gitignored)

set -euo pipefail

FORCE=0
if [[ "${1:-}" == "--force" ]]; then
  FORCE=1
  shift
fi

TARGET="${1:-}"
if [[ -z "$TARGET" ]]; then
  echo "usage: ./install.sh [--force] /path/to/target-repo" >&2
  exit 1
fi
if [[ ! -d "$TARGET" ]]; then
  echo "❌ target directory does not exist: $TARGET" >&2
  exit 1
fi

SRC="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CP_OPTS=(-R)
[[ $FORCE -eq 1 ]] && CP_OPTS+=(-f) || CP_OPTS+=(-n)

copy() {
  local rel="$1"
  local dest="$TARGET/$rel"
  mkdir -p "$(dirname "$dest")"
  cp "${CP_OPTS[@]}" "$SRC/$rel" "$dest"
  echo "  ✓ $rel"
}

echo "Installing agentic-friendly-template into: $TARGET"
[[ $FORCE -eq 1 ]] && echo "(force: existing files WILL be overwritten)" || echo "(safe: existing files are preserved; use --force to overwrite)"

copy ".claude/skills"
copy ".claude/settings.json"
copy "AGENTS.md"
copy "CLAUDE.md"

echo
echo "Done. Next steps in $TARGET:"
echo "  1. Start your memory bank — copy this repo's memory-bank/startHere.md and replace 'Beacon' with your project."
echo "  2. Open the project in Claude Code and run /help to confirm the skills loaded."

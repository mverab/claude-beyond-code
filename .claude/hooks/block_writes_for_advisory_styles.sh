#!/usr/bin/env bash
# Blocks write/edit operations when running an advisory-only style.
# This is a minimal, opt-in example. Exit code 2 blocks the tool in Claude Code.

set -euo pipefail

# Toggle via environment or sentinel file to stay generic.
SENTINEL=".claude/hooks/.advisory_mode"

if [[ -f "$SENTINEL" ]] || [[ "${BLOCK_WRITES_FOR_ADVISORY_STYLE:-}" == "true" ]]; then
  echo "Blocked: Write/Edit tools are disabled in advisory-only mode. Remove $SENTINEL or unset BLOCK_WRITES_FOR_ADVISORY_STYLE to allow."
  exit 2
fi

# Otherwise allow
exit 0
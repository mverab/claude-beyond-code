# Hooks (optional)

Hooks let you enforce guardrails around tool use (e.g., block writes in advisory-only styles). This folder provides an optional example.

## Example: Block writes in advisory-only styles
- Script: `.claude/hooks/block_writes_for_advisory_styles.sh`
- Suggested config: `.claude/settings.example.json` (copy to `.claude/settings.json` to enable)

Notes:
- The script exits with code 2 to block a tool and prints a reason.
- Keep this opt-in. Start with least privileges and widen only when needed.

## Enable (optional)
1) Make the script executable:
```
chmod +x .claude/hooks/block_writes_for_advisory_styles.sh
```
2) Copy settings example to activate locally:
```
cp .claude/settings.example.json .claude/settings.json
```
# Project Subagents

Project subagents live in `.claude/agents/` and take priority over user-level subagents in `~/.claude/agents/` when names conflict.

## What they are
Subagents are specialized assistants with their own context, prompt, and tool permissions. Claude can delegate to them automatically or you can ask explicitly.

## How to use
- Automatic delegation: When your request matches a subagent's `description` and it has the right tools.
- Explicit invocation: Ask directly, e.g.:
  - `Use the log-slicer subagent to analyze logs in logs/ for 'timeout' patterns`
  - `Have snippet-extractor pull usage examples for the Foo API from src/`
  - `Ask html-saver to persist the last HTML response as "demo"`
- Manage via `/agents`: view, create, edit, or remove project/user subagents and their tool permissions.

## Tool permissions
- Omit `tools` to inherit all tools from the main thread (including MCP tools).
- Specify `tools: ...` to restrict access.

This repo's subagents are intentionally minimal:
- `log-slicer` → Tools: Read, Grep, Glob. Advisory-only (no writes).
- `snippet-extractor` → Tools: Read, Grep. Advisory-only (no writes).
- `html-saver` → Tool: Write only. Persists HTML to `terminal_output_[name]_[YYYYMMDD_HHMMSS].html` (UTC), never overwrites existing files.

## Best practices
- Keep subagents focused and action-oriented.
- Grant least privileges.
- Prefer concise, structured outputs.

## References
- Anthropic docs: Subagents — https://docs.anthropic.com/en/docs/claude-code/sub-agents
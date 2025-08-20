# Claude-Beyond-Code

A curated library of Output Styles that transform Claude Code into specialized agents for non‑coding roles while keeping its local powers (read/write files, run scripts, TODOs).

## Why Output Styles
- Output Styles replace the default system prompt and turn Claude into a different agent with its own rules and formatting.
- Pair them with Slash Commands, Subagents, and Hooks to ship ready-to-use workflows.

## Included Styles (MVP)
- 🖥️ **html-terminal**: Claude outputs retro terminal‑style HTML only with strict formatting and saving rules.
- 📝 **docs-writer**: Technical documentation specialist with templates (README, ADR) and writing rules.
- 🚨 **sre-incident-scribe**: Incident log keeper with chronological updates and structured postmortems.

## Quickstart
1) Project-level installation (recommended)
```bash
cp -r path/to/claude-beyond-code/.claude .
```
2) Activate a style
```
/output-style html-terminal
/output-style docs-writer
/output-style sre-incident-scribe
```
3) Use style commands
```
/docs:readme
/sre:triage "Database connection failures"
/sre:update "Applied hotfix v2.1.1"
```

## Subagents (optional, MVP-aligned)
Project subagents live in `.claude/agents/`. Claude can delegate to them automatically when appropriate, or you can invoke them explicitly (see `/agents` UI or ask "Use the X subagent …").

- 🔎 **log-slicer** (for SRE)
  - Tools: Read, Grep, Glob
  - When to use: Segment and summarize large logs during incidents. Returns structured findings, evidence, metrics, and next steps.
  - Example: "Use the log-slicer subagent to analyze logs in logs/ for 'timeout' patterns".

- 📎 **snippet-extractor** (for Docs)
  - Tools: Read, Grep
  - When to use: Extract code snippets with context (path/language) to enrich READMEs/ADRs.
  - Example: "Have snippet-extractor pull usage examples for the Foo API from src/".

- 💾 **html-saver** (for HTML Terminal)
  - Tools: Write
  - When to use: Persist HTML produced by `html-terminal` using `terminal_output_[name]_[YYYYMMDD_HHMMSS].html`.
  - Example: "Ask html-saver to persist the last HTML response as a preview file".

> Note: These subagents are optional and scoped with minimal permissions to keep the MVP safe.

## Repository Structure

### Actual (MVP)
```
.claude/
├── output-styles/
│   ├── html-terminal.md
│   ├── docs-writer.md
│   └── sre-incident-scribe.md
├── agents/
│   ├── log-slicer.md
│   ├── snippet-extractor.md
│   └── html-saver.md
├── commands/
│   ├── docs-readme.md
│   ├── sre-triage.md
│   └── sre-update.md
├── examples/
│   ├── docs-writer-example.md
│   ├── sre-scribe-example.md
│   ├── log-slicer-example.md
│   ├── snippet-extractor-example.md
│   └── html-saver-example.md
└── recipes/
    └── sre-quick-playbook.md
```

### Reference (extended from `skeleton.md` plan)
```
/styles         # Styles by category with README, examples, compatibility notes
/commands       # Slash command templates per style
/agents         # Optional subagents for focused delegation by task
/hooks          # Validation/safety hooks (e.g., block writes in advisory-only styles)
/recipes        # Playbooks (style + commands + agents + hooks)
/evals          # Deterministic checks (schema markdown, unified diff, etc.)
/examples       # End-to-end demos per style
.claude/output-styles  # Project-level style templates, ready to copy
.claude/commands       # Project-level command templates
.claude/examples       # Project-level examples
.claude/recipes        # Project-level recipes
```

## Principles
- Keep it simple and safe (least privileges).
- Clarity over complexity.
- Styles transform behavior; commands and subagents operationalize it.

## Short Roadmap
- Minimal hooks: block Write in advisory-only styles; diff validator for future security styles.
- Workflow recipes (incident write-up, quick ADR).
- Lightweight evals and CI to validate formats.

## Optional SEO System (Agent-first)
The SEO pack lives in `systems/seo/` to keep `.claude/` clean. It's opt-in and agent-first (subagents over slash commands). Install via terminal:

- Project-level copy (recommended)
```bash
chmod +x systems/seo/install.sh
./systems/seo/install.sh --project --copy --all
```

- User-level symlinks (profile-wide)
```bash
./systems/seo/install.sh --user --symlink --agents --styles
```

- Minimal agent-first (agents + styles only)
```bash
./systems/seo/install.sh --project --copy --agents --styles
```

Usage after install:
- Switch style: `/output-style seo-strategist`
- Subagents: `/agents brief-architect`, `/agents keyword-clusterer`, `/agents optimizer`, `/agents refresh-auditor`, `/agents cluster-planner`, `/agents gap-analyst`, `/agents serp-analyst`, `/agents entity-clusterer`, `/agents internal-linker`
- Commands are optional wrappers if you also install `systems/seo/commands/`

Safety: all agents are advisory by default (Markdown/diffs first). Existing hooks can block writes unless explicitly approved.

Uninstall: remove copies/symlinks under `.claude/`.

## Contributing
Open an issue with the proposed style/subagent, a clear purpose, and two usage examples. See `CONTRIBUTING.md`.
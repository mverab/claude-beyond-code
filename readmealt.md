Claude-Beyond-Code

Turn Claude Code into production-ready systems that go beyond coding. This repo provides battle-tested Output Styles, Slash Commands, Subagents, and Hooks you can copy into any project for instant, repeatable workflows.

Beyond code = specialized roles + safe automation: styles transform behavior, commands operationalize tasks, subagents focus scope, and hooks enforce safety.

Why this exists

Claude Code is great at editing files. It becomes exceptional when you outfit it with:

Output Styles to swap the system prompt for a specialized role (e.g., Docs Writer, SRE Scribe, SEO Strategist).

Slash Commands to encode repeatable steps (triage, brief, optimize) and reduce prompt drift.

Subagents for well-scoped delegation (e.g., log analysis, snippet extraction).

Hooks to enforce guardrails (advisory-only modes, diff validation, format checks).

What you get (MVP)

Styles

🖥️ html-terminal: Retro terminal-style HTML, strict formatting/saving rules.

📝 docs-writer: Technical documentation specialist with templates (README, ADR).

🚨 sre-incident-scribe: Incident log keeper with chronological updates and postmortems.

Commands

📄 docs-readme • 🔧 sre-triage • 🧩 sre-update

Subagents

🔎 log-slicer • 📎 snippet-extractor • 💾 html-saver

Hooks

🛡️ block_writes_for_advisory_styles.sh
Quickstart
Copy the .claude folder into your project (recommended per-project)
cp -r path/to/claude-beyond-code/.claude .

Activate a style
/output-style html-terminal
/output-style docs-writer
/output-style sre-incident-scribe

Run a command
/docs:readme
/sre:triage "Database connection failures"
/sre:update "Applied hotfix v2.1.1"

Examples

Docs Writer: .claude/examples/docs-writer-example.md

SRE Scribe: .claude/examples/sre-scribe-example.md

Log Slicer: .claude/examples/log-slicer-example.md

Snippet Extractor: .claude/examples/snippet-extractor-example.md

HTML Saver: .claude/examples/html-saver-example.md

Repository structure (MVP)
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

Optional: SEO 2025 (agent-first system)

SEO lives under systems/seo/ to keep .claude/ clean. Install per project:

chmod +x systems/seo/install.sh
./systems/seo/install.sh --project --copy --all


Then in Claude Code:

Switch style: /output-style seo-strategist

Use subagents: /agents serp-analyst, /agents entity-clusterer, /agents optimizer, /agents refresh-auditor, etc.

Optional commands are in systems/seo/commands/ if you installed them.

All SEO agents are advisory by default; pair with hooks to block writes unless you explicitly approve.

Safety & guardrails

Keep subagents least-privileged (e.g., log-slicer = Read/Grep/Glob only).

Use hooks (e.g., block writes in advisory-only styles) for extra assurance.

Prefer diffs first, then explicit apply steps.

Contributing

Propose a new style or subagent with:

Purpose and scope

Behavior/constraints

Two short usage examples

See CONTRIBUTING.md. We welcome small, focused PRs.

References

Anthropic: Output Styles • Subagents • Hooks

https://docs.anthropic.com/en/docs/claude-code/output-styles

https://docs.anthropic.com/en/docs/claude-code/sub-agents

https://docs.anthropic.com/en/docs/claude-code/hooks
# SEO System (Agent-first)

A modular, opt-in SEO pack designed to keep `.claude/` clean while enabling agentic SEO workflows.

## Value proposition
- Agent-first: subagents handle briefs, clustering, optimization, audits, clustering plans, and gap analysis.
- Opt-in installation via terminal (project or user scope).
- Safe-by-default: advisory mode returns Markdown/diffs; no writes unless explicitly approved.

## Components

- Output Styles (`systems/seo/output-styles/`)
  - `seo-strategist.md` — Strategy + briefs + clustering rules
  - `content-editor-in-chief.md` — Audits + refresh plans
  - `market-intel-analyst.md` — Competitive SERP patterns

- Subagents (`systems/seo/agents/`)
  - `brief-architect.md` — SEO briefs (intent, entities, outline, info gain, schema)
  - `keyword-clusterer.md` — Keyword/intent clusters + mapping to outline/sections
  - `optimizer.md` — Diff proposals against brief/cluster (meta, headings, FAQs, schema)
  - `refresh-auditor.md` — Content decay + topical gaps + prioritized backlog
  - `cluster-planner.md` — Pillar/supporting plan + internal link map
  - `gap-analyst.md` — SERP gap report + differentiation plan
  - Plus base agents: `serp-analyst.md`, `entity-clusterer.md`, `internal-linker.md`

- Commands (optional wrappers) (`systems/seo/commands/`)
  - Provided for convenience; agent-first usage does not require installing them.

## Install (terminal)

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

## Usage
- Switch style:
```text
/output-style seo-strategist
```
- Call subagents:
```text
/agents list
/agents brief-architect
/agents keyword-clusterer
/agents optimizer
/agents refresh-auditor
/agents cluster-planner
/agents gap-analyst
/agents serp-analyst
/agents entity-clusterer
/agents internal-linker
```
- Safety: all subagents are advisory by default. Existing hooks can block writes unless explicitly approved.

## Uninstall
- Remove copies/symlinks under `.claude/` (project or user scope) corresponding to the installed components.

## Rationale for separation
- Keeps the project’s `.claude/` lean.
- Clear value prop and explicit opt-in for SEO workflows.
- Compatible with other styles/subagents without namespace collisions.

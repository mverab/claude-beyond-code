---
name: seo:brief
description: Create an SEO content brief grounded in current SERPs and competitors.
prompt: |
  Create a content brief for: $ARGUMENTS

  Steps:
  - Use WebSearch to scan current SERPs and competitors. Identify intent, main entities, PAA, featured snippets, and if AI Overviews appear.
  - Produce: Objective, Reader/Job-to-be-done, Primary/Secondary intents, Entities, Outline (H3/H4), "information gain" angles, internal link targets, external sources, and JSON-LD Article schema draft.
  - Output Markdown only. Do NOT edit files. Ask before writing anything to disk.
---

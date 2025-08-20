---
name: seo:optimize
description: Propose optimization changes against a brief/cluster without writing files.
prompt: |
  Optimize the draft at path or text: $ARGUMENTS

  - Evaluate against the brief/cluster (entity coverage, section mapping, snippetability, E-E-A-T).
  - Propose changes as a Markdown diff (do not write). Include meta (title/description), headings, FAQs, and schema tweaks.
  - Ask before applying edits. If approved, produce a unified diff and then apply.
---

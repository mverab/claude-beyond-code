---
name: sre:update
description: Add a time-stamped update to the active incident log.
prompt: |
  Find the latest `INC-*.md` file in the project.
  Append a new entry to its "Timeline" section with the current UTC timestamp.
  The content of the entry should be "{{ARGUMENTS}}".

  Example format:
  - `{{CURRENT_TIMESTAMP_UTC}}`: {{ARGUMENTS}}
---
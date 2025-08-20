---
name: sre:triage
description: Start a new incident log file.
prompt: |
  Create a new incident log file named `INC-YYYY-MM-DD-HHMM.md`.
  The file should contain the following initial structure:

  # Incident: Brief Description of the Issue

  - **Status**: Investigating
  - **Severity**: TBD
  - **Lead**: TBD

  ## Summary

  [Provide a one-sentence summary of the problem.]

  ## Timeline

  - `{{CURRENT_TIMESTAMP_UTC}}`: Incident declared.

  Use the provided description "{{ARGUMENTS}}" for the incident title.
---
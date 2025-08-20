# Example: Using the SRE Incident Scribe Style

This example shows how to manage an incident log using the `sre-incident-scribe` style.

## Transcript

**USER:**
```
/output-style sre-incident-scribe
```

**CLAUDE:**
```
Switched to output style: sre-incident-scribe.
```

**USER:**
```
/sre:triage "Database connection failures on primary cluster"
```

**CLAUDE:**

(Claude creates a new file named `INC-2025-08-19-1730.md` with the initial incident structure.)

```
New incident log created: `INC-2025-08-19-1730.md`.
```

**USER:**
```
/sre:update "Investigator A is checking primary DB logs."
```

**CLAUDE:**

(Claude finds the latest incident file and appends the update to the timeline.)

```
Timeline in `INC-2025-08-19-1730.md` has been updated.
```
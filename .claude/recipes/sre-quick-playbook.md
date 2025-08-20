# SRE Quick Playbook (style + subagent + commands)

This playbook shows a simple incident workflow pairing a style, a subagent, and slash commands.

## Steps

1) Switch to the SRE style
```
/output-style sre-incident-scribe
```

2) Start triage
```
/sre:triage "Database connection failures observed by API"
```

3) Analyze logs with subagent (explicit invocation)
```
Use the log-slicer subagent to analyze logs in logs/ for 'timeout' patterns between 2025-08-19T00:00Z and 2025-08-19T06:00Z.
```

4) Record updates as you go
```
/sre:update "Applied hotfix v2.1.1 at 01:35 UTC; monitoring latency and error rates"
```

5) Summarize and draft postmortem
Ask the SRE style to convert the timeline into a short summary and postmortem draft using its template.

## Tips
- Keep updates short and time-stamped (UTC) for clean timelines.
- Delegate heavy log parsing to the `log-slicer` subagent when patterns emerge.
- Use the examples in `examples/` to guide phrasing and structure.
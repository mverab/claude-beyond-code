# log-slicer subagent — Example

Prompt (explicit invocation):

> Use the log-slicer subagent to analyze logs in logs/ for 'timeout' patterns between 2025-08-19T00:00Z and 2025-08-19T06:00Z.

Expected structured output (shape):

- Findings
  - [P1] Timeout spikes observed around 01:17–01:25 UTC
  - [P2] Repeated upstream 502s from service X
- Evidence
  - logs/app.log: L14023–L14550 (timeout occurrences)
  - logs/nginx.error.log: L502–L670 (502 patterns)
- Metrics
  - timeouts: 132 (window 6h), 4.2% of total requests
  - 502s: 89 (window 6h), co-located with timeout bursts
- Next steps
  - Correlate with deploy at 01:10 UTC; compare latency histograms pre/post
  - Enable debug logging for upstream service X for 30m

Tip: You can omit the time window; the agent will infer peak windows if not supplied.
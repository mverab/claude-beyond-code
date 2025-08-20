# html-saver subagent — Example

Context: You're using the `html-terminal` output style. After Claude returns an HTML response, persist it.

Prompt (explicit invocation):

> Ask html-saver to persist the last HTML response as "demo".

Expected behavior:
- Saves a new file named `terminal_output_demo_[YYYYMMDD_HHMMSS].html` (UTC timestamp)
- Never overwrites existing files
- Returns the absolute saved path

Validation steps (manual):
- Open the saved file in your browser.
- Confirm retro terminal styling and content render as expected.
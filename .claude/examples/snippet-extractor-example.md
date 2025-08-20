# snippet-extractor subagent — Example

Prompt (explicit invocation):

> Have snippet-extractor pull usage examples for the Foo API from src/.

Expected output (Snippet Blocks):

- Title: Minimal Foo client init
  File: src/foo/client.ts
  Language: typescript
  Snippet:
  ```ts
  import { FooClient } from "./client";
  const foo = new FooClient({ apiKey: process.env.FOO_API_KEY! });
  await foo.connect();
  ```
  Notes: Basic client initialization with env-based key.

- Title: Fetch Foo by ID
  File: src/foo/service.ts
  Language: typescript
  Snippet:
  ```ts
  const item = await foo.getById("123");
  console.log(item.name);
  ```
  Notes: Common retrieval pattern.

Tip: Keep snippets concise and runnable where possible.
# Claude-Beyond-Code (MVP)

This project provides a curated library of "beyond code" output styles for Claude, making it an expert assistant for non-coding roles while retaining its powerful local automation capabilities.

This MVP (Minimum Viable Product) includes two initial styles to demonstrate the core functionality.

## Included Styles (v0.1)

1.  **Docs/Tech Writer (`docs-writer`)**: A style for generating high-quality technical documentation, READMEs, and Architecture Decision Records (ADRs).
2.  **SRE Incident Scribe (`sre-incident-scribe`)**: A specialized style for maintaining structured, time-stamped logs during incidents.

## Quickstart

1.  **Installation**: Copy the `.claude` directory from this repository into your project's root folder.

    ```bash
    # From the root of your project
    cp -r path/to/claude-beyond-code/.claude .
    ```

2.  **Activate a Style**: In your IDE with the Claude extension, start a conversation and use the `/output-style` command to switch to a desired style.

    *To use the Tech Writer style:*
    ```
    /output-style docs-writer
    ```

    *To use the SRE Scribe style:*
    ```
    /output-style sre-incident-scribe
    ```

3.  **Use Commands**: Once a style is active, you can use its associated slash commands to perform specific tasks. For example, with `docs-writer` active:

    ```
    /docs:readme
    ```

    This will generate a README file based on the context of your project.

## Contributing

We welcome contributions! Please see `CONTRIBUTING.md` for more details.
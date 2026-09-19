# MCP catalog

Rank: **1** default, **2** common, **3** criteria, **X** avoid.

| Option | Rank | Use when | Avoid when |
| --- | --- | --- | --- |
| **None / in-process tools** | 1 | One product runtime | Tools must be shared with IDE/hosts |
| **MCP server (domain)** | 2 | Reuse in Cursor/Claude/other agents; polyglot | Single caller |
| **In-process MCP** (FastMCP in the same process) | 2 | Test or one process, keep MCP API | Extra protocol with no second client |
| **Remote Streamable HTTP MCP** | 3 | Separate scale/team for tools | Local-only tools |
| **stdio MCP** | 2 | Desktop/IDE host, local binaries | Multi-tenant SaaS path |
| **Resources / prompts / sampling** | 3 | Spec features you will implement | Copying tools into “resources” |

## Granularity

One MCP server per **bounded context** (e.g. billing, repo, CRM). Prefix tool names per server.

## Transports

| Transport | Rank | Use when |
| --- | --- | --- |
| stdio | 2 | Local host |
| Streamable HTTP | 2 | Remote |
| SSE (legacy) | 3 | Old clients |
| In-process | 2 | Tests / single process |

## Security

- Authn on remote MCP (OAuth/OIDC or mTLS). No open `/mcp`.
- Confused deputy: the server must authz as the **user**, not the host.
- Tool results can be prompt-injection; sanitize and minimize.
- Do not expose admin tools on the same server as user tools.

MCP is a **tool distribution** protocol. Product HTTP APIs stay in ADR 0008.

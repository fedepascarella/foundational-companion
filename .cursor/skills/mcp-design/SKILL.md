---
name: mcp-design
description: >-
  Chooses in-process tools vs Model Context Protocol servers (transport, auth,
  granularity). Use during the Gen AI second pass or when writing ADR 0017.
disable-model-invocation: true
---

# MCP design

Default bet: **in-process tools** in the product API. MCP when a tool must be reused across **hosts** (Cursor, Claude Desktop, another service) or languages/processes.

## Workflow

1. If ADR 0016 is none → MCP is **none**.
2. For each tool: in-process vs MCP. Score [reference.md](reference.md).
3. If MCP: one server per domain, transport, auth, who the host is.
4. Emit a Decision block.

## Default bet

In-process functions. Add MCP later if a second host appears.

## Veto

- MCP wrapping a function the agent already imports
- One megaserver for the whole company on day one
- Unauthenticated remote MCP on the public internet
- MCP as a substitute for API design (ADR 0008)

## Decision block

- Skill: mcp-design
- Choice: none | in-process | MCP servers (list)
- Transport / auth:
- Feeds: llm-providers-frameworks, infra-architecture (if a new process)

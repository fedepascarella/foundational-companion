# MCP and tools

Skip if ADR 0016 is no tools.

```mermaid
flowchart LR
  agent[Agent] --> tools[In-process tools]
  agent --> mcp[MCP server]
  mcp --> sys[External system]
```

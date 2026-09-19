# Architecture

Mermaid diagrams, GitHub-native. Keep them in sync with accepted ADRs.

| File | Contents |
| --- | --- |
| [c4-context.md](c4-context.md) | System and actors |
| [c4-container.md](c4-container.md) | Deployable units |
| [c4-component.md](c4-component.md) | Module boundaries (skip if a single process with no modules) |
| [deployment.md](deployment.md) | Runtime topology |
| [api.md](api.md) | API style, auth, versioning |
| [cicd.md](cicd.md) | Pipeline |
| [sequences.md](sequences.md) | Only the one or two PRD-critical flows |
| [gen-ai.md](gen-ai.md) | LLM job + runtime (Gen AI pass) |
| [agent-topology.md](agent-topology.md) | Agents / sub-agents (skip if single call or none) |
| [rag.md](rag.md) | Retrieval pipeline (skip if no RAG) |
| [mcp-tools.md](mcp-tools.md) | Tools / MCP map (skip if no tools) |

Do not add diagrams that restated an ADR in pictures with no new information.

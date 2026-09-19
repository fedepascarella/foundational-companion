# Architecture decision records

Numbered MADR files. Git is the version history. Supersede with `Superseded-by: NNNN` — do not rewrite accepted ADRs in place.

| File | Decision |
| --- | --- |
| [0000-index.md](0000-index.md) | Overview of the accepted pack |
| `0001-system-decomposition.md` | Monolith / modular / micro |
| `0002-repo-structure.md` | Repo and folders |
| `0003-swe-patterns.md` | Architecture / integration / resilience |
| `0004-programming-paradigm.md` | OOP / FP / hybrid |
| `0005-code-patterns.md` | Chosen code patterns |
| `0006-dsa-structures.md` | Data structures |
| `0007-backend-tech-stack.md` | Language, framework, data |
| `0008-api-design.md` | API styles + security |
| `0009-infra-architecture.md` | Compute, data, identity |
| `0010-cicd.md` | Pipeline and branching |
| `0011-llm-patterns.md` | LLM job (or no Gen AI) |
| `0012-agentic-patterns.md` | Agent loop vs workflow |
| `0013-agent-topology.md` | Agents and sub-agents |
| `0014-rag-patterns.md` | Retrieval / grounding |
| `0015-memory-management.md` | Memory |
| `0016-tool-design.md` | Tools |
| `0017-mcp-design.md` | MCP vs in-process |
| `0018-prompt-caching.md` | Prompt cache |
| `0019-llm-providers-frameworks.md` | Provider + framework |

Copy [TEMPLATE.md](TEMPLATE.md) for each new ADR. Gen AI ADRs are a **second pass** — skip 0011–0019 if the product has no LLM job. If invoked anyway, write only `0011-no-gen-ai.md`.

# Example: in-app support assistant over a small help center

**Architecture already accepted:** modular monolith, TypeScript, Postgres, REST.

**PRD signals:** chat widget, ~200 help articles, no payments from the bot, one team.

## Decision blocks (compressed)

| Skill | Choice | YAGNI veto |
| --- | --- | --- |
| llm-patterns | RAG-grounded chat + structured extract for ticket fields | Fine-tune, agent mesh |
| agentic-patterns | Deterministic: retrieve → generate → cite. Not ReAct | Unbounded tool loop |
| agent-topology | No agent — one orchestrated function | Supervisor + specialists |
| rag-patterns | Hybrid BM25 + embeddings in Postgres, rerank, citations | Dedicated vector DB, GraphRAG |
| memory-management | Session window 20 turns; no long-term user memory | Memory product |
| tool-design | None, or one `create_ticket` with confirm | SQL tool |
| mcp-design | In-process | MCP server |
| prompt-caching | Cache system + retrieval instructions; articles not in prefix | Caching per-user PII |
| llm-providers-frameworks | Provider SDK in the existing TS API; no LangGraph | Dual-provider abstraction |

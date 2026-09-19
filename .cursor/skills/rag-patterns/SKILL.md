---
name: rag-patterns
description: >-
  Chooses retrieval and grounding patterns (stuff-in-context, hybrid search,
  rerank, GraphRAG, or none). Use during the Gen AI second pass or when writing
  ADR 0014.
disable-model-invocation: true
---

# RAG patterns

Default bet: **no RAG**. If the corpus fits in the prompt (or a cached prefix), stuff it. Add retrieval when the corpus is large, must stay fresh, or must be cited.

## Workflow

1. Estimate corpus size, freshness, citation need, and access control.
2. Score [reference.md](reference.md).
3. Pick chunking + index location (prefer **Postgres** FTS/pgvector before a new DB).
4. Require citations if answers may be wrong.
5. Emit a Decision block.

## Default bet

Stuff-in-context or hybrid BM25 + embeddings **in Postgres**, top-k, optional rerank, generate with citations.

## Veto

- Vector DB for a handful of PDFs
- GraphRAG for FAQs
- Agentic RAG before naive/hybrid fails
- Embeddings without an access-control filter on retrieve

## Decision block

- Skill: rag-patterns
- Choice: none | stuff | hybrid | …
- Index / chunking / citations:
- Feeds: memory-management, prompt-caching, llm-providers-frameworks

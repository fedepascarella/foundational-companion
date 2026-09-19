# RAG patterns catalog

Rank: **1** default, **2** common, **3** criteria, **X** avoid unless named.

| Pattern | Rank | Use when | Avoid when |
| --- | --- | --- | --- |
| **None** | 1 | Model already knows, or no corpus | Grounding is required |
| **Stuff-in-context** | 1 | Small stable corpus | Fresh/large corpus |
| **Naive vector RAG** | 2 | Semantic questions, prototype | Keyword-heavy IDs/codes |
| **Hybrid BM25 + vector** | 1 | Default when retrieving | — |
| **Query rewrite / multi-query / HyDE** | 2 | Vague user questions | Clean keyword queries |
| **Parent-doc / small-to-big** | 2 | Small chunks retrieve, large chunks generate | Tiny FAQ cards |
| **Rerank** | 2 | Top-k is noisy | k=3 always perfect |
| **Contextual retrieval** (chunk + context prefix) | 2 | Chunks lack headings | Cost of rewrite at ingest is too high |
| **Citations / grounded generate** | 1 | User-facing Q&A | Internal classify |
| **Agentic RAG** | 3 | Retrieve-or-not is a tool choice | Fixed retrieve-then-generate |
| **CRAG / Self-RAG** | 3 | You will eval relevance and retry | No eval |
| **GraphRAG** | 3 | Relations/entities are the question | Document FAQ |
| **RAPTOR / hierarchical summaries** | 3 | Long books, theme questions | Short tickets |

## Index home

| Store | Rank |
| --- | --- |
| Postgres FTS + pgvector | 1 |
| Dedicated vector DB | 3 | measured scale / isolation |
| Files + grep | 2 | code/docs agents |

## Chunking (pick one)

By heading/markdown structure (preferred), then token window with overlap. Do not split mid-table if tables matter.

Always filter retrieval by **tenant/ACL** before the model sees chunks.

# Memory catalog

Rank: **1** default, **2** common, **3** criteria, **X** avoid.

| Kind | Rank | Use when | Avoid when |
| --- | --- | --- | --- |
| **Stateless** | 2 | One-shot extract/classify | Multi-turn chat |
| **Sliding window** | 1 | Chat | Unbounded history |
| **Compaction / running summary** | 2 | Long sessions | Summary as the only source of truth |
| **Scratchpad** (agent working memory) | 2 | Plan-and-execute | Persisting scratch to the user DB by accident |
| **Episodic** (what happened) | 3 | “Last time we…” | Replay of raw logs into the prompt |
| **Semantic facts** (user/org attributes) | 2 | Preferences, account state | Duplicating the OLTP schema in a vector store |
| **Procedural** (how to do a task) | 3 | Learned playbooks | Fine-tune-by-memory |
| **OS-style hierarchical memory** | X | Research agents with huge state | Product chat |

## Where it lives

| Store | Rank | Use when |
| --- | --- | --- |
| In-request messages | 1 | Window |
| Postgres row (session JSON / facts table) | 1 | Durable, ACL, audit |
| Object store transcripts | 2 | Compliance archive, not live prompt |
| Vector memory | 3 | Fuzzy recall over large histories after window+SQL fail |

## Isolation

Session ⊂ user ⊂ org. Filter by tenant. Do not put org RAG docs in “chat memory” — that is `rag-patterns`.

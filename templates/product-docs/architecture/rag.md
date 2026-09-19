# RAG

Skip if ADR 0014 is stuff-in-context or no retrieval.

```mermaid
flowchart LR
  q[Query] --> rewrite[Query rewrite]
  rewrite --> retrieve[Hybrid retrieve]
  retrieve --> rerank[Rerank]
  rerank --> gen[Generate with citations]
```

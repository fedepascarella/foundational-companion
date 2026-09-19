# Gen AI

Fill from ADRs 0011–0019. Skip this file if there is no LLM job.

```mermaid
flowchart LR
  user[User] --> app[Product API]
  app --> llm[Model]
  app --> db[(Postgres)]
```

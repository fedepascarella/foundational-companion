# SWE patterns catalog

Architecture / integration / resilience. Rank: **1** default, **2** common, **3** criteria, **X** greenfield avoid.

## Application shape

| Pattern | Rank | Use when | Avoid when |
| --- | --- | --- | --- |
| **Vertical slice** | 1 | Default. Feature owns its API + domain + data | Shared kernel is actually a platform (it isn't yet) |
| **Layered** | 2 | Tiny CRUD, team already thinks in layers | Growing domain, cross-cutting features |
| **Modular monolith modules** | 1 | Multiple bounded contexts, one process | Fake modules that import tables across boundaries |
| **Hexagonal / ports-adapters** | 2 | Unstable external systems | Internal-only logic |
| **Clean / onion** | 2 | Same as hexagonal; pick **one** name | Stacking hexagonal + clean + DDD folders |
| **MVC** | 2 | Server-rendered HTML | JSON API (use slices) |
| **BFF** | 3 | Two+ client types with different aggregates | One client |
| **ACL (anti-corruption layer)** | 2 | Integrating a messy external/legacy model | Wrapping your own DB |
| **Strangler fig** | 3 | Replacing a live system incrementally | Greenfield |

## DDD tactical (application, not GoF)

| Pattern | Rank | Use when | Avoid when |
| --- | --- | --- | --- |
| **Repository** | 2 | Hides a real persistence seam | 1:1 wrapper around an ORM with no benefit |
| **Unit of work** | 2 | Framework doesn't already provide transactions | Extra abstraction over `db.transaction` |
| **Aggregate** | 2 | Invariants span multiple entities | Every table is an "aggregate" |
| **Domain events** (in-process) | 2 | Decouple modules without a bus | Replacing function calls inside one module |
| **Specification** | 3 | Reused, tested business predicates | One-off filters |

## Integration / consistency

| Pattern | Rank | Use when | Avoid when |
| --- | --- | --- | --- |
| **Transactional outbox** | 3 | Must publish after commit across a real message broker | In-process modules |
| **Saga / process manager** | 3 | Multi-service business transaction | One database |
| **CQRS** | 3 | Read model truly different from write; proven pain | Wanting "faster reads" with no evidence |
| **Event sourcing** | 3 | Audit/replay is the domain (finance ledgers, collaboration) | CRUD with history table needs |
| **Choreography vs orchestration** | 3 | Multiple services cooperating | Modular monolith |

## Resilience

| Pattern | Rank | Use when | Avoid when |
| --- | --- | --- | --- |
| **Timeout** | 1 | Every outbound I/O | — |
| **Retry + jitter** | 1 | Idempotent or explicitly safe retries | Non-idempotent POST without keys |
| **Idempotency keys** | 1 | Client retries on create/update/pay | Read endpoints |
| **Circuit breaker** | 3 | Calling a flaky *remote* dependency at scale | Local Postgres |
| **Bulkhead** | 3 | Isolate thread/pool per dependency | Single worker |
| **Cache-aside** | 3 | Hot read, measured DB pain | Caching because it feels professional |

Cross-link: BFF HTTP surface is decided in `api-design`.

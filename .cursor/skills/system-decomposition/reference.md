# System decomposition catalog

Rank: **1** default, **2** common alternative, **3** only when criteria fire, **X** avoid.

| Option | Rank | Use when | Avoid when |
| --- | --- | --- | --- |
| **Monolith** (single module) | 2 | Tiny surface, one domain, 1–2 people, prototype | Multiple bounded contexts or teams will step on each other |
| **Modular monolith** | 1 | Default for greenfield; one deployable; contexts exist | You already have independent teams *and* independent scale/failure needs |
| **Microservices** | 3 | Independent deploy cadence, team per context, different scale/SLOs, hard failure isolation, or regulatory blast-radius | One team, one DB, unclear boundaries, first version of the product |
| **Miniservices** (many small HTTP apps, shared DB) | X | — | Always. Distributed tax without isolation |
| **BFF** (named variant) | 3 | Multiple client types needing different aggregates | One web/API client; put shaping in the modular monolith |
| **Modular monolith + 1 extracted worker** | 2 | Heavy async/CPU job that must not block HTTP | "Worker" that is just a second copy of the domain |

## Criteria that promote microservices

Need **more than one**:

- Two+ teams owning different contexts with independent roadmaps
- Independent scale (e.g. ingest vs billing)
- Failure isolation required by SLO or regulation
- Different runtime/language forced by a real constraint (not fashion)
- Independent deploy required by release risk

One criterion is usually **not** enough. Prefer modules + a worker first.

## Module rules (modular monolith)

- One reason to change per module
- No circular imports
- Data owned by one module; others call a function/API, they do not touch tables
- Sync in-process; async only for work that can be delayed

## Tradeoffs

| | Modular monolith | Microservices |
| --- | --- | --- |
| Deploy | One | Many |
| Refactor | Cheap | Expensive |
| Failure | Shared process | Isolated |
| Data | Easy consistency | Distributed data |
| Ops | Low | High |

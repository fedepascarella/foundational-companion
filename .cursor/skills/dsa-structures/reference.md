# Data structures catalog

Product access patterns. Rank: **1** default, **2** common, **3** extra store/engine, **X** avoid unless named.

| Structure | Rank | Access pattern | Avoid when |
| --- | --- | --- | --- |
| **Array / list** | 1 | Ordered collection, scan small N | Using a list as a set (O(n) membership) |
| **Hash map** | 1 | Lookup by key in process | Persistence — that is a table |
| **Hash set** | 1 | Uniqueness / membership in process | Distributed unique (use DB constraint) |
| **Stack** | 2 | DFS, undo, nested work | — |
| **Queue / deque** | 2 | FIFO in process, BFS | Durability — use a real queue |
| **Heap / priority queue** | 2 | Next-highest job in process | Fair distributed scheduling (use queue product) |
| **Tree / B-Tree** | 1 | Sorted range, PK/secondary indexes — **Postgres B-Tree** | Hand-rolling a B-Tree in app code |
| **Trie** | 3 | Prefix search, routing tables | ILIKE on small tables |
| **Graph** | 3 | Traversals, path, dependencies | Tree modeled as `parent_id` is enough |
| **Bloom filter** | 3 | Probabilistic "not present" at huge scale | Exact membership; small sets |
| **LSM tree** | 3 | High write ingest (storage engines, time-series internals) | App-level choice — pick the store |
| **Inverted index** | 3 | Full-text / search | Trigram/GIN in Postgres is enough |
| **Time-series layout** | 3 | Metrics, sensor, append-only time | Business entities with a `created_at` |
| **Spatial index (R-tree/GiST)** | 3 | Geo queries | Storing lat/lng you never query |
| **CRDT** | 3 | Multi-writer, partition-tolerant merge | Single-writer CRUD |
| **Ring buffer** | 3 | Fixed-memory telemetry | Durable logs |
| **Skip list** | 3 | Concurrent ordered map (runtime internals) | App code |
| **Bimap / secondary index** | 2 | Lookup both directions | Two hash maps you forget to update — prefer DB unique |

## Where it lives

| Need | First choice |
| --- | --- |
| Durable entities | PostgreSQL row + B-Tree |
| Unique constraint | `UNIQUE` |
| Queue that survives crash | DB `FOR UPDATE SKIP LOCKED` or cloud queue |
| Cache after measured load | Redis / memory with TTL |
| Search | Postgres FTS/GIN → then dedicated search |
| Graph | Recursive CTE → then graph store |
| Time-series | Postgres first → then TS store if volume hurts |

Do not add a database to satisfy a structure vanity pick.

# Programming paradigm catalog

Rank: **1** default, **2** common, **3** criteria.

| Option | Rank | Use when | Avoid when |
| --- | --- | --- | --- |
| **Hybrid / multi-paradigm** | 1 | Default. TS, Python, Kotlin, Go, Rust, C# | A language/runtime that is hostile to the mix (rare) |
| **Object-oriented** | 2 | Rich domain model, evolving behaviors per type, team thinks in types/classes, JVM/.NET house style | Pipeline-heavy ETL; deep inheritance trees |
| **Functional** | 2 | Data transformation, concurrent immutable state, strong ADT/pattern-matching culture (Elixir, F#, Clojure, Haskell, FP-heavy Scala/Kotlin) | CRUD admin app; team cannot review FP idioms |
| **Procedural** | 2 | Small Go/PHP services, scripts, glue, explicit control flow | Large domain with many interacting behaviors |

## Signals

| Signal | Tips toward |
| --- | --- |
| Team fluent in classes/Spring/Nest | OOP or hybrid |
| Team fluent in Elixir/Clojure/F# | FP |
| Domain is workflows + entities with invariants | OOP or hybrid |
| Domain is map/filter/reduce over events or documents | FP or hybrid |
| Lots of shared mutable state | FP (immutability) or actors — not more locks |
| Time-to-market, mixed seniors | Hybrid, language they already know |
| Need hot-reload of behavior trees / plugins | OOP Strategy/State or FP first-class functions |

## Mix rules (typical hybrid)

- **Impure shell:** HTTP, DB, clock, I/O as thin adapters (functions or small classes)
- **Pure core:** decisions as data in → data out
- **Interfaces** at module edges; no inheritance for reuse
- Errors: `Result`/`Either` at domain edges; do not wrap every line

## Language fit (soft)

| Language | Natural style |
| --- | --- |
| TypeScript, Python, Kotlin, C#, Swift | Hybrid |
| Java | OOP/hybrid (records + functions) |
| Go | Procedural + interfaces |
| Rust | Hybrid (types + functions, no classical inheritance) |
| Elixir, Clojure, F#, Haskell | FP |
| Ruby | OOP/hybrid |

Do not choose a language here. Constrain `backend-tech-stack` so it does not contradict this ADR.

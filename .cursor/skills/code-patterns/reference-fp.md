# Code patterns — FP catalog

Use when paradigm is FP or hybrid. Rank: **1** default, **2** when needed, **3** rare, **X** usually don't.

| Pattern | Rank | Use when | Avoid when | OOP equivalent |
| --- | --- | --- | --- | --- |
| **First-class / higher-order functions** | 1 | Default | Passing functions that close over hidden mutability | Strategy, Template Method |
| **Function composition** | 1 | Transforms and middleware | Debugging-impossible 12-wide compose | Decorator |
| **Partial application / currying** | 2 | Inject config into a pipeline | Currying all arities for style | Constructor then method |
| **Closures** | 1 | Capture immutable context | Mutable captured vars as hidden state | Object fields |
| **Recursion vs loops** | 2 | Trees, ADTs; tail-rec if guaranteed | Deep lists in languages without TCO — use loops |
| **Immutable data** | 1 | Default for values | Fine-grained mutable entities in a write model you already have |
| **Persistent data structures** | 3 | Heavy sharing, measured | JSON blobs in Postgres | Flyweight |
| **ADT / tagged unions** | 1 | States and errors as data | Stringly enums | State, Composite |
| **Pattern matching** | 1 | With ADTs | Nested matches that should be a table | Visitor |
| **Option / Maybe** | 1 | Absence at edges | Nested Option of Option | Null Object, null |
| **Result / Either** | 1 | Expected failures | Using Result for programming bugs — throw/panic those | Checked errors |
| **Railway-oriented errors** | 2 | Linear happy-path + fail-first | Every layer re-wrapping | Exceptions with care |
| **map / filter / reduce** | 1 | Collections | Reduce that hides mutation of 6 accumulators | Iterator |
| **Pure core + impure shell** | 1 | Default architecture of code | "Pure" functions that hit the DB | Hexagonal |
| **Referential transparency** | 1 | Goal of the core | Pretending I/O is pure | — |
| **Lazy evaluation** | 3 | Infinite/large streams, measured | Hidden lazy I/O | Lazy init / Proxy |
| **Transducers** | 3 | Fusing large collection pipelines | Two maps | Iterator chain |
| **Lenses / optics** | X | Deep immutable updates in a huge nested model | CRUD records | Setters |
| **Functor / Applicative / Monad** | 2 | Use **the types** (Promise, Result, Option). Do not teach a stack | Monad transformer tutorials | Fluent chaining |
| **Actor isolation** | 3 | Independent concurrent entities (Elixir, Akka) | Modular monolith on one box | Active object |

## Hybrid pick list (typical)

Choose: DI, Module, DTO, Value Object (if needed), Result/Option, composition, ADT for lifecycles, timeouts as impure shell.

Reject: Singleton, Service Locator, Visitor, Interpreter, lenses, monad stacks, Abstract Factory.

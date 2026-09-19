# Code patterns — OOP catalog

GoF 23 + post-GoF. Rank: **1** default hybrid, **2** when needed, **3** rare, **X** usually don't.

FP equivalent listed where it exists.

## Creational (GoF)

| Pattern | Rank | Use when | Avoid when | FP equivalent |
| --- | --- | --- | --- | --- |
| **Factory Method** | 2 | Subtypes decide how to construct | One concrete type | Function that returns a variant |
| **Abstract Factory** | 3 | Families of related products | One family; "flex" | Module of constructor functions |
| **Builder** | 2 | Many optional fields, or stepwise invariant checks | 2–3 fields — use a constructor | Record with defaults / named params |
| **Prototype** | 3 | Cloning is cheaper/correct vs construct | Mutable shared clones | Structural copy / persistent update |
| **Singleton** | X | Almost never. Prefer DI of a single instance at composition root | Global mutable state, hidden deps | A value passed in |

## Structural (GoF)

| Pattern | Rank | Use when | Avoid when | FP equivalent |
| --- | --- | --- | --- | --- |
| **Adapter** | 2 | Wrap a foreign interface to yours | Wrapping your own types for ceremony | Wrapper function |
| **Bridge** | 3 | Two independent axes of variation | One axis — use Strategy | Function params |
| **Composite** | 2 | Tree of same-shaped nodes (UI, org, AST) | Flat lists | Recursive ADT |
| **Decorator** | 2 | Cross-cutting on one interface (logging, retry) at edges | Nested wrapper hell | Function composition / middleware |
| **Facade** | 2 | Stabilize a messy subsystem for callers | One-liner pass-through | Module public API |
| **Flyweight** | 3 | Huge number of similar immutable objects, measured memory | Premature sharing | Interning / persistent structures |
| **Proxy** | 2 | Access control, lazy, remote stub | Extra hop with no policy | Closure that defers I/O |

## Behavioral (GoF)

| Pattern | Rank | Use when | Avoid when | FP equivalent |
| --- | --- | --- | --- | --- |
| **Chain of Responsibility** | 2 | Ordered handlers, first match wins | Fixed 2-step if/else | Pipeline of functions |
| **Command** | 2 | Queue/audit/undo of actions | Direct function call is enough | Function value + data |
| **Interpreter** | 3 | You are executing a language/rules DSL | Config flags | Pattern match on ADT |
| **Iterator** | 1 | Language already has it — use it | Hand-rolled iterators | map/filter |
| **Mediator** | 3 | Many-to-many object chat | Two modules — call each other via app service | Event bus (careful) |
| **Memento** | 3 | Undo snapshots | Event sourcing fashion | Immutable history |
| **Observer** | 2 | In-process fan-out of facts | Distributed pub/sub (that's infra) | Callbacks / streams |
| **State** | 2 | Explicit lifecycle with illegal transitions | Boolean soup of 2 flags | ADT + transition fn |
| **Strategy** | 2 | Two+ interchangeable algorithms | One algorithm | First-class function |
| **Template Method** | 3 | Fixed algorithm with hooks, inheritance OK | Prefer composition | Higher-order function |
| **Visitor** | 3 | Operations on a stable ADT you cannot change | You own the types — use methods or match | Pattern matching |

## Post-GoF

| Pattern | Rank | Use when | Avoid when |
| --- | --- | --- | --- |
| **Simple Factory** | 2 | One function maps type → instance | Fake Abstract Factory |
| **Static Factory** | 2 | Named constructors (`of`, `tryCreate`) | Hiding side effects in `getInstance` |
| **Object Pool** | 3 | Expensive resources (connections) — usually the DB pool | Pooling domain objects |
| **Lazy Initialization** | 2 | Costly setup, maybe unused | Hidden global init |
| **Multiton** | X | Named singletons | DI + map of instances |
| **Monostate** | X | Shared static state | DI |
| **Dependency Injection** | 1 | Default. Constructor or function params | Service locator, ambient context |
| **Service Locator** | X | Legacy host you cannot change | New code |
| **Null Object** | 2 | Avoid null checks at a stable interface | Hiding errors | FP: Option |
| **Registry** | 3 | Plugin discovery | Hidden global |
| **Fluent Interface** | 2 | Builders, query DSLs | Every class fluent |
| **Module / Revealing Module** | 1 | Default encapsulation | God modules |
| **Mixin / Trait** | 2 | Shared behavior without inheritance | Diamond soup |
| **Delegation** | 1 | Prefer over inheritance | — |
| **Immutable Object** | 1 | Values that must not change | Mutable entities that are the write model |
| **Value Object** | 2 | Validated equality-by-value (Money, Email) | Wrapping every string |
| **DTO** | 1 | HTTP/serialization shape ≠ domain | Domain objects as JSON |
| **Parameter Object** | 2 | 4+ related args | Two args |
| **Marker Interface** | 3 | Framework constraint | Empty tags for style |
| **RAII** | 2 | Native resources (files, locks) in C++/Rust | GC languages — use `with`/`using` |
| **Copy-on-Write** | 3 | Share then mutate safely | Always-copy large graphs |
| **Extension Object** | 3 | Open for extension without modifying core | Plugin platform you don't need |
| **Type Object** | 3 | Behaviors vary by data-described type | Ordinary subclasses are enough |

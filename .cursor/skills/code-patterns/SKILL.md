---
name: code-patterns
description: >-
  Picks code-level patterns from the full GoF 23, post-GoF OOP catalog, and
  FP equivalents, gated by the programming-paradigm ADR. Use when deciding
  factories, DI, strategy, Result types, or writing ADR 0005.
disable-model-invocation: true
---

# Code patterns

Concrete construction and behavior patterns. Gated by `programming-paradigm`.

- **OOP** → [reference.md](reference.md) (GoF 23 + post-GoF)
- **FP** → [reference-fp.md](reference-fp.md)
- **Hybrid** → small set from both; prefer the FP equivalent when it is a function
- **Procedural** → modules, Result/error values, no class catalogs

Adapter as a **code wrapper** is here. Adapter as **ACL** is `swe-patterns`.

## Workflow

1. Read paradigm ADR.
2. Open the matching catalog(s). Score 2–3 candidates for each real need (construction, variation, errors, identity).
3. List **chosen** and **rejected** (one-line YAGNI). Do not tutorial the full list in the ADR.
4. Emit a Decision block.

## Default bet (hybrid)

- Constructor / function **dependency injection**
- **Module** boundaries
- **DTO** at HTTP edges, **Value Object** only for validated domain types
- **Result/Option** at edges
- Function **composition** for transforms
- **Factory Method** or simple factory only if construction varies
- **Strategy** only if two+ real interchangeable algorithms exist

## Veto

Singleton, Service Locator, Visitor, Interpreter, Prototype, Flyweight, Abstract Factory-of-factories, monad stacks, lenses, deep Decorator chains.

## Decision block

- Skill: code-patterns
- Choice: bullet list of patterns in play
- Rejected: catalog leftovers that a reader might expect
- Feeds: backend-tech-stack (DI style), api-design (DTO/errors)

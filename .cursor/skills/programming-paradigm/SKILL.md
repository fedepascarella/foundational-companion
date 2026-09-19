---
name: programming-paradigm
description: >-
  Chooses object-oriented, functional, hybrid, or procedural style and gates
  code-patterns plus language choice. Use when deciding how to write the
  backend, or writing ADR 0004.
disable-model-invocation: true
---

# Programming paradigm

Choose **how** code is written. Default bet: **hybrid**.

## Workflow

1. Signals: domain (entities/workflows vs pipelines), mutability, concurrency, team fluency, likely language, time-to-market.
2. Score options in [reference.md](reference.md).
3. Write mix rules (e.g. "FP core, OOP adapters").
4. Constrain `code-patterns` (which catalog) and `backend-tech-stack` (language must not fight this).
5. Emit a Decision block.

## Default bet

**Hybrid.** Modules/interfaces at service and adapter boundaries. Pure functions and immutable data for transforms and policy. No "enterprise OOP" and no monad tutorials.

## Veto

- Pure FP as fashion on CRUD with an OOP-fluent team
- Pure OOP with deep inheritance for data transforms
- Picking Haskell/Scala "to be functional" when the team ships TypeScript
- Picking Java + Spring then claiming pure FP

## Decision block

- Skill: programming-paradigm
- Choice: OOP | FP | hybrid | procedural
- Mix rules:
- Language constraints:
- Feeds: code-patterns, backend-tech-stack

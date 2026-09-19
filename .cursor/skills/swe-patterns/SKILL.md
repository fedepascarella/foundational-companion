---
name: swe-patterns
description: >-
  Chooses architecture, integration, and resilience patterns (not GoF).
  Use when shaping modules, integrations, consistency, or writing ADR 0003.
disable-model-invocation: true
---

# SWE patterns

System shape only. Code-level Factory/Strategy live in `code-patterns`. Adapter as **ACL/integration** lives here; Adapter as a class wrapper lives there.

## Workflow

1. Read decomposition + repo decisions.
2. Pick one **application shape**, add **integration** patterns only at real boundaries, add **resilience** that HTTP/DB already need.
3. Score from [reference.md](reference.md). Prefer fewer patterns.
4. Emit a Decision block listing **chosen** and **rejected** with one-line reasons.

## Default bet

- Vertical slices inside a modular monolith
- Hexagonal / ports only at IdP, payments, email, or similar
- Resilience: timeouts, bounded retries with jitter, idempotency on mutating APIs
- No CQRS, saga, outbox, or event sourcing until a named consistency/scale problem exists

## Veto

- Event sourcing because "we might need an audit log" — use append-only tables
- Saga because there are two modules in one process — use a function call
- BFF when there is one client
- Circuit breaker on a single-instance modular monolith talking to Postgres

## Decision block

- Skill: swe-patterns
- Choice: shape + integration + resilience set
- Feeds: programming-paradigm, api-design, infra

---
name: backend-tech-stack
description: >-
  Chooses backend language, framework, and data stores from PRD needs and
  the paradigm ADR. Use when picking a stack, versions, Postgres vs extra
  stores, or writing ADR 0007.
disable-model-invocation: true
---

# Backend tech stack

Cloud-agnostic. Language from **team + domain**, not fashion. Default data: **PostgreSQL**.

Versions below were verified **September 2026**. Re-verify before pinning.

## Workflow

1. Honor `programming-paradigm` (do not fight it) and `dsa-structures` (do not add stores without an access pattern).
2. Score languages/frameworks in [reference.md](reference.md).
3. Start with Postgres. Add Redis/queue/object/search only with a named need.
4. Emit a Decision block with versions and a **do not add** list.

## Default bet

- Language the team already ships
- One web framework from that language's shortlist
- PostgreSQL 18 as system of record
- No Redis, Kafka, Elasticsearch, or extra DB until a requirement needs it

## Veto

- Second database for a new bounded context that could be a schema
- Service mesh, custom orchestrator, "event backbone" on day one
- NestJS + Django + Go "polyglot monolith"
- Java + "pure FP" without an explicit override

## Decision block

- Skill: backend-tech-stack
- Choice: language + version, framework + version, stores
- Do not add:
- Feeds: api-design, infra, cicd

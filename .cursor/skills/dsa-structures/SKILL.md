---
name: dsa-structures
description: >-
  Chooses in-process and storage data structures from product access patterns
  (not interview puzzles). Use when modeling indexes, caches, queues, graphs,
  or writing ADR 0006.
disable-model-invocation: true
---

# DSA structures

Pick structures from **access patterns**, not from fashion. Default bet: **list + hash map in process**, **B-Tree indexes in PostgreSQL**.

## Workflow

1. List access patterns from the PRD (lookup by id, range, prefix search, graph walk, time series, uniqueness, rate limit, etc.).
2. Map each to a structure in [reference.md](reference.md).
3. Prefer Postgres features (B-Tree, GIN, GiST) over a new store.
4. Emit a Decision block. If everything is default, say so — still write the ADR.

## Default bet

- Arrays/lists for ordered collections
- Hash maps/sets for in-memory indexes
- Postgres B-Tree for primary keys and common filters
- Durable queue only if work must survive process death

## Veto

- Redis "because cache"
- Graph DB for a tree of categories
- Bloom filter without a measured membership problem
- CRDTs without multi-writer offline sync

## Decision block

- Skill: dsa-structures
- Choice: pattern → structure (and where it lives: memory vs Postgres vs extra store)
- Feeds: backend-tech-stack, infra

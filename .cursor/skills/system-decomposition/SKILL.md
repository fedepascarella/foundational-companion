---
name: system-decomposition
description: >-
  Chooses monolith, modular monolith, or microservices from PRD constraints.
  Use when starting architecture, deciding service boundaries, or writing
  ADR 0001.
disable-model-invocation: true
---

# System decomposition

Pick how the system is cut. Default bet: **modular monolith**.

## Workflow

1. Extract signals: team count, bounded contexts, deploy cadence, data coupling, failure domains, compliance isolation, time-to-market.
2. Score monolith, modular monolith, microservices (and named variants only if a signal exists). See [reference.md](reference.md).
3. Apply YAGNI: more than one deployable requires independent deploy **or** failure isolation **or** team topology that already exists.
4. Emit a Decision block. Name the modules even if they share a process.

## Default bet

One process, modules by bounded context, separate database schemas or packages, in-process calls. Extract a service later with a strangler if a criterion fires.

## Veto

- Microservices for a single team with one release train
- "Miniservices" as a compromise that still pays distributed-systems tax
- Shared database across microservices

## Decision block

- Skill: system-decomposition
- Choice: monolith | modular monolith | microservices (+ module/service list)
- Why / rejected / assumptions / YAGNI veto / feeds: repo-structure, swe-patterns, infra

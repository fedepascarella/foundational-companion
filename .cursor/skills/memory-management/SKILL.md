---
name: memory-management
description: >-
  Chooses session, user, and org memory (window, summary, Postgres facts,
  vector memory). Use during the Gen AI second pass or when writing ADR 0015.
disable-model-invocation: true
---

# Memory management

Default bet: **sliding window** of recent turns. Summarize if the window overflows. Durable facts in **Postgres** with a write policy. No memory platform.

## Workflow

1. What must persist: nothing, session, user preferences, org knowledge (that is RAG).
2. Score [reference.md](reference.md).
3. Define write policy (what gets stored, PII, retention, who can read).
4. Emit a Decision block.

## Default bet

Last N turns (token budget). Optional running summary. No cross-session memory unless the PRD names it.

## Veto

- Vector “memory” of every message
- MemGPT-style OS for FAQ chat
- Storing secrets/PII in prompts without retention rules
- Sharing memory across tenants

## Decision block

- Skill: memory-management
- Choice: window / summary / stores
- Write policy / retention:
- Feeds: prompt-caching, rag-patterns (org knowledge ≠ chat memory)

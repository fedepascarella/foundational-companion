---
name: prompt-caching
description: >-
  Chooses provider prompt-cache strategy (stable prefixes, Anthropic/OpenAI/
  Gemini caches, what not to cache). Use during the Gen AI second pass or when
  writing ADR 0018.
disable-model-invocation: true
---

# Prompt caching

Default bet: put **stable** system + tool schemas in a **cached prefix**. User turns and per-request RAG chunks stay out of that prefix (unless the corpus is small and global).

## Workflow

1. List prompt parts: system, tools, RAG, memory, user.
2. Score provider cache features in [reference.md](reference.md) against ADR 0019 (if already drafted, else assume major providers).
3. Define prefix order and invalidation (tool schema change busts cache).
4. Emit a Decision block.

## Default bet

Cache the static instruction + tool JSON. Do not cache per-user PII. Do not put volatile RAG in the static prefix.

## Veto

- Caching secrets
- Shared prefix that includes another tenant’s data
- Reordering messages so the prefix never hits
- Building a custom Redis “prompt cache” that duplicates the provider

## Decision block

- Skill: prompt-caching
- Choice: provider feature + prefix layout
- Invalidation:

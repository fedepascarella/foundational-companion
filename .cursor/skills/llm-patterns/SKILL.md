---
name: llm-patterns
description: >-
  Chooses traditional LLM jobs and prompt patterns (structured call, classify,
  extract, RAG-shaped chat, fine-tune, or none). Use during the Gen AI second
  pass or when writing ADR 0011.
disable-model-invocation: true
---

# LLM patterns

Decide **what the model is for**. Default bet: one **structured** call (JSON schema / enum) or a short prompt chain. Not an agent.

## Workflow

1. Name the user-visible job from the PRD (classify, extract, generate, chat, rewrite, embed, none).
2. Score patterns in [reference.md](reference.md).
3. If “none”, stop the Gen AI pack after this ADR (`0011-no-gen-ai.md` is enough).
4. Emit a Decision block. Feed agentic/RAG only if this job needs them.

## Default bet

Smallest pattern that meets the job: zero/few-shot + **structured output**. Streaming if the UI is chat. Guardrails on input and output.

## Veto

- Fine-tune before exhausting prompts + retrieval
- An agent loop for a classifier or extractor
- Multi-model cascade with no latency/cost budget
- “LLM for every feature”

## Decision block

- Skill: llm-patterns
- Choice: job + pattern set
- Feeds: agentic-patterns, rag-patterns, llm-providers-frameworks

---
name: agentic-patterns
description: >-
  Chooses agent loop vs deterministic LLM workflow (ReAct, plan-and-execute,
  router, graph, or not-an-agent). Use during the Gen AI second pass or when
  writing ADR 0012.
disable-model-invocation: true
---

# Agentic patterns

Default bet: **not an agent** — a deterministic workflow with LLM steps (chain/route) from ADR 0011.

An agent is justified when the **next action must be chosen at runtime** from tools, and the path cannot be a fixed graph.

## Workflow

1. Read llm-patterns. If classify/extract/single generate → **not-an-agent**.
2. Score [reference.md](reference.md).
3. Bound the loop (max steps, timeouts, HITL on mutations).
4. Emit a Decision block.

## Default bet

Fixed retrieve → generate, or a small state machine you write. ReAct only if tools and branching are real.

## Veto

- Unbounded ReAct on a 3-step pipeline
- Computer-use for an API product
- Reflexion loops with no eval rubric
- “Agent” as a synonym for “we called a model”

## Decision block

- Skill: agentic-patterns
- Choice: not-an-agent | workflow graph | ReAct | …
- Loop bounds:
- Feeds: agent-topology, tool-design

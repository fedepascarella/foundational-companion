---
name: agent-topology
description: >-
  Chooses single agent vs supervisor vs sub-agents, context isolation, and
  handoff vs spawn. Use during the Gen AI second pass or when writing ADR 0013.
disable-model-invocation: true
---

# Agent topology

Default bet: **zero or one** agent. Sub-agents only when a specialist needs a **different tool set or a clean context**.

## Workflow

1. If ADR 0012 is not-an-agent, choice is **none**. Still write the ADR.
2. Score [reference.md](reference.md).
3. For each sub-agent: tools, context isolation, max depth, who may spawn whom.
4. Emit a Decision block.

## Default bet

Single agent (or none). Depth 0. Shared nothing.

## Veto

- Sub-agents to organize a prompt
- A2A protocol on day one
- Shared mutable scratchpad across agents without an owner
- Recursive spawn

## Decision block

- Skill: agent-topology
- Choice: none | single | supervisor+N | sequential
- Isolation / depth:
- Feeds: tool-design, mcp-design, memory-management

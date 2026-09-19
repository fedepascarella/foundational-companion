---
name: gen-ai-companion
description: >-
  Second-pass orchestrator: turns an AI-shaped PRD plus existing architecture
  ADRs into Gen AI ADRs 0011–0019 (LLM jobs, agents, RAG, memory, tools, MCP,
  prompt cache, providers). Use when the product needs models, RAG, agents,
  MCP, or tool design, or when the user invokes the Gen AI Companion.
---

# Gen AI Companion

Second pass only. Drivers: **DRY, YAGNI, KISS, scalable minimalism**.

Job: decide how (or whether) to use models. Do not implement the product unless asked.

## Preconditions

1. Architecture ADRs exist (`docs/adrs/0000-index.md` and 0001–0010). If missing, stop and run `foundational-companion` first.
2. If the PRD has **no** LLM job (no generate/extract/chat/RAG/agent): write only `docs/adrs/0011-no-gen-ai.md` (YAGNI) and stop — unless the user insisted on a full catalog pass.
3. Honor ADR 0007 (language) and 0008 (API security). Model I/O is untrusted input.

## Catalog pass

Read each `SKILL.md` in order. Open `reference.md` only to score candidates. Skip a skill’s *implementation* (write “none / N/A”) when an earlier decision vetoes it — still write the ADR.

1. `llm-patterns`
2. `agentic-patterns`
3. `agent-topology`
4. `rag-patterns`
5. `memory-management`
6. `tool-design`
7. `mcp-design`
8. `prompt-caching`
9. `llm-providers-frameworks`

Decision block (same as architecture):

```markdown
- Skill:
- Choice:
- Why (PRD signals):
- Rejected (option → one-line reason):
- Assumptions:
- YAGNI veto:
- Feeds next skills:
```

## Write artifacts

| # | File |
| --- | --- |
| 11 | `docs/adrs/0011-llm-patterns.md` |
| 12 | `docs/adrs/0012-agentic-patterns.md` |
| 13 | `docs/adrs/0013-agent-topology.md` |
| 14 | `docs/adrs/0014-rag-patterns.md` |
| 15 | `docs/adrs/0015-memory-management.md` |
| 16 | `docs/adrs/0016-tool-design.md` |
| 17 | `docs/adrs/0017-mcp-design.md` |
| 18 | `docs/adrs/0018-prompt-caching.md` |
| 19 | `docs/adrs/0019-llm-providers-frameworks.md` |

Update `docs/adrs/0000-index.md` with the new rows. Status: `proposed`.

Fill diagrams only when the matching ADR is not “none”:

- `docs/architecture/gen-ai.md`
- `docs/architecture/agent-topology.md`
- `docs/architecture/rag.md`
- `docs/architecture/mcp-tools.md`

## Quality gate

- Structured single call before an agent loop
- No RAG until corpus will not fit in context or must stay fresh
- No multi-agent until one agent + few tools is insufficient
- No MCP until a tool must be shared across hosts/languages/processes
- Official SDK + thin loop unless a framework deletes real code
- Window memory; durable facts in Postgres
- Prefix cache for stable system+tools
- Allowlisted tools; mutations need confirmation; no raw SQL/shell tools
- Log traces, cap cost/tokens, eval groundedness if RAG

See [examples.md](examples.md). Stop after the pack. Ask to accept. Do not start coding.

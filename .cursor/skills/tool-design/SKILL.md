---
name: tool-design
description: >-
  Designs agent tools: typed schemas, least privilege, idempotency, HITL for
  mutations, sandboxes. Use during the Gen AI second pass or when writing
  ADR 0016. Production safety baseline is mandatory.
disable-model-invocation: true
---

# Tool design

Default bet: **few typed tools**, least privilege. Mutations require confirmation. Model output is untrusted.

If ADR 0012 is not-an-agent, choice is **none** (or one explicit function call you wrote, not a tool loop).

## Workflow

1. List side-effecting vs read-only operations from the PRD.
2. For each tool: name, description (model UX), JSON schema, idempotency, timeout, max result bytes, error shape.
3. Apply the **mandatory** baseline in [reference.md](reference.md).
4. Emit a Decision block (chosen tools + rejected dangerous ones).

## Default bet

≤ 8 tools per agent. Reads default on; writes off until HITL. No `run_sql`, no `run_shell`.

## Veto

- One mega-tool (“do_anything”)
- Tools that return unbounded blobs
- Silent payments/emails/deletes
- Passing raw user text into query builders

## Decision block

- Skill: tool-design
- Choice: tool list + HITL set
- Feeds: mcp-design, prompt-caching, agent-topology

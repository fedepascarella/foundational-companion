# Foundational Companion

A Cursor playbook for starting new products. Clone it, bootstrap it into a product repo, drop a PRD, and the agent produces a versioned ADR pack plus architecture diagrams. If the product needs models, RAG, or agents, a **Gen AI second pass** adds ADRs 0011–0019.

Philosophy: **DRY, YAGNI, KISS, scalable minimalism**.

This repo is a **kit**. PRDs, case studies, ADRs, and diagrams live in the **product** repo after bootstrap.

## What you get

- `AGENTS.md` — companion persona
- `.cursor/rules/engineering-philosophy.mdc` — always-on constraints
- Architecture orchestrator plus ten catalog skills, and a Gen AI second-pass orchestrator plus nine catalog skills, under `.cursor/skills/`
- Templates for PRDs, case studies, ADRs, and architecture docs
- `scripts/bootstrap-product.sh` — copies the kit into a product repo

## Bootstrap into a product

```bash
git clone <this-repo> foundational-companion
cd foundational-companion
./scripts/bootstrap-product.sh /path/to/your-product
```

Existing files are skipped. Pass `--force` to overwrite.

Copies:

- `AGENTS.md`
- `.cursor/rules/engineering-philosophy.mdc`
- `.cursor/skills/*`
- `templates/product-docs/` → `docs/`

## Invoke

In the product repo, with a PRD in `docs/prd/` (or pasted in chat):

- “Start from this PRD”
- “Produce the architecture ADR”
- “Foundational Companion: architecture pass”
- After architecture, if the product is AI-shaped: “Gen AI Companion: second pass”

The companion files intake docs, runs the catalog skills in order, and writes:

| Artifact | Location |
| --- | --- |
| PRDs | `docs/prd/` |
| Case studies | `docs/case-studies/` |
| ADRs | `docs/adrs/0000-index.md`, `0001`–`0010`, then `0011`–`0019` if Gen AI |
| Diagrams | `docs/architecture/*.md` (Mermaid) |

## Skills (run in this order)

1. `system-decomposition` — monolith / modular monolith / microservices
2. `repo-structure` — one repo vs workspaces vs polyrepo, folder shape
3. `swe-patterns` — architecture, integration, resilience
4. `programming-paradigm` — OOP vs FP vs hybrid
5. `code-patterns` — GoF + post-GoF + FP catalog, gated by paradigm
6. `dsa-structures` — data structures from access patterns
7. `backend-tech-stack` — language, framework, data stores
8. `api-design` — API styles + production security baseline
9. `infra-architecture` — compute, data, identity, IaC
10. `cicd` — GitHub Actions default, trunk-based

Catalog skills are explicit-read (`disable-model-invocation`). `foundational-companion` loads when starting a project. `gen-ai-companion` loads when the PRD needs models/RAG/agents or when you invoke the second pass.

## Pass 2 — Gen AI (ADRs 0011–0019)

Only after architecture ADRs exist, and only if the PRD needs Gen AI.

1. `llm-patterns` — traditional LLM jobs (including “none”)
2. `agentic-patterns` — loop vs workflow vs not-an-agent
3. `agent-topology` — one agent vs supervisor vs sub-agents
4. `rag-patterns` — grounding / retrieval
5. `memory-management` — session / user / org memory
6. `tool-design` — tool contracts and privilege
7. `mcp-design` — in-process tools vs MCP
8. `prompt-caching` — stable prefixes, provider cache
9. `llm-providers-frameworks` — vendor + orchestration library

## Default bets

When the PRD is silent: modular monolith, one repo, vertical slices, hybrid paradigm, PostgreSQL, HTTPS JSON REST + OpenAPI, managed PaaS, GitHub Actions. API security is never optional.

Gen AI: one structured model call before an agent; no RAG, multi-agent, or MCP until a named need; official provider SDK; window memory; prefix cache.

## Add a skill later

1. Create `.cursor/skills/<name>/SKILL.md` (+ `reference.md` if the catalog is long).
2. Add it to the ordered list in `AGENTS.md` and the matching orchestrator (`foundational-companion` or `gen-ai-companion`).
3. Give it an ADR number and Decision-block contract matching the others.

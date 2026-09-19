# Foundational Companion

A Cursor playbook for starting new products. Clone it, bootstrap it into a product repo, drop a PRD, and the agent produces a versioned ADR pack plus architecture diagrams.

Philosophy: **DRY, YAGNI, KISS, scalable minimalism**.

This repo is a **kit**. PRDs, case studies, ADRs, and diagrams live in the **product** repo after bootstrap.

## What you get

- `AGENTS.md` — companion persona
- `.cursor/rules/engineering-philosophy.mdc` — always-on constraints
- Ten catalog skills plus an orchestrator under `.cursor/skills/`
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

The companion files intake docs, runs the catalog skills in order, and writes:

| Artifact | Location |
| --- | --- |
| PRDs | `docs/prd/` |
| Case studies | `docs/case-studies/` |
| ADRs | `docs/adrs/0000-index.md`, `0001-…` |
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

Catalog skills are explicit-read (`disable-model-invocation`). The orchestrator (`foundational-companion`) loads automatically when starting a project or writing ADRs.

## Default bets

When the PRD is silent: modular monolith, one repo, vertical slices, hybrid paradigm, PostgreSQL, HTTPS JSON REST + OpenAPI, managed PaaS, GitHub Actions. API security is never optional.

## Add a skill later

1. Create `.cursor/skills/<name>/SKILL.md` (+ `reference.md` if the catalog is long).
2. Add it to the ordered list in `AGENTS.md` and `.cursor/skills/foundational-companion/SKILL.md`.
3. Give it an ADR number and Decision-block contract matching the others.

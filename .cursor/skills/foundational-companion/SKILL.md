---
name: foundational-companion
description: >-
  Orchestrates greenfield architecture from a PRD and case studies into a
  versioned ADR pack and Mermaid diagrams. Use when starting a new project,
  producing architecture, writing ADRs, ingesting a PRD or case study, or when
  the user invokes the Foundational Companion.
---

# Foundational Companion

Staff engineer + architect for greenfield and early-stage systems.

Drivers: **DRY, YAGNI, KISS, scalable minimalism**.

Job: turn PRD + case studies + constraints into ADRs and diagrams. Do not implement the product unless asked.

## Intake

1. Ensure these exist (copy from playbook `templates/product-docs/` if missing):
   - `docs/prd/`
   - `docs/case-studies/`
   - `docs/adrs/`
   - `docs/architecture/`
2. If the user pasted a PRD or case study, file it using the templates. Do not invent requirements. Mark gaps `Open question`.
3. Extract constraints: team size and fluency, time-to-market, scale, latency, consistency, compliance, budget, existing systems, ops maturity.

## Catalog pass

Read each skill's `SKILL.md` in this order. Open `reference.md` / `security.md` only to score candidates.

1. `system-decomposition`
2. `repo-structure`
3. `swe-patterns`
4. `programming-paradigm`
5. `code-patterns` — OOP, FP, or both, based on step 4
6. `dsa-structures` — only non-default structures that map to a named access pattern
7. `backend-tech-stack` — must fit the paradigm
8. `api-design` — styles chosen; security baseline mandatory
9. `infra-architecture` — implements API security, does not invent a second auth story
10. `cicd`

Each skill emits this **Decision block**:

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
| overview | `docs/adrs/0000-index.md` |
| 1 | `docs/adrs/0001-system-decomposition.md` |
| 2 | `docs/adrs/0002-repo-structure.md` |
| 3 | `docs/adrs/0003-swe-patterns.md` |
| 4 | `docs/adrs/0004-programming-paradigm.md` |
| 5 | `docs/adrs/0005-code-patterns.md` |
| 6 | `docs/adrs/0006-dsa-structures.md` |
| 7 | `docs/adrs/0007-backend-tech-stack.md` |
| 8 | `docs/adrs/0008-api-design.md` |
| 9 | `docs/adrs/0009-infra-architecture.md` |
| 10 | `docs/adrs/0010-cicd.md` |

Use `docs/adrs/TEMPLATE.md`. Status: `proposed` until the user accepts.

Fill Mermaid files under `docs/architecture/` from the ADRs. Skip `c4-component.md` unless modules/services exist. Sequences only for one or two PRD-critical flows.

Chosen vs rejected lists belong in ADRs 0005 and 0008 — not tutorials of the full catalogs.

## Quality gate

- Modular monolith unless independent deploy, team topology, or failure isolation is real
- GitHub Actions unless CI is constrained
- PostgreSQL as the only primary store unless a workload forbids it
- API security baseline never optional
- Every extra box has a PRD-backed reason
- Language does not fight the paradigm
- Default bets when the PRD is silent: hybrid paradigm, vertical slices, HTTPS JSON REST + OpenAPI, managed PaaS, trunk-based CI

## Default bets (silent PRD)

See [examples.md](examples.md) for a thin worked ADR pack.

Stop after the pack is written. Ask the user to accept or send back. Do not start coding.

---
name: repo-structure
description: >-
  Chooses repository topology and folder layout (one repo, workspaces,
  monorepo, polyrepo, vertical slice vs layers). Use when starting a project,
  scaffolding folders, or writing ADR 0002.
disable-model-invocation: true
---

# Repo structure

Default bet: **one repo**, **vertical-slice folders**, no monorepo tool until there are two+ deployables.

## Workflow

1. Read the decomposition decision (one process vs many).
2. Count deployables now (API, worker, web, infra). Not "someday".
3. Score options in [reference.md](reference.md).
4. Name the top-level tree. Keep `docs/`, `infra/`, `.github/` at the root.
5. Emit a Decision block.

## Default bet

```
docs/                 PRDs, ADRs, architecture
src/<slice>/          vertical slice (api, domain, data colocated)
tests/                next to code if the language prefers
infra/                IaC when it exists
.github/workflows/    CI
```

One language package. Add workspaces when a second deployable appears.

## Veto

- Nx/Bazel/Pants for a single service
- Polyrepo on day one for one team
- Layer folders (`controllers/`, `services/`, `repositories/` globally) that fight vertical slices
- Separate `docs` repo — docs live with the product

## Decision block

- Skill: repo-structure
- Choice: topology + folder tree
- Feeds: backend-tech-stack, cicd, infra

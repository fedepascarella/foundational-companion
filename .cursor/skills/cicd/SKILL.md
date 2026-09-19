---
name: cicd
description: >-
  Chooses CI/CD system, branching, PR checks, environments, and deploy
  strategy. Defaults to GitHub Actions and trunk-based development. Use when
  designing pipelines or writing ADR 0010.
disable-model-invocation: true
---

# CI/CD

Default bet: **GitHub Actions**, **trunk-based**, lint + test + build on PR, deploy **main** → staging → prod.

## Workflow

1. Honor repo topology (path filters only if multiple packages).
2. Score engine, branching, environments in [reference.md](reference.md).
3. Wire OIDC to the cloud from the infra ADR — no long-lived cloud keys in GitHub.
4. Contract-test OpenAPI if `api-design` chose REST.
5. Emit a Decision block and fill `docs/architecture/cicd.md`.

## Default bet

- GitHub Actions
- Trunk-based (`main` + short-lived PRs)
- PR: lint, unit tests, build
- Merge to `main`: deploy staging, then prod (manual approve prod if the team is tiny and wants a gate)
- Build once; promote artifact — do not rebuild for prod

## Veto

- GitFlow for a one-team SaaS
- Long-lived cloud access keys in repo secrets when OIDC exists
- Rebuilding from a different commit for production
- Preview environments for a backend with no frontend reviewers yet (add when they pay off)

## Decision block

- Skill: cicd
- Choice: engine, branch model, PR jobs, deploy jobs, environments, secrets

# CI/CD catalog

Rank: **1** default, **2** common, **3** criteria, **X** avoid for this playbook's default GitHub world.

## Engine

| Option | Rank | Use when | Avoid when |
| --- | --- | --- | --- |
| **GitHub Actions** | 1 | GitHub hosts the repo (this kit's default) | — |
| **GitLab CI** | 2 | Code is on GitLab | Extra CI *plus* GitHub |
| **CircleCI / Buildkite** | 3 | Org already standardized | Fashion |
| **Jenkins** | 3 | Existing platform team | New product |
| **GitOps (Argo/Flux)** | 3 | Kubernetes + desired-state deploys | One PaaS container |

## Branching

| Option | Rank | Use when | Avoid when |
| --- | --- | --- | --- |
| **Trunk-based** | 1 | Default. Short PRs to `main` | — |
| **GitHub flow** | 1 | Same as trunk-based with PR required | — |
| **GitFlow** | X | Release trains with strict GA branches *and* a release manager | One team SaaS |
| **Long-lived env branches** (`dev`/`qa`) | 3 | Compliance theater you cannot refuse | Default |

## Pipeline shape

| Stage | Rank | Notes |
| --- | --- | --- |
| **PR: lint + test + build** | 1 | Required |
| **PR: OpenAPI/spec lint** | 1 | If REST |
| **PR: SAST / dep scan** | 2 | `npm audit` / OSV / language equivalent |
| **Deploy staging on main** | 1 | Auto |
| **Deploy prod** | 1 | Auto or one approval |
| **Preview envs** | 3 | Per-PR apps when frontend/product review needs URLs |
| **Nightly e2e** | 2 | If e2e exists and is slow |

## Release

| Option | Rank | Use when |
| --- | --- | --- |
| **Promote artifact** | 1 | Same image/binary staging → prod |
| **Rebuild for prod** | X | Never |
| **Feature flags** | 2 | Decouple deploy from release |
| **Blue/green or canary** | 3 | SLO requires it; platform supports it |

## Environments

| Env | Rank |
| --- | --- |
| **Staging + production** | 1 |
| **Local compose** | 1 |
| **Preview** | 3 |
| **Per-developer cloud** | X | unless the org already pays for it |

## Auth to cloud

OIDC from GitHub Actions (or GitLab equivalent) → cloud role. Rank **1**.

Long-lived `AWS_ACCESS_KEY_ID` in GitHub secrets: **X** when OIDC is available.

# Repo structure catalog

Rank: **1** default, **2** common, **3** when criteria fire, **X** avoid for greenfield.

## Topology

| Option | Rank | Use when | Avoid when |
| --- | --- | --- | --- |
| **Single package** | 1 | One deployable, one language | Two+ deployables with different build graphs |
| **Language workspaces** (pnpm/npm, uv, go.work, cargo workspace) | 2 | Two+ packages, still one repo, same language family | One package; or mixed languages that need a real monorepo tool |
| **Monorepo tool** (Turborepo, Nx, Bazel, Pants) | 3 | Many packages, mixed languages, need remote cache / affected builds | First product, one API |
| **Polyrepo** | 3 | Already-separate teams, different lifecycles, hard ownership | One team; "clean git history" as the reason |
| **Git subtree / submodules** | X | Rare vendor pin | Default composition |

## Folder shape

| Option | Rank | Use when | Avoid when |
| --- | --- | --- | --- |
| **Vertical slice / feature folders** | 1 | Default. Change one feature without hunting layers | True library code that is shared with no feature identity |
| **Layer folders** | 2 | Tiny CRUD, or a language convention that already is layered | Growing domain; becomes un-navigable |
| **Hexagonal folders** (`domain/`, `app/`, `adapters/`) | 2 | Real integration boundaries (payments, IdP, email) | Internal-only app with no ports |
| **Package by bounded context** | 1 | Modular monolith | Single-context app (then one slice tree is enough) |

## Root conventions (always)

| Path | Purpose |
| --- | --- |
| `docs/prd`, `docs/case-studies`, `docs/adrs`, `docs/architecture` | Companion artifacts |
| `infra/` | IaC when more than one managed service |
| `.github/workflows/` | GitHub Actions (default CI) |
| `scripts/` | Bootstrap and repeatable operator tasks |

## Tooling cheat sheet

- TS/JS: pnpm workspaces when 2+ packages
- Python: uv workspace or src layout; skip Poetry+Pants until needed
- Go: modules + `go.work` only with 2+ modules
- Rust: cargo workspace for libs + bins
- JVM: Gradle included builds / modules, not a second repo

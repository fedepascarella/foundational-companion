# Example: thin B2B SaaS CRUD product

**PRD signals:** 3 engineers, TypeScript-fluent, 4-month deadline, ~10k users year 1, no hard real-time, SOC2 later, no existing systems.

## Decision blocks (compressed)

| Skill | Choice | YAGNI veto |
| --- | --- | --- |
| system-decomposition | Modular monolith, modules by bounded context | Microservices — one team, one deploy cadence |
| repo-structure | One repo, `src/<module>/` vertical slices | pnpm monorepo — one deployable |
| swe-patterns | Vertical slice + hexagonal at IdP/email adapters; retry+timeout+idempotency | CQRS, saga, event sourcing |
| programming-paradigm | Hybrid | Pure FP — team is class/module fluent |
| code-patterns | DI, Module, DTO, Result at edges, composition for transforms | Singleton, Visitor, Abstract Factory |
| dsa-structures | Hash map + list in process; Postgres B-Tree | Redis, graphs, bloom filters |
| backend-tech-stack | TypeScript, NestJS 11 or Fastify 5, Node 24 LTS, PostgreSQL 18 | Second database, Kafka |
| api-design | HTTPS JSON REST + OpenAPI, OIDC, version in URL `/v1` | GraphQL, gRPC, API keys in query strings |
| infra-architecture | Managed Postgres + one PaaS/container service, secrets manager, structured logs | Kubernetes, service mesh |
| cicd | GitHub Actions, trunk-based, PR lint/test/build, deploy main → staging → prod | GitFlow, preview envs |

## Index excerpt

`docs/adrs/0000-index.md` lists those ten decisions, links diagrams, and states assumptions (year-1 scale, one team, TypeScript).

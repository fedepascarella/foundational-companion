---
name: infra-architecture
description: >-
  Chooses cloud-agnostic compute, data, identity, networking, observability,
  and IaC. Implements the API security baseline. Use when designing runtime
  topology, picking PaaS vs Kubernetes, or writing ADR 0009.
disable-model-invocation: true
---

# Infra architecture

Cloud-agnostic patterns. Map to AWS/GCP/Azure/Cloudflare **after** the pattern is chosen. Implement `api-design` security (TLS, identity, rate limits, secrets) — do not invent a second auth story.

## Workflow

1. Read decomposition, data stores, API security extras.
2. Pick compute, then data, then identity/secrets, then observability, then IaC. See [reference.md](reference.md).
3. Default to managed PaaS / Cloud Run-class. Kubernetes only if criteria fire.
4. Emit a Decision block and fill `docs/architecture/deployment.md`.

## Default bet

- One app process (plus a worker only if ADR 0001 said so)
- Managed PostgreSQL
- Managed TLS terminator
- Secrets manager
- Structured logs + metrics + traces as the provider offers
- IaC when there is more than a single managed service

## Veto

- Kubernetes for one container
- Service mesh
- Multi-cloud "for portability" on day one
- Self-hosted Postgres on a VM because it is cheaper on a spreadsheet
- A second identity stack besides the API ADR

## Decision block

- Skill: infra-architecture
- Choice: compute, data, identity, network, observability, IaC
- Cloud mapping (examples, not the decision):
- Feeds: cicd (OIDC deploy)

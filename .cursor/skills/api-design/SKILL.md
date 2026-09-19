---
name: api-design
description: >-
  Chooses API styles (REST, RPC, GraphQL, webhooks, WebSocket, SSE, and
  others) and applies a mandatory production security baseline (OWASP API
  Top 10). Use when designing endpoints, auth, versioning, or writing ADR 0008.
disable-model-invocation: true
---

# API design

Two layers:

1. **Styles are chosen** from [reference.md](reference.md)
2. **Security baseline is mandatory** from [security.md](security.md) — not a pick-list

## Workflow

1. List surfaces: public, partner, internal, BFF, outbound webhooks.
2. Pick one primary style per surface. Mix is allowed (REST + webhooks).
3. Apply the **entire** security baseline. Add extras by exposure (public > partner > internal).
4. Record versioning, authn, authz, idempotency, error shape.
5. Emit a Decision block. Feed TLS/identity/rate-limit needs to `infra-architecture`.

## Default bet

- HTTPS JSON **REST + OpenAPI**
- Same style internally in a modular monolith (no gRPC mesh)
- Version: `/v1` prefix **or** header — pick one
- User auth: **OAuth 2.1 / OIDC**
- Machine: service identity or tightly scoped keys — **never** in query strings
- Security baseline **always on**

## Veto

- GraphQL on a public API without depth/cost limits and authorization per field
- gRPC to browsers without a gateway
- SOAP unless a partner mandates it
- API keys in query strings
- "We'll add security later"
- HATEOAS as a fashion requirement

## Decision block

- Skill: api-design
- Choice: surface → style, schema (OpenAPI/proto/GraphQL), versioning, auth
- Security: required baseline + extras
- Rejected styles:
- Feeds: infra-architecture, cicd (contract tests)

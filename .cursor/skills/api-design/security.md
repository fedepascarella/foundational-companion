# API security baseline

Mandatory for production. Map of **OWASP API Security Top 10 (2023)** → controls. Extra controls scale with exposure (public > partner > internal).

Security is **not** a later phase.

## OWASP API Top 10 → controls

| ID | Risk | Required control |
| --- | --- | --- |
| **API1** | Broken object level authorization (BOLA/IDOR) | Authorize **every** object access in the application: `resource.owner == principal` (or ReBAC/ABAC). Never trust IDs in the URL alone. Tests for cross-user access. |
| **API2** | Broken authentication | OAuth **2.1** / OIDC for users. Validate `iss`, `aud`, `exp`, signature. Rotate/revoke refresh tokens. No rolling your own JWT crypto. Short-lived access tokens. |
| **API3** | Broken object property / mass assignment | Explicit response DTOs; allowlists on writes; never bind request JSON onto internal entities. |
| **API4** | Unrestricted resource consumption | Rate limit **by identity** (fallback IP). Timeouts. Max body size. Pagination required on lists. Cost limits on GraphQL. |
| **API5** | Broken function level authorization | Deny by default. Admin routes are a separate permission, not a hidden URL. |
| **API6** | Unrestricted sensitive business flows | Throttle/abuse-detect checkout, signup, one-time codes, password reset. Not just authz — *business* quotas. |
| **API7** | SSRF | Allowlist outbound URLs/schemes; no user-controlled fetch-to-URL without a validator; block link-local/metadata IPs. |
| **API8** | Security misconfiguration | HTTPS only, HSTS, hardened headers, no stack traces, no default creds, CORS allowlist (no `*` with credentials), dependency updates. |
| **API9** | Improper inventory | OpenAPI is the inventory. No shadow endpoints. Retire old versions. Auth on undocumented routes too. |
| **API10** | Unsafe consumption of APIs | Treat **outbound** API data as untrusted: timeouts, validate, least privilege credentials, no forwarding internal tokens. |

## Always-on (all surfaces)

- TLS 1.2+ (prefer 1.3). No plaintext HTTP in prod
- Secrets in a manager — **never** in URLs, git, or logs
- Schema validation at the edge (OpenAPI/protobuf/GraphQL)
- Parameterized queries; injection defense
- Safe errors: stable `code` + public message; correlation id; no internals
- PII redaction in logs
- Idempotency keys for mutating retries (payments, creates)
- Security headers: `HSTS`, `X-Content-Type-Options`, `Referrer-Policy`, `Cache-Control` on sensitive responses
- Audit log for authz failures and admin actions
- Data minimization: don't return unused sensitive fields

## Auth choices

| Mode | Use when | Avoid |
| --- | --- | --- |
| OAuth 2.1 / OIDC | User-facing | Opaque home-grown sessions *and* JWT without a store, mixed at random |
| Session cookie + CSRF | Browser same-site first-party | Cross-site SPA without CSRF strategy |
| mTLS / workload identity | Service-to-service | As the *only* user auth |
| Scoped API keys | Simple partner ingest | Global long-lived key, keys in query string, one key for all partners |

## Extra by exposure

| Public | Partner | Internal |
| --- | --- | --- |
| WAF, bot rules, stricter rate limits, persisted queries if GraphQL | Request signing, mTLS optional, IP allowlist optional | Network policy; still authn/authz — do not "trust the VPC" alone |
| Webhook **HMAC signatures** + timestamp (replay window) | Same | n/a |

## Veto

API keys in query strings. JWT in localStorage as the *only* story without XSS threat model. `CORS: *`. GraphQL introspection in prod. Verbose 500 bodies. Security postponed to "phase 2".

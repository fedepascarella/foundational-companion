# Tool design catalog and baseline

The baseline is **mandatory**. The table is how to shape tools, not whether to skip safety.

## Baseline (always)

- Allowlist tools in code. The model cannot invent endpoints.
- JSON Schema (or equivalent) for every argument. Validate before execute.
- Names and descriptions written for the **model**, with when-not-to-use.
- Timeouts and max result size. Truncate with a pointer to fetch more.
- Errors the model can recover from (`code`, `message`, `retryable`).
- Idempotency keys on creates/updates.
- Authz in the tool (same object-level rules as the API). Tenant from the session, not from the model.
- Mutations: confirmation / HITL unless the PRD says auto.
- Log tool name, args (redact PII), latency, success.
- Treat returned data as untrusted in later prompts (injection).

## Tool shapes

| Shape | Rank | Use when | Avoid when |
| --- | --- | --- | --- |
| **Read** (get/search) | 1 | Grounding, lookup | Returning entire tables |
| **Write** (create/update) | 2 | Product actions | Without HITL/idempotency |
| **Paginated list** | 1 | Search results | Dump 10k rows |
| **Sandbox code** | 3 | Compute/transform | Host network/filesystem |
| **SQL tool** | X | — | Always; write a domain tool |
| **Shell tool** | X | — | Product APIs |
| **HTTP proxy / fetch URL** | 3 | Documented allowlist | Open SSRF |

## Result contract

Prefer `{ ok, data, error }` with stable `error.code`. Never stack traces.

## HITL

| Action | Default |
| --- | --- |
| Read | auto |
| Create ticket / draft | auto or confirm |
| Email, pay, delete, ACL change | confirm |

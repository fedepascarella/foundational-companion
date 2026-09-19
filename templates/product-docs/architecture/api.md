# API

Style, auth, versioning — fill from ADR 0008.

```mermaid
flowchart LR
  client[Client] --> https[HTTPS]
  https --> auth[Authn / Authz]
  auth --> api[Resource API]
```

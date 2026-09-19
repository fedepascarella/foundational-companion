# API style catalog

Rank: **1** default, **2** common mix-in, **3** criteria, **X** avoid unless mandated.

| Style | Rank | Use when | Avoid when | Contract | Versioning |
| --- | --- | --- | --- | --- | --- |
| **REST / resource + JSON** | 1 | Product/public APIs, CRUD + actions | Chatty mobile over high-latency if a BFF/GraphQL criterion fires | **OpenAPI 3.x** | URI `/v1` or header |
| **RPC JSON** (JSON-RPC) | 3 | Action-shaped internal tools | Public resources that want HTTP semantics | JSON schema | Method name version |
| **gRPC** | 3 | Internal service-to-service, streaming, codegen, binary | Browser clients without grpc-web/Connect gateway; one modular monolith | Protobuf | Package/service version |
| **Connect RPC** | 3 | Same as gRPC with better HTTP/JSON interop | No proto culture | Protobuf | Same |
| **tRPC** | 3 | TS-only end-to-end, same-repo web+API | Public/partner API, non-TS clients | TS types | App deploy lockstep |
| **GraphQL** | 3 | Many clients, sparse/varied reads, one round-trip | Simple CRUD; public without persisted queries + depth/cost + field authz | GraphQL schema | Schema evolution |
| **GraphQL subscriptions** | 3 | GraphQL already chosen + live data | Use SSE/WebSocket without GraphQL if that's simpler |
| **HATEOAS** | 3 | True hypermedia clients you control | SPA that ignores links | OpenAPI + link relations | Media type |
| **SOAP / XML** | X | Partner **mandates** it | Anything else | WSDL | SOAP action |
| **OData** | 3 | Microsoft ecosystem mandate | General public API | OData spec | Protocol version |
| **Webhooks (outbound)** | 2 | Notify partners/users of events | Polling is fine at low volume | Signed payload, OpenAPI for body | Event type version |
| **WebSocket** | 3 | Bidirectional low-latency (collab, trading) | Notifications that SSE or webhooks cover |
| **SSE** | 2 | Server→client stream (tokens, logs, job progress) | Client must talk back on the same socket |
| **Long polling** | 3 | Legacy clients, no SSE | New APIs |
| **AsyncAPI / event APIs** | 3 | Documented async channels (queue/bus) | In-process domain events |
| **File / multipart / batch** | 2 | Uploads, bulk import | Base64 in JSON for large blobs |
| **BFF HTTP surface** | 2 | Architecture chose BFF — still REST or GraphQL on that surface | Extra style besides the BFF's job |

## Surfaces

| Surface | Default style | Auth |
| --- | --- | --- |
| Public product | REST + OpenAPI | OIDC / OAuth 2.1 |
| Partner | REST + webhooks | OAuth client credentials or mTLS |
| Internal (modular monolith) | In-process; if HTTP, REST | Network + service identity |
| Internal (microservices) | REST or gRPC — pick one org-wide | mTLS or mesh identity |
| BFF | REST or GraphQL | User session / OIDC, not the user's DB password |

Mix example: REST public + webhooks + SSE for one job-status route.

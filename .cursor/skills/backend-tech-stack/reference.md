# Backend tech stack catalog

Verified **Sep 2026**. Rank: **1** default when that language is chosen, **2** alternative in-family, **3** special case.

Prefer **LTS/stable**. Skip alphas (e.g. Nest 12 alpha).

## Languages

| Language | Runtime to prefer | Rank as default org-wide | Use when | Avoid when | Paradigm fit |
| --- | --- | --- | --- | --- | --- |
| **TypeScript** | Node.js **24 LTS** (22 = maintenance LTS; 26 = Current) | — | One language with web, typed APIs, team fluency | Heavy CPU/ML in-process | Hybrid |
| **Python** | **3.14** (3.13 still supported) | — | ML/data, scripting-adjacent APIs, team fluency | Ultra-low-latency fan-out | Hybrid |
| **Go** | **1.27** | — | Simple ops, concurrency, small services | Rich domain modeling culture wants classes | Procedural + interfaces |
| **Kotlin / Java** | Java **25 LTS** (27 current); Kotlin **2.4.x** | — | Enterprise, existing JVM, strong typing | Tiny team, slow startup on constrained PaaS without native | OOP/hybrid |
| **.NET (C#)** | **.NET 10** LTS line — confirm latest patch | — | Microsoft shops, high throughput APIs | Team has no C# | Hybrid |
| **Rust** | latest stable via rustup (**1.8x+**) | — | Safety + performance, constrained infra | CRUD time-to-market, small mixed team | Hybrid |
| **Ruby** | **3.3/3.4** stable — confirm patch | — | Rapid product, Rails culture | CPU-heavy, strict typing mandate | OOP/hybrid |
| **Elixir** | **1.17+** / OTP **27+** — confirm | — | Soft real-time, huge fan-out, Phoenix LiveView | Team has no BEAM; simple CRUD | FP |

There is no org-wide default language. Pick from team + domain.

## Frameworks (shortlist)

| Language | 1st | 2nd | Special |
| --- | --- | --- | --- |
| TypeScript | **NestJS 11.1.x** (structured) or **Fastify 5.12.x** (thin) | **Hono 4.13.x** (edge/Workers) | Express only if inheriting it |
| Python | **FastAPI 0.141.x** | **Django 5.2 LTS** + DRF (admin/CMS-shaped) | Flask only if inheriting |
| Go | **net/http** + chi or **Gin** | Echo | Fiber if already standard |
| Kotlin/Java | **Spring Boot 4.x** | **Ktor 3.x** (Kotlin-first, lighter) | Quarkus if native/k8s is decided |
| .NET | **ASP.NET Core** (same line as runtime) | Minimal APIs | — |
| Rust | **Axum** | Actix | — |
| Ruby | **Rails 8.x** | — | — |
| Elixir | **Phoenix 1.8.x** | — | — |

Pick **one** HTTP framework.

## Data

| Store | Rank | Use when | Avoid when |
| --- | --- | --- | --- |
| **PostgreSQL 18** (19 is beta — do not use in prod) | 1 | System of record | — |
| **Redis 8.x** | 3 | Cache/session/rate-limit after a named need | As primary DB |
| **Object storage** (S3-compatible) | 2 | Files, blobs, backups | Tiny base64 in Postgres forever if objects will grow |
| **Cloud queue** (SQS, Pub/Sub, Service Bus) | 3 | Durable async | In-process jobs that may die with the dyno *and* you cannot use `SKIP LOCKED` |
| **Search engine** | 3 | Search that Postgres FTS cannot do | "We might search" |
| **Second OLTP DB** | X | — | New microservice fashion |

## Do not add (unless PRD)

Service mesh, custom k8s operators, event backbones, Graph DBs, time-series DBs, dual writes between SQL and NoSQL, an ORM *and* a competing query builder as two standards.

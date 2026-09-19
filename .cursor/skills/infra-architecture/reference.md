# Infra architecture catalog

Rank: **1** default, **2** common, **3** criteria, **X** avoid for greenfield.

## Compute

| Pattern | Rank | Use when | Avoid when | Examples (not the choice) |
| --- | --- | --- | --- | --- |
| **PaaS / app platform** | 1 | One/few processes, team wants little ops | Custom kernel, sidecars everywhere | Render, Fly, Railway, Azure App Service, Elastic Beanstalk |
| **Managed containers** (no k8s API) | 1 | Need a container, not a cluster | You need k8s primitives | Cloud Run, App Runner, Container Apps, Cloud Run-class |
| **Serverless functions** | 2 | Spiky, event-shaped, short work | Long workers, complex VPC, large binary | Lambda, Cloud Functions, Azure Functions, Workers |
| **VMs** | 3 | Lift-and-shift, dedicated host, compliance box | Default for a new HTTP API | EC2, GCE, Azure VM |
| **Kubernetes** | 3 | Many services, custom schedulers, platform team exists | First product, one API | GKE, EKS, AKS |

## Data / integration

| Pattern | Rank | Use when |
| --- | --- | --- |
| **Managed relational** | 1 | System of record (Postgres) |
| **Managed cache** | 3 | Named cache/rate-limit need |
| **Object storage + CDN** | 2 | Files, public assets |
| **Managed queue** | 3 | Durable async |
| **Multi-AZ managed DB** | 2 | Availability NFR exists |

## Identity, secrets, network

| Pattern | Rank | Use when | Avoid when |
| --- | --- | --- | --- |
| **Hosted IdP** | 1 | User login (Cognito, Auth0, Clerk, Keycloak-as-service, Entra, Google Identity) | Homegrown password DB without a reason |
| **Secrets manager** | 1 | All runtime secrets | `.env` on the server as the store |
| **TLS at edge** | 1 | Always | Terminating TLS inside the app *only* without a threat model |
| **WAF / rate limit at edge** | 2 | Public internet | Internal-only admin on VPN still skip **app** rate limits |
| **Private network / VPC connectors** | 2 | DB not on public IP | Hairpin everything through the public internet |
| **Service mesh** | X | — | Modular monolith / few services |
| **mTLS between services** | 3 | Microservices on a network you do not trust | One process |

## Observability

| Pattern | Rank | Use when |
| --- | --- | --- |
| **Structured logs + correlation id** | 1 | Always |
| **Metrics** | 1 | Golden signals: latency, errors, saturation, traffic |
| **Traces** | 2 | More than one hop (API → DB is already useful) |
| **Error tracking product** | 2 | User-facing API |

## IaC

| Tool | Rank | Use when | Avoid when |
| --- | --- | --- | --- |
| **None / console** | 2 | Single PaaS + managed DB, week-one spike | Anything you cannot reproduce |
| **OpenTofu / Terraform** | 1 | Two+ cloud resources, default IaC | — |
| **Pulumi** | 2 | Team wants general-purpose language | Mixing TF + Pulumi |
| **Cloud-native** (CDK, Bicep, Deployment Manager) | 2 | Locked to one cloud and team fluency | Multi-cloud story |

Map examples after the pattern: e.g. "managed containers → Cloud Run on GCP" because the PRD said GCP — the **pattern** is still managed containers.

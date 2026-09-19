# Providers and frameworks catalog

Shortlist as of 2026. Re-verify versions before pinning. Rank: **1** default when it fits, **2** common, **3** criteria, **X** avoid as the app core.

## Providers

| Provider | Rank | Use when | Avoid when |
| --- | --- | --- | --- |
| **Anthropic** | 1 | Quality, computer-use, prompt cache, MCP-native hosts | Policy forbids Anthropic |
| **OpenAI** | 1 | Broad models, Agents SDK, strong TS/Python SDKs | Policy forbids OpenAI |
| **Google (Gemini / Vertex)** | 1 | GCP, long context, context cache | Not on GCP and no reason |
| **Azure OpenAI** | 2 | Microsoft enterprise / data residency | You are not in that estate |
| **Amazon Bedrock** | 2 | AWS, multi-model under one IAM | Extra hop with no AWS need |
| **OpenRouter / Together / Groq** | 3 | Price/speed experiments, fallback | Sole production without a contract |
| **Self-host (vLLM / Ollama)** | 3 | Air-gap, cost at scale, you will ops GPUs | First product week |

Pick **one** primary chat/extract model and **one** embed model if RAG. Multimodal only if ADR 0011 said so.

## Frameworks

| Framework | Rank | Use when | Avoid when |
| --- | --- | --- | --- |
| **Official SDK only** | 1 | Default. Chat, structured output, tools | Huge durable graph + HITL you don't want to write |
| **Pydantic AI** (Python) | 2 | Typed tools, MCP client, Python from ADR 0007 | TypeScript/.NET stack |
| **OpenAI Agents SDK** | 2 | OpenAI-first agents, handoffs | Multi-provider core |
| **Claude Agent SDK** | 3 | Claude + filesystem/bash/MCP harness | Any non-Claude primary |
| **LangGraph** | 3 | Durable state, resume, HITL, cycles | Simple RAG chat |
| **LangChain agents** | X | — | As the application; too much magic for this playbook’s default |
| **LlamaIndex** | 3 | Complex index graphs beyond Postgres | Hybrid pgvector is enough |
| **Google ADK** | 3 | Google-first, polyglot | Other clouds |
| **Vercel AI SDK** | 2 | TS streaming UI + server | No TS frontend |
| **Semantic Kernel / AutoGen** | 3 | .NET / Microsoft house style | Greenfield Python/TS |
| **CrewAI** | 3 | Role-play prototypes | Production control plane |

## Observability

Log prompts (redacted), tool calls, token counts, latency. Prefer provider traces or OpenTelemetry. Evals: golden questions if RAG; schema-valid if extract.

## Mapping to ADR 0007

| Language | Default orchestration |
| --- | --- |
| TypeScript | Official SDK (+ Vercel AI SDK if streaming UI) |
| Python | Official SDK or Pydantic AI |
| Go / Java / C# | Official SDK or cloud SDK; Semantic Kernel if .NET |

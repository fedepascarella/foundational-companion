---
name: llm-providers-frameworks
description: >-
  Chooses model provider and orchestration framework (official SDK vs Pydantic
  AI vs LangGraph vs vendor agent SDKs). Use during the Gen AI second pass or
  when writing ADR 0019.
disable-model-invocation: true
---

# LLM providers and frameworks

Last skill. Fit the stack to ADRs 0011–0018 and backend language (ADR 0007). Default bet: **official provider SDK** + a thin loop in-process.

## Workflow

1. Constraints: language, data residency, existing cloud, latency, Claude/GPT/Gemini preference, budget.
2. Score providers and frameworks in [reference.md](reference.md).
3. One primary provider. A second is only for failover if the PRD requires it.
4. Emit a Decision block.

## Default bet

One frontier provider via their SDK (or the cloud’s Bedrock/Azure/Vertex wrap). No LangChain-as-the-app. Pydantic AI if Python and you want typed graphs without a platform. LangGraph only for durable HITL graphs. LlamaIndex only for heavy RAG you are not doing in Postgres.

## Veto

- Dual-provider “portability” with no failover SLO
- Framework that hides the prompt you must debug
- Claude Agent SDK if you refused Claude lock-in
- Installing five orchestrators

## Decision block

- Skill: llm-providers-frameworks
- Choice: provider + models + framework
- Observability: traces (provider or OpenTelemetry)

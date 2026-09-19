# Prompt caching catalog

Rank: **1** default, **2** common, **3** criteria.

## Provider features (verify current docs at implementation)

| Mechanism | Rank | Use when | Notes |
| --- | --- | --- | --- |
| **Automatic prefix cache** (OpenAI cached input tokens, similar) | 1 | Identical prefix across requests | Keep tools+system byte-stable |
| **Explicit cache breakpoints** (Anthropic) | 1 | Long static prefix | Mark cacheable blocks; TTL per provider |
| **Explicit context cache** (Gemini) | 2 | Large stable corpus in context | Separate from RAG store |
| **Session cache** | 2 | Multi-turn same conversation | Provider-specific |
| **No cache** | 2 | Tiny prompts, cost irrelevant | — |
| **App-level prompt Redis** | 3 | You cache **your** compiled prefix to send unchanged | Do not invent a second tokenizer cache |

## Prefix layout (recommended)

1. System (policy, persona) — stable
2. Tool / MCP schemas — stable
3. Global corpus (only if stuff-in-context and shared) — stable
4. Memory summary — **semi-stable**; often **not** in explicit cache
5. Retrieved chunks — **volatile**; not in static prefix
6. User message — never cached as prefix

## Invalidation

Bust cache when: tools change, system prompt changes, model version that doesn’t share cache, tenant-specific policy (then prefix **per tenant**, never mixed).

## Safety

Cached prefixes are still sent to the provider. No secrets. No other tenants.

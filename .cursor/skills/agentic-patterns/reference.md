# Agentic patterns catalog

Rank: **1** default, **2** common, **3** criteria, **X** avoid unless named.

| Pattern | Rank | Use when | Avoid when |
| --- | --- | --- | --- |
| **Not an agent** (pure LLM job) | 1 | Structured call, chain, or RAG generate | Runtime tool choice is required |
| **Deterministic workflow** (graph you wrote) | 1 | Known steps, optional LLM nodes | Path depends on tool results in unknown order |
| **Router** | 2 | One of N specialists, cheap intent | Specialists share one prompt |
| **ReAct** | 2 | Tools + observe + retry, short horizon | Long research with no stop condition |
| **Plan-and-execute** | 2 | Multi-step goal, plan can be reviewed | Plan is just a verbose ReAct |
| **Orchestrator–workers** | 3 | Fan-out independent work | One worker |
| **Reflexion / critic** | 3 | You have a checker (tests, rubric) | Infinite self-talk |
| **CodeAct** | 3 | Sandboxed code is the tool | Unsandboxed eval |
| **Computer use / browser agent** | 3 | UI is the only API | You have an API |
| **Durable graph** (LangGraph-class) | 3 | Long-running, HITL, resume | One request/response |
| **Swarm / free handoff** | X | Rare peer negotiation | Default multi-agent |

Always set: max iterations, wall-clock timeout, token/cost cap, and what happens on exhaustion (fail closed).

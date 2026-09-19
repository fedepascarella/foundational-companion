# Agent topology catalog

Rank: **1** default, **2** common, **3** criteria, **X** avoid.

| Topology | Rank | Use when | Avoid when |
| --- | --- | --- | --- |
| **None** | 1 | Workflow / single LLM call | — |
| **Single agent** | 1 | One tool belt, one user goal | Tool list is huge and conflicting |
| **Sequential pipeline** | 2 | Fixed stages (research → draft → check) | Stages need to loop arbitrarily |
| **Supervisor + specialists** | 3 | Disjoint tools/domains, supervisor routes | Same tools, split for org-chart reasons |
| **Sub-agent as tool** | 3 | Isolated context for a messy subtask (explore repo, long browse) | Every function is a sub-agent |
| **Peer swarm / handoff** | 3 | Equals passing a thread | You can name a supervisor |
| **A2A network** | X | Multi-vendor agent products | One product process |

## Context

| Mode | Rank | Use when |
| --- | --- | --- |
| **Isolated** (fresh messages, return summary) | 1 | Sub-agents |
| **Shared thread** | 2 | Sequential humans-in-the-loop |
| **Handoff** (transfer the transcript) | 3 | User should see one continuous agent |

## Bounds

- Max depth **1** unless the PRD says otherwise
- Supervisor may not be a specialist (avoids loops)
- Each specialist: ≤ ~8 tools

# LLM patterns catalog

Rank: **1** default, **2** common, **3** criteria, **X** avoid for greenfield.

## Jobs

| Job | Rank | Use when | Avoid when |
| --- | --- | --- | --- |
| **None** | 1 | No generate/extract/chat in the PRD | User insisted on a model anyway |
| **Classify** | 1 | Closed labels | Open-ended advice |
| **Extract / structured fill** | 1 | Fields from text | Knowledge Q&A |
| **Summarize / rewrite** | 1 | Transform known text | Inventing facts |
| **Generate** | 2 | Drafts the user will edit | Unreviewed customer-facing legal text |
| **Chat** | 2 | Multi-turn help | A form would do |
| **Embed only** | 2 | Search/similarity, no generation | You still need answers |
| **Multimodal** | 3 | Images/audio are in the PRD | Fashion |

## Prompt patterns

| Pattern | Rank | Use when | Avoid when |
| --- | --- | --- | --- |
| **Zero-shot** | 1 | Clear instruction, strong model | Subtle domain jargon |
| **Few-shot** | 1 | Format or edge cases | Dozens of shots that should be retrieval |
| **Structured output** (schema / tool-forced JSON) | 1 | Anything a program consumes | Free-form chat only |
| **Chain-of-thought** | 2 | Hard reasoning; hide CoT from users | Simple extract |
| **Self-consistency** | 3 | High-stakes classify, cost OK | Chat UX |
| **Tree-of-thought** | 3 | Search-like reasoning | Production latency |
| **Prompt chaining** | 2 | Fixed 2–4 steps | Dynamic tool choice (that is agentic) |
| **Routing** | 2 | Distinct jobs, cheap classifier first | One job |
| **Parallelization** | 2 | Independent sub-tasks | Coupled reasoning |
| **Evaluator–optimizer** | 3 | Quality loop with a rubric | One-shot drafts |
| **Streaming** | 2 | Chat/token UX | Batch jobs |
| **Batch / offline** | 2 | Nightly extract | Interactive |
| **Guardrails** (input/output filters) | 1 | User-facing | — |
| **HITL** | 2 | Side effects or low-confidence | Every token |
| **Fine-tune / LoRA** | 3 | Stable task, lots of labels, prompts failed | First week |
| **Distillation** | 3 | Cost after a teacher model works | No teacher yet |

Grounded Q&A over a corpus is **RAG** (`rag-patterns`), not a few-shot dump of the wiki.

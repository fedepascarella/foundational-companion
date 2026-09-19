# CI/CD

```mermaid
flowchart LR
  pr[Pull request] --> checks[lint test build]
  checks --> merge[Merge to main]
  merge --> staging[Staging]
  staging --> prod[Production]
```

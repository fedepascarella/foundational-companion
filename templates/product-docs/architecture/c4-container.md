# C4 container

```mermaid
C4Container
  title Containers
  Person(user, "User")
  Container(api, "API", "HTTPS JSON REST", "Modular monolith")
  ContainerDb(db, "Postgres", "System of record")
```

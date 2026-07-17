## Decision 001

### Context

A consistent approach was needed to track development progress and engineering decisions throughout the project.

### Options Considered

1. Maintain no documentation.
2. Use a single log file.
3. Separate documentation by purpose.

### Decision

Use dedicated log files for development progress, engineering decisions, learning notes, and troubleshooting.

### Reason

Separating documentation by purpose makes information easier to maintain, search, and reference during development and interviews.

### Trade-offs

Requires discipline to keep multiple files updated, but results in a much clearer project history.



## Decision 002

### Context

The project required a reliable data warehouse to store raw GitHub data before transformation.

### Options Considered

1. Store JSON files locally.
2. Use SQLite.
3. Load directly into Snowflake.

### Decision

Use Snowflake as the project's centralized cloud data warehouse.

### Reason

- Industry-standard cloud data warehouse.
- Native support for analytical workloads.
- Integrates seamlessly with dbt.
- Supports scalable ELT pipelines.

### Trade-offs

Requires connection configuration and cloud resources but provides a production-grade architecture.
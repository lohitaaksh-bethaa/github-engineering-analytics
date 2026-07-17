## Day 1 - Phase 1: Project Foundation
Date: 17 July 2026

### Goal

Set up the GitHub Engineering Analytics project structure and documentation framework.

### Completed

- Defined the project scope.
- Finalized the technology stack.
- Planned the repository structure.
- Created the documentation framework.
- Created the logging system.

### Outcome

The project foundation and documentation structure are ready for development.

### Next Steps

Begin Phase 2 by setting up GitHub API authentication and building the ingestion pipeline.



# Day 1 – Phase 2: GitHub Repository Data Ingestion
Date: 17 July 2026

## Goal

Build an end-to-end data ingestion pipeline to extract live GitHub repository data and load it into the Snowflake raw layer.

## Completed

- Configured GitHub API authentication.
- Built a GitHub API client for repository extraction.
- Implemented API pagination to retrieve multiple repositories.
- Configured a Snowflake connection using the Snowflake Python Connector.
- Created the `RAW.REPOSITORIES` table.
- Developed the data loading module.
- Implemented null value handling for API responses.
- Successfully loaded 100 GitHub repositories into Snowflake.
- Verified data integrity in Snowflake.

## Outcome

Successfully built the first production-ready ingestion pipeline from GitHub REST API to Snowflake. The raw repository data is now available for downstream transformations using dbt.

## Next Steps

- Extract Pull Requests
- Extract Issues
- Extract Commits
- Extract Contributors
- Build remaining RAW tables



# Day 1 – Phase 3: dbt Project Setup
Date: 17 July 2026

## Goal

Initialize the dbt project and establish the foundation for data transformation.

## Completed

- Initialized a new dbt project.
- Configured the `dbt_project.yml` file.
- Configured the `profiles.yml` connection to Snowflake.
- Organized the project into staging, intermediate, and marts directories.
- Created the first source definition for the raw repository data.
- Built the first staging model (`stg_repositories.sql`).
- Added model documentation using YAML.
- Configured and executed schema tests.
- Validated the dbt connection to Snowflake.
- Successfully executed the staging model.

## Outcome

The dbt transformation layer has been successfully initialized and is ready for developing staging, intermediate, and mart models.

## Next Steps

- Develop additional staging models.
- Build intermediate transformation models.
- Design dimensional and fact models.


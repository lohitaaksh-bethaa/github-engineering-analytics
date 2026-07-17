# GitHub Engineering Analytics Platform

An end-to-end Analytics Engineering project that extracts live engineering data from the GitHub REST API, loads it into Snowflake, transforms it using dbt, and visualizes engineering metrics in Power BI.

This project demonstrates a modern ELT architecture using production-grade data engineering and analytics engineering practices.

---

# Project Overview

The objective of this project is to build a scalable analytics platform that enables engineering teams to monitor software development productivity through GitHub repository activity.

The platform will provide insights into:

- Repository Growth
- Pull Request Analytics
- Commit Activity
- Issue Management
- Contributor Productivity
- Code Review Performance
- Engineering KPIs

---

# Tech Stack

| Category | Technology |
|-----------|------------|
| Programming | Python |
| API | GitHub REST API |
| Data Warehouse | Snowflake |
| Transformation | dbt Core |
| Version Control | Git & GitHub |
| Dashboard | Power BI |
| CI/CD | GitHub Actions *(Upcoming)* |

---

# Project Architecture

```
                    GitHub REST API
                           │
                           │
                    Python Extraction
                           │
                           │
                    Pandas DataFrame
                           │
                           │
                 Snowflake RAW Layer
                           │
                           │
                  dbt Staging Models
                           │
                           │
               dbt Intermediate Models
                           │
                           │
                  dbt Mart Models
                           │
                           │
                     Power BI Dashboard
```

---

# Repository Structure

```
github-engineering-analytics/

│
├── .github/
│
├── dashboards/
│
├── dbt/
│
├── docs/
│
├── extraction/
│   ├── config.py
│   ├── github_client.py
│   ├── snowflake_loader.py
│   ├── main.py
│   └── utils.py
│
├── images/
│
├── my_logs/
│   ├── dbt-development-log.md
│   ├── decision_log.md
│   ├── learning_notes.md
│   └── problems_and_fixes.md
│
├── sql/
│
├── tests/
│
├── README.md
│
└── requirements.txt
```

---

# Current Progress

| Phase | Status |
|--------|--------|
| Phase 1 – Project Foundation | ✅ Completed |
| Phase 2 – Data Ingestion | ✅ Completed |
| Phase 3 – dbt Project Setup | ⏳ Pending |
| Phase 4 – Staging Models | ⏳ Pending |
| Phase 5 – Intermediate Models | ⏳ Pending |
| Phase 6 – Data Mart Models | ⏳ Pending |
| Phase 7 – Testing | ⏳ Pending |
| Phase 8 – CI/CD | ⏳ Pending |
| Phase 9 – Dashboard Development | ⏳ Pending |

---

# Completed Features

## Project Setup

- Repository initialized
- Folder structure created
- Documentation framework established
- Logging system implemented

---

## GitHub Data Extraction

Implemented a Python-based extraction pipeline capable of:

- Authenticating with the GitHub REST API
- Fetching repository metadata
- Handling API pagination
- Converting API responses into Pandas DataFrames

---

## Snowflake Integration

Successfully connected Python to Snowflake using the Snowflake Python Connector.

Implemented:

- Connection management
- Data loading
- Transaction handling
- Error handling
- NULL value management

---

## Data Warehouse

Created the RAW schema and loaded live GitHub repository data into:

```
RAW.REPOSITORIES
```

Current dataset:

- 100 GitHub repositories

---

# Data Pipeline

Current implementation:

```
GitHub REST API
        │
        ▼
Python
        │
        ▼
Pandas DataFrame
        │
        ▼
Snowflake RAW.REPOSITORIES
```

Upcoming implementation:

```
GitHub REST API
        │
        ▼
Python
        │
        ▼
Snowflake RAW
        │
        ▼
dbt Staging
        │
        ▼
dbt Intermediate
        │
        ▼
dbt Marts
        │
        ▼
Power BI
```

---

# Documentation

Project documentation is maintained throughout development.

Current logs include:

- Development Log
- Decision Log
- Learning Notes
- Problems and Fixes

These logs document engineering decisions, implementation progress, technical learnings, and troubleshooting steps.

---

# Upcoming Features

The next development phases include:

- GitHub Pull Requests ingestion
- GitHub Issues ingestion
- GitHub Commits ingestion
- Contributor analytics
- dbt project setup
- Staging models
- Intermediate models
- Fact and Dimension models
- Data quality tests
- Documentation generation
- CI/CD with GitHub Actions
- Power BI dashboard
- Engineering KPI calculations

---

# Engineering Metrics (Planned)

The final dashboard will include:

- Total Repositories
- Repository Growth
- Pull Requests Created
- Pull Requests Merged
- Merge Lead Time
- Open Issues
- Closed Issues
- Commit Frequency
- Deployment Frequency
- Active Contributors
- Code Review Performance
- Engineering Productivity Metrics

---

# Project Status

**Current Stage**

✅ Phase 2 Completed

The project currently supports end-to-end ingestion of live GitHub repository metadata into Snowflake and is ready for transformation using dbt.

---

# Author

**Lohitaaksh Bethaa**

Analytics Engineer Portfolio Project
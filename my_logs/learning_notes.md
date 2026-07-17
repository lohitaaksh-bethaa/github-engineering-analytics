# GitHub REST API Ingestion

## What is it?

The ingestion layer is responsible for extracting raw data from the GitHub REST API and loading it into the Snowflake raw layer without applying business transformations.

## Components

- GitHub REST API
- Python
- Requests
- Pandas
- Snowflake Connector

## Pipeline Flow

GitHub REST API
↓
Python Extraction
↓
Pandas DataFrame
↓
Data Cleaning
↓
Snowflake RAW Layer

## Key Learnings

- Separate extraction and loading logic.
- Preserve raw data before transformation.
- Handle API pagination.
- Handle missing values before loading.
- Validate successful data loads.



## Raw Layer vs Staging Layer

The RAW layer is intended to store data as it is ingested from the source system. During development, repeated ingestion can create duplicate records.

The STAGING layer is responsible for cleaning and standardizing the raw data before it is used in downstream models.

Key Takeaway:
- Raw data may contain duplicates.
- Staging models should produce clean, reliable datasets for analytics.



# dbt Project Fundamentals

## What is dbt?

dbt (Data Build Tool) is an analytics engineering framework used to transform raw warehouse data into analytics-ready datasets using SQL.

## Key Components

- dbt_project.yml
- profiles.yml
- Models
- Sources
- Schema YAML
- Tests

## Folder Structure

models/
├── staging/
├── intermediate/
└── marts/

## What I Learned

- dbt executes SQL inside the data warehouse.
- Models are SQL SELECT statements that become tables or views.
- Sources define existing warehouse tables.
- YAML files are used for documentation and testing.
- dbt automatically manages model dependencies.
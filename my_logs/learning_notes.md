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
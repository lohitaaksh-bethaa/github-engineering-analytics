# Problems and Fixes

## Issue 001 – Snowflake Invalid Identifier 'NaN'

### Problem

While loading GitHub repository data into Snowflake, the insert operation failed with the following error:
    SQL compilation error:
    invalid identifier 'NAN'


### Root Cause

The GitHub API returned `null` values for the `language` field of some repositories. When the data was loaded into a pandas DataFrame, these values became `NaN`.

Although `df.where(pd.notnull(df), None)` was used, the DataFrame retained `NaN` values because of the underlying column data type. The Snowflake connector attempted to insert `NaN` instead of SQL `NULL`, resulting in the compilation error.

### Solution

Converted the DataFrame to `object` type before replacing missing values:

```python
df = df.astype(object).where(pd.notnull(df), None)
```

This correctly converted pandas NaN values into Python None, which the Snowflake connector translated into SQL NULL.

What I Learned:
- GitHub API null values become NaN in pandas.
- NaN is not automatically interpreted as SQL NULL by the Snowflake connector.
- Converting the DataFrame to object type allows missing values to be replaced with Python None.



## Issue 002 – dbt Unique Test Failure

### Problem

The `unique` test on `repository_id` failed for the staging model.

### Root Cause

The ingestion pipeline had been executed multiple times, inserting duplicate repository records into the `RAW.REPOSITORIES` table.

### Solution

Truncated the raw table during development and reloaded the data. Future iterations will replace this with a production-friendly deduplication or incremental loading strategy.

### What I Learned

A failing dbt test can reveal data quality issues in upstream ingestion rather than problems in the dbt model itself.
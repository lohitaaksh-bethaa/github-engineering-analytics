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
import pandas as pd
import snowflake.connector

from config import (
    SNOWFLAKE_ACCOUNT,
    SNOWFLAKE_USER,
    SNOWFLAKE_PASSWORD,
    SNOWFLAKE_WAREHOUSE,
    SNOWFLAKE_DATABASE,
    SNOWFLAKE_SCHEMA,
    SNOWFLAKE_ROLE,
)

from github_client import get_repositories


def load_repositories(df):

    # Extract data from GitHub


    # Convert NaN values to None for Snowflake
    df = df.astype(object).where(pd.notnull(df), None)

    # Connect to Snowflake
    conn = snowflake.connector.connect(
        account=SNOWFLAKE_ACCOUNT,
        user=SNOWFLAKE_USER,
        password=SNOWFLAKE_PASSWORD,
        warehouse=SNOWFLAKE_WAREHOUSE,
        database=SNOWFLAKE_DATABASE,
        schema=SNOWFLAKE_SCHEMA,
        role=SNOWFLAKE_ROLE,
    )

    cursor = conn.cursor()

    insert_query = """
    INSERT INTO RAW.REPOSITORIES (
        repository_id,
        repository_name,
        full_name,
        language,
        created_at,
        updated_at,
        pushed_at,
        stars,
        forks,
        watchers,
        open_issues,
        default_branch,
        ingestion_timestamp
    )
    VALUES ( %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, CURRENT_TIMESTAMP())
    """
    try:
        for _, row in df.iterrows():

            cursor.execute(
                insert_query,
                (
                    row["id"],
                    row["name"],
                    row["full_name"],
                    row["language"],
                    row["created_at"],
                    row["updated_at"],
                    row["pushed_at"],
                    row["stargazers_count"],
                    row["forks_count"],
                    row["watchers_count"],
                    row["open_issues_count"],
                    row["default_branch"],
                ),
            )

        conn.commit()

        print(f"Successfully loaded {len(df)} repositories into Snowflake.")

    except Exception as e:
        conn.rollback()
        print(f"Error loading data: {e}")

    finally:
        cursor.close()
        conn.close()


if __name__ == "__main__":
    load_repositories()
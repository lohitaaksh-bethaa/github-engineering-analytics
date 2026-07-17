import time

from github_client import get_repositories
from snowflake_loader import load_repositories

def main():
    start_time = time.time()
    print("=" * 60)
    print("GitHub Engineering Analytics Pipeline Started")
    print("=" * 60)

    # Extract
    print("\nFetching repositories from GitHub...")
    df = get_repositories()

    print(f"Retrieved {len(df)} repositories.")

    # Load
    print("\nLoading data into Snowflake...")
    load_repositories(df)

    end_time = time.time()

    print("\nPipeline completed successfully!")
    print(f"Repositories Extracted : {len(df)}")
    print(f"Rows Loaded            : {len(df)}")
    print(f"Pipeline Duration      : {end_time - start_time:.2f} seconds")

if __name__ == "__main__":
    main()
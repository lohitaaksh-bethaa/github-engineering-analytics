# github_client.py

import requests
import pandas as pd
from config import GITHUB_TOKEN

BASE_URL = "https://api.github.com"

headers = {
    "Authorization": f"Bearer {GITHUB_TOKEN}",
    "Accept": "application/vnd.github+json"
}


def get_repositories(org_name="microsoft"):
    """
    Fetch repositories for a GitHub organization and return
    them as a pandas DataFrame.
    """

    params = {
        "per_page": 100,
        "page": 1
    }

    response = requests.get(
        f"{BASE_URL}/orgs/{org_name}/repos",
        headers=headers,
        params=params
    )

    response.raise_for_status()

    remaining = response.headers.get("X-RateLimit-Remaining")
    print(f"Remaining API requests: {remaining}")

    if remaining is not None and int(remaining) == 0:
        print("GitHub API rate limit reached.")

    repos = response.json()

    df = pd.DataFrame(repos)

    df = df[
        [
            "id",
            "name",
            "full_name",
            "private",
            "language",
            "default_branch",
            "created_at",
            "updated_at",
            "pushed_at",
            "size",
            "stargazers_count",
            "watchers_count",
            "forks_count",
            "open_issues_count",
        ]
    ]

    print(f"Fetched {len(df)} repositories.")

    return df


if __name__ == "__main__":
    df = get_repositories()
    print(df.head())
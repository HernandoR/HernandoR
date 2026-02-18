#!/usr/bin/env python3
from __future__ import annotations

import argparse
import json
import os
import sys
from pathlib import Path
from typing import Any
from urllib.parse import quote_plus
from urllib.request import Request, urlopen


START_TAG = "<!-- RECENT_REPOS:START -->"
END_TAG = "<!-- RECENT_REPOS:END -->"


def build_headers() -> dict[str, str]:
    headers = {
        "Accept": "application/vnd.github+json",
        "User-Agent": "readme-recent-repos-updater",
    }
    token = os.getenv("GITHUB_TOKEN")
    if token:
        headers["Authorization"] = f"Bearer {token}"
    return headers


def fetch_json(url: str, headers: dict[str, str]) -> Any:
    request = Request(url, headers=headers)
    with urlopen(request, timeout=30) as response:
        return json.load(response)


def format_repo_line(repo_full: str, repo_data: dict[str, Any]) -> str:
    html_url = repo_data.get("html_url") or f"https://github.com/{repo_full}"
    description = (repo_data.get("description") or "No description.").replace("\n", " ").replace("\r", " ")
    language = repo_data.get("language") or "Misc"
    pushed_at = (repo_data.get("pushed_at") or "")[:10]
    updated_text = pushed_at if pushed_at else "unknown"
    return f"- [{repo_full}]({html_url}) — {description} _({language}, updated: {updated_text})_"


def recent_from_pr_activity(username: str, top_n: int, headers: dict[str, str]) -> list[str]:
    query = quote_plus(f"is:pr author:{username}")
    url = f"https://api.github.com/search/issues?q={query}&sort=updated&order=desc&per_page=100"
    payload = fetch_json(url, headers)
    items = payload.get("items", [])

    lines: list[str] = []
    seen_repos: set[str] = set()
    own_prefix = f"{username}/"

    for item in items:
        repository_url = item.get("repository_url", "")
        repo_full = repository_url.replace("https://api.github.com/repos/", "", 1)
        if not repo_full.startswith(own_prefix):
            continue
        if repo_full in seen_repos:
            continue

        seen_repos.add(repo_full)
        repo_api_url = item.get("repository_url")
        if not repo_api_url:
            continue

        repo_data = fetch_json(repo_api_url, headers)
        if repo_data.get("archived") or repo_data.get("disabled"):
            continue

        lines.append(format_repo_line(repo_full, repo_data))
        if len(lines) >= top_n:
            break

    return lines


def recent_from_repo_push(username: str, top_n: int, headers: dict[str, str]) -> list[str]:
    url = f"https://api.github.com/users/{username}/repos?sort=updated&per_page=100"
    repos = fetch_json(url, headers)

    lines: list[str] = []
    for repo in repos:
        owner = ((repo.get("owner") or {}).get("login"))
        if owner != username:
            continue
        if repo.get("fork") or repo.get("archived") or repo.get("disabled"):
            continue

        repo_full = repo.get("full_name") or f"{username}/{repo.get('name', 'unknown-repo')}"
        lines.append(format_repo_line(repo_full, repo))
        if len(lines) >= top_n:
            break

    return lines


def update_readme(readme_path: Path, lines: list[str]) -> None:
    if not lines:
        lines = ["- No active repositories found."]

    content = readme_path.read_text(encoding="utf-8")
    start_idx = content.find(START_TAG)
    end_idx = content.find(END_TAG)

    if start_idx == -1 or end_idx == -1 or end_idx < start_idx:
        raise RuntimeError("README markers not found or invalid")

    start_insert = start_idx + len(START_TAG)
    new_block = "\n".join(lines)
    updated = content[:start_insert] + "\n" + new_block + "\n" + content[end_idx:]
    readme_path.write_text(updated, encoding="utf-8")


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="Update README recent repositories section")
    parser.add_argument("--username", default=os.getenv("GITHUB_REPOSITORY_OWNER", "HernandoR"))
    parser.add_argument("--readme", default="README.md")
    parser.add_argument("--top-n", type=int, default=int(os.getenv("TOP_N", "6")))
    return parser.parse_args()


def main() -> int:
    args = parse_args()
    headers = build_headers()

    lines = recent_from_pr_activity(args.username, args.top_n, headers)
    if not lines:
        lines = recent_from_repo_push(args.username, args.top_n, headers)

    update_readme(Path(args.readme), lines)
    print(f"Updated recent repositories for {args.username} in {args.readme}.")
    return 0


if __name__ == "__main__":
    try:
        raise SystemExit(main())
    except Exception as exc:
        print(f"Error: {exc}", file=sys.stderr)
        raise SystemExit(1)

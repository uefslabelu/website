#!/usr/bin/env bash

set -euo pipefail

if [[ $# -lt 1 || $# -gt 5 ]]; then
  echo "Usage: $0 <upstream-url> [upstream-branch] [base-branch] [sync-branch] [base-remote]" >&2
  exit 2
fi

UPSTREAM_URL="$1"
UPSTREAM_BRANCH="${2:-main}"
BASE_BRANCH="${3:-main}"
SYNC_BRANCH="${4:-update-from-upstream}"
BASE_REMOTE="${5:-origin}"
UPSTREAM_REMOTE="upstream"

REPO_URL="$(git remote get-url "$BASE_REMOTE")"

# 1. Add the customer remote if it doesn't exist yet
if git remote get-url "$UPSTREAM_REMOTE" >/dev/null 2>&1; then
  git remote set-url "$UPSTREAM_REMOTE" "$UPSTREAM_URL"
  echo "Upstream remote updated"
else
  git remote add "$UPSTREAM_REMOTE" "$UPSTREAM_URL"
  echo "Upstream remote added"
fi

# 2. Fetch the upstream branch and your own base branch
git fetch "$UPSTREAM_REMOTE" "$UPSTREAM_BRANCH"
git fetch "$BASE_REMOTE" "$BASE_BRANCH"

# 3. Create (or reset) the sync branch from the latest base branch
git checkout -B "$SYNC_BRANCH" "$BASE_REMOTE/$BASE_BRANCH"

# 4. Merge the upstream branch into the sync branch
if git merge "$UPSTREAM_REMOTE/$UPSTREAM_BRANCH" --no-edit; then
  echo "Merge completed cleanly"
else
  echo "Merge conflicts detected — resolve them now, then run:"
  echo "   git add <files> && git commit"
  echo "   git push $BASE_REMOTE $SYNC_BRANCH -f"
  exit 1
fi

# 5. Push the sync branch
git push "$BASE_REMOTE" "$SYNC_BRANCH" -f
echo "Branch '$SYNC_BRANCH' pushed"

# 6. Open the compare/PR URL in the default browser
COMPARE_URL="$REPO_URL/compare/$BASE_BRANCH...$SYNC_BRANCH?expand=1"
echo "Opening PR creation page: $COMPARE_URL"

if command -v open >/dev/null 2>&1; then
  open "$COMPARE_URL"            # macOS
elif command -v xdg-open >/dev/null 2>&1; then
  xdg-open "$COMPARE_URL"        # Linux
elif command -v start >/dev/null 2>&1; then
  start "$COMPARE_URL"           # Windows (Git Bash/cmd)
else
  echo "Could not detect a way to open a browser automatically."
  echo "Open this URL manually: $COMPARE_URL"
fi
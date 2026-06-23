#!/usr/bin/env bash

CUSTOMER_REMOTE="customer"
CUSTOMER_URL="https://github.com/UEFSLabelu/website"
CUSTOMER_BRANCH="main"
BASE_BRANCH="main"
SYNC_BRANCH="update-from-fork"
REPO_URL="https://github.com/EcompJr/pj-labelu"

# 1. Add the customer remote if it doesn't exist yet
if git remote get-url "$CUSTOMER_REMOTE" >/dev/null 2>&1; then
  echo "Customer remote already exists"
else
  git remote add "$CUSTOMER_REMOTE" "$CUSTOMER_URL"
  echo "Customer remote added"
fi

# 2. Fetch latest from customer fork and your own base branch
git fetch "$CUSTOMER_REMOTE"
git fetch origin "$BASE_BRANCH"

# 3. Create (or reset) the sync branch from the latest base branch
git checkout -B "$SYNC_BRANCH" "origin/$BASE_BRANCH"

# 4. Merge customer's branch into the sync branch
if git merge "$CUSTOMER_REMOTE/$CUSTOMER_BRANCH" --no-edit; then
  echo "Merge completed cleanly"
else
  echo "Merge conflicts detected — resolve them now, then run:"
  echo "   git add <files> && git commit"
  echo "   git push origin $SYNC_BRANCH -f"
  exit 1
fi

# 5. Push the sync branch
git push origin "$SYNC_BRANCH" -f
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
#!/bin/bash
set -e  # Exit on any error

echo "========== START FEED GENERATION =========="

# Configure git with inputs
git config --global user.name "${INPUT_NAME}"
git config --global user.email "${INPUT_EMAIL}"
git config --global --add safe.directory /github/workspace

# Run the feed generator
python3 /usr/bin/feed.py

# Commit & push if changes exist
if [ -n "$(git status --porcelain)" ]; then
  git add -A
  git commit -m "Update Feed"
  git push
else
  echo "No changes to commit."
fi

echo "=========== DONE ==========="
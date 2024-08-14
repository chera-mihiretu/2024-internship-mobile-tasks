#!/bin/bash

# Check if a commit message is provided
if [ -z "$1" ]; then
  echo "Usage: $0 \"commit message\""
  exit 1
fi

# Commit message from the first argument
COMMIT_MESSAGE="$1"

# Add all changes to the staging area
git add .

# Commit the changes with the provided message
git commit -m "$COMMIT_MESSAGE"

# Ensure we are on the main branch
BRANCH_NAME=$(git rev-parse --abbrev-ref HEAD)
if [ "$BRANCH_NAME" != "main" ]; then
  echo "You are not on the 'main' branch. Switching to 'main' branch."
  git checkout main
fi

# Push changes to the remote repository
git push origin main

echo "Changes pushed to 'main' branch successfully."

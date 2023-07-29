#!/bin/bash

# Parse command line arguments
while getopts ":f:p" opt; do
  case ${opt} in
    f ) TOKEN_FILE="$OPTARG"
      ;;
    p ) PASTE_TOKEN=true
      ;;
    \? ) echo "Usage: set-github-token.sh -f <token-file> [-p]"
         exit 1
      ;;
  esac
done

# Check if the token file exists
if [ ! -z "$TOKEN_FILE" ] && [ ! -f "$TOKEN_FILE" ]; then
  echo "Token file not found: $TOKEN_FILE"
  exit 1
fi

# Get the GitHub token from the token file or clipboard
if [ ! -z "$TOKEN_FILE" ]; then
  GITHUB_TOKEN=$(cat "$TOKEN_FILE")
elif [ ! -z "$PASTE_TOKEN" ]; then
  GITHUB_TOKEN=$(wl-paste)
else
  echo "Usage: set-github-token.sh -f <token-file> [-p]"
  exit 1
fi

# Get the current Git remote URL for the origin repository
REMOTE_URL=$(git remote get-url origin)

# Check if the remote URL already contains a GitHub token
if echo "$REMOTE_URL" | grep -qE '\btoken\b'; then
  echo "GitHub token already present in Git remote URL"
  exit 0
fi

# Add the GitHub token to the Git remote URL
NEW_REMOTE_URL=$(echo "$REMOTE_URL" | sed "s/https:\/\//https:\/\/${GITHUB_TOKEN}@/")

# Set the updated Git remote URL
git remote set-url origin "$NEW_REMOTE_URL"

echo "GitHub token added to Git remote URL"

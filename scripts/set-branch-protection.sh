#!/usr/bin/env bash
# set-branch-protection.sh
# Safely enable required_linear_history for a branch while preserving other protection settings.
# Usage:
#   ADMIN_TOKEN=ghp_... ./scripts/set-branch-protection.sh [owner/repo] [branch]
# If owner/repo is omitted, the script reads the 'origin' remote to determine it.

set -euo pipefail

if ! command -v jq >/dev/null 2>&1; then
  echo "This script requires 'jq' (https://stedolan.github.io/jq/). Install it and retry." >&2
  exit 1
fi

TOKEN=${ADMIN_TOKEN:-${GITHUB_TOKEN:-}}
if [ -z "$TOKEN" ]; then
  echo "Set ADMIN_TOKEN (or GITHUB_TOKEN) environment variable with a repo-admin PAT." >&2
  exit 1
fi

REMOTE=${1:-}
BRANCH=${2:-master}

if [ -z "$REMOTE" ]; then
  # try to parse origin remote
  URL=$(git remote get-url origin 2>/dev/null || true)
  if [ -z "$URL" ]; then
    echo "Cannot determine repository. Provide owner/repo as first argument or configure 'origin' remote." >&2
    exit 1
  fi
  # normalize https or git@ URLs
  if [[ "$URL" =~ ^git@ ]]; then
    # git@github.com:owner/repo.git
    REMOTE=$(echo "$URL" | sed -E 's/^git@[^:]+:([^/]+\/[^.]+)(\.git)?$/\1/')
  else
    # https://github.com/owner/repo.git
    REMOTE=$(echo "$URL" | sed -E 's#https?://[^/]+/([^/]+/[^.]+)(\.git)?#\1#')
  fi
fi

OWNER=$(echo "$REMOTE" | cut -d'/' -f1)
REPO_NAME=$(echo "$REMOTE" | cut -d'/' -f2)

API="https://api.github.com/repos/$OWNER/$REPO_NAME/branches/$BRANCH/protection"

echo "Fetching current branch protection for $OWNER/$REPO_NAME branch '$BRANCH'..."
HTTP_CODE=$(curl -sS -H "Authorization: token $TOKEN" -H "Accept: application/vnd.github+json" -o /tmp/branch_prot.json -w "%{http_code}" "$API")

if [ "$HTTP_CODE" = "404" ]; then
  echo "No existing protection found (HTTP 404). Creating protection with required_linear_history=true..."
  PAYLOAD=$(jq -n '{required_status_checks: null, enforce_admins: false, required_pull_request_reviews: null, restrictions: null, required_linear_history: true}')
else
  if [ "$HTTP_CODE" != "200" ]; then
    echo "Failed to fetch branch protection: HTTP $HTTP_CODE" >&2
    cat /tmp/branch_prot.json >&2
    exit 1
  fi
  echo "Merging with existing protection and setting required_linear_history=true..."
  PAYLOAD=$(jq '. as $p | { 
    required_status_checks: ($p.required_status_checks // null),
    enforce_admins: ($p.enforce_admins.enabled // false),
    required_pull_request_reviews: ($p.required_pull_request_reviews // null),
    restrictions: ($p.restrictions // null),
    required_linear_history: true
  }' /tmp/branch_prot.json)
fi

# perform the PUT to set the protection
echo "Applying protection payload to $API"
RESPONSE=$(curl -sS -X PUT "$API" -H "Authorization: token $TOKEN" -H "Accept: application/vnd.github+json" -d "$PAYLOAD")

if echo "$RESPONSE" | jq -e '.required_linear_history' >/dev/null 2>&1; then
  echo "Success: required_linear_history is enabled for $OWNER/$REPO_NAME:$BRANCH"
else
  echo "Failed to set branch protection. API response:" >&2
  echo "$RESPONSE" >&2
  exit 1
fi

exit 0

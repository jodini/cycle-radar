#!/usr/bin/env bash
set -euo pipefail

if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  echo "Error: run this script from inside the Cycle Radar Git repository." >&2
  exit 1
fi

if [[ $# -lt 1 ]]; then
  echo "Usage: ./publish.sh \"commit message\"" >&2
  exit 1
fi

if [[ -z "$(git status --porcelain)" ]]; then
  echo "Nothing to publish: working tree is clean."
  exit 0
fi

echo "Changes to publish:"
git status --short

echo
echo "Diff summary:"
git diff --stat
git diff --cached --stat

echo
git add -A
git commit -m "$*"
git push

echo
echo "Published. GitHub Pages will deploy from the pushed branch according to repository settings."

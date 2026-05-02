#!/usr/bin/env bash
# bootstrap.sh — initialize and push the infra meta-repo as a stub.
#
# Containerfiles and ops scripts stay in the governance repo until the
# migration plan documented in README.md is executed.

set -euo pipefail

cd "$(dirname "$0")"

if [ -d .git ]; then
  echo "A .git directory already exists in $(pwd). Aborting." >&2
  exit 1
fi

git init -b main
git add -A
git commit -m "chore: initial commit (relocation stub)"
gh repo create wakir-labs/infra \
  --public \
  --description "Wakir Labs infrastructure: containers, sandbox setup, ops glue (migration target)" \
  --source=. \
  --remote=origin \
  --push

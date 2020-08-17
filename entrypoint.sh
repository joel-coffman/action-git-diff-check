#!/bin/sh

set -e
set -u

base="HEAD^"
if [ $# -gt 0 ]; then
  base="$1"
fi

repository=$(mktemp)
if git rev-parse --git-dir 2> "$repository"; then
  if ! git rev-parse --quiet --verify "$base" > /dev/null; then
    # invalid base revision -- use the "empty tree" instead
    base="$(echo -n | git hash-object -t tree --stdin)"
  fi

  set -x
  git rev-parse "$base"
  git rev-parse "HEAD"
  git diff --check --color "$base..HEAD"
else
  cat "$repository" >> /dev/stderr
fi

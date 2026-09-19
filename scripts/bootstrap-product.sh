#!/usr/bin/env bash
# Copy the Foundational Companion into a product repo.
# Usage: scripts/bootstrap-product.sh [--force] /path/to/product

set -euo pipefail

FORCE=0
if [[ "${1:-}" == "--force" ]]; then
  FORCE=1
  shift
fi

if [[ $# -ne 1 ]]; then
  echo "Usage: $0 [--force] /path/to/product-repo" >&2
  exit 2
fi

TARGET="$1"
if [[ ! -d "$TARGET" ]]; then
  echo "Target is not a directory: $TARGET" >&2
  exit 1
fi

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

copy_item() {
  local src="$1"
  local dest="$2"
  if [[ -e "$dest" && "$FORCE" -ne 1 ]]; then
    echo "skip (exists): $dest"
    return
  fi
  mkdir -p "$(dirname "$dest")"
  if [[ -d "$src" ]]; then
    rm -rf "$dest"
    cp -R "$src" "$dest"
  else
    cp "$src" "$dest"
  fi
  echo "copied: $dest"
}

copy_item "$ROOT/AGENTS.md" "$TARGET/AGENTS.md"
copy_item "$ROOT/.cursor/rules/engineering-philosophy.mdc" \
  "$TARGET/.cursor/rules/engineering-philosophy.mdc"

mkdir -p "$TARGET/.cursor/skills"
for skill_dir in "$ROOT/.cursor/skills"/*; do
  [[ -d "$skill_dir" ]] || continue
  name="$(basename "$skill_dir")"
  copy_item "$skill_dir" "$TARGET/.cursor/skills/$name"
done

mkdir -p "$TARGET/docs"
for section in prd case-studies adrs architecture; do
  src="$ROOT/templates/product-docs/$section"
  dest="$TARGET/docs/$section"
  if [[ ! -d "$src" ]]; then
    continue
  fi
  mkdir -p "$dest"
  for f in "$src"/*; do
    [[ -e "$f" ]] || continue
    copy_item "$f" "$dest/$(basename "$f")"
  done
done

echo
echo "Foundational Companion bootstrapped into $TARGET"
echo "Next: drop a PRD in docs/prd/ and ask the companion to produce the architecture."

#!/usr/bin/env bash
# Ensambla los capítulos en un único manuscrito.
set -euo pipefail
cd "$(dirname "$0")/.."
out=obra/manuscrito.md
{
  echo "# La edad de los huesos"
  echo
  echo "*Novela*"
  echo
  for f in obra/capitulos/[0-9]*.md; do
    echo
    sed -e 's/^---$//' "$f"
    echo
  done
} > "$out"
echo "$out: $(wc -w < "$out") palabras"

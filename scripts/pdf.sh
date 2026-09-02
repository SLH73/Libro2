#!/usr/bin/env bash
# Compone el PDF maquetado de la novela: 15 x 23 cm, TeX Gyre Pagella.
#   bash scripts/pdf.sh
# Requiere: pandoc, xelatex (texlive-xetex + latex-recommended/extra + lang-spanish),
#           fonts-texgyre y FreeSerif (para la única tirada en árabe).
set -euo pipefail
cd "$(dirname "$0")/.."

SALIDA="obra/La edad de los huesos - Lamani.pdf"

mkdir -p obra/pdf
python3 scripts/epub/construir.py latex

pandoc obra/pdf/fuente.md \
  --from=markdown+raw_tex \
  --to=pdf --pdf-engine=xelatex \
  --template=scripts/pdf/plantilla.tex \
  --top-level-division=part \
  --output="$SALIDA"

if command -v pdfinfo >/dev/null; then
  pdfinfo "$SALIDA" | grep -E "^(Pages|Page size)"
fi
echo "PDF: $SALIDA ($(du -h "$SALIDA" | cut -f1))"

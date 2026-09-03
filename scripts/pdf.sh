#!/usr/bin/env bash
# Compone el PDF maquetado de la novela: 15 x 23 cm, TeX Gyre Pagella.
#   bash scripts/pdf.sh
# Requiere: pandoc, xelatex (texlive-xetex + latex-recommended/extra + lang-spanish),
#           fonts-texgyre y FreeSerif (para la única tirada en árabe).
set -euo pipefail
cd "$(dirname "$0")/.."

LIBRO="obra/La edad de los huesos - Lamani.pdf"
CONCURSO="obra/La edad de los huesos - original de concurso.pdf"

mkdir -p obra/pdf
python3 scripts/epub/construir.py latex

componer () {   # $1 = plantilla, $2 = salida
  pandoc obra/pdf/fuente.md \
    --from=markdown+raw_tex \
    --to=pdf --pdf-engine=xelatex \
    --template="$1" \
    --top-level-division=part \
    --output="$2"
  if command -v pdfinfo >/dev/null; then
    printf '%s: %s páginas, %s\n' "$2" \
      "$(pdfinfo "$2" | awk '/^Pages/{print $2}')" "$(du -h "$2" | cut -f1)"
  fi
}

# 1. la maqueta de libro, 15 x 23 cm
componer scripts/pdf/plantilla.tex "$LIBRO"

# 2. el original de concurso: A4, Times 12, interlineado doble, anónimo
componer scripts/pdf/plantilla-concurso.tex "$CONCURSO"

# el original de concurso no puede llevar el nombre real del autor en ninguna parte
if pdftotext "$CONCURSO" - 2>/dev/null | grep -qiE "susana|lopezherr|slh73"; then
  echo "AVISO: el original de concurso contiene datos identificativos. Revísalo." >&2
  exit 1
fi

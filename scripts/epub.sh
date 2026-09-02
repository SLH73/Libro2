#!/usr/bin/env bash
# Construye el EPUB de la novela a partir de obra/capitulos/.
#   bash scripts/epub.sh
# Requiere: pandoc, python3 con Pillow. Valida con epubcheck si está instalado.
set -euo pipefail
cd "$(dirname "$0")/.."

SALIDA="obra/La edad de los huesos - Lamani.epub"

mkdir -p obra/epub
python3 scripts/epub/portada.py
python3 scripts/epub/construir.py

pandoc obra/epub/fuente.md \
  --from=markdown \
  --to=epub3 \
  --metadata-file=scripts/epub/metadatos.yaml \
  --css=scripts/epub/estilo.css \
  --epub-cover-image=obra/epub/portada.jpg \
  --toc --toc-depth=2 \
  --split-level=2 \
  --output="$SALIDA"

echo "EPUB: $SALIDA ($(du -h "$SALIDA" | cut -f1))"

if command -v java >/dev/null && [ -f /usr/bin/epubcheck ]; then
  java -jar /usr/bin/epubcheck "$SALIDA" 2>&1 | grep -E "^(Messages|No errors)" || true
fi

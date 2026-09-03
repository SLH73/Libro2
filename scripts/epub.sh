#!/usr/bin/env bash
# Construye el EPUB de la novela a partir de obra/capitulos/.
#   bash scripts/epub.sh
# Genera dos ficheros:
#   · EPUB 3, el estándar actual
#   · EPUB 2, para lectores antiguos que no abren EPUB 3
# Requiere: pandoc, python3 con Pillow. Valida con epubcheck si está instalado.
set -euo pipefail
cd "$(dirname "$0")/.."

E3="obra/la-edad-de-los-huesos-lamani.epub"
E2="obra/la-edad-de-los-huesos-lamani-epub2.epub"

mkdir -p obra/epub
python3 scripts/epub/portada.py
python3 scripts/epub/construir.py epub

componer () {   # $1 = epub3|epub2, $2 = salida
  pandoc obra/epub/fuente.md \
    --from=markdown \
    --to="$1" \
    --metadata-file=scripts/epub/metadatos.yaml \
    --css=scripts/epub/estilo.css \
    --epub-cover-image=obra/epub/portada.jpg \
    --toc --toc-depth=2 \
    --split-level=2 \
    --output="$2"
  python3 scripts/epub/reempaquetar.py "$2"
  if command -v java >/dev/null && [ -f /usr/bin/epubcheck ]; then
    java -jar /usr/bin/epubcheck "$2" 2>&1 | grep -E "^Messages" || true
  fi
  echo "  -> $2 ($(du -h "$2" | cut -f1))"
}

componer epub3 "$E3"
componer epub2 "$E2"

# nombres antiguos, con espacios: fuera, que algunos gestores de ficheros
# de Android y algunos lectores no los tragan
rm -f "obra/La edad de los huesos - Lamani.epub"

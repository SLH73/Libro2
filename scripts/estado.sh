#!/usr/bin/env bash
# Regenera obra/ESTADO.md: la memoria entre sesiones.
# Lo ejecuta el Director al abrir la sesión y después de cada capítulo.
set -euo pipefail
cd "$(dirname "$0")/.."

OBJETIVO=200000
TOTAL_CAPS=100
CAPS_DIR=obra/capitulos

palabras=$(find $CAPS_DIR -name '[0-9]*.md' -exec cat {} + 2>/dev/null | wc -w | tr -d ' ')
escritos=$(find $CAPS_DIR -name '[0-9]*.md' 2>/dev/null | wc -l | tr -d ' ')
ultimo=$(find $CAPS_DIR -name '[0-9]*.md' 2>/dev/null | sort | tail -1)
ultimo_num=$(basename "${ultimo:-000-x.md}" | cut -c1-3)
siguiente=$(printf "%03d" $((10#${ultimo_num} + 1)))
pct=$(( palabras * 100 / OBJETIVO ))
restantes=$(( OBJETIVO - palabras ))
[ $restantes -lt 0 ] && restantes=0

if [ "$escritos" -ge "$TOTAL_CAPS" ] && [ "$palabras" -ge "$OBJETIVO" ]; then
  fase="TERMINADA — pasar a cierre editorial y desactivar la tarea programada"
  accion="No escribas más capítulos. Ejecuta editor-literario y auditor-autenticidad sobre el manuscrito completo, ensambla con scripts/ensamblar.sh y avisa al usuario."
else
  fase="EN PRODUCCIÓN"
  accion="Escribe el capítulo $siguiente siguiendo obra/arquitectura.md. Commit y push inmediatamente después. Luego el $((10#$siguiente + 1)). Sin parar."
fi

cat > obra/ESTADO.md <<EOF
# ESTADO DE LA OBRA

> Fichero generado por \`scripts/estado.sh\`. **Es lo primero que lee cada sesión.**
> Última actualización: $(date -u '+%Y-%m-%d %H:%M UTC')

| | |
|---|---|
| **Fase** | $fase |
| **Palabras escritas** | **$palabras** / $OBJETIVO ($pct %) |
| **Palabras restantes** | $restantes |
| **Capítulos escritos** | $escritos / $TOTAL_CAPS |
| **Último capítulo cerrado** | ${ultimo:-ninguno todavía} |
| **SIGUIENTE CAPÍTULO A ESCRIBIR** | **$siguiente** |

## Qué tienes que hacer ahora

$accion

## Recordatorio

1. Lee la ficha del capítulo $siguiente en \`obra/arquitectura.md\`.
2. Lee \`obra/biblia.md\` y los dos últimos capítulos escritos para no romper continuidad.
3. Escribe en \`obra/capitulos/$siguiente-titulo-en-kebab.md\`.
4. \`bash scripts/estado.sh && git add -A && git commit -m "cap $siguiente: ..." && git push -u origin claude/libro-200k-agentes-automaticos-28lkqx\`
5. Vuelve al punto 1 con el capítulo siguiente. No pares hasta que se corte la sesión.

## Notas dejadas por la sesión anterior

$(sed -n '/^## Notas dejadas/,$p' obra/ESTADO.md 2>/dev/null | tail -n +2 | grep -v '^$' | head -20 || echo "(ninguna)")
EOF
echo "ESTADO: $palabras/$OBJETIVO palabras · $escritos/$TOTAL_CAPS capítulos · siguiente: $siguiente"

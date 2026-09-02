#!/usr/bin/env bash
# Regenera obra/ESTADO.md: la memoria entre sesiones.
# Lo ejecuta el Director al abrir la sesión y después de cada capítulo.
set -euo pipefail
cd "$(dirname "$0")/.."

OBJETIVO=200000
TOTAL_CAPS=125
CAPS_DIR=obra/capitulos

palabras=$(find $CAPS_DIR -name '[0-9]*.md' -exec cat {} + 2>/dev/null | wc -w | tr -d ' ')
escritos=$(find $CAPS_DIR -name '[0-9]*.md' 2>/dev/null | wc -l | tr -d ' ')
ultimo=$(find $CAPS_DIR -name '[0-9]*.md' 2>/dev/null | sort | tail -1)
ultimo_num=$(basename "${ultimo:-000-x.md}" | cut -c1-3)
siguiente=$(printf "%03d" $((10#${ultimo_num} + 1)))
pct=$(( palabras * 100 / OBJETIVO ))
restantes=$(( OBJETIVO - palabras ))
[ $restantes -lt 0 ] && restantes=0
caps_restantes=$(( TOTAL_CAPS - escritos ))
[ $caps_restantes -lt 1 ] && caps_restantes=1
# La media que hay que sostener de aquí al final para llegar a 200.000.
# Se recalcula sola en cada capítulo: si una sesión escribe corto, la
# siguiente lo ve y compensa. Es el termostato de la obra.
media_necesaria=$(( restantes / caps_restantes ))
if [ "$escritos" -gt 0 ]; then media_actual=$(( palabras / escritos )); else media_actual=0; fi

if [ "$escritos" -ge "$TOTAL_CAPS" ] && [ "$palabras" -ge "$OBJETIVO" ]; then
  fase="TERMINADA — pasar a cierre editorial y desactivar la tarea programada"
  accion="No escribas más capítulos. Ejecuta editor-literario y auditor-autenticidad sobre el manuscrito completo, ensambla con scripts/ensamblar.sh y avisa al usuario."
else
  fase="EN PRODUCCIÓN"
  accion="Escribe el capítulo $siguiente siguiendo obra/arquitectura.md, **con una extensión de al menos $media_necesaria palabras** (ver el aviso de ritmo de abajo). Commit y push inmediatamente después. Luego el $((10#$siguiente + 1)). Sin parar."
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
| **Media escrita hasta ahora** | $media_actual palabras/capítulo |
| **MEDIA NECESARIA DE AQUÍ AL FINAL** | **$media_necesaria palabras/capítulo** |

## ⚠️ Aviso de ritmo

Quedan **$restantes palabras** repartidas en **$caps_restantes capítulos**. Eso obliga
a una media de **$media_necesaria palabras por capítulo** de aquí al final.

Las fichas de \`obra/arquitectura.md\` dan la extensión *relativa* de cada capítulo
(cuál es largo y cuál es corto, y eso no se toca: el ritmo irregular es una
decisión de estilo). Pero la escala se ajusta a esta media. Si la ficha pide 2.000
y la media necesaria es 2.400, escribe ese capítulo a 2.400. Los capítulos en
primera persona —\`[ANUAR]\` y \`[VOZ]\`— son la excepción y **nunca pasan de 1.400
palabras**: son cuchilladas, y alargarlos los estropea.

Escribir corto es el único error que este sistema no perdona, porque no se nota en
un capítulo y se nota al final del libro.

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

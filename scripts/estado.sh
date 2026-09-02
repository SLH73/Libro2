#!/usr/bin/env bash
# Regenera obra/ESTADO.md: la memoria entre sesiones.
# Lo ejecuta el Director al abrir la sesión y después de cada capítulo.
set -euo pipefail
cd "$(dirname "$0")/.."

OBJETIVO=155000
TOTAL_CAPS=126
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
# La media que hay que sostener de aquí al final para llegar al objetivo.
# Se recalcula sola en cada capítulo: si una sesión escribe corto, la
# siguiente lo ve y compensa. Es el termostato de la obra.
media_necesaria=$(( restantes / caps_restantes ))
if [ "$escritos" -gt 0 ]; then media_actual=$(( palabras / escritos )); else media_actual=0; fi

if [ "$escritos" -ge "$TOTAL_CAPS" ]; then
  fase="TERMINADA — pasar a cierre editorial y desactivar la tarea programada"
  accion="No escribas más capítulos. Ejecuta editor-literario y auditor-autenticidad sobre el manuscrito completo, ensambla con scripts/ensamblar.sh y avisa al usuario."
else
  fase="EN PRODUCCIÓN"
  accion="Escribe el capítulo $siguiente siguiendo obra/arquitectura.md, **con una extensión de al menos $media_necesaria palabras** (ver el aviso de ritmo de abajo). Commit y push inmediatamente después. Luego el $((10#$siguiente + 1)). Sin parar."
fi

if [ "$escritos" -ge "$TOTAL_CAPS" ]; then
  fila_siguiente="| **Siguiente capítulo a escribir** | ninguno: la novela está completa |"
  fila_media="| **Fase de trabajo** | revisión sobre capítulos existentes (ver informes 05) |"
  bloque_ritmo="## Ritmo

La novela está cerrada en $escritos capítulos y $palabras palabras. El objetivo nominal
eran $OBJETIVO; el dictamen de cierre (\`obra/informes/editorial-05.md\`, §6) recomienda
**no rellenar** para alcanzarlo. La diferencia se gana, si se gana, convirtiendo
resúmenes en escena —nunca alargando.

**No escribas capítulos nuevos.**"
  bloque_recordatorio="## Recordatorio

1. La fase de escritura ha terminado. No hay capítulo siguiente.
2. El trabajo que queda está listado en \`obra/informes/editorial-05.md\` §8 y en
   \`obra/informes/autenticidad-05.md\`: son revisiones sobre capítulos existentes.
3. Comprueba que la tarea programada está desactivada antes de terminar el turno."
else
  fila_siguiente="| **SIGUIENTE CAPÍTULO A ESCRIBIR** | **$siguiente** |"
  fila_media="| **MEDIA NECESARIA DE AQUÍ AL FINAL** | **$media_necesaria palabras/capítulo** |"
  bloque_ritmo="## Ritmo

Quedan **$restantes palabras** en **$caps_restantes capítulos**: una media de
**$media_necesaria palabras por capítulo**, que es el ritmo natural de esta novela y
no hay que forzarlo en ninguna dirección.

**La extensión la manda la escena, no la cuenta.** Las fichas de
\`obra/arquitectura.md\` dan la extensión relativa de cada capítulo —cuál es largo y
cuál corto— y eso es lo que se respeta. Un capítulo se acaba donde se tiene que
acabar. Los de primera persona —\`[ANUAR]\` y \`[VOZ]\`— nunca pasan de 1.400
palabras: son cuchilladas.

Si la media necesaria se dispara por encima de 1.800, **no alargues los capítulos**:
avisa al usuario de que el objetivo y el plano se han separado."
  bloque_recordatorio="## Recordatorio

1. Lee la ficha del capítulo $siguiente en \`obra/arquitectura.md\`.
2. Lee \`obra/biblia.md\` y los dos últimos capítulos escritos para no romper continuidad.
3. Escribe en \`obra/capitulos/$siguiente-titulo-en-kebab.md\`.
4. \`bash scripts/estado.sh && git add -A && git commit -m \"cap $siguiente: ...\" && git push -u origin claude/libro-200k-agentes-automaticos-28lkqx\`
5. Vuelve al punto 1 con el capítulo siguiente. No pares hasta que se corte la sesión."
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
$fila_siguiente
| **Media escrita hasta ahora** | $media_actual palabras/capítulo |
$fila_media

$bloque_ritmo

## Qué tienes que hacer ahora

$accion

$bloque_recordatorio

## Notas dejadas por la sesión anterior

$(sed -n '/^## Notas dejadas/,$p' obra/ESTADO.md 2>/dev/null | tail -n +2 | grep -v '^$' | head -20 || echo "(ninguna)")
EOF
echo "ESTADO: $palabras/$OBJETIVO palabras · $escritos/$TOTAL_CAPS capítulos · siguiente: $siguiente"

#!/usr/bin/env bash
# Guardia de concurrencia entre sesiones relanzadas.
#
# La tarea programada dispara una sesión nueva cada hora. Si los tokens estaban
# agotados, la sesión anterior murió y esta debe continuar. Pero si la anterior
# sigue viva y escribiendo, dos sesiones tocarían el mismo capítulo.
#
# En vez de un fichero de bloqueo (que se queda colgado cuando una sesión muere
# a mitad), usamos el propio historial de git: si el último commit de capítulo
# tiene menos de MINUTOS_GUARDIA minutos, hay alguien trabajando. Un contenedor
# que muere no puede dejar un commit reciente colgado.
set -euo pipefail
cd "$(dirname "$0")/.."

MINUTOS_GUARDIA=${MINUTOS_GUARDIA:-35}
RAMA=claude/libro-200k-agentes-automaticos-28lkqx

git fetch -q origin "$RAMA" 2>/dev/null || true
# Solo sincroniza si no hay trabajo local sin guardar: nunca destruye un capítulo a medias.
if [ -z "$(git status --porcelain)" ]; then
  git reset -q --hard "origin/$RAMA" 2>/dev/null || true
else
  echo "AVISO: hay cambios locales sin commitear. No sincronizo. Commitéalos antes de seguir."
fi

ultimo=$(git log -1 --format=%ct --grep='^cap ' 2>/dev/null || echo 0)
[ -z "$ultimo" ] && ultimo=0
ahora=$(date +%s)
minutos=$(( (ahora - ultimo) / 60 ))

if [ "$ultimo" -gt 0 ] && [ "$minutos" -lt "$MINUTOS_GUARDIA" ]; then
  echo "OCUPADO: otra sesión commiteó hace $minutos min (guardia: $MINUTOS_GUARDIA)."
  echo "No escribas nada. Termina el turno sin tocar el repositorio."
  exit 1
fi

echo "TURNO LIBRE: último capítulo commiteado hace ${minutos} min. Te toca escribir."
exit 0

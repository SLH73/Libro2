# La edad de los huesos

Novela de 200.000 palabras en castellano, escrita por el **pipeline de nueve
agentes** de [`SLH73/Libro1-9-agentes`](https://github.com/SLH73/Libro1-9-agentes),
en producción continua y automática.

> Ceuta tenía aquel verano ochenta y tres mil habitantes y en dos noches
> entraron setenta y dos mil personas, y lo primero que pensó Elena Bonmatí, que
> llevaba veintitrés años poniéndole números a la gente, fue que aquello no iba a
> caber en ningún papel.

**Elena Bonmatí**, médica forense de Ceuta, abre el cuerpo de un chico de catorce
años que aparece entre los ahogados de la avalancha del 30 de julio de 2026. Se
ahogó, sí. Pero antes tuvo el cuello apretado por algo que no era el mar. Y en el
bolsillo del pantalón, plastificado y doblado en cuatro, lleva un informe forense
de 2017 firmado por ella: el papel con el que declaró adulto a un menor. Alguien
ha puesto ese cadáver delante de ella a propósito.

Premio objetivo: **Planeta**. Tema: la crisis migratoria de Ceuta de julio de
2026, con los hechos verificados (72.000 entradas a nado por los espigones del
Tarajal y Benzú, los bulos de Facebook, los 4.000 menores sin identificar de
agosto, la ciudad contra los polideportivos). Todos los personajes son ficticios.

## Cómo se escribe sola

El problema de una novela de 200.000 palabras es que no cabe en una sesión. Se
acaban los tokens a mitad de una frase y el contenedor se recicla. La solución
está montada en tres piezas:

**1 · La memoria está en el disco, no en la conversación.**
`obra/arquitectura.md` tiene la ficha de los cien capítulos —objetivo, línea
temporal, extensión, tipo de cierre— y `obra/biblia.md` la continuidad. Una
sesión que abre este repositorio por primera vez sabe exactamente qué escribir
sin haber hablado nunca con nadie.

**2 · `obra/ESTADO.md` dice dónde se quedó la anterior.**
Lo regenera `scripts/estado.sh` contando las palabras reales de
`obra/capitulos/`. Es lo primero que lee cada sesión, por orden de `CLAUDE.md`.
Como cada capítulo se commitea y se sube en cuanto se termina, el corte por
tokens nunca cuesta más de un capítulo a medias.

**3 · Una tarea programada relanza el trabajo cada hora.**
Dispara una sesión nueva que hace `turno.sh` → `estado.sh` → escribe → commit →
push → siguiente capítulo, hasta que se agota. Si los tokens no se han
restablecido todavía, la sesión no hace nada y la de la hora siguiente lo
intenta otra vez. Cuando se restablecen, el trabajo continúa por donde iba.

`scripts/turno.sh` evita que dos sesiones escriban el mismo capítulo: en vez de
un fichero de bloqueo —que se queda colgado cuando una sesión muere a mitad—
usa el historial de git. Si el último commit `cap NNN:` tiene menos de treinta y
cinco minutos, hay alguien trabajando y la sesión nueva se retira.

```
CLAUDE.md                 el Director Editorial (agente 1)
.claude/skills/           los otros ocho agentes + las cinco skills metodológicas
obra/
├── ESTADO.md             ← dónde se quedó la última sesión
├── brief-editorial.md    agente 1
├── tendencias.md         agente 2 · los hechos verificados de julio de 2026
├── premisas.md           agente 3 · premisa y personajes
├── arquitectura.md       agente 4 · el plano de los 100 capítulos
├── biblia.md             agente 7 · continuidad viva
├── capitulos/            agente 5 y 6 · la novela
└── informes/             agentes 8 y 9 · edición y autenticidad
scripts/
├── estado.sh             recuenta y regenera ESTADO.md
├── turno.sh              guardia de concurrencia entre sesiones
└── ensamblar.sh          monta obra/manuscrito.md
```

## Estado

Ver [`obra/ESTADO.md`](obra/ESTADO.md).

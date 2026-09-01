---
name: detector-texto-ia
description: >
  Analiza cualquier texto y evalúa la probabilidad de que haya sido generado
  por inteligencia artificial, replicando el razonamiento de los detectores
  comerciales líderes del mercado: GPTZero, Originality.ai, Turnitin,
  Copyleaks, ZeroGPT y QuillBot Detector. Usa esta skill SIEMPRE que el
  usuario pregunte si un texto es de IA, si fue escrito por ChatGPT/Claude/
  Gemini, si pasaría un detector como Turnitin o GPTZero, o pida verificar
  la autenticidad o el origen de cualquier texto. También activar ante frases
  como "¿cuánto IA tiene esto?", "analiza si esto es humano o artificial",
  "detecta IA en este texto", "¿es esto generado por IA?". Incluye un modo
  específico para ficción literaria —novelas, relatos, capítulos— donde las
  señales del análisis general se invierten: actívalo cuando el usuario
  pregunte si su prosa suena a IA, a prosa de manual o a texto genérico.
---

# Skill: Detector de Texto Generado por IA

## Propósito

Evaluar si un texto fue generado (total o parcialmente) por un modelo de
lenguaje (LLM), aplicando las mismas dimensiones de análisis que usan los
detectores comerciales más precisos del mercado. El análisis es orientativo:
ningún detector —humano ni automatizado— alcanza el 100% de precisión.

---

## Proceso de análisis

Cuando recibas un texto a analizar, evalúa las siguientes **5 dimensiones**
en orden. Al final, sintetiza un veredicto.

---

### DIMENSIÓN 1 — PERPLEJIDAD
**¿Qué tan predecible es la elección de palabras?**

Los LLMs eligen siempre la palabra estadísticamente más probable en cada
contexto. Los humanos cometen elecciones inesperadas, usan sinónimos
infrecuentes, construyen giros propios.

| Señal IA (baja perplejidad) | Señal humana (alta perplejidad) |
|---|---|
| Vocabulario neutro y genérico | Palabras inusuales o muy específicas |
| Metáforas comunes y trilladas | Metáforas propias o inesperadas |
| Frases que "suenan bien" siempre | Frases que sorprenden o chirrían |
| Elecciones léxicas predecibles | Giros idiomáticos, regionalismos |

**Cómo evaluarlo**: Lee el texto prestando atención a si cada frase
podría haber salido de un autocompletar muy bueno, o si hay momentos donde
el autor claramente eligió algo inesperado.

---

### DIMENSIÓN 2 — BURSTINESS (variabilidad rítmica)
**¿Varía la longitud y complejidad de las frases?**

Los LLMs tienden a mantener una longitud de frase muy consistente y un
ritmo uniforme. Los humanos alternan de forma impredecible entre frases
muy cortas y párrafos largos y sinuosos.

| Señal IA | Señal humana |
|---|---|
| Frases de longitud casi idéntica | Frases cortas. Y luego una muy larga. |
| Ritmo constante y fluido | Acelerones y pausas naturales |
| Párrafos siempre de 3-5 frases | Párrafos de 1 línea junto a otros de 10 |
| Complejidad sintáctica uniforme | Oraciones simples mezcladas con subordinadas múltiples |

**Cómo evaluarlo**: Mide mentalmente la longitud de cada frase. Si todas
tienen más o menos la misma extensión y ritmo, es señal de alerta.

---

### DIMENSIÓN 3 — PATRONES LÉXICOS DE LLM
**¿Aparecen frases o estructuras típicas de modelos de lenguaje?**

Los LLMs en español tienen tics lingüísticos muy reconocibles. Busca:

**Conectores y muletillas IA frecuentes:**
- *En conclusión / En resumen / Cabe destacar / Es importante señalar*
- *Por otro lado / Sin embargo / Asimismo / En este sentido / Cabe mencionar*
- *En el ámbito de / En el contexto de / A lo largo de / En el marco de*
- *Es fundamental / Resulta esencial / Vale la pena destacar*
- *No obstante / A su vez / De este modo / En definitiva*

**Estructuras formulaicas:**
- Introducción → 3 puntos desarrollados → conclusión que repite lo dicho
- Listas numeradas o con viñetas perfectamente paralelas
- Cada párrafo comienza con una oración-resumen del párrafo
- El texto "explica" conceptos que el lector ya conocería

**Neutralidad forzada:**
- Ausencia total de postura personal o subjetividad
- No hay humor, ironía, frustración ni entusiasmo genuino
- Tono académico-corporativo aunque el tema no lo requiera
- Frases como "existen diversas perspectivas sobre este tema"

---

### DIMENSIÓN 4 — COHERENCIA ESTRUCTURAL
**¿El texto tiene arquitectura de LLM?**

| Señal IA | Señal humana |
|---|---|
| Párrafos de longitud casi idéntica | Párrafos muy desiguales |
| Transiciones perfectas entre párrafos | Saltos bruscos, digresiones |
| Ningún error tipográfico ni de puntuación | Errores leves o idiosincráticos |
| Cero anécdotas personales | Referencias a experiencias propias |
| Explicaciones de lo obvio | Dar por sentados conocimientos del lector |
| Texto "completo" sin lagunas temáticas | Énfasis en lo que le importa al autor |

**Señal especial — texto mixto (IA + edición humana):**
Busca inconsistencias de estilo entre párrafos: si unos suenan muy
formales y otros más coloquiales, puede ser edición parcial de un texto IA.

---

### DIMENSIÓN 5 — VOZ Y AUTENTICIDAD
**¿Hay una persona detrás del texto?**

Buscar activamente señales de presencia humana:
- Pronombres en primera persona con opinión real (*"creo que", "me parece", "en mi experiencia"*)
- Referencias a hechos concretos y verificables que no son de conocimiento general
- Humor, ironía, sarcasmo o incomodidad genuina
- Contradicciones menores o cambios de opinión dentro del texto
- Conocimiento de primera mano: detalles muy específicos que solo alguien "que estuvo ahí" sabría
- Estilo inconsistente o errores que revelan pensamiento en tiempo real

---

## Casos especiales — leer antes de dar veredicto

### ⚠️ Texto humanizado (IA + paráfrasis posterior)
**Síntomas**: vocabulario más variado que la IA pura, pero estructura
predecible; posibles inconsistencias de estilo entre párrafos; ausencia
de voz personal aunque el léxico sea variado.
**Diagnóstico**: señalar como "posiblemente IA humanizada" con confianza MEDIA.

### ⚠️ Texto formal humano (falso positivo frecuente)
**Síntomas**: lenguaje técnico, estructurado y sin errores. Textos
académicos, científicos, legales o corporativos escritos por humanos
pueden puntuar alto en señales IA.
**Diagnóstico**: reducir confianza a BAJA, emitir advertencia explícita
de falso positivo.

### ⚠️ Texto mixto (humano editado con IA)
**Síntomas**: algunos párrafos con voz propia clara y otros con tics IA;
saltos de registro notorios; listas que no encajan con el resto del tono.
**Diagnóstico**: señalar qué secciones parecen IA y cuáles humanas.

### ⚠️ Texto muy corto (<150 palabras)
**Diagnóstico**: declarar análisis INCONCLUSIVO — muestra insuficiente
para evaluar con fiabilidad. Solicitar más texto si es posible.

---

---

## MODO FICCIÓN LITERARIA — leer antes de analizar una novela

Las cinco dimensiones de arriba están calibradas para prosa expositiva:
artículos, ensayos, trabajos académicos, contenido web. **Aplicadas sin
ajustar a un capítulo de novela dan un veredicto falso**, porque tres de sus
señales se invierten y otras no aplican en absoluto.

Cuando el texto analizado sea ficción —novela, relato, capítulo suelto—,
sustituye el análisis general por lo que sigue.

### Qué se invierte

| Señal general | Por qué falla en ficción |
|---|---|
| "Cero errores tipográficos → IA" | La prosa literaria editada no tiene erratas. No es señal de nada. |
| "Sin primera persona con opinión → IA" | Un narrador en tercera limitada no opina en su nombre. No es señal de nada. |
| "Cero anécdotas personales → IA" | La ficción no las tiene por definición. No es señal de nada. |
| "Explicaciones de lo obvio → IA" | En ficción sí es señal, pero de otra cosa: de *telling*, no de origen. |
| "Transiciones perfectas → IA" | Una transición limpia entre escenas es oficio, no automatismo. |

### Las dimensiones que sí sirven, recalibradas

**BURSTINESS — la más diagnóstica en ficción, con diferencia.**
Mide la longitud de frase de un párrafo entero. La prosa literaria humana
alterna sin patrón: tres palabras, luego cuarenta, luego siete. La prosa
generada tiende a un promedio estable del que casi no se sale. Aplica lo
mismo a los párrafos: si todos ocupan entre cuatro y seis líneas a lo largo
del capítulo, es la señal más fuerte que existe.

**PERPLEJIDAD — mide en los adjetivos y en las metáforas.**
El sustantivo suele ser correcto; donde se delata la prosa generada es en el
adjetivo previsible y en la metáfora de repertorio. Un silencio *ensordecedor*,
unos ojos que *brillaban como*, un nudo *en la garganta*, una sonrisa que *no
llegó a sus ojos*.

**ESTRUCTURA DE PÁRRAFO — el molde repetido.**
Busca el párrafo que siempre se construye igual: gesto físico → pensamiento
del personaje → frase corta de cierre que sentencia. Una vez es ritmo; ocho
veces en un capítulo es un molde.

### Tics propios de la prosa de ficción generada

Ninguno aparece en la lista de conectores del análisis general:

- **La emoción explicada después de mostrarla.** "Cerró la puerta sin hacer
  ruido. Estaba furiosa." La segunda frase anula la primera; un autor elige una.
- **La ambivalencia declarada como fórmula.** "Sintió una mezcla de alivio y
  culpa." Nombrar las dos emociones es el atajo que sustituye a construirlas.
- **El adverbio en -mente como muleta.** Especialmente al principio de frase y
  en verbos de habla: *lentamente*, *suavemente*, *inevitablemente*.
- **El detalle sensorial de catálogo.** Olor a café, luz dorada de la tarde,
  polvo en suspensión, el tictac de un reloj. Correcto y de nadie.
- **Diálogo sin idiolecto.** Todos los personajes con la misma longitud de
  frase y el mismo registro; si se quitan las acotaciones, no se sabe quién
  habla.
- **La frase final de capítulo que sentencia el tema.** El cierre que explica
  al lector lo que debe haber entendido, en lugar de dejarlo abierto.
- **La simetría excesiva.** Cada escena con su resolución, cada personaje con
  su momento, cada promesa cobrada a tiempo. La vida no cuadra tanto.

### Cómo dar el veredicto en ficción

En un manuscrito escrito con asistencia de IA —el caso normal en un pipeline
de escritura— la pregunta "¿fue generado por IA?" no aporta nada: la respuesta
se sabe de antemano. **Reformula el veredicto.**

Lo que se mide es si la prosa alcanza el listón literario:

> **VEREDICTO: [APROBADO / REQUIERE REVISIÓN]**
> **Índice de prosa mecánica: XX%** — proporción del capítulo que un editor
> señalaría como prosa de manual, correcta pero sin autor detrás.
>
> *(0-15% = prosa con voz propia | 16-35% = irregular, revisar los fragmentos
> marcados | 36%+ = devolver el capítulo al escritor)*

Después, en lugar de la lista de señales general:

1. **Fragmentos que fallan**, citados literalmente, con el tic concreto que
   los delata y una reescritura propuesta de una línea.
2. **Medición de burstiness** del capítulo: longitud de frase mínima, máxima y
   promedio, y si la variación es real o cosmética.
3. **Prueba del diálogo**: tapa las acotaciones de una escena y di si se
   distingue quién habla.
4. **Lo que sí tiene voz**: los pasajes que funcionan, para que el escritor
   sepa cuál es su propio registro cuando acierta.

No apruebes un capítulo por ser gramaticalmente correcto. El listón es
literario, no funcional.

## Formato de output obligatorio

Presenta siempre el análisis con esta estructura:

---

### 🔍 ANÁLISIS DE AUTENTICIDAD TEXTUAL

**VEREDICTO: XX% de probabilidad de ser generado por IA**
*(0-30% = probablemente humano | 31-60% = ambiguo | 61-85% = probablemente IA | 86-100% = muy probablemente IA)*

**Nivel de confianza: ALTO / MEDIO / BAJO**
*[Justificación en 1-2 frases de por qué el nivel de confianza es ese]*

---

**Señales detectadas:**

🔴 Señales que apuntan a IA:
- [lista de evidencias concretas encontradas en el texto]

🟢 Señales que apuntan a autoría humana:
- [lista de evidencias concretas encontradas en el texto]

---

**Fragmentos más reveladores:**
> *[citar 1-3 fragmentos concretos del texto con explicación de por qué son reveladores]*

---

**⚠️ Advertencias:**
*[Si aplica: riesgo de falso positivo, texto muy corto, texto mixto, etc.]*

---

**Recomendación de verificación:**
Para confirmar este análisis, usar:
- **[detector recomendado]** — [razón específica para este tipo de texto]
- Como segunda opinión: **[detector secundario]**

---

*Disclaimer: Este análisis es orientativo. Los mejores detectores del mercado
(GPTZero, Originality.ai) alcanzan ~92-95% de precisión en condiciones ideales,
pero presentan tasas significativas de falsos positivos en textos formales y
académicos. No usar como evidencia definitiva.*

---

## Guía de recomendación de detectores comerciales

Usar esta tabla para la sección "Recomendación de verificación":

| Tipo de texto | Detector primario | Detector secundario |
|---|---|---|
| Texto académico / tesis | Turnitin | GPTZero |
| Contenido web / SEO | Originality.ai | Copyleaks |
| Texto en español específicamente | GPTZero | ZeroGPT |
| Verificación rápida y gratuita | GPTZero (free) | QuillBot Detector |
| Alto volumen / API | Copyleaks | Originality.ai |
| Sospecha de humanización | Originality.ai | Winston AI |

---

## Tabla resumen — señales IA vs humano

| Dimensión | Señal IA fuerte | Señal humana fuerte |
|---|---|---|
| Perplejidad | Vocabulario neutro y predecible | Giros inesperados, regionalismos |
| Burstiness | Frases de longitud uniforme | Alternancia caótica de longitudes |
| Léxico | Conectores formulaicos repetidos | Sin muletillas, voz propia |
| Estructura | Intro-desarrollo-conclusión perfecta | Digresiones, saltos, énfasis personal |
| Voz | Sin primera persona, neutral | Opinión, humor, contradicción, anécdota |
| Errores | Cero errores tipográficos | Errores leves o idiosincráticos |
| Detalle | Conocimiento genérico | Detalles muy específicos de primera mano |

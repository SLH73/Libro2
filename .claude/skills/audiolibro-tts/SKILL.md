---
name: audiolibro-tts
description: Convierte la novela terminada en audiolibro MP3 en español con edge-tts, limpiando antes toda la maquetación que la voz leería en alto — números de página, cornisas repetidas, llamadas de nota, palabras partidas por guion — y aplicando prosodia de lectura. Úsala como post-producción, fuera del pipeline, cuando el manuscrito ya ha pasado el Auditor de Autenticidad. Actívala también cuando el autor pida escuchar un capítulo, pasar un PDF a audio o hacer una maqueta sonora para revisar el ritmo.
---

# Audiolibro TTS

## Rol

Mientras dure esta tarea produces el audiolibro. Al entregar los MP3, vuelves a tu rol
de Director Editorial.

No eres un paso del pipeline: llegas después, cuando el texto ya está aprobado. Y no
editas la novela — si al escucharla detectas un problema de prosa, lo dices en el
informe y se lo devuelves al Editor Literario; tú no tocas los capítulos.

El PDF o el markdown no son el producto: el producto es una voz que se sigue durante
horas sin tropiezos. Todo lo que en la página es invisible —el `147` del pie, el título
del libro repetido arriba de cada hoja, el `3` volado de una nota, la almohadilla de un
encabezado markdown— la voz lo lee en alto y rompe la lectura. Tu trabajo real está en
el paso 3.

## Dos entradas

| Entrada | Cómo | Qué se limpia |
|---|---|---|
| Capítulos de `obra/capitulos/*.md` | modo `--markdown` | Sintaxis markdown y prosodia. No hay maquetación de página. |
| Un PDF externo | modo por defecto | Las seis pasadas completas del paso 3. |

Para la novela de este repositorio, la entrada son los capítulos: nunca exportes a PDF
para volver a extraer el texto: eso introduce a mano todos los defectos que el paso 3
tiene que quitar después.

## Parámetros

| Parámetro | Por defecto | Notas |
|---|---|---|
| `--voz` | `es-ES-AlvaroNeural` | Alternativas: `es-ES-ElviraNeural` (f), `es-MX-JorgeNeural`, `es-AR-ElenaNeural`. Elige según el narrador de la novela, no por gusto: si la voz narradora es una mujer de Carabanchel, `AlvaroNeural` la contradice. |
| `--rate` | `-8%` | La velocidad nominal de edge-tts suena apresurada en narrativa larga. No la subas sin que te lo pidan. |
| `--volume` | `+0%` | |
| `--pitch` | `+0Hz` | |
| `--salida` | `obra/audio/` | Un MP3 por capítulo + `libro_completo.mp3` |
| `--auto` | desactivado | Salta la confirmación del paso 4. Solo si el autor lo pide expresamente. |

## Paso 1 — Sondear la entrada

Con capítulos markdown, comprueba que están todos y en orden (`ls obra/capitulos/`) y
que el que vas a leer ha pasado el Auditor: mira `obra/informes/autenticidad-NN.md`. No
generes tres horas de audio de un capítulo que está pendiente de revisión.

Con un PDF:

```bash
pdfinfo "$PDF"                 # páginas, título, si está cifrado
pdftotext -f 1 -l 3 "$PDF" -   # ¿sale texto o son imágenes?
```

Si las primeras páginas salen vacías o con basura, el PDF es escaneado: no hay capa de
texto. Dilo y para. La salida es OCR (`ocrmypdf --language spa`), no síntesis; no
intentes sintetizar un texto que no existe.

Comprueba las dependencias antes de seguir: `edge-tts`, `ffmpeg` y, para PDF,
`pdftotext` (poppler-utils). Si falta alguna, indica el comando de instalación y para.

## Paso 2 — Extraer el texto crudo

Solo para PDF:

```bash
pdftotext -layout -enc UTF-8 "$PDF" texto_crudo.txt
```

`-layout` conserva la disposición en columnas y, sobre todo, mantiene los saltos de
página como `\f` (form feed). **No lo pierdas**: el paso 3.2 necesita saber dónde
empieza y acaba cada página para detectar la maquetación repetida.

Con markdown no hay paso 2: el capítulo entra directamente en el paso 3.

## Paso 3 — Limpieza del texto (el paso que decide la calidad)

```bash
# capítulo de la novela
python3 .claude/skills/audiolibro-tts/scripts/limpiar_texto_tts.py \
        obra/capitulos/05-ana.md audio/05.txt --markdown

# PDF externo
python3 .claude/skills/audiolibro-tts/scripts/limpiar_texto_tts.py \
        texto_crudo.txt texto_limpio.txt
```

El script hace seis pasadas, en este orden. El orden importa: los números de página se
van antes del reflujo de párrafos, porque después del reflujo ya no son líneas sueltas y
no hay forma de distinguirlos.

### 3.1 Números de página

Tres formas, todas por patrón de línea completa (nunca sobre texto corrido):

- **Dígitos solos**: `^\s*\d{1,4}\s*$`.
- **Decorados**: `— 147 —`, `- 147 -`, `[147]`, `| 147`, `Página 147`, `pág. 147`.
  Exige dígitos en medio: la raya sola es diálogo español, no maquetación.
- **Romanos de los preliminares** (`ix`, `xxiv`): validados con la gramática estricta
  del número romano, no con `[ivxlcdm]+`, que se traga *civil*, *mil* y *divisó*. Y solo
  en la primera línea o la última de la página, y solo dentro de los preliminares. Un
  `XIV` suelto en mitad de página es un capítulo, y ese se queda.

En modo markdown esta pasada no se aplica.

### 3.2 Encabezados y pies repetidos

El título del libro arriba de cada página impar y el nombre del autor en las pares se
leen en voz alta 300 veces si no los quitas.

Toma las **dos primeras y dos últimas líneas no vacías de cada página**, normalízalas
(minúsculas, sin tildes, sin dígitos, espacios colapsados) y cuéntalas. Si una clave
aparece en **más del 30 % de las páginas, es maquetación y se borra**. Un capítulo real
nunca se repite en un tercio del libro.

Requisitos para no pasarse de frenada: mínimo 8 páginas en el documento, clave de entre
3 y 70 caracteres —una cornisa es corta, una frase de cuerpo no— y solo se borra en el
borde de la página, nunca dentro. En modo markdown tampoco se aplica.

### 3.3 Llamadas de nota al pie

Los dígitos volados pierden el formato al extraer y quedan pegados a la palabra:
`la realidad3 no admite` → la voz dice «la realidad tres no admite».

Se quitan los dígitos de 1-2 cifras pegados a una letra minúscula o a un signo de cierre
(`.`, `,`, `»`, `)`) y seguidos de espacio o puntuación. Con lista de excepciones para lo
que sí es contenido: `m2`, `m3`, `km2`, `h2o`, `co2`, `no2`, `mp3`, `covid19`.

### 3.4 Palabras partidas por guion

El defecto más audible al convertir PDF. `estre-\nmecido` se lee «estre mecido», con una
pausa en mitad de la palabra.

Se unen `minúscula + '-' + salto + minúscula` sin dejar el guion. Si la segunda mitad
empieza por mayúscula se conserva el guion (`hispano-\nAmericano`), porque ahí el guion
sí es del autor.

### 3.5 Reflujo de párrafos

El PDF trae un salto de línea al final de cada renglón. Hay que deshacerlos sin fundir
párrafos distintos:

- Se **une** cuando la línea no acaba en `.?!:»"…` y la siguiente empieza en minúscula.
- Se **corta** en línea vacía, ante línea que empieza por raya de diálogo (`—`), ante
  comilla latina de apertura (`«`) y tras cierre de frase. Esto es crítico en esta
  novela: el diálogo va con raya, y fundir una réplica con la narración anterior
  destruye la escena al oído.
- Se eliminan bloques de notas al final del capítulo y los índices, junto con su título
  huérfano: si se borra el contenido de `ÍNDICE` o `BIBLIOGRAFÍA`, el encabezado se va
  con él.

En modo markdown, antes de esto se quita la sintaxis que la voz leería: almohadillas de
encabezado, asteriscos de énfasis, enlaces (se queda el texto), comillas de bloque y
reglas horizontales, que se convierten en cambio de escena.

### 3.6 Prosodia

Sin esto la voz lee tres horas al mismo compás y se hace insoportable.

- **Pausa fuerte antes de capítulo**: ante `CAPÍTULO`, `PARTE`, `LIBRO`, `EPÍLOGO`,
  `PRÓLOGO`, encabezado markdown o línea corta en versalitas, se inserta
  `[[PAUSA:1200]]` y se cierra el título con punto para que la voz se detenga.
- **Cambio de escena**: `***`, `* * *`, `···`, `§` o regla horizontal → `[[PAUSA:700]]`.
- **Frases de más de 40 palabras**: se busca una conjunción (`pero`, `aunque`,
  `mientras`, `porque`, `cuando`, `sin embargo`) sin coma en las 12 palabras anteriores
  y se le antepone una. Solo una coma por frase larga: la puntuación inventada de más
  suena a tartamudeo.

  **La `y` no está en esa lista, a propósito.** Aparece dentro de numerales («treinta y
  un auxiliares») y de enumeraciones, donde además la coma antes de `y` es incorrecta en
  español. Meterla partía frases por la mitad.

Los marcadores `[[PAUSA:ms]]` no se sintetizan: en el paso 6 parten el texto y se
convierten en silencio real con ffmpeg.

### El script

Está en `scripts/limpiar_texto_tts.py`, junto a esta skill. Es determinista y ya cubre
las seis pasadas: no lo reescribas en cada ejecución. Si un libro necesita una regla
nueva (una cornisa rara, una nota con símbolo en vez de dígito), añádela al script y
dilo en el informe, para que el siguiente libro la herede.

## Paso 4 — Control antes de sintetizar

**Muestra siempre 500 caracteres del texto limpio junto a los 500 equivalentes del
original**, más las cifras del informe. Tres horas de audio tardan en generarse y el
error de extracción se ve en dos segundos:

```bash
echo "=== ORIGINAL ==="; sed -n '/[[:alpha:]]/,$p' entrada | head -c 500
echo; echo "=== LIMPIO ==="; head -c 500 texto_limpio.txt
```

Elige el fragmento en mitad del texto, no en la portada: los preliminares no son
representativos de cómo quedó el cuerpo.

Señales de que hay que volver al paso 3 antes de gastar una hora de CPU: palabras
pegadas sin espacio (columnas mal leídas), párrafos partidos cada diez palabras (el
reflujo no se aplicó), líneas de índice o de notas coladas, diálogos fundidos con la
narración, o un recuento de cornisas vacío en un libro que claramente las tiene.

Para aquí y devuelve la comparación al autor. No sintetices sin visto bueno, salvo que
te hayan invocado con `--auto`.

## Paso 5 — Síntesis

Parte por capítulos (los `[[PAUSA:1200]]`) y, dentro del capítulo, en bloques de unos
4.000 caracteres cortando siempre en final de párrafo, nunca a mitad de frase. edge-tts
se atraganta con entradas muy largas y falla a mitad.

```bash
edge-tts --voice "es-ES-AlvaroNeural" --rate=-8% \
         --file "bloque_001.txt" --write-media "bloque_001.mp3"
```

Reintenta hasta 3 veces con espera creciente el bloque que falle: el servicio corta
conexiones de vez en cuando. Un bloque perdido en silencio es un salto en la narración
que nadie detecta hasta que lo escucha.

## Paso 6 — Silencios y montaje

Cada `[[PAUSA:ms]]` se convierte en silencio real:

```bash
ffmpeg -f lavfi -i anullsrc=r=24000:cl=mono -t 1.2 -q:a 9 silencio_1200.mp3
ffmpeg -f concat -safe 0 -i lista.txt -c copy "obra/audio/05-ana.mp3"
```

Etiqueta cada MP3 (`-metadata title=... album=... artist=... track=...`) para que el
reproductor muestre los capítulos en orden, y genera además `libro_completo.mp3`.

## Entrega

Los MP3 en `obra/audio/`, un fichero por capítulo con el mismo número que el capítulo de
origen, más `libro_completo.mp3`.

El informe en `obra/informes/audiolibro-NN.md`: capítulos procesados, voz y velocidad,
duración por capítulo y total, las cornisas que se eliminaron (la lista literal, para
que el autor compruebe que no se fue nada de contenido), llamadas de nota y palabras
reunidas. Si tuviste que suponer algo —dónde acaban los preliminares, si un bloque era
índice o texto—, dilo en una línea.

Los MP3 pesan. Si el repositorio no tiene Git LFS configurado, **no los commitees**:
súbelos donde el autor te diga y deja en el informe la duración y el enlace. Lo que sí
se commitea siempre es el informe.

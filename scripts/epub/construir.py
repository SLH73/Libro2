#!/usr/bin/env python3
"""Construye el fuente Markdown que pandoc convierte en EPUB.

Transformaciones respecto de los ficheros de obra/capitulos/:
  · «## 12. Greulich y Pyle»  ->  h2 con el número en una línea aparte
  · la línea de epígrafe (*3 de agosto de 2026*) -> <p class="epigrafe">
  · la línea con un solo «*»                     -> <p class="separador">
Todo lo demás (raya de diálogo, cursivas, negritas, citas) pasa tal cual.
"""
import glob, os, re, sys

SALIDA = "obra/epub/fuente.md"
ficheros = sorted(glob.glob("obra/capitulos/[0-9]*.md"))
if not ficheros:
    sys.exit("no hay capítulos en obra/capitulos/")

out = []
capitulos = 0

for f in ficheros:
    lineas = open(f, encoding="utf-8").read().rstrip("\n").split("\n")
    i = 0
    while i < len(lineas):
        l = lineas[i]

        # portadilla de parte
        if l.startswith("# PARTE"):
            out += ["", l.replace("# ", "# ", 1), ""]
            i += 1
            continue

        # título de capítulo
        m = re.match(r"^## (\d+)\.\s+(.*)$", l)
        if m:
            capitulos += 1
            num, titulo = m.group(1), m.group(2).strip()
            out += ["", f'## <span class="numero">{num}</span><span class="sep"> · </span>{titulo}', ""]
            i += 1
            # epígrafe: primera línea no vacía si va entre asteriscos
            j = i
            while j < len(lineas) and not lineas[j].strip():
                j += 1
            if j < len(lineas):
                e = re.match(r"^\*(.+)\*$", lineas[j].strip())
                if e and not lineas[j].strip().startswith("**"):
                    out += [f'<p class="epigrafe">{e.group(1)}</p>', ""]
                    i = j + 1
            continue

        # separador de escena
        if l.strip() == "*":
            out += ["", '<p class="separador">✳</p>', ""]
            i += 1
            continue

        # «2015. Cuatro carpetas.» no es una lista numerada: escapa el punto,
        # y si va seguida de otra línea, fuerza el salto para que no se peguen.
        if re.match(r"^\d{1,4}\. ", l):
            l = re.sub(r"^(\d{1,4})\. ", r"\1\\. ", l)
            if i + 1 < len(lineas) and lineas[i + 1].strip():
                l = l + "  "

        out.append(l)
        i += 1

    out.append("")

texto = "\n".join(out)
texto = re.sub(r"\n{3,}", "\n\n", texto)
os.makedirs("obra/epub", exist_ok=True)
open(SALIDA, "w", encoding="utf-8").write(texto)
print(f"{SALIDA}: {capitulos} capítulos, {len(texto.split())} palabras")

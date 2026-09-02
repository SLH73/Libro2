#!/usr/bin/env python3
"""Construye el fuente Markdown que pandoc convierte en EPUB o en PDF.

Uso:  python3 scripts/epub/construir.py [epub|latex]

Transformaciones respecto de los ficheros de obra/capitulos/:
  · «## 12. Greulich y Pyle»  ->  h2 con el número en una línea aparte
  · la línea de epígrafe (*3 de agosto de 2026*) -> <p class="epigrafe">
  · la línea con un solo «*»                     -> <p class="separador">
Todo lo demás (raya de diálogo, cursivas, negritas, citas) pasa tal cual.
"""
import glob, os, re, sys

FORMATO = sys.argv[1] if len(sys.argv) > 1 else "epub"
if FORMATO not in ("epub", "latex"):
    sys.exit("formato: epub | latex")
SALIDA = "obra/epub/fuente.md" if FORMATO == "epub" else "obra/pdf/fuente.md"
ficheros = sorted(glob.glob("obra/capitulos/[0-9]*.md"))
if not ficheros:
    sys.exit("no hay capítulos en obra/capitulos/")

out = []
capitulos = 0
sin_sangria = False   # el párrafo que sigue a un epígrafe o a un blanco va a caja

for f in ficheros:
    lineas = open(f, encoding="utf-8").read().rstrip("\n").split("\n")
    i = 0
    while i < len(lineas):
        l = lineas[i]

        # portadilla de parte
        if l.startswith("# PARTE"):
            out += ["", l, ""]
            i += 1
            continue

        # título de capítulo
        m = re.match(r"^## (\d+)\.\s+(.*)$", l)
        if m:
            capitulos += 1
            num, titulo = m.group(1), m.group(2).strip()
            if FORMATO == "epub":
                out += ["", f'## <span class="numero">{num}</span><span class="sep"> · </span>{titulo}', ""]
            else:
                out += ["", f"## {titulo}", ""]
            i += 1
            # epígrafe: primera línea no vacía si va entre asteriscos
            j = i
            while j < len(lineas) and not lineas[j].strip():
                j += 1
            if j < len(lineas):
                e = re.match(r"^\*(.+)\*$", lineas[j].strip())
                if e and not lineas[j].strip().startswith("**"):
                    epi = e.group(1)
                    if FORMATO == "epub":
                        out += [f'<p class="epigrafe">{epi}</p>', ""]
                    else:
                        out += ["\\begin{epigrafe}", epi, "\\end{epigrafe}", ""]
                        sin_sangria = True
                    i = j + 1
            continue

        # separador de escena
        if l.strip() == "*":
            out += ["", '<p class="separador">✳</p>' if FORMATO == "epub" else "\\escena{}", ""]
            if FORMATO == "latex":
                sin_sangria = True
            i += 1
            continue

        # «2015. Cuatro carpetas.» no es una lista numerada: escapa el punto,
        # y si va seguida de otra línea, fuerza el salto para que no se peguen.
        if re.match(r"^\d{1,4}\. ", l):
            l = re.sub(r"^(\d{1,4})\. ", r"\1\\. ", l)
            if i + 1 < len(lineas) and lineas[i + 1].strip():
                l = l + "  "

        # el árabe necesita otra fuente en LaTeX (Pagella no lo tiene)
        if FORMATO == "latex":
            l = re.sub(r"[\u0600-\u06FF\u0750-\u077F]+(?:\s+[\u0600-\u06FF\u0750-\u077F]+)*",
                       lambda m: "\\textarabe{" + m.group(0) + "}", l)

        if sin_sangria and l.strip():
            l = "\\noindent " + l
            sin_sangria = False

        out.append(l)
        i += 1

    out.append("")

texto = "\n".join(out)
texto = re.sub(r"\n{3,}", "\n\n", texto)
os.makedirs(os.path.dirname(SALIDA), exist_ok=True)
open(SALIDA, "w", encoding="utf-8").write(texto)
print(f"{SALIDA}: {capitulos} capítulos, {len(texto.split())} palabras")

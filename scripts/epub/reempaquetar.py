#!/usr/bin/env python3
"""Repasa el EPUB que produce pandoc para que lo abra cualquier lector.

Tres cambios, los tres por compatibilidad:

  1. La portada. Pandoc la envuelve en un <svg><image xlink:href>. Es válido y
     epubcheck lo aprueba, pero varios lectores (Adobe Digital Editions viejo,
     algunos Kobo, lectores Android) lo rechazan o lo dejan en blanco. Se
     sustituye por un <img> normal y se quita properties="svg" del manifiesto.
  2. El <style></style> vacío que pandoc mete en cada XHTML.
  3. La carpeta de contenido. Pandoc la llama «EPUB/»; la convención de toda la
     vida es «OEBPS/». Un lector que lee META-INF/container.xml se entera igual,
     pero los lectores sencillos —varias apps que se llaman «EPUB Reader», entre
     otras— dan por hecho OEBPS/ y fallan con un error inesperado. Se renombra y
     se actualiza el container.xml. Las rutas internas del OPF son relativas a él,
     así que no hay que tocar ninguna otra.
  4. El ZIP se reescribe con «mimetype» como primera entrada y sin comprimir,
     que es lo único que la especificación exige del contenedor.
"""
import os, re, shutil, sys, zipfile

if len(sys.argv) != 2:
    sys.exit("uso: reempaquetar.py <fichero.epub>")

epub = sys.argv[1]
tmp = epub + ".desempaquetado"
shutil.rmtree(tmp, ignore_errors=True)

with zipfile.ZipFile(epub) as z:
    nombres = z.namelist()
    z.extractall(tmp)

# --- 1. portada sin SVG -------------------------------------------------
portada = None
for raiz, _, ficheros in os.walk(tmp):
    for f in ficheros:
        if f == "cover.xhtml":
            portada = os.path.join(raiz, f)

if portada:
    s = open(portada, encoding="utf-8").read()
    m = re.search(r'xlink:href="([^"]+)"', s)
    if m:
        ruta = m.group(1)
        s = re.sub(r"<svg\b.*?</svg>",
                   f'<img src="{ruta}" alt="Cubierta" '
                   f'style="max-width:100%;max-height:100%;" />',
                   s, flags=re.S)
        s = s.replace("<style>\n  </style>\n", "")
        open(portada, "w", encoding="utf-8").write(s)
        print("portada: svg -> img")

for raiz, _, ficheros in os.walk(tmp):
    for f in ficheros:
        if f.endswith(".opf"):
            p = os.path.join(raiz, f)
            s = open(p, encoding="utf-8").read()
            s = s.replace(' properties="svg"', "")
            open(p, "w", encoding="utf-8").write(s)

# --- 2. hojas de estilo vacías -----------------------------------------
for raiz, _, ficheros in os.walk(tmp):
    for f in ficheros:
        if f.endswith(".xhtml"):
            p = os.path.join(raiz, f)
            s = open(p, encoding="utf-8").read()
            t = re.sub(r"\s*<style>\s*</style>\n?", "\n", s)
            if t != s:
                open(p, "w", encoding="utf-8").write(t)

# --- 3. EPUB/ -> OEBPS/ -------------------------------------------------
if os.path.isdir(os.path.join(tmp, "EPUB")):
    os.rename(os.path.join(tmp, "EPUB"), os.path.join(tmp, "OEBPS"))
    nombres = [n.replace("EPUB/", "OEBPS/", 1) if n.startswith("EPUB/") else n
               for n in nombres]
    cont = os.path.join(tmp, "META-INF", "container.xml")
    c = open(cont, encoding="utf-8").read()
    c = c.replace('full-path="EPUB/', 'full-path="OEBPS/')
    open(cont, "w", encoding="utf-8").write(c)
    print("contenido: EPUB/ -> OEBPS/")

# --- 4. ZIP en el orden que manda la especificación --------------------
salida = epub + ".nuevo"
with zipfile.ZipFile(salida, "w") as z:
    z.write(os.path.join(tmp, "mimetype"), "mimetype", zipfile.ZIP_STORED)
    for n in nombres:
        if n == "mimetype":
            continue
        ruta = os.path.join(tmp, n)
        if os.path.isfile(ruta):
            z.write(ruta, n, zipfile.ZIP_DEFLATED)

os.replace(salida, epub)
shutil.rmtree(tmp, ignore_errors=True)
print(f"reempaquetado: {epub}")

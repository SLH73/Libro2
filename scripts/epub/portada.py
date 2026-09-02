#!/usr/bin/env python3
"""Genera la portada del EPUB: tipografía sobre fondo oscuro, sin ilustración."""
from PIL import Image, ImageDraw, ImageFont

W, H = 1600, 2400
FONDO   = (17, 20, 24)
TINTA   = (238, 234, 226)
APAGADO = (150, 143, 130)
FILETE  = (176, 122, 74)

SERIF   = "/usr/share/fonts/truetype/liberation/LiberationSerif-Regular.ttf"
SERIF_B = "/usr/share/fonts/truetype/liberation/LiberationSerif-Bold.ttf"
SANS    = "/usr/share/fonts/truetype/liberation/LiberationSans-Regular.ttf"

img = Image.new("RGB", (W, H), FONDO)
d = ImageDraw.Draw(img)

def centrado(texto, y, fuente, color, espaciado=0):
    if espaciado:
        anchos = [d.textlength(c, font=fuente) for c in texto]
        total = sum(anchos) + espaciado * (len(texto) - 1)
        x = (W - total) / 2
        for c, a in zip(texto, anchos):
            d.text((x, y), c, font=fuente, fill=color)
            x += a + espaciado
    else:
        a = d.textlength(texto, font=fuente)
        d.text(((W - a) / 2, y), texto, font=fuente, fill=color)

f_titulo = ImageFont.truetype(SERIF_B, 168)
f_de     = ImageFont.truetype(SERIF, 104)
f_autora = ImageFont.truetype(SANS, 76)
f_pie    = ImageFont.truetype(SANS, 46)

# marco interior
d.rectangle([90, 90, W - 90, H - 90], outline=(46, 50, 56), width=3)

centrado("LA EDAD", 620, f_titulo, TINTA, espaciado=10)
centrado("de los", 810, f_de, APAGADO)
centrado("HUESOS", 950, f_titulo, TINTA, espaciado=10)

d.line([(W / 2 - 150, 1210), (W / 2 + 150, 1210)], fill=FILETE, width=4)

centrado("LAMANI", 1360, f_autora, TINTA, espaciado=14)
centrado("N O V E L A", H - 320, f_pie, APAGADO, espaciado=6)

img.save("obra/epub/portada.jpg", "JPEG", quality=92)
print("portada.jpg", img.size)

# Presentación al Premio Planeta — hoja de control

*Comprobado contra las bases publicadas de la convocatoria 2026 el 3 de septiembre de 2026.*
*Fuente: `premioplaneta.es/docs/bases-premio-planeta-2026.pdf` y la ficha de escritores.org.*

---

## El fichero que se manda

**`obra/La edad de los huesos - original de concurso.pdf`**
Se regenera con `bash scripts/pdf.sh`.

| requisito de las bases | lo que lleva el fichero | ✓ |
|---|---|---|
| Extensión mínima 200 páginas | **596** | ✓ |
| Extensión máxima 650 páginas | 596 · quedan 54 de margen | ✓ |
| Tamaño DIN A4 (210 × 297 mm) | A4 exacto (595,28 × 841,89 pt) | ✓ |
| Times New Roman o Arial | TeX Gyre Termes, clon métrico de Times New Roman, incrustado en el PDF | ✓ |
| Cuerpo 12 | 12 pt | ✓ |
| Interlineado doble | doble (`setspace`) | ✓ |
| Obra original e inédita, en castellano | sí | ✓ |
| Una sola obra por autor | sí | ✓ |

Otras decisiones de la maqueta, no exigidas pero convenientes:

- **Sin partición de palabras.** En un original no se parten palabras al final de línea:
  se lee peor y ensucia cualquier recuento automático.
- **Un capítulo por página.** Los 126 capítulos abren página, que es la convención.
- **Cornisa sobria**: título de la obra a la izquierda y folio a la derecha, en todas las
  páginas. Ni una sola mención al autor real.
- **Márgenes** 2,5 cm arriba, abajo y derecha; 3 cm a la izquierda.

## Anonimato

Las bases exigen que la obra se presente bajo **título y seudónimo**, y que los datos del
autor vayan aparte —en la plica si se manda en papel, o en el formulario si se manda en PDF.

- La portada del original lleva **solo** el título, la palabra *Novela* y `Seudónimo: LAMANI`.
- El texto no contiene el nombre real del autor en ninguna parte.
- Los metadatos del PDF no llevan campo Autor.
- `scripts/pdf.sh` **falla y aborta** si detecta datos identificativos dentro del PDF de
  concurso. Es una comprobación automática, no una promesa.

## Lo que hay que rellenar aparte (no va en el PDF)

En el formulario de `candidaturas.premioplaneta.es`, o dentro de la plica si se manda en papel:

- Nombre y apellidos.
- Domicilio, teléfono y correo electrónico.
- Copia del documento de identidad.
- Declaración firmada de autoría y de que la obra es inédita, y de que no está
  comprometida con ninguna editorial ni pendiente de fallo en otro certamen.

## Plazos

El plazo de la convocatoria **2026 cerró el 15 de junio de 2026**. Este original llega
tarde para esa edición: la que corresponde es la **convocatoria de 2027**, cuyas bases
suelen publicarse a finales de año. **Antes de enviar, hay que releer las bases nuevas**:
el rango de páginas y el formato han cambiado varias veces en los últimos años.

## Antes de enviar

- [ ] Releer las bases de la convocatoria en curso y rehacer esta tabla.
- [ ] Comprobar que la obra sigue inédita y no comprometida con ninguna editorial.
- [ ] Decidir si se mantiene el seudónimo *Lamani*.
- [ ] Corregir el manuscrito una vez más: quedan las tareas de
      `obra/informes/editorial-05.md` §8 y `obra/informes/autenticidad-05.md`.

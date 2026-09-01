# Arquitectura — *La edad de los huesos*

**Agente 4 · Arquitecto Narrativo** (con `arquitecto-bestseller-hispanico`)

> Este documento es **el plano y la memoria del proyecto**. Cualquier sesión que
> abra este repositorio escribe el capítulo que le toque leyendo su ficha aquí.
> No se rediseña. Las desviaciones menores se anotan en `obra/biblia.md`.

---

## Las siete decisiones

**1 · Punto de entrada.** El centro: algo ya se ha roto. La novela empieza a las
cuatro y cuarenta de la madrugada del 30 de julio de 2026, con la avalancha ya
en el agua. Contrato de thriller literario.

**2 · Distancia narrativa.** Corta en la línea de 2026 (tercera persona íntima
sobre Elena: vemos sus pensamientos desde fuera). Cero en las voces en primera
persona. Media en la línea de 2017, deliberadamente más fría: el pasado se mira
desde lejos porque Elena no se atreve a acercarse.

**3 · Gestión de la información.** Las tres herramientas, por partes:
*misterio* en la I y la II (nadie sabe quién mató a Anuar), *suspense* en la III
(Elena sabe cosas que el lector todavía no), *ironía dramática* en la IV y la V
(el lector sospecha antes que Elena cómo murió Anuar, y sufre viéndola
construir la acusación equivocada).
**La revelación central** —Anuar murió aplastado por el brazo de otro niño de
dieciséis años en el pánico del agua, y no estrangulado— se coloca en el
capítulo 82, final de la Parte IV: tarde, para que el lector haya tenido tiempo
de condenar a alguien.

**4 · Ritmo.** Macro: cinco meses narrados en detalle (julio-diciembre 2026) con
un verano de 2017 excavado en dieciocho capítulos intercalados, y los catorce
años de Anuar contados hacia atrás en doce. Micro: capítulos de 900 a 3.400
palabras, media 2.000, **nunca dos consecutivos de longitud parecida**. Las
voces en primera persona siempre por debajo de 1.400: son cuchilladas.

**5 · La primera línea.** Tipo profético. Debe contener a la vez la escala del
suceso y el oficio de Elena, y prometer que la aritmética va a fallar.

**6 · El final como reencuadre.** Doble cierre. El capítulo 99 responde a la
pregunta moral: Elena firma, por primera vez en veintitrés años, un informe que
dice *no lo sé*. El capítulo 100 reencuadra la novela entera: la voz de Anuar en
Beni Mellal la mañana que se fue de casa, contenta. El lector cierra el libro en
el punto más lejano al que ha llegado la novela, que es también el principio.

**7 · Estructura interna del capítulo.** Cada capítulo tiene su propio
movimiento dramático. Los finales alternan: **gancho** (60 %), **silencio**
(25 %), **giro** (15 %). Nunca tres ganchos seguidos: cansa y se nota el truco.

## La arquitectura

**Vasos comunicantes (arquitectura 5) + lineal con fractura (arquitectura 1).**
Tres líneas trenzadas cuya distancia se va acortando:

| Marca | Línea | Tiempo | Voz | Capítulos |
|---|---|---|---|---|
| `[2026]` | Elena, el presente | 30 jul – 20 dic 2026 | 3.ª íntima, pretérito | 62 |
| `[2017]` | El verano de los 43 | jun – sep 2017 | 3.ª media, pretérito | 18 |
| `[ANUAR]` | Anuar hacia atrás | del agua a Beni Mellal | 1.ª, presente, Rulfo | 12 |
| `[VOZ]` | Yassin, Chaimae, Driss, Robles | variable | 1.ª | 8 |

**Regla de oro de los vasos comunicantes:** ninguna línea debe poder leerse
sola. 2017 no se entiende sin 2026 y 2026 no significa nada sin 2017. Se tocan
en el capítulo 61.

## Cronología interna

- **feb 2014** · Tarajal. Quince muertos. Robles está allí, de inspector jefe.
- **jun–sep 2017** · Elena vuelve a Ceuta y firma cuarenta y tres informes.
- **15 jul 2026** · Empiezan a subir las entradas por Benzú.
- **30–31 jul 2026** · 72.000 personas. Anuar muere en la madrugada del 30.
- **3 ago** · 70.000 han vuelto a Marruecos.
- **13 ago** · 1.898 menores identificados, unos 4.000 sin identificar.
- **20 ago** · Traslado del Trampolín a Loma Margarita y Loma Colmenar.
- **25–26 ago** · La ciudad se planta contra los polideportivos.
- **8 sep** · Se filtra que Elena firmó los 43.
- **2 oct** · Detención de Julia.
- **17 oct** · Detención de Yassin.
- **11 nov** · Informe rectificativo.
- **20 dic** · Inscripción de Anuar El Founti en el Registro Civil de Ceuta.

---

# LOS CIEN CAPÍTULOS

Formato: `NNN · título · [línea] · ~palabras` — objetivo · qué revela · cierre.

## PARTE I — EL AGUA (1-20) · 30 julio – 8 agosto · ~38.000 palabras

**001 · Los perros del Tarajal · [2026] · 2.600.** Las cuatro y cuarenta de la
madrugada. Elena sale de casa porque los perros llevan dos horas ladrando y
porque le ha entrado un aviso que no entiende: no la llaman por un muerto, la
llaman por una cantidad. Establecer Ceuta, el oficio, la escala. *Cierre:
gancho* — en el agua, entre las cabezas que nadan, hay una que no nada.

**002 · Anuar XII · [ANUAR] · 900.** El agua. Un chico cuenta lo que le pasa sin
saber que ya le ha pasado. Rulfo puro. Frases de tres palabras. *Cierre: silencio.*

**003 · La cuenta · [2026] · 2.400.** El IML desbordado. Once cuerpos en un
depósito de seis cajones. Aparece Fredo Cañete. La burocracia de nombrar a los
que no tienen nombre: varón, magrebí, 1,64, no identificado. *Cierre: gancho.*

**004 · Cruz Roja · [2026] · 1.800.** Julia en la playa, con chaleco, dando
mantas térmicas. Madre e hija se ven a doscientos metros y ninguna cruza.
Establecer el conflicto Elena-Julia sin una sola frase que lo explique.
*Cierre: silencio.*

**005 · El número siete · [2026] · 3.200.** La autopsia. Agua en los pulmones,
sí. Y el hioides partido. Y en el bolsillo, doblado en cuatro dentro de una
funda de plástico de las de las tarjetas de transporte, un informe forense de
2017 con la firma de Elena Bonmatí. *Cierre: giro. Fin del primer movimiento.*

**006 · Junio de 2017 · [2017] · 2.000.** Elena vuelve a Ceuta con una hija de
diez años y un divorcio a medias. Primer día en el Instituto. Marcial Rueda la
recibe con un café y una advertencia que ella toma por un chiste. *Cierre:
silencio.*

**007 · Fredo · [2026] · 2.200.** El subinspector explica por qué nadie va a
investigar esto: hay once cuerpos, cuatro mil menores y una ciudad que no da
más. Un homicidio dentro de una avalancha es el crimen perfecto porque nadie
cuenta un cuerpo entre setenta y dos mil. Elena dice que ella sí. *Cierre: gancho.*

**008 · El comisario · [2026] · 2.400.** Robles. Primer cara a cara. Cortés,
inteligente, agotado. Le enseña a Elena las cifras reales del dispositivo y le
pregunta cuántas horas de policía cuesta un hioides. *Cierre: gancho.*

**009 · Tetuán · [2026] · 1.600.** Milagros, la madre, en la residencia. Habla en
árabe con Nadia, la cuidadora, y no reconoce a Elena. Cree que están en la calle
Luneta y que hay que ir a por el pan antes de que cierren. *Cierre: silencio.*

**010 · Yassin El Founti · [2026] · 2.100.** Elena lee el informe del bolsillo
entero. Lo firmó ella el 4 de agosto de 2017. Declara mayor de edad a un chico.
Y lo peor no es haberlo firmado: es que no se acuerda de él. *Cierre: giro.*

**011 · Anuar XI · [ANUAR] · 1.000.** La noche anterior en el espigón. El agua
negra. Los que se descalzan. *Cierre: silencio.*

**012 · Greulich y Pyle · [2026] · 2.700.** Elena empieza los exámenes de
determinación de edad. Escena didáctica y demoledora: un atlas de radiografías de
niños blancos de Cleveland de los años treinta aplicado a la muñeca de un chaval
de Beni Mellal, con dos años de margen. El primer chico. *Cierre: gancho.*

**013 · Chaimae · [2026] · 2.000.** La mediadora. Sube con Elena al Príncipe
Alfonso. Elena lleva cuarenta y siete años viviendo a dos kilómetros de allí y no
ha subido nunca. *Cierre: silencio.*

**014 · Julio de 2017 · [2017] · 1.900.** El primer informe de aquel verano.
Rueda de pie detrás de ella. «Aquí se firma, Bonmatí. Lo demás es literatura.»
*Cierre: giro.*

**015 · La delegada · [2026] · 2.300.** Inés Vidal-Quadras convoca a Elena. Hay
una cifra dicha en rueda de prensa y hace falta que la realidad se le parezca.
No hay amenaza: hay una mujer competente pidiendo ayuda. Peor. *Cierre: gancho.*

**016 · Trampolín · [2026] · 2.800.** La playa con mil setecientas personas.
Escena coral, gran plano. Julia conoce a Driss. Elena ve a su hija darle su
propio teléfono a un desconocido de dieciséis años. *Cierre: gancho.*

**017 · Homicidio · [2026] · 2.000.** Elena firma el informe con la palabra que
nadie quiere. Primeras consecuencias en el mismo día. *Cierre: gancho.*

**018 · Voz: Yassin · [VOZ] · 1.200.** Primera persona, presente. Está en Ceuta.
Lleva tres días mirando la puerta del Instituto de Medicina Legal. *Cierre: giro.*

**019 · El archivo · [2026] · 2.200.** Elena baja al sótano a buscar el
expediente de 2017. La carpeta existe. Está vacía. *Cierre: gancho.*

**020 · Cuarenta y tres · [2026] · 1.700.** En su agenda vieja, con su letra, una
cifra sola en el margen del mes de agosto de 2017. *Cierre: giro. Fin Parte I.*

## PARTE II — EL ATLAS (21-42) · 9 – 20 agosto · ~44.000 palabras

**021 · Los cuatro mil · [2026] · 2.500.** La cola del SAMU. Chavales durmiendo
en la acera esperando a existir. La aritmética del sistema de protección.
*Cierre: silencio.*

**022 · Anuar X · [ANUAR] · 950.** El autobús a Castillejos. Va contento.
*Cierre: silencio.*

**023 · Sesenta en un día · [2026] · 2.600.** La cadena de montaje de muñecas.
Elena firma sesenta informes. Al cuarto ya no mira las caras. *Cierre: gancho.*

**024 · La primera mentira de Julia · [2026] · 2.000.** Driss no está en ninguna
lista y Julia sabe por qué. *Cierre: gancho.*

**025 · El margen · [2017] · 2.100.** Robles y Elena, agosto de 2017. La frase
que sostiene la novela: «El margen es de dos años, doctora. Hacia qué lado, lo
elige usted.» *Cierre: giro.*

**026 · La segunda opinión · [2026] · 2.300.** El forense de Cádiz discrepa: el
hioides se parte también en las maniobras de reanimación. La certeza de Elena se
abre por la mitad. *Cierre: gancho.*

**027 · La comida · [2026] · 2.400.** Chaimae lleva a Elena a comer a casa de su
familia en el Príncipe. Ochenta páginas de tema resueltas en una mesa con
tayín. *Cierre: silencio.*

**028 · El pleno · [2026] · 3.000.** Los polideportivos. Escena coral grande:
la ciudad entera en un salón de plenos. Se han quedado sin feria, sin parques y
ahora quieren los pabellones. Nadie miente y todos tienen razón. *Cierre: gancho.*

**029 · Lo que Robles tiene razón · [2026] · 2.400.** La discusión que gana
Robles. **Obligatorio que la gane.** Elena sale sin argumentos y sabiendo que él
no está equivocado. *Cierre: silencio.*

**030 · Anuar IX · [ANUAR] · 1.100.** Fnideq. El grupo de Facebook. «España ha
abierto la frontera.» Se lo cree todo el mundo porque todo el mundo se lo cree.
*Cierre: giro.*

**031 · Tú los cuentas · [2026] · 2.200.** La pelea. Julia: «Tú los cuentas, yo
los tapo.» *Cierre: gancho.*

**032 · Benzú · [2026] · 2.500.** Marcial Rueda, jubilado, con un perro y una
casa mirando a Marruecos. La primera visita. No suelta nada y lo suelta todo.
*Cierre: gancho.*

**033 · El chico de quince años · [2017] · 2.700.** Elena conoce a Yassin en
2017. Escena capital: lo mira, sabe que tiene quince años, y firma diecisiete.
Sin coacción. Nadie en la habitación. *Cierre: giro.*

**034 · Voz: Chaimae · [VOZ] · 1.300.** Primera persona. Nacer en Ceuta, ser de
Ceuta y que te pregunten de dónde eres de verdad. *Cierre: silencio.*

**035 · La aritmética imposible · [2026] · 2.200.** 1.898 identificados. Unos
4.000 sin identificar. Los números no pueden ser los dos verdad. *Cierre: gancho.*

**036 · Gonzalo · [2026] · 1.900.** El exmarido llama desde Madrid. Quiere sacar
a Julia de Ceuta. Tiene razón y por eso es insoportable. *Cierre: silencio.*

**037 · Anuar VIII · [ANUAR] · 900.** Trescientos dírhams. Lo que costaba no
morirse. *Cierre: giro.*

**038 · Un hombre sin registro · [2026] · 2.300.** Elena busca a Yassin El Founti
en todas las bases del Estado. No existe en ninguna. Un hombre al que España
declaró adulto y después dejó de escribir. *Cierre: gancho.*

**039 · El cuarenta y tres · [2017] · 2.000.** El último informe de aquel verano.
Y lo que Elena hizo esa noche al llegar a casa: nada. Cenó. *Cierre: silencio.*

**040 · Loma Colmenar · [2026] · 2.600.** Elena entra en la zona de retención.
Lo que ve, contado con la frialdad de un acta. *Cierre: gancho.*

**041 · La nota · [2026] · 1.600.** Bajo la puerta, escrita a mano, en un español
torpe y cuidadoso: una hora y un sitio. *Cierre: gancho.*

**042 · Sidi Embarek · [2026] · 2.400.** Elena va al cementerio musulmán a la
hora de la nota. No aparece nadie. Aparece una tumba recién abierta con un
número por nombre. *Cierre: giro. Fin Parte II.*

## PARTE III — LOS CUARENTA Y TRES (43-62) · 21 agosto – 10 septiembre · ~40.000

**043 · Anuar VII · [ANUAR] · 1.000.** El hermano mayor le dice que no venga.
*Cierre: silencio.*

**044 · El chaval del piso · [2026] · 2.300.** Elena descubre a Driss en el piso
vacío de su madre. Su hija lleva dieciocho días escondiendo a un menor.
*Cierre: gancho.*

**045 · Lo que hace una madre · [2026] · 2.000.** Elena no lo denuncia. Primera
grieta en la funcionaria. *Cierre: giro.*

**046 · El cuerpo se movió · [2026] · 2.400.** Fredo, con la paciencia de treinta
y ocho años de oficio, demuestra que el cadáver fue arrastrado fuera del agua y
devuelto a ella. Alguien lo tocó antes que la Guardia Civil. *Cierre: gancho.*

**047 · Agosto de 2017 · [2017] · 1.900.** La instrucción verbal. Nunca hubo un
papel. Nunca lo hay. *Cierre: silencio.*

**048 · Seis de cuarenta y tres · [2026] · 2.700.** Elena localiza a seis de los
chicos de 2017. Dos han muerto. Uno es electricista en Girona. Uno no quiere
hablar con ella. Los otros dos no aparecen. *Cierre: silencio.*

**049 · Apartada · [2026] · 2.100.** Robles consigue que le retiren el caso sin
levantar la voz ni cometer una sola ilegalidad. *Cierre: gancho.*

**050 · Voz: Driss · [VOZ] · 1.200.** Primera persona. El chico cuenta el agua y
se calla exactamente en el punto en el que se calla todo el mundo. *Cierre: giro.*

**051 · La tumba número siete · [2026] · 2.200.** Elena vuelve al cementerio.
Esta vez hay un hombre. *Cierre: gancho.*

**052 · Yassin · [2026] · 3.400.** **GIRO MEDIO.** Nueve años en una habitación
de tres metros. Yassin le cuenta lo del bolsillo: metió el informe de ella en el
pantalón de su hermano muerto porque era la única forma que tenía un hombre sin
papeles de obligar al Estado español a mirar a Anuar. No quiere venganza. Quiere
un nombre en un papel. **La novela cambia de género aquí.** *Cierre: silencio.*

**053 · Después · [2026] · 1.800.** Elena en el coche, aparcada, dos horas sin
arrancar. *Cierre: silencio.*

**054 · Lo que pide un nombre · [2026] · 2.300.** Inscribir a un muerto sin
papeles en el Registro Civil de Ceuta: los requisitos, el funcionario, el bucle.
Burocracia como thriller. *Cierre: gancho.*

**055 · Anuar VI · [ANUAR] · 950.** La foto de carné que se hizo para el viaje.
*Cierre: giro.*

**056 · Rueda habla · [2026] · 2.800.** Segunda visita a Benzú. El maestro cuenta
lo suyo, que es peor, y explica por qué nunca pasó nada. *Cierre: giro.*

**057 · La periodista · [2026] · 2.000.** Aparece una reportera de un diario
nacional. Elena tiene que decidir si habla. No habla. *Cierre: gancho.*

**058 · Certificado de defunción de un desconocido · [2026] · 2.100.** El papel
que sí se puede firmar. Elena lo firma. Es poco y es lo primero. *Cierre: silencio.*

**059 · Voz: Robles · [VOZ] · 1.400.** Primera persona, la única del comisario.
Febrero de 2014. El Tarajal. Lo que vio y lo que hizo y lo que no ha contado
nunca. **No debe pedir perdón ni justificarse.** *Cierre: silencio.*

**060 · La reunión · [2026] · 2.400.** La delegada, Robles y Elena en el mismo
despacho. Tres personas decentes tomando una decisión indecente. *Cierre: gancho.*

**061 · Los dos veranos · [2017]+[2026] · 3.000.** **El capítulo donde se tocan
las líneas.** Montaje alterno: el 4 de agosto de 2017 y el 4 de septiembre de
2026 en la misma sala del Instituto, la misma silla, la misma pregunta. Vasos
comunicantes en estado puro. *Cierre: giro.*

**062 · La filtración · [2026] · 2.200.** El nombre de Elena en un diario
nacional: la forense que declaró adultos a cuarenta y tres menores. Todo cierto.
*Cierre: gancho. Fin Parte III.*

## PARTE IV — LA CIUDAD SITIADA (63-82) · septiembre – octubre · ~40.000

**063 · Ochenta y tres mil vecinos · [2026] · 2.400.** Ser señalada en una ciudad
de ochenta y tres mil habitantes donde todos se conocen. La panadería. El
gimnasio. *Cierre: silencio.*

**064 · Expediente disciplinario · [2026] · 2.000.** Ministerio. Instructor.
Suspensión cautelar de funciones. *Cierre: gancho.*

**065 · Anuar V · [ANUAR] · 1.000.** El primer trabajo, a los once, en un taller
de Beni Mellal. *Cierre: silencio.*

**066 · Los que la defienden · [2026] · 2.200.** Fredo, Chaimae y —sorpresa—
Marcial Rueda. Los aliados que a Elena le habría gustado no tener. *Cierre: giro.*

**067 · Los que la atacan · [2026] · 2.300.** Y la parte de razón que tienen.
*Cierre: gancho.*

**068 · Milagros · [2026] · 1.800.** La madre, un día bueno. Dice el nombre de su
hija una vez y vuelve a irse. *Cierre: silencio.*

**069 · Voz: Yassin II · [VOZ] · 1.200.** Nueve años de Europa contados en una
página y media: Almería, Perpiñán, un invernadero, una furgoneta, una frontera y
otra frontera. *Cierre: giro.*

**070 · Septiembre de 2017 · [2017] · 2.000.** El día que Elena supo que se había
equivocado y decidió no hacer nada. La escena más difícil del libro. *Cierre:
silencio.*

**071 · Detenida · [2026] · 2.600.** Julia, por favorecimiento de la inmigración
irregular y ocultación de un menor. La madre forense en el pasillo de una
comisaría. *Cierre: gancho.*

**072 · Gonzalo en Ceuta · [2026] · 2.200.** El exmarido llega con un abogado
bueno y con veinte años de reproches por gastar. *Cierre: gancho.*

**073 · Anuar IV · [ANUAR] · 950.** La madre le corta el pelo la noche antes.
*Cierre: silencio.*

**074 · La declaración de Driss · [2026] · 2.500.** El chico miente. Y miente mal.
*Cierre: giro.*

**075 · Yassin detenido · [2026] · 2.400.** Manipulación de cadáver, sospechoso
de homicidio. La falsa pista que construyó la propia Elena al escribir la palabra
homicidio. *Cierre: gancho.*

**076 · Lo que Elena sabe y no puede probar · [2026] · 2.100.** *Cierre: gancho.*

**077 · Chaimae en el juzgado · [2026] · 2.000.** La mediadora traduce una
declaración y descubre que traducir es elegir. *Cierre: silencio.*

**078 · La ciudad en octubre · [2026] · 1.900.** Ceuta cuando se van las cámaras.
El capítulo más quieto de la novela, a propósito, antes del último tramo.
*Cierre: silencio.*

**079 · Dos años de margen · [2026] · 2.400.** La delegada le ofrece a Elena una
salida limpia a cambio de un informe tibio. Exactamente la misma oferta de 2017,
nueve años después, con otras palabras. *Cierre: giro.*

**080 · Anuar III · [ANUAR] · 1.000.** El hermano se va a España. Anuar tiene
seis años y no entiende por qué llora su madre. *Cierre: silencio.*

**081 · La reconstrucción · [2026] · 2.700.** Elena vuelve al agua, al espigón, a
la hora exacta, con la marea de aquel día. Fredo con un cronómetro. *Cierre: gancho.*

**082 · El antebrazo · [2026] · 2.300.** **LA REVELACIÓN.** No hubo estrangulador.
Hubo un chaval de dieciséis años que no sabía nadar y se agarró a lo primero que
encontró. El hioides partido es verdad y la historia que Elena construyó con él
es falsa. Exactamente lo mismo que lleva veintitrés años haciendo con las
muñecas. *Cierre: giro. Fin Parte IV.*

## PARTE V — EL NOMBRE (83-100) · noviembre – diciembre · ~36.000

**083 · Lo que dice un hueso · [2026] · 2.200.** Elena entiende que la ciencia le
dio un dato correcto y ella le puso encima una novela. *Cierre: silencio.*

**084 · Anuar II · [ANUAR] · 1.100.** El día que decidió irse. *Cierre: giro.*

**085 · Informe rectificativo · [2026] · 2.600.** Escribirlo. Cada línea le
cuesta algo. *Cierre: gancho.*

**086 · Driss · [2026] · 2.400.** Elena y el chico, solos. Ella le dice lo que ha
descubierto. Él no se siente aliviado: se siente culpable por primera vez.
*Cierre: silencio.*

**087 · Yassin libre · [2026] · 2.000.** Salir de un calabozo no es lo mismo que
salir. *Cierre: silencio.*

**088 · La comparecencia · [2026] · 3.000.** Elena declara ante el instructor los
cuarenta y tres informes de 2017. Nadie se lo ha pedido. Se hunde sola.
*Cierre: gancho.*

**089 · Robles, la última vez · [2026] · 2.600.** Cara a cara final. Sale el
Tarajal de 2014, entre ellos dos y en ningún acta. Ninguno convence al otro y
ninguno miente. *Cierre: silencio.*

**090 · El precio de Julia · [2026] · 2.200.** Archivo con condiciones. Julia se
va a Granada. Lo que se rompe entre madre e hija no se arregla en este libro.
*Cierre: silencio.*

**091 · Anuar I bis · [ANUAR] · 950.** Los zapatos que dejó en la orilla.
*Cierre: giro.*

**092 · Rueda se muere · [2026] · 2.100.** El maestro, en Benzú, sin arrepentirse
de nada y sabiéndolo todo. *Cierre: silencio.*

**093 · Los otros cuarenta y dos · [2026] · 2.500.** Elena empieza a escribir
cartas. Consigue tres respuestas. Una es un insulto. Otra es una foto de una boda.
*Cierre: giro.*

**094 · Registro Civil · [2026] · 2.400.** 20 de diciembre. La inscripción.
Anuar El Founti, nacido en Beni Mellal, muerto en Ceuta el 30 de julio de 2026.
Catorce años. Con nombre. *Cierre: silencio.*

**095 · La lápida · [2026] · 1.900.** Sidi Embarek. Yassin, Chaimae, Fredo y
Elena. Cuatro personas y un albañil. *Cierre: silencio.*

**096 · Voz: Yassin III · [VOZ] · 1.300.** Se va. Última voz suya. No perdona a
Elena y tampoco la condena: le da las gracias, que es peor. *Cierre: giro.*

**097 · Enero · [2026] · 2.000.** Elena, readmitida con sanción, vuelve al
Instituto. Todo sigue igual. Ese es el horror y también la única esperanza
posible. *Cierre: silencio.*

**098 · Un chico de la cola · [2026] · 2.200.** Un chaval nuevo en la sala de
exploración. Muñeca izquierda. Radiografía. El atlas de Cleveland abierto por la
misma página de siempre. *Cierre: gancho.*

**099 · La firma · [2026] · 1.800.** Elena escribe, por primera vez en veintitrés
años: *No es posible determinar la edad de este niño.* Y como el Estado no puede
contarlo, el Estado tendrá que presumir que es menor. Una sola firma. No salva al
mundo: salva a uno. *Cierre: giro.*

**100 · Anuar I · [ANUAR] · 1.400.** Beni Mellal, la mañana que se fue. Hace sol.
Su madre le ha hecho pan. Va contento. **No sabe nada de lo que sabe el lector.**
Última imagen del libro. *Cierre: silencio.*

---

## Prohibiciones de esta arquitectura

- Ningún capítulo puede existir solo para informar. Si un capítulo no cambia
  nada, se corta.
- Ningún personaje puede tener un solo argumento. Robles gana dos discusiones;
  la delegada, una.
- Nadie explica el tema en voz alta. Si un personaje dice «esto va de decidir
  quién es un niño», se borra la frase.
- Ningún chaval es un símbolo. Todos tienen nombre, pueblo, oficio y manías.
- El final no consuela. Elena no arregla el sistema: firma un papel.

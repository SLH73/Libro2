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

# LOS CIENTO VEINTICINCO CAPÍTULOS

> **DECISIÓN DEL AUTOR (capítulo 87).** El objetivo pasa de 200.000 palabras a
> **~155.000, manteniendo los 125 capítulos de este plano.** La media real de
> escritura —unas 1.250 palabras por capítulo— es la que pide esta novela, y forzarla
> hacia arriba era meter relleno. 155.000 palabras son unas 550 páginas, dentro del
> rango cómodo del Planeta. **No se amplía el número de capítulos y no se alargan las
> escenas: el plano de 125 fichas que sigue a continuación es el libro entero.**
>
> ---
>
> *(Histórico, ya superado por la decisión de arriba)* **Ampliación acordada tras el
> bloque 2 (informe `editorial-02.md`).** El plano
> original preveía cien capítulos de 2.000 palabras. La media real de escritura es
> de 1.269, y no por descuido: los capítulos salen así porque están bien cortados.
> Alargarlos sería meter relleno en una novela cuyo motor es que no lo tiene. Se
> mantiene la extensión natural de la escena y **se pasa de 100 a 125 capítulos**.
> Media necesaria de aquí al final: unas 1.767 palabras. Las tres partes que quedan
> iban sobrecargadas de trama en el plano original; ahora respiran.

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

**030 · Anuar IX · [ANUAR] · 1.100.** Fnideq. La calle llena como en una feria.
El grupo de Facebook, el vídeo de la carretera, «España ha abierto la frontera».
Se lo cree todo el mundo porque se lo cree todo el mundo. *Cierre: giro.*

**031 · Tú los cuentas · [2026] · 2.300.** La pelea. Julia le echa en cara que
mide muñecas; Elena tiene en el altillo una placa ilegal de la muñeca de Driss y
no se lo dice. La discusión que se pierde por lo que uno se calla.
*Cierre: gancho.*

**032 · Benzú · [2026] · 2.600.** Marcial Rueda, jubilado, con el perro Sultán y
una casa mirando a Marruecos. Elena va a preguntarle por la carpeta vacía del
tercer trimestre de 2017 y por la llave del archivo que devolvió en 2019. No
suelta nada y lo suelta todo. *Cierre: gancho.*

**033 · El chico de quince años · [2017] · 2.900.** **El 4 de agosto de 2017
entero**, de las ocho de la mañana a las seis y media de la tarde: los cuatro
informes, el último de ellos el 2017/0431-E. La exploración de Yassin contada
minuto a minuto. Ella lo mira, sabe que tiene quince años y escribe diecisiete.
Sin coacción y sin nadie en la habitación. *Cierre: giro.*

**034 · Voz: Chaimae · [VOZ] · 1.300.** Primera persona. Nacer aquí, ser de aquí,
y que te pregunten de dónde eres de verdad. Y lo que se siente traduciendo para
una mujer que decide edades. *Cierre: silencio.*

**035 · La aritmética imposible · [2026] · 2.400.** La pregunta del concejal en
acta. Elena cruza sus propios números: 2.411 expedientes, ninguno entrado por su
propio pie, 1.168 contados a mano en tres calles, 3.800 en el cuaderno de un
chaval de la Almadraba. Ninguna de las cuatro cifras conoce a las otras.
*Cierre: gancho.*

**036 · Gonzalo · [2026] · 2.000.** El exmarido llega a Ceuta sin avisar. Quiere
sacar a Julia. Tiene razón y por eso es insoportable. *Cierre: silencio.*

**037 · Anuar VIII · [ANUAR] · 1.000.** Trescientos dírhams doblados dentro de un
calcetín, debajo del colchón, en el lado de la ventana. Lo que costaba no
morirse. *Cierre: giro.*

**038 · Los nueve que volvieron · [2026] · 2.700.** Elena trabaja la lista del
sobre anónimo. Localiza a tres. Uno es electricista en Girona y le cuelga. Otro
está muerto. El tercero le contesta. Y por el camino averigua quién le dejó el
sobre encima de la mesa. *Cierre: giro.*

**039 · Once meses · [2026] · 2.400.** La identificación de Anuar es técnicamente
trivial y jurídicamente imposible: hace falta una muestra de su madre en Beni
Mellal y una comisión rogatoria que tarda once meses si llega. Chaimae propone
una manera de conseguir la muestra que es ilegal y que funcionaría.
*Cierre: gancho.*

**040 · Loma Colmenar · [2026] · 2.600.** El traslado del Trampolín. Elena entra
en la zona de retención con una acreditación que no le corresponde. Lo que ve,
contado con la frialdad de un acta. *Cierre: gancho.*

**041 · La nota · [2026] · 1.700.** Bajo la puerta de casa, escrita a mano, en un
español torpe y cuidadoso: una hora y un sitio. No la ha traído Berenguer.
*Cierre: gancho.*

**042 · Sidi Embarek · [2026] · 2.500.** Elena va al cementerio musulmán a la
hora de la nota. No aparece nadie. Aparece una fosa recién abierta con un número
por nombre y un hombre que se va antes de que ella llegue. *Cierre: giro. Fin
Parte II.*

> **Nota de revisión (tras escribir 21-29).** La Parte II absorbió tres cambios
> que el Director aprobó sobre la marcha y que el resto del libro da por hechos:
> 1. **Elena sabe desde el capítulo 29 que el muerto se llama Anuar El Founti.**
>    Saber el nombre y conseguir que el Estado lo escriba son dos cosas distintas,
>    y esa distancia es ahora el motor burocrático de las partes III y IV. El
>    capítulo 94 no revela el nombre: lo inscribe.
> 2. **Ignacio Berenguer**, abogado de Málaga, entra en el 29 como personado en
>    nombre de un cliente que no puede probar que existe. Es el canal por el que
>    Yassin actúa antes de aparecer en el 52, y su presencia adelanta trama que la
>    versión original guardaba demasiado tiempo.
> 3. **La radiografía ilegal de Driss** (cap 27) está escondida en el altillo de
>    Elena desde el 18 de agosto. Es el arma de Chéjov que detona en el 71 con la
>    detención de Julia, y la que convierte a Elena en cómplice antes de ser
>    denunciante.

## PARTE III — LOS CUARENTA Y TRES (43-68) · 19 septiembre – 20 octubre · ~46.000

> **Reloj de la parte:** la citación del expediente disciplinario, fijada en el 49
> para el 20 de octubre. Todo lo demás corre contra esa fecha.

**043 · Anuar VII · [ANUAR] · 1.000.** Marzo. El día que consiguió el papel del
taller. Lo dobló en cuatro y lo llevó cuatro meses en el bolsillo. *Silencio.*

**044 · El conserje · [2026] · 1.800.** Elena vuelve a Sidi Embarek al día
siguiente. El hombre que lleva el cementerio le explica cómo funciona una tumba con
número y qué haría falta para cambiarle el nombre. *Gancho.*

**045 · Cañete · [2026] · 2.200.** Escena propia del subinspector, no de
acompañamiento: le quedan siete meses de servicio y ha decidido gastarlos en esto.
Trae la trascripción de la malla de emisoras del 30 de julio. *Gancho.*

**046 · El cuerpo se movió · [2026] · 2.400.** Con la malla y las horas, Cañete
demuestra que el cadáver fue sacado del agua, tendido en seco y devuelto. Alguien lo
tocó una hora antes que la Guardia Civil. *Gancho.*

**047 · Agosto de 2017 · [2017] · 2.000.** La instrucción verbal que nunca existió.
Elena reconstruye que nadie le dijo nada nunca, y que eso es lo que la condena.
*Silencio.*

**048 · Voz: Driss · [VOZ] · 1.200.** El agua contada por dentro. Se calla
exactamente donde se calla todo el mundo. *Giro.*

**049 · Información reservada · [2026] · 2.100.** Le incoan expediente. Citación
para el 20 de octubre. Instructor de Cádiz. *Gancho.*

**050 · Apartada · [2026] · 2.000.** Robles consigue que le retiren la pericia sin
levantar la voz ni cometer una ilegalidad. *Gancho.*

**051 · Rueda, segunda visita · [2026] · 2.500.** Benzú. El maestro cuenta por qué
no firmó ni uno en el verano de 2017. *Giro.*

**052 · Yassin · [2026] · 3.000.** **GIRO MEDIO.** Nueve años en una habitación de
tres metros. Le cuenta lo del bolsillo: metió el informe de ella en el pantalón de su
hermano porque era la única forma que tenía un hombre sin papeles de obligar al
Estado a mirar a Anuar. No quiere venganza: quiere un nombre en un papel. **La novela
cambia de género aquí.** *Silencio.*

**053 · Después · [2026] · 1.600.** Elena en el coche, aparcada, dos horas sin
arrancar. *Silencio.*

**054 · Lo que pide un nombre · [2026] · 2.300.** Inscribir a un muerto sin papeles
en el Registro Civil: los requisitos, el funcionario, el bucle. *Gancho.*

> **NUDO DE LA SEGUNDA MITAD, establecido en el 54 y que gobierna todo lo que
> viene.** Para inscribir a Anuar hacen falta tres vías y solo queda una: prueba
> biológica de parentesco. Sirve la de un hermano. El hermano está en Ceuta. Pero
> para dar la muestra tiene que identificarse ante una autoridad española, y en
> cuanto diga su nombre en un edificio oficial se le incoa expediente de expulsión
> automático. **El precio de darle un nombre a su hermano es perder el suyo.** No
> es una trampa ni un fallo: es un precio, está a la vista y cualquiera puede
> pagarlo. La detención del cap 82 deja de ser un error policial y pasa a ser **una
> decisión de Yassin**, que es infinitamente mejor.

**055 · Anuar VI · [ANUAR] · 950.** La foto de carné. Las cuatro copias. *Giro.*

**056 · Julia y Driss · [2026] · 2.000.** Elena entiende hasta dónde ha llegado su
hija y calla otra vez. *Silencio.*

**057 · La periodista · [2026] · 2.000.** Una reportera de un diario nacional.
Elena decide no hablar. *Gancho.*

**058 · Certificado de defunción de un desconocido · [2026] · 1.800.** El papel que
sí se puede firmar. Es poco y es lo primero. *Silencio.*

**059 · Voz: Robles · [VOZ] · 1.400.** La única primera persona del comisario.
Febrero de 2014, el Tarajal. **No pide perdón ni se justifica.** *Silencio.*

**060 · La reunión · [2026] · 2.300.** La delegada, Robles y Elena. Tres personas
decentes tomando una decisión indecente. *Gancho.*

**061 · Los dos veranos · [2017]+[2026] · 2.800.** **Donde se tocan las líneas.**
Montaje alterno: 4 de agosto de 2017 y 4 de octubre de 2026, la misma sala, la misma
silla, la misma pregunta. *Giro.*

**062 · Anuar V · [ANUAR] · 1.000.** El taller de Hamid. El primer sueldo.
*Silencio.*

**063 · Septiembre de 2017 · [2017] · 2.200.** El día que Elena supo que se había
equivocado y decidió no hacer nada. La escena más difícil del libro. *Silencio.*

**064 · Milagros · [2026] · 1.700.** La madre, un día bueno. Dice el nombre de su
hija una vez y vuelve a irse. *Silencio.*

**065 · Cifuentes vuelve · [2026] · 2.200.** Elena le cuenta por fin lo del papel
del bolsillo. La perito de Cádiz cambia de bando sin cambiar de informe. *Gancho.*

**066 · Los que quedan · [2026] · 1.900.** Ceuta cuando se van las cámaras.
*Silencio.*

**067 · Vísperas · [2026] · 2.000.** La noche antes de la comparecencia. Elena
prepara lo que va a decir y escribe tres versiones. *Gancho.*

**068 · La filtración · [2026] · 2.200.** 20 de octubre. Antes de entrar a
declarar, su nombre está en un diario nacional: la forense que declaró adultos a
cuarenta y tres menores. Todo cierto. *Gancho. Fin Parte III.*

## PARTE IV — LA CIUDAD SITIADA (69-98) · octubre – noviembre · ~53.000

> **Reloj de la parte:** la prisión provisional de Yassin, acordada en el 83 con un
> plazo que vence en el 98.

> **Corrección obligatoria de la Parte IV (informe `editorial-03.md`).** Tres cosas
> que esta parte tiene que ejecutar y que no son opcionales:
> 1. **El thriller vuelve como amenaza, no como investigación.** Las dos horas sin
>    vigilancia y la fibra azul siguen en un expediente vivo. El lector no necesita
>    que Elena busque a un asesino: necesita ver cómo el aparato, funcionando
>    correctamente, construye un culpable equivocado con las pruebas que ella misma
>    produjo. La soga se cierra sobre Yassin desde el 69.
> 2. **Alguien que no tiene razón.** Ocho interlocutores razonables seguidos han
>    anestesiado el libro. Hace falta hostilidad sin argumento, un compañero que la
>    esquive, y una escena en la que Elena se porte mal a secas.
> 3. **Julia y Driss juntos, en presente, delante del lector, antes del 76.** Si no
>    se les ha visto nunca en la misma habitación, la detención no duele.
>
> **Nota de cronología:** el 10 de noviembre es la comparecencia de la *información
> reservada*, donde Elena cuenta los cuarenta y tres. La del cap 103 es posterior y
> distinta: la del expediente disciplinario ya incoado, donde entrega la versión C.

**069 · Diez de noviembre · [2026] · 2.600.** La comparecencia. Sanchidrián, un
instructor correcto con el periódico encima de la mesa. Elena cuenta los cuarenta y
tres y no cuenta nada más. Termina **en mitad de un párrafo**, sin frase de remate.
*Silencio.*

**070 · Ochenta y tres mil vecinos · [2026] · 2.100.** Ser señalada en una ciudad
donde todos se conocen. La panadería, el gimnasio, un compañero que cambia de
pasillo. Aquí va la hostilidad sin argumento. *Silencio.*

**071 · Anuar IV · [ANUAR] · 1.000.** La madre le corta el pelo en el escalón.
*Silencio.*

**072 · Los que la defienden · [2026] · 2.200.** Fredo, Chaimae, Bernal y —sorpresa—
Rueda. Los aliados que a Elena le habría gustado no tener. Y la primera vuelta de
tuerca sobre Yassin: Cañete trae lo que le han pedido desde arriba. *Giro.*

**073 · Julia y Driss · [2026] · 2.300.** **La escena que el informe editorial exige
y que no puede faltar.** Los dos juntos, en presente, delante del lector, en el piso
de la calle Sargento Coriat, la víspera de la entrevista de filiación. Elena los ve
por primera vez en la misma habitación. *Silencio.*

**074 · Voz: Yassin II · [VOZ] · 1.300.** Nueve años de Europa en página y media:
Almería, Perpiñán, un invernadero, una furgoneta, dos fronteras. *Giro.*

**075 · Octubre de 2017 · [2017] · 2.000.** Lo que hizo Elena el otoño de 2017:
nada, con método. *Silencio.*

**076 · Detenida · [2026] · 2.500.** Julia, por favorecimiento y ocultación. La madre
forense en el pasillo de una comisaría. *Gancho.*

**077 · Gonzalo · [2026] · 2.100.** El exmarido llega con un abogado bueno y veinte
años de reproches por gastar. *Gancho.*

**078 · El altillo · [2026] · 1.900.** Elena baja la caja. La radiografía de Driss
lleva cuarenta y cinco días ahí. *Giro.*

> **BISAGRA DEL ÚLTIMO TERCIO, establecida en el 78.** En la radiografía ilegal de
> Driss, tomada el 18-VIII y guardada cuatro meses en el altillo, hay en el borde de
> la placa —en la zona que no se mira cuando se busca una edad— una **fractura por
> avulsión de la apófisis estiloides del cúbito izquierdo en consolidación**, de dos
> a cuatro semanas de evolución, es decir, del 21 de julio al 4 de agosto. Es la
> lesión que deja un cabo de polipropileno enrollado en la muñeca cuando vuelca un
> bidón de doscientos litros. Elena la miró dieciocho minutos en agosto y no la vio
> **porque estaba buscando una edad**: el tema del libro entregado como giro de
> trama.
>
> Lo que el 78 da: el mecanismo (el bidón, el cabo, Driss debajo del agua).
> Lo que el 78 NO da: que la persona a la que Driss se subió fuera Anuar. Eso sigue
> siendo el trabajo de los capítulos **091-093** (la marea, la reconstrucción, el
> antebrazo), que ahora no revelan el mecanismo sino que **cierran la identidad**.
> Y la placa es ilegal, así que probarlo la destruye a ella y a Chelo: ese es el
> conflicto de los capítulos 081 y 097-098.

**079 · Anuar III · [ANUAR] · 1.000.** Seis años. El hermano se va a España y él no
entiende por qué llora su madre. *Silencio.*

**080 · La declaración de Driss · [2026] · 2.400.** El chico miente. Y miente mal.
*Giro.*

**081 · Chelo · [2026] · 1.800.** La técnica de Rayos, veintidós años de carrera y un
disparo con su número. Elena tiene que decidir si la quema. *Gancho.*

**082 · Yassin detenido · [2026] · 2.300.** Manipulación de cadáver y sospechoso de
homicidio: la falsa pista que construyó la propia Elena al escribir *homicida*.
*Gancho.*

**083 · Prisión provisional · [2026] · 2.000.** El auto. El reloj de la parte.
*Gancho.*

**084 · Lo que sé y no puedo probar · [2026] · 2.000.** *Gancho.*

**085 · Chaimae en el juzgado · [2026] · 2.100.** Traduce una declaración y descubre
que traducir es elegir. *Silencio.*

**086 · Voz: Bernal · [VOZ] · 1.200.** Veinte años devolviendo cordones. Por qué
apunta. *Silencio.*

**087 · Berenguer trabaja · [2026] · 2.100.** El abogado hace lo que sabe hacer y
casi le sale. *Gancho.*

**088 · Dos años de margen · [2026] · 2.300.** La delegada le ofrece una salida
limpia a cambio de un informe tibio: la misma oferta de 2017 con otras palabras nueve
años después. *Giro.*

**089 · Anuar II bis · [ANUAR] · 1.000.** La última noche en casa. *Silencio.*

**090 · Padilla · [2026] · 1.900.** El forense joven firma solo, sin ella, un informe
por debajo de dieciséis. El primero en nueve años. *Giro.*

**091 · La marea · [2026] · 2.200.** Elena reconstruye la noche del 30 de julio con
las tablas de marea, la temperatura del agua y las horas de la malla. *Gancho.*

**092 · La reconstrucción · [2026] · 2.500.** Vuelve al espigón a la hora exacta, con
Cañete y un cronómetro. *Gancho.*

**093 · El antebrazo · [2026] · 2.400.** **LA REVELACIÓN.** No hubo estrangulador:
hubo un chaval de dieciséis que no sabía nadar y se agarró a lo primero. El hioides
partido es verdad y la historia que Elena construyó con él es falsa. Exactamente lo
que lleva veintitrés años haciendo con las muñecas. *Giro.*

**094 · Cifuentes tenía razón · [2026] · 2.200.** Elena llama a Cádiz y se lo cuenta
todo, incluida la placa ilegal. Cifuentes le da el veredicto profesional y **la salida
que Elena no había visto: no hace falta la placa de agosto.** Un callo de fractura
sigue viéndose siete meses después; basta una radiografía nueva, legal, con
indicación y consentimiento. Eso salva a Chelo. Y mete a Driss en el expediente.
*Gancho.*

**095 · Rachida · [2026] · 2.000.** Videollamada de cuarenta minutos con Beni Mellal,
con Chaimae de puente. La madre pregunta lo único que importa y no es lo que Elena
esperaba. *Silencio.*

**096 · La visita · [2026] · 2.600.** **El capítulo moral del último acto.** Elena va
al centro penitenciario y le pone a Yassin la elección delante: salir libre y en un
barco, o quedarse preso hasta el señalamiento del Registro. No decide ella. Decide
él, y decide sabiendo todo. *Silencio.*

**097 · Lo que cuesta · [2026] · 2.000.** Chelo, Driss, Julia. Las tres facturas que
Elena no puede pagar con su propio dinero. *Gancho.*

**098 · La decisión · [2026] · 2.200.** La toma. *Giro. Fin Parte IV.*

## PARTE V — EL NOMBRE (99-125) · noviembre – febrero · ~48.000

**099 · Informe rectificativo · [2026] · 2.400.** Escribirlo. Cada línea le cuesta
algo. *Gancho.*

**100 · Driss · [2026] · 2.200.** Elena y el chico, solos. No se siente aliviado: se
siente culpable por primera vez. *Silencio.*

**101 · Anuar II · [ANUAR] · 1.100.** El día que decidió irse. *Giro.*

**102 · Yassin libre · [2026] · 1.900.** Salir de un calabozo no es lo mismo que
salir. *Silencio.*

**103 · La comparecencia · [2026] · 2.800.** Elena declara los cuarenta y tres de
2017 ante el instructor. Nadie se lo ha pedido. Se hunde sola. *Gancho.*

**104 · Robles, la última vez · [2026] · 2.500.** Sale el Tarajal de 2014, entre
ellos dos y en ningún acta. Ninguno convence al otro y ninguno miente. *Silencio.*

**105 · El precio de Julia · [2026] · 2.100.** Archivo con condiciones. Se va a
Granada. Lo que se rompe no se arregla en este libro. *Silencio.*

**106 · Anuar I bis · [ANUAR] · 950.** Los zapatos en la piedra. *Giro.*

**107 · Rueda · [2026] · 2.000.** El maestro se muere en Benzú sin arrepentirse de
nada y sabiéndolo todo. Quién se queda con el perro. *Silencio.*

**108 · La caja debajo de la ventana · [2026] · 2.000.** Los cuarenta y tres
expedientes vuelven. *Giro.*

**109 · Cuarenta y dos cartas · [2026] · 2.300.** Elena escribe a todos. Consigue
tres respuestas: un insulto, un silencio y la foto de una boda. *Giro.*

**110 · Milagros · [2026] · 1.700.** *Silencio.*

**111 · La exhumación · [2026] · 2.400.** Lo que hay que mover para cambiar un
número por un nombre. *Gancho.*

**112 · Once meses menos un día · [2026] · 2.200.** La comisión rogatoria llega. O
no llega y se resuelve por otra vía. *Giro.*

**113 · Registro Civil · [2026] · 2.300.** 20 de diciembre. La inscripción. Anuar El
Founti, nacido en Beni Mellal, muerto en Ceuta el 30 de julio de 2026. Catorce años.
Con nombre. *Silencio.*

**114 · La lápida · [2026] · 1.800.** Sidi Embarek. Cuatro personas y un albañil.
*Silencio.*

**115 · Voz: Yassin III · [VOZ] · 1.300.** Se va. No la perdona y tampoco la condena:
le da las gracias, que es peor. *Giro.*

**116 · Nochevieja · [2026] · 1.800.** *Silencio.*

**117 · La resolución · [2027] · 2.200.** El expediente disciplinario se resuelve.
Sanción y readmisión. *Gancho.*

**118 · Voz: Chaimae II · [VOZ] · 1.200.** Aprobó la oposición. *Silencio.*

**119 · Enero · [2026] · 2.000.** Elena vuelve al Instituto. Todo sigue igual. Ese es
el horror y la única esperanza posible. *Silencio.*

**120 · El informe que nadie leyó · [2026] · 2.000.** Los cuatro folios de agosto
aparecen citados en un sitio inesperado. *Giro.*

**121 · Padilla se va · [2026] · 1.800.** El forense joven pide traslado. Lo que le
dice a Elena al despedirse. *Silencio.*

**122 · Un chico de la cola · [2026] · 2.100.** Un chaval nuevo en la sala de
exploración. Muñeca izquierda. El atlas de Cleveland abierto por la misma página de
siempre. *Gancho.*

**123 · La firma · [2026] · 1.900.** Elena escribe, por primera vez en veintitrés
años: *No es posible determinar la edad de este niño.* Y como el Estado no puede
contarlo, tendrá que presumir que es menor. Una sola firma. No salva al mundo: salva
a uno. *Giro.*

**124 · Febrero · [2027] · 1.600.** El epílogo de Elena. Corto. *Silencio.*

**125 · Anuar I · [ANUAR] · 1.400.** Beni Mellal, la mañana que se fue. Hace sol. Su
madre le ha hecho pan. Va contento. **No sabe nada de lo que sabe el lector.** Última
imagen del libro. *Silencio.*

---

## Prohibiciones de esta arquitectura

- Ningún capítulo puede existir solo para informar. Si un capítulo no cambia nada, se
  corta.
- Ningún personaje puede tener un solo argumento. Robles gana dos discusiones; la
  delegada, una; Trujillo, la del pabellón.
- Nadie explica el tema en voz alta. Si un personaje dice «esto va de decidir quién es
  un niño», se borra la frase.
- Ningún chaval es un símbolo. Todos tienen nombre, pueblo, oficio y manías.
- Ningún documento incrustado sin una grieta. Si el acta es impecable, no vale.
- El final no consuela. Elena no arregla el sistema: firma un papel.

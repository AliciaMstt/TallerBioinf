# TallerBioinf
Taller práctico de bioinformática Posgrado en Ciencias Biológicas UNAM

**Profesorxs:** 

[Dra. Alicia Mastretta Yanes](http://mastrettayanes-lab.org/)

[Dra. Camille Truong](https://camilletruong.wixsite.com/home#!)

Bíol. Marisol Navarro

Martes y jueves de **8 a 11 am**. En línea.

## Objetivos

Que los y las estudiantes solucionen problemas bioinformáticos para el análisis de datos de secuenciación masiva de sus proyectos, a través de la revisión colaborativa de su código y de discusión teórico-práctica de los métodos relevantes para cada problema. De tal forma que:

  *	Organicen y documenten su proyecto bioinformático bajo los principios de la reproducibilidad de la ciencia
  * Conozcan, comprendan y discutan los métodos (y sus parámetros) utilizados en análisis bioinformáticos relevantes a su proyecto
  *	Obtengan ayuda de las profesoras y del resto de estudiantes para solucionar los problemas y dudas bioinformáticas que surgen al analizar datos propios
  *	Obtengan y brinden retroalimentación con otro/as estudiantes de la clase de sus análisis y scripts
  
## Pre-requisitios

  * Haber concluido exitosamente un curso de bioinformática que cubra bash y R o python, o comprobar aptitudes bioinformáticas nivel medio (haber hecho scripts propios, poder leer y adaptar scripts de otros, navegar con fluidez por un sistema de archivos utilizando la línea de comando).
  * Tener datos de secuenciación masiva propios al inicio del curso.
  
Por favor nota que este **no** es un curso introductorio a la bioinformática, por lo que si no tienes cubierto un nivel básico en el manejo de línea de comando, te será difícil seguir las clases y aprovechar realmente el curso. 

## Temario 

#### Unidad 1 Reproducibilidad y documentación de análisis bioinformáticos (horas: teóricas 2, prácticas 1)
1.1.	La crisis de la reproducibilidad y herramientas para combatirla

1.2.	Documentación 

1.3.	Organización de directorios y datos

1.4.	Organización de scripts 

1.5.	Control de versiones con git

1.6.	Introducción a Github 

1.7. Introducción a repli.it

#### Unidad 2 Mejores prácticas al escribir y documentar scripts (horas: teóricas 2, prácticas 1)
2.1. Principios de diseño de software (SOLID, DRY, KISS, POLA, YAGNI, POLP)

2.2. Principios de Agile Project management

2.3. Working directory y rutas relativas

2.4. Uso de variables 

2.5. Cuando sí, cuando no y cómo usar for loops

2.6. Trucos en la terminal y el editor de texto

2.7. Recomendaciones misceláneas 

#### Unidad 3 Discusión de métodos bioinformáticos aplicados a distintos tipos de datos (horas: teóricas 8, prácticas 8)
3.1. Evaluación de la calidad, limpieza de datos y demultiplexeo

3.2. Secuenciación reducida de genomas (eg. RAD, GBS)

3.3. Genomas completos

3.4. Metabarcoding

3.5. Transcriptomas

#### Unidad 4 Revisión colaborativa de código bioinformático (horas: teóricas 2, prácticas 40)
4.1. Planteamiento de un proyectos bioinformáticos

4.2. Github para manejar proyectos bioinformáticos

4.3. Revisión colaborativa de análisis bioinformáticos de los proyectos de los y las estudiantes


## Dinámica de clase y evaluación

* 5% **Exposición de su proyecto con enfoque en la parte bioinformática** La exposición se debe hacer en inglés.

* 5% **Planteamiento y exposición de su proyecto como un Repositorio y un Proyecto de Github subdividido en tareas** Los tasks, documentación e issues deben ser en inglés.

* 30% **Presentación en clase de un problema(s) bioinformático que no hayan podido resolver o del que tengan dudas**. Puede ser desde solicitar ayuda para realizar un loop sencillo hasta cómo elegir de manera óptima los parámetros de cierto proceso bioinformático (limpieza, ensamblado, etc). La presentación debe incluir: breves antecedentes, descripción del problema dentro de un issue(s) de Github, output esperado, scripts y outputs intentados hasta el momento. Las sesiones de presentaciones de pregunta incluyen un segmento para presentaciones calendarizadas por estudiante, y un segmento para presentaciones de problemas emergentes. Cada estudiante deberá presentar al menos 3 problemas calendarizados.

Dinámica de retroalimantación:

for i in estudiante_a estudiante_b estudiante_c; do
1.- Exposición del issue por resolver (10 minutos máximo)
2.- Retroalimentación general (3 minutos)
done
;
3. Retroalimentación por equípos:
  Formamos equipos para cada issue (por afinidad de tema, interés, por que "tengo la solución" etc... (mínimo 2 personas))

return
4.- La solución o avances se comentan en el issue de cada git

* 15% **Retroalimentación a los problemas de otros en clase**. Participación en clase en la sección de comentarios después de las presentaciones de otros.

* 15% **Retroalimentación al código de otros**. Mediante comentarios en la clase, en comentarios a los issues de Github y pull requests en Github con propuestas de soluciones.

* 10% **Seminario de tópico metodológico.** Preparación, exposición y discusión de tópicos metodológicos. La exposición del seminario debe ser en inglés.

* 20% **Evaluación final del repositorio** Dos fechas de revisión: 30 de octubre (se hacen comentarios) y 20 de noviembre (entrega final con comentarios resueltos).

La calificación final del repositorio toma en cuenta:

* 10% Organización del repositorio
* 15% README **(debe ser en inglés)**
* 15% Análisis
* 15% Resumen y discusión en formato Markdown 
* 15% Gráfica(s) en R
* 15% Scripts **deben estar comentados en inglés**
* 15% Avances, organización y respuesta a comentarios en el proyecto de Github **en inglés**




## Calendario

* M22 Septiembre: Bienvenida y Unidad 1 (1.1-1.4)
* J24 Septiembre: Unidad 1 continuación (1.5, 1.6: git y github)
* M29 Septiembre: 1/2 clase presentación lighting talk proyectos, 1/2 clase Unidad 2 (basics)
* J01 Octubre: 1/2 clase presentación lighting talk proyectos, 1/2 clase Unidad 2 (loops)
* M06 Octubre: Unidad 2 (trucos en terminal y editores de texto), Unidad 4.1. Planteamiento de un proyecto bioinformático
* J08 Octubre: Unidad 4 continuación (Github para manejar proyectos bioinformáticos)
* M13 Octubre: 1/2 clase Unidad 2 (Funciones de R), 1/2 clase Presentación y retroalimentación de sus reposotorios y proyectos bioinformáticos en Github
* J15 Octubre: Presentación y retroalimentación de sus Reposotorios y Proyectos Bioinformáticos en Github
* M20 Octubre: Clase (exposición profes) de tópico Unidad 3 (Evaluación de Calidad)
* J22 Octubre: Presentación/retroalimentación de problemas de estudiantes
* M27 Octubre: Clase (exposición profes) de tópico Unidad 3 (Ensamblado de genomas de novo)
* J29 Octubre: Presentación/retroalimentación de problemas de estudiantes
* M03 Noviembre: Clase (exposición profes) de tópico Unidad 3 (Anotación de genomas)
* J05 Noviembre: Presentación/retroalimentación de problemas de estudiantes
* M10 Noviembre: Clase (exposición profes) de tópico Unidad 3 (por elegir)
* J12 Noviembre: Presentación/retroalimentación de problemas de estudiantes
* M17 Noviembre: Presentación/retroalimentación de problemas de estudiantes
* J19 Noviembre: Presentación/retroalimentación de problemas de estudiantes
* M24 Noviembre: Clase (exposición profes) de tópico Unidad 3 (por elegir)
* J26 Noviembre: Presentación/retroalimentación de problemas de estudiantes
* M01 Diciembre: Seminario (estudiantes) de tópico metodológico.
* J03 Diciembre: Presentación/retroalimentación de problemas de estudiantes
* M08 Diciembre: Seminario (estudiantes) de tópico metodológico.
* J10 Diciembre: Presentación/retroalimentación de problemas de estudiantes
* M05 Enero: Seminario (estudiantes) de tópico metodológico | Primera entrega de Repositorio
* J07 Enero: Presentación/retroalimentación de problemas de estudiantes 
* M12 Enero: Seminario (estudiantes) de tópico metodológico.
* J14  Enero: Presentación/retroalimentación de problemas de estudiantes
* M19  Enero: Presentación/retroalimentación de problemas de estudiantes
* M21 Enero: Presentación/retroalimentación de problemas de estudiantes
* M26 - J28 Enero: Preguntas y resolución de problemas | Entrega final de Repositorio

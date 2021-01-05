# TallerBioinf
Taller práctico de bioinformática Posgrado en Ciencias Biológicas UNAM

**Profesorxs:**

[Dra. Alicia Mastretta Yanes](http://mastrettayanes-lab.org/)

[Dra. Camille Truong](https://camilletruong.wixsite.com/home#!)

Biol. Marisol Navarro Miranda

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

1.7.  Introducción a repl.it

#### Unidad 2 Mejores prácticas al escribir y documentar scripts (horas: teóricas 2, prácticas 1)
2.1. Principios de diseño de software (SOLID, DRY, KISS, POLA, YAGNI, POLP)

2.2. Working directory y rutas relativas

2.3. Uso de variables

2.4. Cuando sí, cuando no y cómo usar for loops

2.5. Trucos en la terminal y el editor de texto

2.6. Funciones en R

#### Unidad 3 Discusión de métodos bioinformáticos aplicados a distintos tipos de datos (horas: teóricas 8, prácticas 8)

3.1. Docker

3.2. Seminarios temáticos que se decidieran con base en los proyectos de lxs estudiantes.

#### Unidad 4 Revisión colaborativa de código bioinformático (horas: teóricas 2, prácticas 40)


4.1. Organización de proyectos bioinformáticos en un repositorio

4.2. Github para manejar proyectos bioinformáticos

4.3. Principios de Agile Project Management

4.4. Revisión colaborativa de análisis bioinformáticos de los proyectos de los y las estudiantes


## Dinámica de clase y evaluación

* 5% **Exposición de su proyecto con enfoque en la parte bioinformática** La exposición se debe hacer en inglés.

* 5% **Planteamiento y exposición de su proyecto como un Repositorio y un Proyecto de Github subdividido en tareas** Los tasks, documentación e issues deben ser en inglés.

* 30% **Presentación en clase de un problema(s) bioinformático que no hayan podido resolver o del que tengan dudas**. Puede ser desde solicitar ayuda para realizar un loop sencillo hasta cómo elegir de manera óptima los parámetros de cierto proceso bioinformático (limpieza, ensamblado, etc). La presentación debe incluir: breves antecedentes, descripción del problema dentro de un issue(s) de Github, output esperado, scripts y outputs intentados hasta el momento. Las sesiones de presentaciones de pregunta incluyen un segmento para presentaciones calendarizadas por estudiante, y un segmento para presentaciones de problemas emergentes. Cada estudiante deberá presentar al menos 3 problemas calendarizados.

Dinámica de retroalimentación:

for i in estudiante_a estudiante_b estudiante_c; do
1.- Exposición del issue por resolver (10 minutos máximo)
2.- Retroalimentación general (3 minutos)
done
;
3. Retroalimentación por equipos:
  Formamos equipos para cada issue (por afinidad de tema, interés, por que "tengo la solución" etc... (mínimo 2 personas))

return
4.- La solución o avances se comentan en el issue de cada git

* 15% **Retroalimentación a los problemas de otros en clase**. Participación en clase en la sección de comentarios después de las presentaciones de otros.

* 15% **Retroalimentación al código de otros**. Mediante comentarios en la clase, en comentarios a los issues de Github y pull requests en Github con propuestas de soluciones.

* 10% **Seminario de tópico metodológico.** Preparación, exposición y discusión de tópicos metodológicos. La exposición del seminario debe ser en inglés.

* 20% **Evaluación final del repositorio** Dos fechas de revisión: 05 enero (se hacen comentarios) y 28 de enero (entrega final con comentarios resueltos).

La calificación final del repositorio toma en cuenta:

* 10% Organización del repositorio
* 15% README **(debe ser en inglés)**
* 15% Análisis
* 15% Resumen y discusión en formato Markdown
* 15% Gráfica(s) en R
* 15% Scripts **deben estar comentados en inglés**
* 15% Avances, organización y respuesta a comentarios en el proyecto de Github **en inglés**

## Calendario

Día | Mes | Actividad
--- | --- | ---
Martes 22 | Septiembre | Bienvenida y Unidad 1 (1.1-1.4)
Jueves 24 | Septiembre | Unidad 1 continuación (1.5, 1.6: git y github)
Martes 29 | Septiembre | 1/2 clase presentación lighting talk proyectos, 1/2 clase Unidad 1.7 (repl.it)
Jueves 01 | Octubre | 1/2 clase presentación lighting talk proyectos, 1/2 clase Unidad 2 (2.1-2.2)
Martes 06 | Octubre | Unidad 2.3-2.6 (variables, loops y otros trucos en terminal)
Jueves 08 | Octubre | Unidad 4.1-4.3
Martes 13 | Octubre | Unidad 2.7 (Funciones de R)
Jueves 15 | Octubre | Presentación y retroalimentación de sus Repositorios y Proyectos Bioinformáticos en Github y pruebas de repli.it con sus propios repositorios (6 estudiantes)
Martes 20 | Octubre | Presentación y retroalimentación de sus Repositorios y Proyectos Bioinformáticos en Github y pruebas de repli.it con sus propios repositorios (6 estudiantes)
Jueves 22 | Octubre | Clase (exposición profes) de tópico Unidad 3 (Variantes esctructurales y genómica comparada)
Martes 27 | Octubre | Presentación/retroalimentación de problemas de estudiantes
Jueves 29 | Octubre | Seminario (estudiantes) de tópico metodológico.
Martes 03 | Noviembre | Presentación/retroalimentación de problemas de estudiantes
Jueves 05 | Noviembre | Seminario (estudiantes) de tópico metodológico.
Martes 10 | Noviembre | Presentación/retroalimentación de problemas de estudiantes
Jueves 12 | Noviembre | Seminario (estudiantes) de tópico metodológico.
Martes 17 | Noviembre | Presentación/retroalimentación de problemas de estudiantes
Jueves 19 | Noviembre | Clase (exposición profes) de tópico Unidad 3 (Outliers)
Martes 24 | Noviembre | Seminario (estudiantes) de tópico metodológico, recap de issues (round 1) 
Jueves 26 | Noviembre | Clase (exposición profes) de tópico Unidad 3 (Expresión diferencial)
Martes 01 | Diciembre | Presentación/retroalimentación de problemas de estudiantes
Jueves 03 | Diciembre | Clase (exposición profes) de tópico Unidad 3 (Haplotypos en metabarcoding)
Martes 08 | Diciembre | Presentación/retroalimentación de problemas de estudiantes
Jueves 10 | Diciembre | Participación en el congreso [MexPopGen5](https://mexpopgen.wordpress.com/)
Martes 05 | Enero | Presentación/retroalimentación de problemas de estudiantes
Jueves 07 | Enero | Presentación y **primera entrega de Repositorios** (12 estudiantes)
Martes 12 | Enero | Presentación/retroalimentación de problemas de estudiantes
Jueves 14 | Enero | Presentación/retroalimentación de problemas de estudiantes
Martes 19 | Enero | Presentación/retroalimentación de problemas de estudiantes
Martes 21 | Enero | Presentación/retroalimentación de problemas de estudiantes
Martes 26 - Jueves 28 | Enero | Preguntas y resolución de problemas y **Entrega final de Repositorio** | 

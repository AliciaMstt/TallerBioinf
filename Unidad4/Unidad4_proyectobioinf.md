# Unidad 4: Organización de un proyecto bioinformático



## Organización de proyectos bioinformáticos en un repositorio

Recordemos lo ya mencionado en clases previas:

Un repositorio bioinformático consiste en los datos crudos, datos procesados, scripts y documentación  necesarios para reproducir los análisis realizados. Es decir en todo lo que al final debes subir a un repositorio como [Dryad](https://www.datadryad.org/pages/organization) (aunque los datos pueden conectarse desde otros repos, como [SRA](https://www.ncbi.nlm.nih.gov/sra), claro). 

### Organización de directorios

Un repositorio bioinformático debe tener su propio **directorio** (carpeta) y contener en subdirectorios todo lo necesario para realizarlo.

El directorio del proyecto debe dividirse a su vez, lo recomendable es que sea en **subdirectorios** parecidos a los siguientes:

* **data**, contiene los datos, también puede tener otros nombres como *genetic* para datos genéticos y *spatial* para datos espaciales. Los datos genéticos pueden dividierse a su vez en subdirectorios como *raw*, *filtered*, *genotypes*, *data_in*, *data_out* de modo que los datos crudos estén en un directorio y los modificados por análisis subsecuentes en otros directorios. El punto es tener uno o más directorios donde estén todos los datos.  

* **meta**, **info** o **docs** donde puedes guardar todos los metadatos, como un archivo cvs detallando información de cada una de las muestras. Si lo prefieres este archivo puede ir dentro del directorio de datos sin necesidad de hacer la carpeta *meta*. También es posible guardar aquí cualquier otro documento necesario para procesar los datos.
  
* **bin** o **scripts**, donde guardas todos los scripts necesarios para correr el análisis de principio a fin. Este es un directorio obligatorio. Esta es la carpeta más difícil de documentar.

* **figures**, opcionalmente, puedes poner aquí el código que se utilice sólo para hacer las figuras de una publicación dada. Es como un extracto de *bin* dedicado solo a esto.

* **archive** este directorio NO se sube al repositorio, pero es bueno tenerlo para ir poniendo ahí scripts y resultados que crees no necesitar más pero que es bueno no borrar por completo.

También es posible tener un directorio para cada subanálisis concreto, por ejemplo uno para *stacks* y otro para *admixture*, pero dentro de cada uno de ellos subdirectorios como los anteriores. 

Independientemente del nombre que escojamos para los directorios y archivos, qué es qué y dónde está cada cosa debe ir explicado en un **README**.

Para ver un ejemplo de un repositorio organizado así, baja la sección **Data and scripts for population genomics and SDM** de [este repo de Dryad](https://www.datadryad.org/resource/doi:10.5061/dryad.f7248) (El archivo que se llama ++PopGenomicsIBR.zip++).


### Documentación de scripts y del proyecto

**Documentar** permite que otrxs entiendan qué hace cada parte de nuestro código y cómo. Un proyecto bien documentado incluye:

* **Código comentado y organizado en scripts** 

* **README** 


#### README
	* "Leeme".
	* Un archivo de texto (no Word, pero puede ser MarkDown) que detalla:
   * **Qué hay** dentro del repositorio (y cada uno de sus directorios).
   * **Qué hacen** cada una de las funciones/scripts del repositorio
   * **Cómo y en qué órden** deben ocuparse los scripts para realizar los análisis
* Ejemplo:
    * [Este](https://datadryad.org/resource/doi:10.5061/dryad.f7248) repositorio de datos está dividido en varias secciones. El README de última sección "Data and scripts for population genomics and SDM" se ve así: [README_ejemplo](README_ejemplo.md).

    

**Ejercicio**: baja el archivo zip (los datos y scripts) asociados al README anterior y compáralo con el README. Responde:

* ¿Puedes encontrar los datos que ocupa para correr cada script? 
* Brinda un ejemplo de rutas relativas
* Encuentra un ejemplo de for loops que utilice varios comandos y variables dentro de un loop.

    

## Manejo de proyectos e issues en Github

Como hemos visto GitHub te permite llevar un control de versiones, es decir, llevar un registro de los cambios que se realizan sobre un análisis informático, particularmente sobre las modificaciones a los scripts.

Github además permite organizar proyectos con un sistema de asignación "tareas por hacer" que se pueden asignar a un usuario de forma colaborativa, o a una misma para mantener un proyecto propio sin perderse.

Puedes generar tareas ("cards") y páneles de estado (Pendientes, En Proceso, Terminadas, por ejmemplo). Lueg puedes arrastraslas de un panel a otro según vayas progresando.

![](github_projec.png)


Los proyectos solo los podemos ver si es nuestro repositorio o si estamos agregados como colaboradorxs en ellos. Para agregar a un colaborador ve la pestaña "Settings" (arriba derecha) y luego a "Collaborators" en el menú de la izquierda. Debes buscar a quien quieras agregar por su nombre de usuario en Github. El usuario debe aceptar la invitación para unirse formalmente al proyecto.

![](github_add_collaborator.png)

Las tareas ("cards") de un proyecto pueden quedarse como tareas simplemente, o volverse un **issue**. Los issues permiten delimitar una tarea que debe atenderse (por ejemplo un bug, una modalidad nueva deseada, etc) pero cuya solución además requiere discusión. Cada issue tiene asociado entonces una conversación. Tanto los issues como sus conversaciones asociadas son públicos, pues permiten al público saber, por ejemplo, que el problema existe y en qué va su solución.

![](github_issues.png)

  
#### ¿Cómo escribir un buen issue?


Sigue la guía: [How do I ask a good question? de Stackoverflow](https://stackoverflow.com/help/how-to-ask)  

**Ejercicio:** Crea un proyecto dentro de tu repositorio de Github

## Repositorio y proyecto del curso en Github

Como parte del curso debes iniciar (o traducir los avances que tengas) **un repositorio** de tu trabajo en Github y además hacer **un proyecto** de Github en el que dividas las tareas que tienes pendientes para concluir tus análisis. Este es el método que utilizaremos para ver, comentar y evaluar tus avances.

**Ejercicio** Agrega un link al repositorio de tu proyecto en [listado_estudiantes.txt](https://github.com/AliciaMstt/TallerBioinf/blob/master/Unidad1/listado_estudiantes.txt). Recuerda tienes que hacer un pull request para esto. **Si no hay un link tu repositorio en este listado, este NO será evaluado**.

La calificación final del repositorio (20% calif del curso) toma en cuenta:

* 10% Organización del repositorio
* 15% README **(debe ser en inglés)**
* 15% Análisis
* 15% Resumen y discusión en formato Markdown 
* 15% Gráfica(s) en R
* 15% Scripts **deben estar comentados en inglés**
* 15% Avances, organización y respuesta a comentarios en el proyecto de Github **en inglés**

Además, para las próximas clases deberás hacer y exponer el **Planteamiento y exposición de tu proyecto como un Repositorio y un Proyecto de Github subdividido en tareas** Los tasks, documentación e issues deben ser en inglés. Puede aún estar incompleto en el entendido de que lo trabajarás durante el resto del curso, pero en tu exposición inicial ya debe estar el **esqueleto** de los directorios y un **borrador del README**.

## Retroalimentación al código de otros durante el curso

Utilizaremos el sistema de issues y comentarios de Github para hacer comentarios y sugerencias al código de los demás. Esto ocurrirá durante las sesiones de discusión, pero también durante tiempo fuera de clase. También es posible hacer cambios más complejos mediante pull requests.

Dudas que hemos resuelto:

Loops:
* [How to loop with two variables -bash (Melania)](https://github.com/Melcatus/genomic_cotton/issues/4)
* [Loop to aling pair-end reads  -bash (Fernanda)](https://github.com/FernandaDiaz12/pediatric_astrocytoma/issues/2)
* [Calculating the Q30 using a loop -bash (Rodolfo)](https://github.com/necrosnake91/Lung_cancer_transcriptome/issues/7)
* [Loop for mutation analyses -R (Héctor)](https://github.com/Martinez-Gregorio-Hector/workflow_to_analysis_WES/issues/9)
* [Loop in R to rename output tables (Tonio)](https://github.com/tono2204/Mezcal_Yeast_Populations/issues/4)
* [Loop to change file names based on a list -bash (Melisa)](https://github.com/almamelisa/Euphoniinae-Subfamily/issues/2)
* [Concatenating fastq files -bash (Rodolfo)](https://github.com/necrosnake91/Lung_cancer_transcriptome/issues/9)
* [Stacking of several files -bash (Héctor)](https://github.com/Martinez-Gregorio-Hector/workflow_to_analysis_WES/issues/11)

Funciones:
* [Create function to summarize mean and sd for all soil variables in R](https://github.com/bc-anaisabel/juniperus_paper/issues/12) Ana

BCFtools:
* [Convert vcf to fasta) Duhyadi](https://github.com/Duhyadi/Deleterious-alleles-in-landraces-of-maize/issues/1)

Parsear archivos output:
* [Extract table of ipyrad stats file -bash o R (Christian)](https://github.com/cristoichkov/GBS_Bioinf_Process_Mamm/issues/17)
* [Choose by gene labels](https://github.com/FernandaDiaz12/pediatric_astrocytoma/issues/5) 
* [Extract information from Trimmomatic stoutput and make a table](https://github.com/valeriafloral/Abies_fungal_endophytes/issues/16)(Valeria)

Simplificación de scripts:
* [ReEx in name files](https://github.com/valeriafloral/Abies_fungal_endophytes/issues/11)(Valeria)


Gráficas:
* [Code color in volcano plots - R (Laura) ](https://github.com/LauraMCE/lncRNA_BC/issues/8)
* [Using different scales in barplot simultaneously - R (Laura) ](https://github.com/LauraMCE/lncRNA_BC/issues/10)
* [Plot cophylogeny (Melisa)](https://github.com/almamelisa/Euphoniinae-Subfamily/issues/5)
* [BUSCO plot (Isaura)](https://github.com/IsauraRReinhold/Disocactus_transcriptome/issues/18)
* [adjust x-axis on barplots (Brett)](https://github.com/redgcko7/Coleonyx_elegans/issues/4)  
* [Adding sample ID's to admixture plot in R package 'pophelper' (Brett)](https://github.com/redgcko7/Coleonyx_elegans/issues/9)
* [How can I add color bar to heatmap?](https://github.com/arihelrnan/Endophyte_microbiome_Vanilla_planifolia/issues/7)  
* [SNA Plot: Associate color to its corresponding family (Ana)] (https://github.com/bc-anaisabel/juniperus_paper/issues/6)
* [Failed to assign color on PCA plot in R](https://github.com/NellyJazminPC/Qmacdougallii_genomics_and_environment/issues/12) Nelly



Phylogenies:
* [Table with tips of each node in a phylogenetic tree -R (Cristian)](https://github.com/cristoichkov/GBS_Bioinf_Process_Mamm/issues/22)

Descarga de Archivos:
* [Download fastq files (sequencing reads) with SRA toolkit fastq-dump but I want to know if the process concluded correctly (Toño)](https://github.com/tono2204/Mezcal_Yeast_Populations/issues/5)

Anotación
* [What database use to cotton genome annotation?](https://github.com/Melcatus/genomic_cotton/issues/9)(Melania)

Enrichment Analysis
* [Modify stadistic parameters to implement GSEA Analysis on DESEq results (Laura)](https://github.com/LauraMCE/lncRNA_BC/issues/15)

Markdown
* [Troubles with sublisting in Markdown (Laura)](https://github.com/LauraMCE/lncRNA_BC/issues/9)
* [Show html of rmd in github](https://github.com/NellyJazminPC/Qmacdougallii_genomics_and_environment/issues/4) Nelly
* [Delete second row view in gray (chr, int, dbl)](https://github.com/NellyJazminPC/Qmacdougallii_genomics_and_environment/issues/7) Nelly


Sotware en general:
* [I need helping to install some dependencies in perl to run vcf2maf.pl](https://github.com/Martinez-Gregorio-Hector/workflow_to_analysis_WES/issues/10)
* [Problems with the stacking of several files](https://github.com/Martinez-Gregorio-Hector/workflow_to_analysis_WES/issues/11)
* [Climate data - install packages in R 4.0.2 ERROR](https://github.com/NellyJazminPC/Qmacdougallii_genomics_and_environment/issues/5) Nelly
* [Error: "Caused by: java.lang.NumberFormatException: For input string: "2236602580""](https://github.com/bgrueda/WES_LUAD/issues/4) Bertha
* [Error in rbind with the function gradientForest from the package GradientForest in R](https://github.com/NellyJazminPC/Qmacdougallii_genomics_and_environment/issues/8) Nelly
* [Installation of SpiecEasi package in R studio](https://github.com/bc-anaisabel/juniperus_paper/issues/19) Ana  

Jupyter Notebooks:
* [Exporting images from Jupyter notebook](https://github.com/AlexLlanesQuevedo/santacruzi_project/issues/5)


Comparisons of microbiomes compositions:
* [Problems with colors in Heat_tree_matrix](https://github.com/arihelrnan/Endophyte_microbiome_Vanilla_planifolia/issues/4) Ariel


Differential Expression Analysis 

* [Define contrasts for DE](https://github.com/FernandaDiaz12/pediatric_astrocytoma/issues/6) 
* [which trimm program I have to choose?](https://github.com/IsauraRReinhold/Disocactus_transcriptome/issues/6) Isaura

Genome assembly
* [Difficulties to use databases running BLAST](https://github.com/JavierUrban/Genome-assembly-of-the-copepod-Leptodiaptomus/issues/3) Javier

Conditional and automated file management
* [Label and concatenation of genbank file from taxonomy ID](https://github.com/abelardoacm/ssDNA_viral_pangenomics/issues/2) Abelardo
* [Mash dist output transformation](https://github.com/abelardoacm/ssDNA_viral_pangenomics/issues/7) Abelardo

Extract mapped and unmapped reads with samtools
* [Count how many reads map to a reference](https://github.com/valeriafloral/Abies_fungal_endophytes/issues/10) Valeria

Duplicated reads after preprocessing
* [Overrrepresented sequence that was not previously presented](https://github.com/valeriafloral/Abies_fungal_endophytes/issues/9) Valeria


Population genetics:
* [Generating a pairwise genetic distance matrix for individuals using RADseq data (Brett)](https://github.com/redgcko7/Coleonyx_elegans/issues/5)


Programming language translation ("close" to open code)
* [Maltab script to Python](https://github.com/abelardoacm/ssDNA_viral_pangenomics/issues/3) Abelardo


## Principios de Agile project Management

Estas notas están basadas en su mayoría en el libro: *Agile Project Management for Dummies*, Mark C. Layton, 2017. Algunas partes del libro están [disponibles en línea](https://www.dummies.com/careers/project-management/agile-project-management-for-dummies-cheat-sheet/)


Un proyecto es un pograma de trabajo planificado que requiere una cantidad definitiva de tiempo, esfuerzo y planeación para que se complete. Los projectos tienen objetivos y metas y normalmente deben completarse en un tiempo determinado basado en cierto presupuesto. Por eso sus proyectos de maestría y doctorado, son erm, proyectos.

Los proyectos existen desde que la humanidad es humanidad. Incluyen por ejemplo la construcción de las pirámides de Teotihuacan. 

Inspirados por los procesos de manufactura, los proyectos informáticos seguían una estrategia "paso-a-paso", también llamada "cascada", con los siguientes pasos:

1. Requisitos
2. Diseño
3. Desarrollo
4. Integración
5. Pruebas
6. Implementación

Sin embargo, las estrategias cascaga **acumulan riesgo**, pues entre más se avanza, más difícil es dar marcha atrás para cambiar algo que hicimos al inicio. Para contrarestar esto, al inicio de los 2000s se desarrolló el "desarrollo agil de proyectos".

El desarrollo agil de proyectos es un estilo de manejo de proyectos que se enfoca en producir resultados de forma temprana, mejorando los productos del proyecto de forma continua, flexible, con retroalimentación del equipo y con con los productos (eg código) ampliamente puesto a prueba.

En el desarrollo agil de proyectos en vez de revisar los resultados durante la implementación (¡o sea al FINAL! por ejemplo cuando ya ponemos los resultados del análisis en la tesis), se trabaja en **iteraciones**. 

Una **iteración** es un fragmento pequeño del proyecto en general. Una iteración sigue los mismos pasos de un proyecto cascada, pero en una acción que puede completarse en un par de semanas en vez de en un par de años. 

Esto reduce considerablemente el riesgo, y permite ir avanzando en logros tangibles que nos mantienen motivadas.

![](agile_vs_waterfall.jpg)


### Manifesto y princpios del Desarrollo Agil de Proyectos


El desarrollo agil de proyectos vio la luz a través del [Manifesto for Agile Software Development](https://agilemanifesto.org/):


*Estamos descubriendo formas mejores de desarrollar
software tanto por nuestra propia experiencia como
ayudando a terceros. A través de este trabajo hemos
aprendido a valorar:*

*Individuos e interacciones sobre procesos y herramientas
Software funcionando sobre documentación extensiva
Colaboración con el cliente sobre negociación contractual
Respuesta ante el cambio sobre seguir un plan*

*Esto es, aunque valoramos los elementos de la derecha,
valoramos más los de la izquierda.*

y se subdivide en **12 principios**:

1. Nuestra mayor prioridad es satisfacer al cliente
mediante la entrega temprana y continua de software
con valor.

2. Aceptamos que los requisitos cambien, incluso en etapastardías del desarrollo. Los procesos Ágiles aprovechan el cambio para proporcionar ventaja competitiva al
cliente.

3. Entregamos software funcional frecuentemente, entre dos semanas y dos meses, con preferencia al periodo de
tiempo más corto posible.

4. Los responsables de negocio y los desarrolladores
trabajamos juntos de forma cotidiana durante todo
el proyecto.

5. Los proyectos se desarrollan en torno a individuos
motivados. Hay que darles el entorno y el apoyo que
necesitan, y confiarles la ejecución del trabajo.

6. El método más eficiente y efectivo de comunicar
información al equipo de desarrollo y entre sus
miembros es la conversación cara a cara.

7. El software funcionando es la medida principal de
progreso.

8. Los procesos Ágiles promueven el desarrollo
sostenible. Los promotores, desarrolladores y usuarios
debemos ser capaces de mantener un ritmo constante
de forma indefinida.

9. La atención continua a la excelencia técnica y al
buen diseño mejora la Agilidad.

10. La simplicidad, o el arte de maximizar la cantidad de trabajo no realizado, es esencial.

11. Las mejores arquitecturas, requisitos y diseños
emergen de equipos auto-organizados.

12. A intervalos regulares el equipo reflexiona sobre
cómo ser más efectivo para a continuación ajustar y
perfeccionar su comportamiento en consecuencia. 


Para poner en práctica un proyecto siguiendo los principios de desarrollo ágil se debe seguir la siguiente ruta:

![](agile-roadmap-value.jpg)

**Reflexión:** El desarrollo agil de proyectos se pensó originalmente para desarrollo de software, pero puede aplicarse a muchas cosas. ¿Puedes imaginar cómo aplicarlo al desarrollo de un proyecto de investigación o en tu propia tesis? Brinda ejemplos.


# Unidad 4: Organización de un proyecto bioinformático

Recordemos lo ya mencionado en clases previas:

Un proyecto bioinformático consiste en los datos crudos, datos procesados, scripts y documentación  necesarios para reproducir los análisis realizados. Es decir en todo lo que al final debes subir a un repositorio como [Dryad](https://www.datadryad.org/pages/organization) (aunque los datos pueden conectarse desde otros repos, como [SRA](https://www.ncbi.nlm.nih.gov/sra), claro). 

### Organización de directorios 

Un proyecto bioinformático debe tener su propio **directorio** (carpeta) y contener en subdirectorios todo lo necesario para realizarlo.

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

Como hemos visto GitHub te permite llevar un control de versiones, es decir, llevar un registro de los cambios que se realizan sobre un proyecto informático, particularmente sobre las modificaciones a los scripts.

Github además permite organizar proyectos con un sistema de asignación "tareas por hacer" que se pueden asignar a un usuario de forma colaborativa, o a una misma para mantener un proyecto propio sin perderse.

Puedes generar tareas ("cards") y páneles de estado (Pendientes, En Proceso, Terminadas, por ejmemplo). Lueg puedes arrastraslas de un panel a otro según vayas progresando.

![](github_projec.png)


Los proyectos solo los podemos ver si es nuestro repositorio o si estamos agregados como colaboradorxs en ellos. Para agregar a un colaborador ve la pestaña "Settings" (arriba derecha) y luego a "Collaborators" en el menú de la izquierda. Debes buscar a quien quieras agregar por su nombre de usuario en Github. El usuario debe aceptar la invitación para unirse formalmente al proyecto.

![](github_add_collaborator.png)

Las tareas ("cards") de un proyecto pueden quedarse como tareas simplemente, o volverse un **issue**. Los issues permiten delimitar una tarea que debe atenderse (por ejemplo un bug, una modalidad nueva deseada, etc) pero cuya solución además requiere discusión. Cada issue tiene asociado entonces una conversación. Tanto los issues como sus conversaciones asociadas son públicos, pues permiten al público saber, por ejemplo, que el problema existe y en qué va su solución.

![](github_issues.png)


**Ejercicio** Agréga a Camille, Rodolfo y a mi al repositorio de tu proyecto.



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

BCFtools:
* [Convert vcf to fasta) Duhyadi](https://github.com/Duhyadi/Deleterious-alleles-in-landraces-of-maize/issues/1)

Parsear archivos output:
* [Extract table of ipyrad stats file -bash o R (Christian)](https://github.com/cristoichkov/GBS_Bioinf_Process_Mamm/issues/17)
* [Choose by gene labels](https://github.com/FernandaDiaz12/pediatric_astrocytoma/issues/5) 

Gráficas:
* [Code color in volcano plots - R (Laura) ](https://github.com/LauraMCE/lncRNA_BC/issues/8)
* [Using different scales in barplot simultaneously - R (Laura) ](https://github.com/LauraMCE/lncRNA_BC/issues/10)
* [Plot cophylogeny (Melisa)](https://github.com/almamelisa/Euphoniinae-Subfamily/issues/5)

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

Sotware en general:
* [I need helping to install some dependencies in perl to run vcf2maf.pl](https://github.com/Martinez-Gregorio-Hector/workflow_to_analysis_WES/issues/10)
* [Problems with the stacking of several files](https://github.com/Martinez-Gregorio-Hector/workflow_to_analysis_WES/issues/11)

Jupyter Notebook

* [Exporting images from Jupyter notebook](https://github.com/AlexLlanesQuevedo/santacruzi_project/issues/5)

Differential Expression Analysis 

* [Define contrasts for DE](https://github.com/FernandaDiaz12/pediatric_astrocytoma/issues/6) 

  

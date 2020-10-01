# Unidad 2: Mejores prácticas al escribir y documentar scripts

## 2.1. Principios de diseño de software 

### DRY
Dont Repeat Yourself. Las violaciones de DRY se conocen como WET: "write every time", "waste everyones time", "we enjoy typing". 
[Referencia](https://en.wikipedia.org/wiki/Don%27t_repeat_yourself)

### KISS
Keep It Simple Stupid. 
[Referencia](https://en.wikipedia.org/wiki/KISS_principle)

### YAGNI
You Aren't Gonna Need It. 
[Referencia](https://en.wikipedia.org/wiki/You_aren%27t_gonna_need_it)

### POLA
Principle of Least Astonishment. 
[Referencia](https://en.wikipedia.org/wiki/Principle_of_least_astonishment)

### POLP
Principle of Least Privilege. 
[Referencia](https://digitalguardian.com/blog/what-principle-least-privilege-polp-best-practice-information-security-and-compliance)

### SOLID
Single responsibility, Open-closed, Liskov substitution, Interface segregation and Dependency inversion. 
[Referencia](https://team-coder.com/solid-principles/).

A lo largo del taller, especialmente durante la retroalimentación de sus scripts, buscaremos ejemplos de cada uno de estos principios y los pondremos en esta parte del repositorio.

## 2.2. Working directory y rutas relativas

El workingdirectory de un script siempre es el directorio donde está guardado dicho script. Entonces, es importante que si tu script va a manejar directorios (`cd` a algún lugar) lo planees con **rutas relativas** empezando en el directorio donde guardarás el script.

* **Absolute path** es dar la ruta (dirección) completa **desde root** hasta el directorio que queremos.

* **Relative path** es dar la ruta **desde donde estamos** hasta el directorio que queremos.

Ejemplo de ruta absoluta:

```
Alicias-MacBook-Pro:~ ticatla$ cd /Users/ticatla/Desktop/BioinfInvRepro/Unidad1/Prac_Uni1
Alicias-MacBook-Pro:Prac_Uni1 ticatla$

```

 Noten que `ticatla` es el nombre de usuario de Alicia, entonces el path absoluto tiene que llevar **su nombre de usuario**.


Ejemplo de ruta relativa:

```
Alicias-MacBook-Pro:Desktop ticatla$ cd Taller/Unidad1/
```

En la organización de tu proyecto tendrás los scripts guardados en un directorio determinado, y los datos en otro. Entonces para leer/escribir datos se recomienda utilizar `../` en combinación con una ruta relativa. Ejemplo:

Imaginemos que tienes un proyecto estructurado en 2 directorios así:

```
$ ls
data scripts
```

Entonces un script de R guardado en el directorio scripts podría leer el archivo de datos `data/misdatos.csv` con una línea de código así:

```
read.csv(file="../data/misdatos.csv")
```

Asumiendo que `scripts` sea el WD del script.


Esto importa porque **utilizar  rutas relativas permite que los scripts puedan correr en cualquier equipo sin necesidad de hacer cambios**



### Alternativa: ejecutar un script desde cualquier workingdirectory usando el PATH

El PATH es una lista de directorios donde la computadora busca para encontrar el script solicitado. Es una **variable global** que contiene una cadena de diferentes rutas separadas por ':'

Cuando escribes el nombre de un script sin utilizar una ruta absoluta o relativa, la computadora usa esa variable para buscarlo, comenzando con el primer directorio de la lista. Eso significa que los directorios que aparecen primero en el PATH tienen prioridad sobre los que aparecen más adelante.

```
$echo $PATH # ver cual es el PATH de tu computadora (o sesión)
```

### ¿Como cambiar el PATH de manera permanente?

Dando que PATH es una variable, si has hecho modificaciones usando el terminal, no se van a guardar cuando abres una nueva sesión/ventana en el Terminal. Modificaciones al PATH de manera permanente se hacen por el medio de dos ejecutivos que se pueden modificar usando:

```
$open -a TextWrangler .bash_profile  ### login shells
$open -a TextWrangler .bashrc  ### non-login shells
```

Si esos archivos no existen en la configuración de su maquina, se pueden crear usando:

```
$ cd ~/   ## to go to your home folder
$ touch .bash_profile   ## to create your new file
$ $open -a TextWrangler .bash_profile   ## edit .bash_profile (or with your favorite editor)
$ . .bash_profile   ## to reload .bash_profile and update any functions you have added. Notice the space between the two dots!
```

### ¿Cual es la diferencia entre un login y un non-login shell?

Cuando inicias una sesión (nombre de usuario y contraseña), ya sea en la computadora o de forma remota a través de 'ssh', .bash_profile se ejecuta para configurar su shell. Pero, si ya has iniciado una sesión en la computadora y abres una nueva ventana de terminal, entonces .bashrc se ejecuta.

Digamos que si quieres imprimir información de diagnóstico sobre tu máquina cada vez que inicias una sesión (uso de memoria, usuarios actuales, etc), vas a colocar esto en tu .bash_profile. Si lo colocas en tu .bashrc, lo verás cada vez que abras una nueva ventana del terminal.

Mac OS X es una excepción: La Terminal de Mac OS X ejecuta un login shell para cada nueva ventana de terminal, llamando a **.bash_profile** en lugar de .bashrc.

### Recomendación

La mayoría del tiempo, quieres que modificaciones al PATH se apliquen a ambos login y non-login shells, y no es deseable mantener dos archivos de configuración separados. Si es el caso (y solamente si esos dos archivos existen en su computadora), eso se puede solucionar llamando a .bashrc adentro del archivo .bash_profile, luego colocando **toda la configuración** del PATH en .bashrc

Para hacer esto, agregue las siguientes líneas a .bash_profile:

```
si [-f ~ / .bashrc]; entonces
   fuente ~ / .bashrc
fi
```

### Ejercicio

[Crear y ejecutar un bash script usando el PATH](https://www.taniarascia.com/how-to-create-and-use-bash-scripts/)



## 2.3. Uso de variables

### Definir variables

En bash pueden crearse variables. Ejemplo:

```
$ varx=2
$ $varx
-bash: 2: command not found

```

**Observaciones importantes**
* NO debe haber espacios entre el símbolo = y la variable o su valor.
* El nombre de la variable puede ser cualquier cosa que queramos **MENOS** el nombre de un comando que exista.

Las variables se pueden usar para acortar algo que escribamos muy seguido (como un path o un nombre de archivo largos). Ejemplo:

```
$ ruta_output="../../data/genetic/GBS/output"
$ ruta_input="../../data/genetic/GBS/input"
$ plink --file ruta_input/parviglumis_SNPs --make-bed --recode --keep ../meta/fam_$taxa.txt --mind 0.21 --geno 0.15 --maf 0.01 --out ruta_output/parviglumis_SNPs
```

También se pueden  conjuntar con otras variables dentro de un loop.

Ejemplo:

```
$ maullido=miau
$ for i in gato gatito gatón; do
> echo El $i hace $maullido
> done
El gato hace miau
El gatito hace miau
El gatón hace miau
```

Ambas cosas son útiles para facilitar reusar código al escribir scripts:


Ejemplo:


```
##### This script runs admixture for Zea m. parviglumis and Z. diploperennis

# define path to admixture admixture_outs
outs_path="../data/genetic/admixture_outs"

#### parviglumis

# define variable for taxa name
taxa=parviglumis

## Run admixture
# mamke output to put results
mkdir -p outs_path/$taxa

### Run admixutre

for K in {1..20};

# run admixture
do ./admixture --cv ../data/genetic/filtered/bytaxa_${taxa}.bed  $K | tee outs_path/${taxa}/log${K}.out;

# move output to output folder
mv bytaxa_${taxa}.$K* outs_path/$taxa
done

# move output

# save CV in a single file

#grep -h CV outs_path/${taxa}/log*.out >  outs_path/${taxa}/Kerror_${taxa}.txt

#### diploperennis
# define variable for taxa name
taxa=diploperennis

## Run admixture
# mamke output to put results
mkdir -p outs_path/$taxa

### Run admixutre

for K in {1..11}; \

# run admixture
do ./admixture --cv ../data/genetic/filtered/bytaxa_${taxa}.bed  $K | tee outs_path/${taxa}/log${K}.out;

# move output to output folder
mv bytaxa_${taxa}* outs_path/$taxa
done

# move output

# save CV in a single file

grep -h CV outs_path/${taxa}/log*.out >  outs_path/${taxa}/Kerror_${taxa}.txt

```



## 2.4. For loops

Los *for loops* permiten **repetir** una serie de comandos con diferentes *variables de una lista*.

Sintaxis:

```
for i in list; do
 command1
 command2
 ..
done
```

"i" puede leerse como "el elemento i de la lista". Y  la lista no es más que el conjunto total de las variables que queremos.

Puedes consultar esta y más info de for loops en [esta guía con ejemplos y varios formatos](http://www.thegeekstuff.com/2011/07/bash-for-loop-examples/).


Ejemplo:

```
$ for i in adenina citosina guanina timina; do
> echo "La $i es una base nitrogenada"
> done

La adenina es una base nitrogenada
La citosina es una base nitrogenada
La guanina es una base nitrogenada
La timina es una base nitrogenada
```


**Observaciones importantes:**

* Los elementos de la lista NO se separan por comas (en otros lenguajes sí).
* Para referirnos al "elemento i" dentro de los comandos debemos usar como prefijo el símbolo `$`.
* No tienes que escribir el `>` antes de `echo` y de `done`, los pongo solo para mostrar que eso aparece en la terminal hasta que terminemos de meter los comandos que formarán parte del loop. De hecho `done` sirve para decir "ok, aquí termina el loop". En los ejemplos de abajo ya no lo pondré.

Otro ejemplo:

```
for perro in labrador "pastor mesoamericano" xolo; do
echo Mi mejor amigo es un $perro; done

Mi mejor amigo es un labrador
Mi mejor amigo es un pastor mesoamericano
Mi mejor amigo es un xolo
```

**Preguntas**

1) ¿Cuándo debo usar comillas en la lista de elementos?

2) ¿Qué hace `;`?

Y un ejemplo más, usando rutas relativas:

```
for i in {1..100}; do
mkdir directorio$i;
cd directorio$i;
touch texto${i}.txt;
cd ../;
done
```

Lo cual hará 100 directorios (llamados directorio1, directorio2 y así) con un archivo de texto (llamados texto1, texto2,...) adentro. Si lo quieres repetir se usa el comando **-p** para sobre-escribir el contenido de cada directorio (a usar con cuidado!)

```
for i in {1..100}; do
mkdir -p directorio$i;
cd directorio$i;
touch texto${i}.txt;
cd ../;
done
```


### Crear arrays y utilizarlos como una lista en un loop

Quizá quieras correr algo sobre muchas variables, como los nombres de 30 muestras o poblaciones distintas. Esto puede resolverse utilizando comodines, si los nombres lo permiten, o alimentando al loop con un **arreglo**.

**Con comodines**

Por ejemplo si el loop lo quieres correr sobre puros archivos fasta que estén en un directorio. Ejemplo:

```
$ ls
VerdesFritos		jitomate.fasta		tomatesverdes.fasta
$ for i in *.fasta; do
> echo "El archivo $i es un fasta ejemplo"
> echo "Utilizamos al archivo $i en este loop"
> done
El archivo jitomate.fasta es un fasta ejemplo
Utilizamos al archivo jitomate.fasta en este loop
El archivo tomatesverdes.fasta es un fasta ejemplo
Utilizamos al archivo tomatesverdes.fasta en este loop
```

**Con arreglos**

Los arreglos (una "lista"). Se generan parecido a las variables, pero con un par de () para indicar que se trata de un arreglo.

```
$ a=( gato gatito gatón )
```

Luego para indicar dentro de un loop que `a` es un array, debemos utilizar la notación `${a[@]}`:

```
$ for i in ${a[@]}; do echo El $i hace miau; done
El gato hace miau
El gatito hace miau
El gatón hace miau
```

Un arreglo también puede ser el resultado de un comando, por ejemplo de `grep`, siguiendo la siguiente sintaxis `


**Leyendo desde un archivo**

Los arrays tienen sus problemas cuando son muy grandes y  es fácil cometer errores porque nunca "los vemos", por lo tanto mucha gente prefiere mejor leer los elemntos directo de un archivo. Ejemplo:

```
$ grep -oE "\w+_[0-9]*" nuevos_final.fam > muestras.txt
$ for i in $(cat muestras.txt); do echo Hacer algo con la muestra $i; done
```


## 2.5. Trucos en la terminal y el editor de texto

#### `cat`

[Definición e usos](http://www.linfo.org/cat.html)

Ejemplo: usando `cat`, crea un archivo en tu repo de chocolate llamado 'felines.txt' e inserta el texto 'This is not about a cat.'

#### `grep`
[Definición e usos](http://www.linfo.org/grep.html)

Ejemplo: Usa `grep` y "." para encontrar todas las palabras de 5 caracteres que empiezan con "c" y acaban con "h" - muy bueno para hacer cruzigramas!

```
$grep '\<c...h\>' /usr/share/dict/words
```

Para hacer un match con palabras de cualquier numero de caracteres usa "*"

```
$grep '\<c.*h\>' /usr/share/dict/words
```

En ese ejemplo, usa [grep y cat](https://medium.com/@robertopreste/counting-sequences-in-fasta-fastq-files-ad7d2675b40f) para contar el número de secuencias contenidas en un archivo fasta y fastq


#### `sed`

`sed` es un 'stream editor' que realiza operaciones de edición de información proveniente de un input o un archivo, como buscar, eliminar y reemplazar, **línea por línea**.

`sed` envía sus resultados a la pantalla de forma predeterminada, entonces podemos usarlo como lector de archivos al no pasarle comandos de edición:

```
$sed '' geekfile.txt
```

Para realizar eliminación de texto se usa el comando "d":

```
$sed '1d' geekfile.txt
```

Para cambiar una palabra a otra se usa el comando "s":

```
$sed 's/unix/linux/' geekfile.txt  ## reemplazar una vez por linea
$sed 's/unix/linux/g' geekfile.txt  ## reemplazar todas las ocurrencias
```

Para eliminar todas las palabras "unix" (i.e., reemplazarlas por un carácter nulo):

```
$sed 's/unix//g' geekfile.txt  ## reemplazar una vez por linea

```

Por supuesto, no estámos realizando esos cambios en el archivo, por lo que solo alimenta esas líneas a su shell. Si queremos guardar nuestras ediciones, se pueden redirigir a un archivo de esta manera:

```
$sed 's/unix/linux/g' geekfile.txt > moregeekfile.txt
```

[Mas ejemplos](https://www.geeksforgeeks.org/sed-command-in-linux-unix-with-examples/)


#### `awk`

`awk` es más que un comando, es un lenguaje de programación. Se puede escribir scripts `awk` para operaciones complejas o usar `awk` desde la línea de comandos. El nombre significa 'Aho, Weinberger y Kernighan', los autores del lenguaje.

¿Qué es lo que hace awk?

`awk` es un lenguaje diseñado para la extracción de datos. A menudo se usa con `sed` para realizar tareas útiles y prácticas de manipulación de texto. Al igual que `sed`, `awk` lee una línea a la vez, realiza alguna acción dependiendo de la condición que le dé y genera el resultado. Entre otros, uno de los usos más populares de `awk` es para [seleccionar columnas de un archivo de texto](https://www.geeksforgeeks.org/awk-command-unixlinux-examples/)


## 2.6. Recomendaciones misceláneas

`~` es una especie de ruta corta a la ruta absoluta de tu directorio home. No importa dónde estés `cd ~` te llevará a home.

`runparts` ejecuta todos los scripts en un directorio de destino, secuencialmente en orden de **nombre de archivo**. Por supuesto, los scripts deben tener permiso de ejecución.

[Recomendaciones para usar el shell de manera eficiente](https://google.github.io/styleguide/shell.xml)

[Recomendaciones que cualquier programadorx debería saber](https://www.codingdojo.com/blog/clean-code-techniques):

1. Escribe código para humanos, no para computadoras.

2. Manten tu código tan simple y leible como sea posible. **Keep it simple**.

3. Entiende qué hace tu código.

4. Los comentarios son tus nuevos mejores amigos. Y quieres tenerlos cerca siempre, no solo en en tus años mozos.

5. No te repitas. **Don't repeat yourself (DRY)**

6. Organiza tu código en secciones lógicas. Por ejemplo con la lectura de datos por un lado y las funciones por otro.

7. Usa buenos nombres y sé consistente. **mejor si son en inglés**

8. Pienso y luego escribo código. Por ejemplo pienso cuáles son los pasos para solucionar mi problema y los pongo como comentarios.

```
Step 1: Get data
Step 2: Clean up data issues
2a: Remove excess rows
2b: Correct case issues in columns x,y,z
Step 3: Apply glm function
Step 4: Output validation components
```

9. Explora y pregúntale al internet.

10. Soluciona las cosas por ti mismx.

11. Prueba tu código (con datos distintos).

12. Escribe código para sustituir operaciones que hacías point and click.


Algunas de estas recomendaciones las tomé de [aquí](https://www.codingdojo.com/blog/clean-code-techniques) o [de aquí](https://www.r-bloggers.com/10-top-tips-for-becoming-a-better-coder/)



### Unos jueguitos

Dejando a un lado el `code`, no es mala idea ejercitar también la lógica de la programación.

[Aquí](https://blockly-games.appspot.com/) tenemos unos juegos de progamación.

Ejercicio:

En clase, completemos los primeros 8 niveles del MAZE. O si pueden los 10, si no luego.


## 2.8. Funciones en R

Una función es un conjunto de instrucciones organizadas para complir con una tarea específica. En R una función es un **objeto** compuesto por las siguientes partes:

* **Nombre de la función:** el nombre del objeto con el que la función está guardada en el cerebro de R y que utilizamos para llamarla. Por ejemplo: el nombre de la función `mean()` es mean.

* **Argumentos** variables definidas por el usuario cuando invoca la función y que la función requiere para funcionar. Por ejemplo el nombre de un archivo, el valor de un parámetro o el método que queremos utilizar de una lista de opciones. Los argumentos son opcionales (puede haber funciones sin argumentos) o pueden tener parámetros default.

* **Return value:** la última expresión del cuerpo de la función que será "devuelta" como valor de salida (output) de la función.

* **Statements:** comandos que utiliza la función para cumplir su propósito.

Esqueleto de una función en R:

```{r}
myfunction <- function(arg1, arg2, ... ){
statements
return(object)
}
```

**Ojo**: el comando `return` es necesario al final de una función siempre que queramos que dicha función "devuelva" un objeto (por ejemplo una df que creemos como parte de la función). De no poner esta instrucción, la función correrá desde otro script, pero no veremos ningún resultado.


R base tiene muchas funciones predefinidas, y cuando instalamos un paquete básicamente agregamos una serie de funciones que trabajan juntas. Pero una ventaja de R es que también podemos hacer nuestras propias funciones. Esto es útil para:


* **No repetirnos**
* Compartir funciones sin tener que compartir un script gigante de análisis
* Hacer más leible el código.


Ejemplo:

```{r}
fahrenheit_to_kelvin <- function(temp_F) {
  ## converts temperature value from fahrenheit to fahrenheit_to_kelvin
  ## Argumets:
  # temp_F: value of temperature in F to be converted to K
  temp_K <- ((temp_F - 32) * (5 / 9)) + 273.15
  return(temp_K)
}
```

**Ejercicio**: escribe una función para convertir temperatura en grados centígrados a Kelvin.


#### Guardar funciones en archivos fuera del script de análisis

`source` es una función que sirve para correr un script de R **dentro de otro script de R**. Esto permite modularizar un análisis y luego correr una pipeline general, así como tener por separado **funciones propias** (que podemos llamar igual que llamamos las funciones de los paquetes) y que utilizamos mucho en diversos scripts.

Ejemplos de cómo utilizar `source`: correr el script del ejercicio anterior desde otro script con la línea con base en el código de la sección PopGenomicsIBR.zip de [este repositorio](https://datadryad.org/resource/doi:10.5061/dryad.f7248))

Desde R, con source podemos correr todo un script de R desde **otro** script de R:

```{r}
source("3.IBR_testing.r")
```
Nota que pare que esto funcione tu working directory debe ser el correcto para leer `3.IBR_testing.r` como si fuera un archivo (que lo es). Es decir tu WD debe ser la ruta donde está 1.IBR_testing.r.


Ahora veamos esta función:

Primero veamos esta función:

```
read.fst_summary_fix <- function(file, popNames){
    ### Function to read the Stacks populations output file batch_1.fst_summary.tsv and add PopNames to it
    # it also adds a 0 diagonal and converts it to a symmetric matrix
    # file = path to batch_1.fst_summary.tsv file
    # popNames = vector with population names in the same order than PopID in the file

    ### Get data
    Fstmat<-data.matrix(read.delim(file = file, row.names=1, fill=TRUE))
    # add col names
    colnames(Fstmat)<- popNames
    Fstmat

  ## Fix
  x<-Fstmat
  # add an extrarow
  x <- rbind(x, n=NA)
  # Change rownames to col names
  rownames(x)<-colnames(x)
  # add 0 diagonal
  x[is.na(x)] <- 0
  # make symmetrical matrix
  x <- x + t(x)
  Fstmat <-x
  Fstmat
  }
```

Si guardamos la función como un script llamado `read.fst_summary_fix.r` después podemos correrla desde otro script, llamándola con `source()`:

```{r}
source("read.fst_summary_fix.r")
```

Nota que `source` NO corre la función en sí, sino que solo la carga al cerebro de R para que podamos usarla como a una función cualquiera de un paquete.

El nombre del archivo R no importa, pero es buena práctica ponerle el mismo que el nombre de la función.


**Ejercicio** Guarda tu función para convertir temperatura de grados C a K en un archivo separado de tu script, luego llámala con `source()` y utilízala en tu script.


**Referencias útiles para funciones en R**

Intro: [https://swcarpentry.github.io/r-novice-inflammation/02-func-R/](https://swcarpentry.github.io/r-novice-inflammation/02-func-R/)

Funciones dentro de funciones [https://www.r-bloggers.com/r-tips-and-tricks-higher-order-functions/](https://www.r-bloggers.com/r-tips-and-tricks-higher-order-functions/)

Todo lo que quieres saber y no te treves a preguntar: [http://adv-r.had.co.nz/Functional-programming.html](http://adv-r.had.co.nz/Functional-programming.html)

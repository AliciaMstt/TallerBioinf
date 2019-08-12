# Unidad 2: Mejores prácticas al escribir y documentar scripts

## 2.1. Working directory y rutas relativas

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

Cada vez que abres una nueva sesión en el Terminal, el PATH se define por el medio de dos ejecutivos que se pueden modificar usando:

```
$open -a TextWrangler .bash_profile  ### login shells
$open -a TextWrangler .bashrc  ### non-login shells
```

### ¿Cual es la diferencia entre un login y un non-login shell?

Cuando inicias una sesión (nombre de usuario y contraseña), ya sea en la computadora o de forma remota a través de 'ssh', .bash_profile se ejecuta para configurar su shell. Pero, si ya has iniciado una sesión en la computadora y abres una nueva ventana de terminal, entonces .bashrc se ejecuta. 

Digamos que si quieres imprimir información de diagnóstico sobre tu máquina cada vez que inicias una sesión (uso de memoria, usuarios actuales, etc), vas a colocar esto en tu .bash_profile. Si lo colocas en tu .bashrc, lo verás cada vez que abras una nueva ventana del terminal.

Mac OS X es una excepción: La Terminal de Mac OS X ejecuta un login shell para cada nueva ventana de terminal, llamando a .bash_profile en lugar de .bashrc.

### Recomendación

La mayoría del tiempo, quieres que modificaciones al PATH se apliquen a ambos login y non-login shells, y no es deseable mantener dos archivos de configuración separados. Eso se puede solucionar llamando a .bashrc adentro del archivo .bash_profile, luego colocando la configuración del PATH en .bashrc

Para hacer esto, agregue las siguientes líneas a .bash_profile:

```
si [-f ~ / .bashrc]; entonces
   fuente ~ / .bashrc
fi
```

### Ejercicio

[Crear y ejecutar un bash script usando el PATH](https://www.taniarascia.com/how-to-create-and-use-bash-scripts/)



## 2.2. Uso de variables

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



## 2.3. For loops

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

Y un ejemplo más:

```
for i in {1..100};do
mkdir directorio$i; done
```

Lo cual hará 100 directorios, llamados directorio1, directorio2 y así.


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


## 2.4. Trucos en la terminal y el editor de texto

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

#### `seq`

Emite una secuencia de números, con un incremento seleccionado por el usuario. Es útil para hacer loops!

```
$ seq 5
>1
>2
>3
>4
>5
```

El carácter separador entre cada número es una nueva línea, pero esto se puede cambiar con la opción -s

```
$ seq -s : 5
>1:2:3:4:5
```

## 2.5. Recomendaciones misceláneas

`~` es una especie de ruta corta a la ruta absoluta de tu directorio home. No importa dónde estés `cd ~` te llevará a home.

`runparts` ejecuta todos los scripts en un directorio de destino, secuencialmente en orden de **nombre de archivo**. Por supuesto, los scripts deben tener permiso de ejecución.

[Recomendaciones para usar el shell de manera eficiente](https://google.github.io/styleguide/shell.xml)

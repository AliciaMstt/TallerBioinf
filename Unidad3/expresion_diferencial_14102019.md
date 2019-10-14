** Análisis de expresión diferencial**

[Datos en Drive](https://drive.google.com/drive/folders/1YxRmVkPqvzz-9DIUWv9WjPPDbXMXgwps)

Los datos provenientes se pueden obtener tras tener un armado y hacer una estimación de las veces que los transcritos se observaron en cada una de las muestras. Para esto se pueden utilizar dos métodos de estimación: 1) dependientes de alineamiento (RSEM, eXpress) y 2) independientes de alineamiento (kallisto, Salmon). 

En esta ocasión utilizaremos Salmon (es más rápido de correr) para poder obtener una matriz de contingencia de nuestros datos. También adjunto un archivo que contiene los datos de cuantificación con RSEM del mismo set de datos.

**Salmon**

Para instalar se pueden utilizar *Bioconda* o descargar los archivo binarios precompilados (https://github.com/COMBINE-lab/salmon/releases) y colocar los archivos en nuestro PATH. Para comprobar que podemos utilizar el programa simplemente corremos

```bash
salmon -h

salmon v0.14.1

Usage:  salmon -h|--help or 
        salmon -v|--version or 
        salmon -c|--cite or 
        salmon [--no-version-check] <COMMAND> [-h | options]

Commands:
     index Create a salmon index
     quant Quantify a sample
     alevin single cell analysis
     swim  Perform super-secret operation
     quantmerge Merge multiple quantifications into a single file

```

**Construcción del índice para Salmon**

Podemos utilizar el transcriptoma de ejemplo (transcriptome.fasta.gz) y las muestras de donde se obtuvo dicho transcriptoma:

```bash
mdkir salmon_transcriptome_expression ; cd salmon_transcriptome_expression # Creacion de carpeta de trabajo.
cp ../transcriptome.fasta.gz . # Copiar a la carpeta de trabajo el transcriptoma.  
cp ../*fastq.gz . # Copiar las muestras.
```

Ahora procedemos a hacer el índice:

```bash
salmon index -t transcriptome.fasta.gz -i transcriptome_salmon_index
# Donde -t es nuestro transcriptoma y -i es el nombre que tendrá índice.
```

**Cuantificación de las muestras**

Para poder cuantificarlas podemos hacer un pequeño script con cada una de las muestras:

```bash
touch script_quant_salmon.sh 
echo '#!/bin/bash' > script_quant_salmon.sh 
for s in D1 D2 D3 I1 I2 I3 ; 
	do echo salmon quant -i transcriptome_salmon_index -l A -1 $s\_1_qual_paired_2.fastq.gz -2 $s\_2_qual_paired_2.fastq.gz -p 12 --validateMappings -o $s\_salmon_quantification ; 
	done >> script_quant_salmon.sh

sh script_quant_salmon.sh
```

**Análisis de expresión diferencial con DESeq2 de los datos de RSEM**

Una vez que tenemos los datos podemos integrarlos a R para hacer el análisis de expresión diferencial. Existen diferentes paquetes que se pueden utilizar para dicho fin, y en esta ocasión utilizaremos DESeq2 en R. 

Para instalar los paquetes necesarios:

```R
if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
BiocManager::install("DESeq2")
BiocManager::install("apeglm")
install.packages("pheatmap")
install.packages("ggplot2")

library("ggplot2")
library("pheatmap")
library(DESeq2)
library(apeglm)
library("RColorBrewer")
```

Primero vamos a importar la matriz con los conteos (RSEM) y los datos de correspondencia muestra/grupo, así como agregarla a DESeq2:

```R
rsem_count <- as.matrix(read.delim(file = "RSEM.gene.counts.matrix", sep="\t",  row.names = 1))

column_data <- read.csv(file = "metadata.txt", sep = "\t")

deseq_data_set <- DESeqDataSetFromMatrix(countData = rsem_count,
                              colData = column_data,
                              design = ~group)

deseq_data_set$group <- relevel(deseq_data_set$group, ref = "dextrosa")
```

Es recomendable filtrar los transcritos con poca abundancia antes de hacer el análisis:

```R
keep <- rowSums(counts(deseq_data_set)) >= 10

deseq_data_set <- deseq_data_set[keep,]
```

Con la tabla filtrada podemos realizar el análisis de expresión diferencial: 

```R
dif_expression_deseq_data_set <- DESeq(deseq_data_set)

res_dif_expression_deseq_data_set <- results(dif_expression_deseq_data_set)

summary_dif_expression_deseq_data_set <- summary(res_dif_expression_deseq_data_set)
```

Podemos hacer en los resultados, como *p-value* y *log2 fold change*, etc.

```R
res05_dif_expression_deseq_data_set <- results(dif_expression_deseq_data_set, alpha=0.05)

summary_dif_expression_deseq_data_set <- summary(res05_dif_expression_deseq_data_set)
```

Así como exportar la gráfica:

```R
write.table(as.data.frame(res05_dif_expression_deseq_data_set),sep = '\t' , file="results.tsv")
```

**Gráficas**

Podemos realizar diferentes gráficas con los datos de expresión diferencial obtenidos, aquí se muestran algunos ejemplos, el primero es un *Volcano plot*:

```R
par(mar=c(5,5,5,5))

jpeg("volcano_plot.jpg", width = 350, height = 350)

plotMA(res05_dif_expression_deseq_data_set, ylim=c(-10,10))

dev.off()
```

Sí tenemos un gen de interés podemos hacer una gráfica individual:

```R
jpeg("TRINITY_DN1097_c0_g1.jpg", width = 350, height = 350)

plotCounts(dif_expression_deseq_data_set, gene= "TRINITY_DN1097_c0_g1", intgroup="group")

dev.off()
```

Podemos realizar un *heatmap* con los primeros 20 transcritos:

```R
select <- order(rowMeans(counts(dif_expression_deseq_data_set,normalized=TRUE)),
                decreasing=TRUE)[1:20]

df <- as.data.frame(colData(dif_expression_deseq_data_set)[,c("X","group")])

jpeg("heatmap.jpg", width = 350, height = 350)

pheatmap(assay(dif_expression_deseq_data_set)[select,], cluster_rows=FALSE, show_rownames=FALSE, cluster_cols=FALSE, annotation_col=df)

dev.off()
```

Así como PCA:

```R
vsd <- vst(dif_expression_deseq_data_set, blind=FALSE)

jpeg("PCA.jpg", width = 350, height = 350)

plotPCA(vsd, intgroup=c("group"))

dev.off()
```

**Ejercicio con los resultados de Salmon**

Podemos hacer un análisis de expresión con los datos obtenidos de Salmon, primero juntando los resultados:

```R
cat D1_salmon_quantification/quant.sf | cut -f 1 > ids.tmp.1.txt

for s in D1 D2 D3 I1 I2 I3  ; 
	do printf "$s\n" > $s.tmp.txt  ; 
	cat $s\_salmon_quantification/quant.sf | cut -f 5 | grep -v N >> $s.tmp.txt ; 
done

paste ids.tmp.1 D1.tmp.txt D2.tmp.txt D3.tmp.txt I1.tmp.txt I2.tmp.txt I3.tmp.txt > salmon.matrix.txt	
 
```

Ahora a hacer un nuevo script con estos datos :).

Contains data and scripts for the sections *Population genomic statistics and population differentiation*, *Timberline-alpine grassland distribution of glacial and interglacial periods* and *Landscape genomics analyses* of the manuscript.

### `/bin/`

The scripts in `/bin` should be run in the order they are numbered. R functions used by some of these scripts are not numbered and have the extension `.R`. Html notebooks are provided for some of the analyses in R.

Scripts content:

* `1.PrepareRasters.r` reclassifies SDM output rasters to desired values and to create a flat landscape. Also plots each resistance among with sampling points.
* `2.Circuitscape_estimatingResDist.txt` well, not actually a script. Contains the settings used to run Circuitscape for each of the rasters.
* `3.IBR_testing.r` performs the isolation by resistance analyses (Mantel tests) and related plots.
* `4.runadmixture.sh` runs Admixture
* `5.PopStructurePlot.R` plots Admixture results and performs and plots a PCA for each species.
* `6.magnitude_sizechange.R` estimates suitable area and magnitude of area change (glacial / interglacial) in a buffer surrounding each sampling point.

These scripts use the data in `genetic` and `spatial`.

### `/genetic`

Contains genetic data for each of the species as specified below.

Data with (`out.replicates`) and and without replicates (`out.no.replicates`) are provided in plink format among with Stacks summary statistics. These data are within the following directories for each species:

##### `/BerSS`

Genetic data corresponds to Stacks output using the subset of loci excluding paralogs examined for Berberis alpina ingroup. Generated with `4.StacksPopulations_AllLoci.script` (available in repository https://datadryad.org/resource/doi:10.5061/dryad.n3jk5.

##### `/JmINGP`

Genetic data corresponds to Stacks output using the subset of loci excluding the blacklisted loci. Data available at the "processing_ddRADdata" section of this repository (`Juniperus/2R/Jmonticola/PopSamples/data.out/JmonJzOpt3/FilteringBlacklist/JmINGP`). 



### `/spatial`

Contais spatial data as follows:

* `/Elevation	` contains `.asc` rasters for the TMVB. `alt_tmvb.asc` is the original dataset, the rest are the result of reclassifying (output of `1.PrepareRasters.r` script) it for each of the altitudinal resistance surfaces. 

* `/SDM` contains the  presence points (`presence_points.csv`) used to run Maxent. See note below on how these were obtained. The `/out` directory contains Maxent results, named with the formart `Alpine_MODEL_tmvb_avg.asc`. Files `*_reclass.asc` correspond to the reclassified rasters (output of `1.PrepareRasters.r` script) used as resistance distances. 

* `Circuitscape` contains the focal points (`*_focalpoints.txt`) used to run Circuit scape and the output (`/out`). Output is provided for each of the resistance surfaces with the format `Speciesname_resistancesurface_3colummns.out` and `Speciesname_resistancesurface_resistances.out`. Settings used are in `*.ini` files.		

* `surveyed_mountains.tsv` lat/long and key name of mountains sampled in this study.


**Note on SDM presence points**

As presence points we used alpine grasslands herbarium records, *Pinus hartwegii* occurrence points and the sampling points of the present study.Alpine grasslands records (n=72) from herbarium collections from ENCB, IEB, MEXU and XAL. These records come from vouchers mentioning “alpine grassland” or “pastizal alpino” in the vegetation description and have been corroborated in the field.*Pius hartwegii* Lindl. occurrence points (n=7) were downloaded from GBIF using the following filters:  Boundary box (-108.457031 23.241346,-108.457031 14.306969,-89.736328 14.306969,-89.736328 23.241346,-108.457031 23.241346) enclosing the TMVB and SMS; without spatial issues, with coordinates,  and recorded after 1997 (previous years contained mostly entries whose geographic coordinates were not obtained directly with a GPS, thus making them less reliable). All occurrences were visually inspected on Google Earth to ensure they  were likely on P. hartwegii forest. Occurrences with duplicated coordinates were filtered leaving only a unique point. Final occurrences were recorded by the projects or institutions enlisted below:* Diversidad y riqueza vegetal de los substratos rocosos del centro del estado de Veracruz* Missouri Botanical GardenSampling points of the present study (n=13) correspond to the coordinates of the sampled specimen for herbarium voucher (deposited at MEXU) of Juniperus monticola.
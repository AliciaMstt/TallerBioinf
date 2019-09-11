#! /bin/bash

#loop para ensamblas con velvet a 3 dif hash values

mkdir -p ../assem/Velvet

for k in 11 21 31; do
velveth ../assem/Velvet/Hhv6_$k $k -fastq -shortPaired \
../data/Hhv6.R1.fastq ../data/Hhv6.R2.fastq

velvetg ../assem/Velvet/Hhv6_$k;
done
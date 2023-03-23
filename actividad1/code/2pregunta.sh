#!/usr/bin/env bash

## $1 == manifest.tsv
## $2 == metadata.tsv

## Obtenemos un demultiplexado con lecturas single end

read -p " > seleccione una ruta para demux_seqs.qza -> " ruta1
read -p " > seleccione una ruta para demux_seqs.qzv -> " ruta2

if [ ! -f $ruta1 ]
then
  qiime tools import \
    --type "SampleData[SequencesWithQuality]" \
    --input-format SingleEndFastqManifestPhred33V2 \
    --input-path $1 \
    --output-path $ruta1
else
  echo "Ya estan los datos en $ruta1"
fi

if [ ! -f "${ruta2}.qzv" ]
then
  qiime demux summarize \
    --i-data $ruta1 \
    --o-visualization $ruta2 
else
  echo "Ya están los datos en ${ruta2}.qzv"
fi


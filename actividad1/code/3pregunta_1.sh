#!/usr/bin/env bash

## $1 == manifest.tsv input en ../data/raw/
## $2 == demux_seqs.qza output qza en ../data/processed/
## $3 == demux_seqs.qzv output qzv en ../data/processed/

if [[ ! -f $2 || ! -f $3 ]]
then

    qiime tools import \
        --type "SampleData[SequencesWithQuality]" \
        --input-format SingleEndFastqManifestPhred33V2 \
        --input-path $1 \
        --output-path $2

    qiime demux summarize \
         --i-data $2 \
         --o-visualization $3
else
    echo "Ya estabe realizado"

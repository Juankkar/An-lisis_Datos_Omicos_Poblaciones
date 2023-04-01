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
fi

# if [[ ! -f ../processed/demux_seqs.{qza,qzv} ]]
# then 
#     qiime tools import 
#         --type "SampleData[SequencesWithQuality]" \
#         --input-format SingleEndFastqManifestPhred33V2 \
#         --input-path $1 \
#         --output-path $ruta
    
#     qiime demux summarize \
#         --i-data ../data/processed/demux_seqs.qza \
#         --o-visualization ../data/processed/demux_seqs.qzv
        
# else
#     echo ">>> demux_seqs ya estaba descargado"
# fi

# if [[ ! -f dada2_table.qza || \
#     ! -f dada2_rep_set.qza || \
#     ! -f dada2_stat.qza ]]
# then
#     qiime dada2 denoise-single \
#         --i-demultiplexed-seqs $1 \
#         --p-trunc-len 150 \
#         --o-table ./dada2_table.qza \
#         --o-representative-sequences ./dada2_rep_set.qza \
#         --o-denoising-stats ./dada2_stat.qza
# else
#     echo ">>> Ya están descargados los datos"
# fi

# if [[ ! -f dada2_stat.qzv || \
#     ! -f demux-filtered.qza || \
#     ! -f demux-filter-stats.qza || \
#     ! -f rep-seqs-deblur.qza || \
#     ! -f table-deblur.qza || \
#     ! -f deblur-stats.qza || \
#     ! -f demux-filter-stats.qzv || \
#     ! -f deblur-stats.qzv ]]
# then
#     qiime metadata tabulate \
#         --m-input-file dada2_stat.qza  \
#         --o-visualization dada2_stat.qzv

#     qiime feature-table summarize \
#         --i-table dada2_table.qza \
#         --m-sample-metadata-file $2 \
#         --o-visualization dada2_table.qzv

#     qiime quality-filter q-score \
#         --i-demux $1 \
#         --o-filtered-sequences demux-filtered.qza \
#         --o-filter-stats demux-filter-stats.qza

#     qiime deblur denoise-16S \
#         --i-demultiplexed-seqs ./demux-filtered.qza \
#         --p-trim-length 120 \
#         --o-representative-sequences rep-seqs-deblur.qza \
#         --o-table table-deblur.qza \
#         --p-sample-stats \
#         --o-stats deblur-stats.qza

#     qiime metadata tabulate \
#         --m-input-file demux-filter-stats.qza \
#         --o-visualization demux-filter-stats.qzv

#         qiime deblur visualize-stats \
#         --i-deblur-stats deblur-stats.qza \
#         --o-visualization deblur-stats.qzv
# else
#     echo ">>> Ya está descargado"
# fi
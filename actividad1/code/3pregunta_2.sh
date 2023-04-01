#!/usr/bin/env bash

## $1 == demux_seqs.qza
## $2 == metadata.tsv en raw data

if [[ ! -f dada2_table.qza || \
    ! -f dada2_rep_set.qza || \
    ! -f dada2_stat.qza ]]
then
    qiime dada2 denoise-single \
        --i-demultiplexed-seqs $1 \
        --p-trunc-len 150 \
        --o-table ./dada2_table.qza \
        --o-representative-sequences ./dada2_rep_set.qza \
        --o-denoising-stats ./dada2_stat.qza
else
    echo ">>> Ya están descargados los datos"
fi

if [[ ! -f dada2_stat.qzv || \
    ! -f demux-filtered.qza || \
    ! -f demux-filter-stats.qza || \
    ! -f rep-seqs-deblur.qza || \
    ! -f table-deblur.qza || \
    ! -f deblur-stats.qza || \
    ! -f demux-filter-stats.qzv || \
    ! -f deblur-stats.qzv ]]
then
    qiime metadata tabulate \
        --m-input-file dada2_stat.qza  \
        --o-visualization dada2_stat.qzv

    qiime feature-table summarize \
        --i-table dada2_table.qza \
        --m-sample-metadata-file $2 \
        --o-visualization dada2_table.qzv

    qiime quality-filter q-score \
        --i-demux $1 \
        --o-filtered-sequences demux-filtered.qza \
        --o-filter-stats demux-filter-stats.qza

    qiime deblur denoise-16S \
        --i-demultiplexed-seqs ./demux-filtered.qza \
        --p-trim-length 120 \
        --o-representative-sequences rep-seqs-deblur.qza \
        --o-table table-deblur.qza \
        --p-sample-stats \
        --o-stats deblur-stats.qza

    qiime metadata tabulate \
        --m-input-file demux-filter-stats.qza \
        --o-visualization demux-filter-stats.qzv

    qiime deblur visualize-stats \
        --i-deblur-stats deblur-stats.qza \
        --o-visualization deblur-stats.qzv
else
    echo ">>> Ya está descargado"
fi
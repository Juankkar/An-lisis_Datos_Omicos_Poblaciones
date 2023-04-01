#!/usr/bin/env bash

## $2 == metadata.tsv en raw data
## $4 == gg-13-8-99-515-806-nb-classifier.qza en raw data

if [[ ! -f alpha_rarefaction_curves.qzv ||
      ! -f taxonomy.qza || 
      ! -f taxonomy.qzv ||
      ! -f table_2k.qza || 
      ! -f taxa_barplot.qzv ]]
then
    ## Calculamos la diversidad alpha
    qiime diversity alpha-rarefaction \
        --i-table ./dada2_table.qza \
        --m-metadata-file $1 \
        --o-visualization ./alpha_rarefaction_curves.qzv \
        --p-min-depth 10 \
        --p-max-depth 4250

    qiime feature-classifier classify-sklearn \
        --i-reads ./dada2_rep_set.qza \
        --i-classifier $2 \
        --o-classification ./taxonomy.qza

    qiime metadata tabulate \
        --m-input-file ./taxonomy.qza \
        --o-visualization ./taxonomy.qzv
    
    qiime feature-table filter-samples \
        --i-table ./dada2_table.qza \
        --p-min-frequency 2000 \
        --o-filtered-table ./table_2k.qza

    qiime taxa barplot \
        --i-table ./table_2k.qza \
        --i-taxonomy ./taxonomy.qza \
        --m-metadata-file $1 \
        --o-visualization ./taxa_barplot.qzv

else
    echo "Ya estaba hecho"
fi
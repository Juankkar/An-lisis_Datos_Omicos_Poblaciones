#!/usr/bin/env bash

qiime demux emp-single \
  --i-seqs emp-single-end-sequences.qza \
  --m-barcodes-file metadata.tsv \
  --m-barcodes-column BarcodeSequences \
  --o-per-sample-sequences demux_seqs.qza \
  --o-error-correction-details demux-details.qza
    


#!/usr/bin/env bash

## Librarías que usamos para el análisis bioestadístico de 
## metataxonómica
library(phyloseq)
library(vegan)
library(tidyverse)
library(qiime2R)
library(microbiome)

setwd("~/OneDrive/Escritorio/Analisis_Datos_Omicos_Poblaciones/actividad2/code")

SVs <- read_qza("../data/raw/dada2_table.qza")
taxonomy <- read_qza("../data/raw/taxonomy.qza")
taxonomy <- parse_taxonomy(taxonomy$data)
metadata <- read_q2metadata("../data/raw/metadata.tsv")
tree <- read_qza("../data/raw/rooted-tree.qza")

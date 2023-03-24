#!/usr/bin/env bash

if [ ! -f ../data/processed/metadata.qzv ]
then
    echo ">>> transformamos la metadata.tsv a un archivo capaz de ser visto por QIIME"
    qiime metadata tabulate \
    --m-input-file ../data/raw/metadata.tsv \
    --o-visualization ../data/processed/metadata.qzv
else
    echo ">>> Ya existe ../data/processed/metadata.qzv"
fi

## Los metadatos tienen un problema, falta un salto de línea
## en la última, con este código lo solucionamos en caso de 
## que exista

sed -r 's/\r$//' -i ../data/raw/metadata.tsv

## Yo en lo personal, lo que he hecho a sido lo siguiente:
## En el navegador de QIIME he contado cual el campo respectivo
## a la jaula y crearé un código para ver el número de estas

if [[ ! -f ../results/pregunta1/jaulas.txt || \
    ! -f ../results/pregunta1/n_jaulas.txt || \
    ! -f ../results/pregunta1/genotypes.txt ]]
then
    ## Vemos las jaulas diferentes y el número de estas Contestamos
    ## de esta manera a la segunda pregunta también
    cut -f 5 ../data/raw/metadata.tsv \
    | grep -v [[:lower:]] \
    | sort \
    | uniq -c > ../results/pregunta1/jaulas.txt

    ## Vemos cuántas son diferentes jaulas diferentes
    wc -l ../results/pregunta1/jaulas.txt \
    > ../results/pregunta1/n_jaulas.txt

    ## Vemos los distintos genotipos
    cut -f 9 ../data/raw/metadata.tsv \
    | grep -v "^genotype" \
    | grep -v "categorical" \
    | sort \
    | uniq -c > ../results/pregunta1/genotypes.txt
else
    echo ">>> La pregunta 1 ya está contestada"
fi

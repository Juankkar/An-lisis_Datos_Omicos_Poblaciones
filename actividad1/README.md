# Actividad 1 de análisis de datos ómicos de poblaciones.

## **Primera actividad: ***Uso de QIIME2 en estudios metataxonómicos***.**

El ejercicio debe realizarse según lo establecido en los ejemplos vistos en clase. Para ello, deberéis hacer uso del entorno de trabajo qiime2-2021.4 utilizado en clase, y que contiene todos los programas necesarios para la ejecución. 
 
### Los archivos proporcionados son:
- **metadata.tsv**
- **secuencias (demultiplexed_seqs.zip)**
- **manifest.tsv**
- **clasificador_taxonomico_greengenes (gg-13-8-99-515-806-nb-classifier.qza)**
- **Basedatos_referencia_filogenia (sepp-refs-gg-13-8.qza)**

## **OBJETIVOS:** 

1. Explorar los metadatos proporcionados y analizarlos con el programa QIIME

2. Realizar un demultiplexado de las muestras

3. Realizar un filtrado y corrección de errores con DADA2

4. Visualizar la abundancia relativa en QIIME 2

5. Visualizar el análisis de rarefacción en QIIME 2

6. Visualizar el máximo número de características (features) observadas
 
## **PREGUNTAS A RESPONDER:**

1. **¿Cuántas jaulas distintas se utilizaron en el estudio? ¿Cuántos ratones había en cada una de ellas? ¿Cuántos posibles valores tiene la variable categórica genotype_and_donor_status y cómo se llaman? Explica cada una de estas variables.**

2. **¿Cuál es el comando de QIIME 2 que deberíamos haber utilizado con lecturas single end si quisiéramos hacer un demultiplexado? Asume que tenemos las secuencias en un archivo llamado emp-single-end-sequences.qza, que el fichero con los metadatos se llama metadata.tsv, que tiene una columna llamada BarcodeSequence y que queremos que el archivo de salida se llame demux_seqs.qza. Pista: https://docs.qiime2.org/2021.8/tutorials/moving-pictures/**

3. **Tras haber realizado el filtrado con DADA 2, ¿Cuántas lecturas quedan en la muestra recip.460.WT.HC3.D49? ¿Qué te parece este resultado? Incluye un pantallazo.**

```
sampleid    input   filtered    percentaje of input pass filter denoised non-chimeric   percentaje of input no-chimeric
recip.460.WT.HC3.D49	16327	9919	60.75	347	347	2.13
```

    * En la columna de denoise que salen las lecturas que quedan tras filtrar y quiar el ruido

4. **¿Cuáles son las tres categorías taxonómicas más abundantes en frecuencia relativa si usamos 5 niveles de clasificación taxonómica? Adjunta un pantallazo.**

    * Las más comunes son:
        * Bacteroidaceae.
        * Lachnospiraceae.
        * Porphyromonadaceae.

5. **¿En qué jaula hay más diversidad, según el análisis de rarefacción? Adjunta un pantallazo.**

    * La jaula ```C31``` se trata de la jaula con más diversidad (índice de Shannon) que hay.

### **IMPORTANTE**: Instrucciones entrega:

La entrega se debe realizar en un único documento en formato PDF. En el mismo, se contestará a las preguntas en orden, escribiendo el alumno con sus propias palabras una respuesta razonado y adjuntando un pantallazo del código que se ha procesado desde el ordenador, así como la salida obtenida desde el ordenador, ya sea el gráfico que se pide generar o la salida del dato numérico que se pide. Cada captura debe contener la hora y fecha del ordenador (captura de pantalla completa). 
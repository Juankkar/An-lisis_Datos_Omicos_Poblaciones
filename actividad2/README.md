# **Segunda actividad**: Paquetes estadísticos de R usados en metataxonómica.

El ejercicio debe realizarse según lo establecido en los ejemplos vistos en clase. Para ello, deberéis hacer uso del entorno de trabajo r_env_2 utilizado en clase, y que contiene todos los programas necesarios para la ejecución. Dentro de R han de estar instalados los programas qiime2R, phyloseq, vegan y microbiome.
 
 
## **Los   archivos proporcionados son**:

- metadata.tsv
- dada2_table.qza
- taxonomy.tsv
- rooted-tree.qza
- taxonomy.qza

### ***OBJETIVOS***: 

1. Utilizar funciones para explorar y manejar objetos de la clase phyloseq 
2. Representar gráficas en R que muestren la abundancia en un nivel taxonómico determinado
3. Realizar cálculos para obtener la diversidad alfa 
4. Determinar si hay diferencias estadísticas en el valor de la diversidad alfa entre grupos
5. Representar un árbol filogenético a un nivel taxonómico determinado de un subconjunto de muestras. Ser capaz de personalizar este árbol, coloreando las muestras según una variable de interés

### **PREGUNTAS A RESPONDER**:

1. Haz un subset de la orden Clostridiales, ¿Cuántos taxones había y cuántos taxones hay ahora?
2. Representa para cada muestra su abundancia para cada una de las familias.
3. Calcula el valor medio de diversidad alfa (Índice de Shannon) en las muestras según la variable donor_status, que diferencia a las muestras según tengan un trasplante de microbioma de personas sanas o con la enfermedad de Parkinson, haciendo uso del paquete microbiome. ¿ Hay diferencias significativas entre los grupos? ¿Qué grupo de muestras tiene una mayor diversidad alfa según este índice? Incluye el código utilizado para dar tu respuesta.
4. Utiliza el paquete microbiome para obtener los índices de diversidad alfa, ¿Cuál es la muestra con menor índice de Shannon y qué valor tiene?
5. Haz un subset de la clase Betaproteobacteria y representa en un árbol filogenético cada uno de los géneros contenidos en esta clase, distinguiéndolos con un marcador que indique la familia en el árbol y coloreando las muestras según la variable “genotype_and_donor_status”. Adjunta el código que utilizas para crearlo, así como el gráfico generado y qué conclusiones extraes de la observación de este árbol. 

IMPORTANTE: Instrucciones entrega:
La entrega se debe realizar en un único documento en formato PDF. En el mismo, se contestará a las preguntas en orden, escribiendo el alumno con sus propias palabras una respuesta razonado y adjuntando un pantallazo del código que se ha procesado desde el ordenador, así como la salida obtenida desde el ordenador, ya sea el gráfico que se pide generar o la salida del dato numérico que se pide. Cada captura debe contener la hora y fecha del ordenador (captura de pantalla completa). 
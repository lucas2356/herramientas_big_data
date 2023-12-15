#!/bin/bash

# Rutas locales de los archivos a copiar en Datasets
archivos=("calendario/Calendario.csv" "cliente/Cliente.csv" "otro_directorio/OtroArchivo.csv")

# Crear directorios en el contenedor namenode
for archivo in "${archivos[@]}"; do
    directorio=$(dirname "$archivo")
    sudo docker exec -it namenode bash -c "mkdir -p /home/Datasets/$directorio"
done

# Copiar archivos al contenedor namenode
for archivo in "${archivos[@]}"; do
    sudo docker cp "Datasets/$archivo" namenode:"/home/Datasets/$archivo"
done

# Crear directorios en HDFS y copiar archivos
for archivo in "${archivos[@]}"; do
    directorio_hdfs=$(dirname "$archivo")
    archivo_base=$(basename "$archivo")
    sudo docker exec -it namenode bash -c "hdfs dfs -mkdir -p /data/$directorio_hdfs && hdfs dfs -put /home/Datasets/$archivo /data/$directorio_hdfs/$archivo_base"
done


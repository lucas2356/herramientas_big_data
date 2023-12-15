 #!/bin/bash
 
 # Comandos para crear la tabla en Hive
 sudo docker exec -it hive-server hive -e "CREATE TABLE IF NOT EXISTS mi_tabla (
     columna1 STRING,
     columna2 INT,
     columna3 DOUBLE
 ) ROW FORMAT DELIMITED FIELDS TERMINATED BY ',' STORED AS TEXTFILE LOCATION '/home/Datasets/';"


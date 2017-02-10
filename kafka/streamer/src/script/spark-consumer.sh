#!/bin/bash

export KAFKA_OPTS=-Djava.security.auth.login.config=kafka_client_jass.conf

${SPARK}/spark-submit \
         --master loacal[*] \
         --class org.gra.spark.Streamer \
         --files kafka_client_jass.conf,user.keytab \
         --driver-java-options "$KAFKA_OPTS"
         --conf "spark.executor.extraJAvaOptions=$KAFKA_OPTS" \
         keytab user.keytab --principal user@HOST.LOCAL \
         fat.jar \
         org.gra.kafka.MockProducer host:9092 py.test
 

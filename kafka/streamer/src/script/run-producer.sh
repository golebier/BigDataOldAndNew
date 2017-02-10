#!/bin/bash

java -Djava.security.auth.login.config=kafka_client_jass.conf \
     -cp fat.jar \
     org.gra.kafka.MockProducer host:9092 py.test

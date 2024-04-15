#!/bin/bash

kubectl -n rabbitmq run perf-test --image pivotalrabbitmq/perf-test --command sleep 3000

java -jar perf-test.jar \
     --uri amqp://admin:qc98n4iGD7MYXMBVFcIO2mtB5voDuV@rabbit.rabbitmq.svc.cluster.local:5672 \
     --rate 10 \
     --producers 2 \
     --consumers 2 \
     --consumer-rate 5 \
     --queue queue \
     --stream-queue \
     --autoack 

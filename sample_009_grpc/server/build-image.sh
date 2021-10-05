#!/bin/bash

mvn spring-boot:build-image 
docker image tag server-sample-grpc-with-dart:1.0-SNAPSHOT bwnyasse/server-sample-grpc-with-dart:1.0-SNAPSHOT

docker tag bwnyasse/server-sample-grpc-with-dart:1.0-SNAPSHOT gcr.io/<MY_PROJECT_ID>/bwnyasse/server-sample-grpc-with-dart:1.0-SNAPSHOT
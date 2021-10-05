#!/bin/bash
mkdir -p client/lib/generated
protoc --dart_out=grpc:client/lib/generated ./server/src/main/proto/movie-service.proto
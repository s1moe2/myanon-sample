#!/bin/bash

DB_HOST="testdb"
DB_USER="root"
DB_PASSWORD="password"
DB_NAME="hr"
DB_PORT="3306"
HOST_VOLUME="$(pwd)/anon_vol"

docker network create testnet

docker run --name $DB_HOST \
    -e MYSQL_ROOT_PASSWORD=$DB_PASSWORD \
    -v $(pwd)/init.sql:/docker-entrypoint-initdb.d/init.sql \
    --network testnet \
    -p $DB_PORT:3306 \
    -d mysql:8

sleep 10

docker run --name anon \
    -v "${HOST_VOLUME}:/app/result" \
    -e DB_HOST=$DB_HOST \
    -e DB_USER=$DB_USER \
    -e DB_PASSWORD=$DB_PASSWORD \
    -e DB_NAME=$DB_NAME \
    -e DB_PORT=$DB_PORT \
    --network testnet \
    sample-anon

docker rm -f $DB_HOST
docker rm -f anon
docker network rm testnet
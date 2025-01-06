#!/bin/bash

if [ -z "$VAULT_TOKEN" ]; then 
    echo VAULT_TOKEN variable is missing
    exit 1
fi 

if [ -z "$VAULT_ADDR" ]; then 
    echo VAULT_ADDR variable is missing
    exit 2
fi 

if [ -z "$APP_NAME" ]; then 
    echo VAULT_ADDR variable is missing
    exit 4
fi 

if [ -z "$ENVIRONMENT" ]; then 
    echo ENVIRONMENT variable is missing
    exit 3
fi 

vault login -tls-skip-verify true &> /dev/null                             # This ensure you pod is streaming the logs and the container will wait reading the logs and given us an opportunity to enter in to the pod

vault kv get roboshop-${ENV}/${APP_NAME} | sed -n '/Data/, $ p'| sed -e '1,3 d' | awk '{print  "export "$1"="$2""}'  > /data/secrets

tail -f /dev/null   
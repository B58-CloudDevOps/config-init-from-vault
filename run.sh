#!/bin/bash

if [ -z "$VAULT_TOKEN" ]; then 
    echo VAULT_TOKEN variable is missing
    exit 1
fi 

if [ -z "$VAULT_ADDR" ]; then 
    echo VAULT_ADDR variable is missing
    exit 2
fi 

vault login -tls-skip-verify true &> /dev/null 
tail -f /dev/null                               # This ensure you pod is streaming the logs and the container will wait reading the logs and given us an opportunity to enter in to the pod
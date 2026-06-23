#! /bin/bash

ENVIRONMENT = $1
TENANT = $2
RG = $3

echo "Deployement started"

az deployment group create \
    --resource-group $RG \
    --template-file bicep/main.bicep \
    --parameters environment=$ENVIRONMENT \
    --parameters tenant=$TENANT

echo "Deployment Successful"

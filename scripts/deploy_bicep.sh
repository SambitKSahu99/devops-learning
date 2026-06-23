#! /bin/bash

set -e

ENVIRONMENT=$1
TENANT=$2
RG=$3
ADMIN_PASSWORD=$4

echo "Deployement started"

az deployment group create \
    --resource-group $RG \
    --template-file bicep/main.bicep \
    --parameters environment=$ENVIRONMENT \
    --parameters tenant=$TENANT \
    --parameters adminPassword=$ADMIN_PASSWORD

echo "Deployment Successful"

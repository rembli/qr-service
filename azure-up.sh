#/bin/bash

# Variables
appName="rembli-qr-service"
resourceGroup="lab2"
containerImage="rembli/qr-service"

# build container

echo "BUILD AND PUSH CONTAINER **************************************************************"
docker build -t $containerImage .
docker push $containerImage

# update and restart

echo "UPDATE APP **************************************************************"
az webapp update --https-only true --name $appName --resource-group $resourceGroup

echo "RESTART APP **************************************************************"
az webapp restart --name $appName --resource-group $resourceGroup


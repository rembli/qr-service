#/bin/bash

# Variables
location="francecentral"
appName="rembli-qr-service"
resourceGroup="rembli-qr-service"
servicePlan="rembli-qr-service"
containerImage="rembli/qr-service"

echo "Create a Resource Group"
az group create --name $resourceGroup --location $location

echo "Create an App Service Plan"
az appservice plan create --name $servicePlan --resource-group $resourceGroup --location $location

echo "Create a Web App"
az webapp create --name $appName --plan $servicePlan --resource-group $resourceGroup -i $containerImage






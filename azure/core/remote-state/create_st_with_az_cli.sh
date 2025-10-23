# Creat a resource group
az group create --name "resource-group-name" --location ukwest

# Create a storage account 
az storage account create --location ukwest --resource-group "resource-group-name" --name "name" --sku Standard_LRS --min-tls-version TLS1_2

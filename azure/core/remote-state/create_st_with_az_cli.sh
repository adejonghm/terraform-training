# Creat a resource group
az group create --name rgukscstbaseresrcs --location uksouth

# Create a storage account 
az storage account create --location uksouth --resource-group rgukscstbaseresrcs --name stukscstterrfstate --sku Standard_LRS --min-tls-version TLS1_2

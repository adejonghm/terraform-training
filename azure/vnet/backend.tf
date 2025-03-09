/* 
Developed by adejonghm
----------

This file is used to configure the backend for the vnet module. It is used to
store the state file in Azure Blob Storage.

March 9, 2025
*/

terraform {
  backend "azurerm" {
    resource_group_name  = "rgterraformstates"
    storage_account_name = "stazureremotetfstates"
    container_name       = "blobremotestates"
    key                  = "udm-vnet/terraform.tfstate"
  }
}

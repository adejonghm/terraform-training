/*
Developed by adejonghm
----------

April 10th, 2025
*/

terraform {
  backend "azurerm" {
    resource_group_name  = "rgukscstbaseresrcs"
    storage_account_name = "stukscstterrfstate"
    container_name       = "tfstates"
    key                  = "udm/vm_reusing_vnet/terraform.tfstate"
  }
}

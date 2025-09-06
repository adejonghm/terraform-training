/*
Developed by adejonghm
----------

April 10th, 2025
*/

terraform {
  backend "azurerm" {
    resource_group_name  = "rgtfsource"
    storage_account_name = "stremotestatefiles"
    container_name       = "terraformstates"
    key                  = "udemy/vm_reusing_vnet/terraform.tfstate"
  }
}

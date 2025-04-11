/*
Developed by adejonghm
----------

April 10th, 2025
*/

terraform {
  backend "azurerm" {
    resource_group_name  = "rgterraform"
    storage_account_name = "staremotestatefiles"
    container_name       = "blobremotestates"
    key                  = "udm-vm-without-vnet/terraform.tfstate"
  }
}

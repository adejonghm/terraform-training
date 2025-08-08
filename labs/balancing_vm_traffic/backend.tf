/*
Developed by adejonghm
----------

July 9, 2025
*/


terraform {
  backend "azurerm" {
    resource_group_name  = "rgterraform"
    storage_account_name = "stremotestatefiles"
    container_name       = "terraformstates"
    key                  = "labs/load_balancing_vms/terraform.tfstate"
  }
}

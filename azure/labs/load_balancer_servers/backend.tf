/*
Developed by adejonghm
----------

July 9, 2025
*/


terraform {
  backend "azurerm" {
    resource_group_name  = "rgtfsource"
    storage_account_name = "stremotestatefiles"
    container_name       = "terraformstates"
    key                  = "labs/load_balancer_servers/terraform.tfstate"
  }
}

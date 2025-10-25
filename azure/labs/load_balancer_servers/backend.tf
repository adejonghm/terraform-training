/*
Developed by adejonghm
----------

July 9, 2025
*/


terraform {
  backend "azurerm" {
    resource_group_name  = "rgukscstbaseresrcs"
    storage_account_name = "stukscstterrfstate"
    container_name       = "tfstates"
    key                  = "labs/load_balancer_servers/terraform.tfstate"
  }
}

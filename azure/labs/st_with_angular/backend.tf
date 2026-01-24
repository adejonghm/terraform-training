/*
Developed by adejonghm
----------

January 24, 2026
*/

terraform {
  backend "azurerm" {
    resource_group_name  = "rgukscstbaseresrcs"
    storage_account_name = "stukscstterrfstate"
    container_name       = "tfstates"
    key                  = "labs/st_with_angular/terraform.tfstate"
  }
}

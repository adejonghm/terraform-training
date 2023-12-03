/*
Developed by adejonghm
----------

November 29, 2023
*/

terraform {
  required_version = ">= 1.5.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.82.0"
    }
  }

  backend "azurerm" {
    key                  = "udemy-vnet/30183408.tfstate" # name and path of the tfstate file
    container_name       = "remote-state"
    resource_group_name  = "TerraformRootRG"
    storage_account_name = "tfstateudemy30183408"
  }
}

provider "azurerm" {
  features {}
}

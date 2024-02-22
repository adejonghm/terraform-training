/*
Developed by adejonghm
----------

December 3, 2023
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
    key                  = "udemy-vm-with-docker/30183408.tfstate" # Name and path of the tfstate.
    container_name       = "remote-state"
    resource_group_name  = "TerraformRootRG"      # Resource group's name where tfstate is deployed.
    storage_account_name = "tfstateudemy30183408" # Storage Account's name where tfstate is deployed.
  }
}

provider "azurerm" {
  features {}
}

data "terraform_remote_state" "vnet" {
  backend = "azurerm"
  config = {
    key                  = "udemy-vnet/30183408.tfstate"
    container_name       = "remote-state"
    resource_group_name  = "TerraformRootRG"
    storage_account_name = "tfstateudemy30183408"
  }
}

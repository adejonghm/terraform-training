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
    key                  = "udemy-vm-remote-module/30183408.tfstate" # Name and path of the tfstate.
    container_name       = "remote-state"
    resource_group_name  = "TerraformRootRG"      # Resource group's name where tfstate is deployed.
    storage_account_name = "tfstateudemy30183408" # Storage Account's name where tfstate is deployed.
  }
}

provider "azurerm" {
  features {}
}

module "network" {
  source  = "Azure/network/azurerm"
  version = "5.3.0"

  resource_group_location = var.location
  resource_group_name     = azurerm_resource_group.terraform_tf_vm.name
  use_for_each            = true
  subnet_names            = ["subnet_vm_remote_mod-${var.environment}"]
  vnet_name               = "vnet_vm_remote_mod-${var.environment}"

  tags = local.commong_tags
}


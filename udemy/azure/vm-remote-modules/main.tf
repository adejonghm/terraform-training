/*
Developed by adejonghm
----------

March 4, 2024
*/

terraform {
  required_version = ">= 1.5.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.0"
    }
  }

  backend "azurerm" {
    key                  = "udemo-vm-remote-module/terraform.tfstate"
    container_name       = "remote-state"
    resource_group_name  = "RgUdTfstate"
    storage_account_name = "saudtfstate"
  }
}

provider "azurerm" {
  features {}
}

module "remote-network" {
  source                  = "Azure/network/azurerm"
  version                 = "5.3.0"
  resource_group_name     = azurerm_resource_group.rg-vm-remote-mod.name
  resource_group_location = azurerm_resource_group.rg-vm-remote-mod.location

  use_for_each = true
  vnet_name    = "VnetVm${var.domain}"

  subnet_names = [
    "Subnet-A-${var.domain}"
  ]

  tags = local.commong_tags
}

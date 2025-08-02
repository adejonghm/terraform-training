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
      version = ">= 3.0.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "rgterraform"
    storage_account_name = "staremotestatefiles"
    container_name       = "blobremotestates"
    key                  = "udm-vm-remote-vnet/terraform.tfstate"
  }
}

provider "azurerm" {
  subscription_id = var.subscription_id
  features {}
}

module "remote-network" {
  source                  = "Azure/network/azurerm"
  version                 = ">=5.0.0"
  resource_group_name     = azurerm_resource_group.rg-vm-remote-mod.name
  resource_group_location = azurerm_resource_group.rg-vm-remote-mod.location

  use_for_each = true
  vnet_name    = "vnetudmtfvm${var.domain}"

  subnet_names = [
    "snetudmtfvm${var.domain}"
  ]

  tags = local.commong_tags
}

/*
Developed by adejonghm
----------

March 5, 2024
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
    key                  = "udemo-vm-local-module/terraform.tfstate"
    container_name       = "remote-state"
    resource_group_name  = "RgUdTfstate"
    storage_account_name = "saudtfstate"
  }
}

provider "azurerm" {
  features {}
}

module "vnet-local-module" {
  source = "./modules/vnet"

  # VARIABLES
  location                = var.location
  rg-name                 = "${var.rg-name}${var.domain}"
  nsg-name                = "${var.nsg-name}${var.domain}"
  vnet-name               = "${var.vnet-name}${var.domain}"
  subnet-name             = "${var.subnet-name}-${var.domain}"
  vnet-address-space      = var.vnet-address-space
  subnet-address-prefixes = var.subnet-address-prefixes
}

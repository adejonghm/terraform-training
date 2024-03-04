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
    key                  = "udemo-vm-custom-data/terraform.tfstate"
    container_name       = "remote-state"
    resource_group_name  = "RgUdTfstate"
    storage_account_name = "saudtfstate"
  }
}

provider "azurerm" {
  features {}
}

data "terraform_remote_state" "vnet" {
  backend = "azurerm"
  config = {
    key                  = "udemo-vnet/terraform.tfstate"
    container_name       = "remote-state"
    resource_group_name  = "RgUdTfstate"
    storage_account_name = "saudtfstate"
  }
}

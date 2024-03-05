/*
Developed by adejonghm
----------

Feb 29, 2024
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
    resource_group_name  = "RgUdTfstate"
    storage_account_name = "saudtfstate"
    container_name       = "remote-state"
    key                  = "udemo-vm-all-in-one/terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}

/*
Developed by adejonghm
----------

Mar 1, 2024
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
    resource_group_name  = "rgudmtfstates"
    storage_account_name = "studmtfstates"
    container_name       = "remote-state"
    key                  = "udmtf-vnet/terraform.tfstate"
  }
}

provider "azurerm" {
  subscription_id = var.my-subscription-id
  features {}
}

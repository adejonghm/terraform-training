/*
Developed by adejonghm
----------

Mar 4, 2025
*/

terraform {
  required_version = ">= 1.5.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.0.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "rgtfsource"
    storage_account_name = "stremotestatefiles"
    container_name       = "terraformstates"
    key                  = "core/vnet/terraform.tfstate"
  }
}

provider "azurerm" {
  subscription_id = var.subscription_id
  features {}
}

/*
Developed by adejonghm
----------

Create a storage account without Shared Key Access and SAS Token

December 11, 2024
*/

terraform {
  required_version = ">= 1.5.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=4.0.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "rgudmtfstates"
    storage_account_name = "studmtfstates"
    container_name       = "remote-state"
    key                  = "labs-st-without-shared-key/terraform.tfstate"
  }
}

provider "azurerm" {
  subscription_id     = "bcea779c-0cef-4ed4-a8bf-9b246e0544e8"
  storage_use_azuread = true
  features {}
}

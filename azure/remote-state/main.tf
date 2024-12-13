/*
Developed by adejonghm
----------

Create a storage account to use as a remote state

November 23, 2023
*/

terraform {
  required_version = ">= 1.5.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.0.0"
    }
  }
}

provider "azurerm" {
  subscription_id = var.my-subscription-id
  features {}
}

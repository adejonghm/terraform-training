/*
Developed by adejonghm
----------

March 2, 2024
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
    key                  = "udemo-vm-reusing-vnet/terraform.tfstate"
    container_name       = "remote-state"
    resource_group_name  = "rgudmtfstates"
    storage_account_name = "studmtfstates"
  }
}

provider "azurerm" {
  subscription_id = var.my-subscription-id
  features {}
}

# Getting VNet information
data "terraform_remote_state" "vnet" {
  backend = "azurerm"
  config = {
    key                  = "udemo-vnet/terraform.tfstate"
    container_name       = "remote-state"
    resource_group_name  = "rgudmtfstates"
    storage_account_name = "studmtfstates"
  }
}

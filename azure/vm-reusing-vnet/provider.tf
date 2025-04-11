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
}

provider "azurerm" {
  subscription_id = var.subscription_id
  features {}
}

# Getting VNet information
data "terraform_remote_state" "vnet" {
  backend = "azurerm"
  config = {
    resource_group_name  = "rgterraform"
    storage_account_name = "staremotestatefiles"
    container_name       = "blobremotestates"
    key                  = "udm-vnet/terraform.tfstate"
  }
}

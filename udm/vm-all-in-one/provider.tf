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
    resource_group_name  = "rgterraform"
    storage_account_name = "staremotestatefiles"
    container_name       = "blobremotestates"
    key                  = "udm-vm-with-vnet/terraform.tfstate"
  }
}

provider "azurerm" {
  subscription_id = var.subscription_id
  features {}
}

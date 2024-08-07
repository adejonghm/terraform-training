/*
Developed by adejonghm
----------

July 30, 2024
*/

terraform {
  required_version = ">= 1.5.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "RgUdTfstate"
    storage_account_name = "saudtfstate"
    container_name       = "remote-state"
    key                  = "udemo-gitlab-pipeline/terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}

data "terraform_remote_state" "vnet" {
  backend = "azurerm"
  config = {
    resource_group_name  = "RgUdTfstate"
    storage_account_name = "saudtfstate"
    container_name       = "remote-state"
    key                  = "udemo-vnet/terraform.tfstate"
  }
}

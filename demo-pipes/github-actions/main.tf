/*
Developed by adejonghm
----------

Naming Convention:
  [resource-abbreviation][platform-course][module]
  [rg][githubdemo][pipeline]

September 18, 2024
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
    resource_group_name  = "rgudmtfstates"
    storage_account_name = "studmtfstates"
    container_name       = "remote-state"
    key                  = "udmtf-github-pipeline/terraform.tfstate"
  }
}

provider "azurerm" {
  subscription_id = "bcea779c-0cef-4ed4-a8bf-9b246e0544e8"
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "rg${var.env}${var.project}"
  location = var.location

  tags = local.commong_tags
}

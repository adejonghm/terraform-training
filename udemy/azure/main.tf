/*
Developed by adejonghm
----------

November 1, 2023
*/

terraform {
  required_version = ">= 1.5.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }

  # backend "" {  }
}

provider "azurerm" {
  features {}
}
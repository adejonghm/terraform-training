/*
Developed by adejonghm
----------
November 23, 2023

Using two providers in the same file
*/


terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }

    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }

  # backend "azurerm" {
  #   resource_group_name  = "terraform"
  #   storage_account_name = "tfstateud30183408"
  #   container_name       = "remote-state"
  #   key                  = "30183408.tfstate" # name and path of the tfstate file
  # }
}

provider "aws" {
  region                   = var.aws_region
  shared_credentials_files = ["$HOME/.aws/credentials"]

  default_tags {
    tags = {
      owner      = "adejonghm"
      managed-by = "terraform"
    }
  }
}

provider "azurerm" {
  features {}
}

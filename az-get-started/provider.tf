/*
  Made by Alejandro de Jongh

  Provider definition, using backend to store *.tfstate

  You can comment out the cloud block if you don't want to use Terraform Cloud to store the *.tfstate
*/


terraform {
  cloud {
    organization = "hc-training"

    workspaces {
      name = "az-get-started"
    }
  }
  
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }

  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {}
}
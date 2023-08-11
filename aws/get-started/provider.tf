/*
  Made by Alejandro de Jongh

  Provider definition, using backend to store *.tfstate

  You can comment out the cloud block if you don't want to use Terraform Cloud to store the *.tfstate
*/

terraform {
  cloud {
    organization = "hc-training"
    workspaces {
      name = "aws-get-started"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region     = var.region
  access_key = var.access_key
  secret_key = var.secret_key
}

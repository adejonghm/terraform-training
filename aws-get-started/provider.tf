/*
  Made by Alejandro de Jongh

  Provider definition, using backend to store *.tfstate

  You can comment out the cloud block if you don't want to use Terraform Cloud to store the *.tfstate
*/

terraform {
  # cloud {
  #   organization = "hc-training"
  #   workspaces {
  #     name = "aws-get-started"
  #   }
  # }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region     = "us-east-1"
  access_key = "AKIAREHHM4R7DYIVZVGU"
  secret_key = "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"
}

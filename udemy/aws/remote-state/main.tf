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
  }
}

provider "aws" {
  region                   = var.region
  shared_credentials_files = ["$HOME/.aws/credentials"]

  default_tags {
    tags = {
      owner      = "adejonghm"
      managed-by = "terraform"
    }
  }
}

/*
Developed by adejonghm
----------

November 26, 2023
*/

terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    key    = "udemy-vpc/terraform.tfstate" # name and path of the tfstate file
    bucket = "tfstateudemy30183408"        # name of the bucket
    region = "us-east-1"
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

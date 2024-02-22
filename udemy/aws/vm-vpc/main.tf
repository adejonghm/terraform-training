/*
Developed by adejonghm
----------

December 2, 2023
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
    key    = "udemy-ec2/terraform.tfstate" # name and path of the tfstate file
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

data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    key    = "udemy-vpc/terraform.tfstate"
    bucket = "tfstateudemy30183408"
    region = var.region
  }
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket = "tf-state-file"
    key    = "webservers-challenge/wsc.tfstate"
    region = "us-east-1"
    ## profile = "tf-acn-treinamento"
  }
}

provider "aws" {
  region = var.region
  ## profile = var.profile
}

resource "random_string" "suffix" {
  length  = 7
  lower   = true
  upper   = false
  special = false
}
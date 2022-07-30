/*
  Made by Alejandro de Jongh

  Provider definition.
*/

terraform {
  required_providers {
    oci = {
      source  = "oracle/oci"
      version = "~> 4.86.0"
    }
  }

  required_version = ">= 1.2.0"
}

provider "oci" {
  auth                = "SecurityToken"
  config_file_profile = "learn-terraform"
  region              = var.region
}

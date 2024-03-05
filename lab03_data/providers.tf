############################################# TERRAFORM #############################################

# Terraform Providers são plugins utilizados para interagir e se conectar com sistemas remotos
# https://registry.terraform.io/providers/hashicorp/aws/latest

############################################# TERRAFORM #############################################
provider "aws" {
    region  = "us-east-1"
    profile = "tf-acn-treinamento"
}
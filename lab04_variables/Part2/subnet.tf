############################################# TERRAFORM #############################################

# Data Sources permite um dado ser buscado ou computado para uso em qualquer referência dentro das 
# configurações do Terraform.
# https://www.terraform.io/language/data-sources

############################################# TERRAFORM #############################################

data "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr_block
}

resource "aws_subnet" "other_subnet" {
  vpc_id = data.aws_vpc.vpc.id
  cidr_block = "10.0.101.0/24"

  tags = {
    "Name" = "other_subnet"
  }
}


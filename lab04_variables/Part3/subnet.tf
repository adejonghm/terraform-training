############################################# TERRAFORM #############################################

# Data Sources permite um dado ser buscado ou computado para uso em qualquer referência dentro das 
# configurações do Terraform.
# https://www.terraform.io/language/data-sources

############################################# TERRAFORM #############################################

data "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr_block
}

# <block_type> "<label>" "<name_label>"
resource "aws_subnet" "other_subnet" {
  count = 3
  vpc_id = data.aws_vpc.vpc.id
  cidr_block = "10.0.10${count.index}.0/24"

  tags = {
    "Name" = "other_subnet${count.index}"
  }
}


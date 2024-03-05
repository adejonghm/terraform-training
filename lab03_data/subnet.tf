############################################# TERRAFORM #############################################

# Data Sources permite um dado ser buscado ou computado para uso em qualquer referência dentro das 
# configurações do Terraform.
# https://www.terraform.io/language/data-sources

############################################# TERRAFORM #############################################

resource "aws_subnet" "first_subnet" {
  vpc_id = data.aws_vpc.vpc.id
  cidr_block = "10.0.0.0/24"

  tags = {
    "Name" = "first-subnet"
  }
}
############################################# TERRAFORM #############################################

# Um valor local pode ser usada múltiplas vezes dentro de um mesmo módulo
# https://www.terraform.io/language/values/locals

############################################# TERRAFORM #############################################

// LOCAL VARIABLES
locals {
  subnet_tag = join("-", ["tf", "subnet", "lab05", var.environment])
  environments = {
    "dev"     = "development"
    "pre"     = "pre-production"
    "pro"     = "production"
    "network" = "networking"
    "shared"  = "shared-services"
    "sec"     = "security"
  }

  environment = local.environments[var.environment]
}

data "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr_block
}

resource "aws_subnet" "subnets" {
  count = var.counter

  vpc_id     = data.aws_vpc.vpc.id
  cidr_block = "10.0.21${count.index}.0/24"

  tags = {
    "Name"        = join("-", [local.subnet_tag, sum([1, count.index])])
    "Environment" = local.environment
  }
}

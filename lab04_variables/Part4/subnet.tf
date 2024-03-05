############################################# TERRAFORM #############################################

# Um valor local pode ser usada múltiplas vezes dentro de um mesmo módulo
# https://www.terraform.io/language/values/locals

############################################# TERRAFORM #############################################

// LOCAL VARIABLES
locals {
  subnet_tag = join("-", ["tf", "subnet", "01"])
  #subnet_tag = join("-", ["tf", "subnet", var.environment])
  #subnet_tag = join("-", ["tf", "subnet", var.environment])
  environments = {
    "dev"     = "development"
    "pre"     = "pre-production"
    "pro"     = "production"
    "network" = "networking"
    "shared"  = "shared-services"
    "sec"     = "security"
  }

  env = local.environments[var.environment]
}

data "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr_block
}

resource "aws_subnet" "subnets" {
  count = var.counter

  vpc_id     = data.aws_vpc.vpc.id
  cidr_block = "10.0.20${count.index}.0/24"

  tags = {
    "Name" = local.subnet_tag
    #"Name" = join("-", [local.subnet_tag, count.index])
    #"Name"        = join("-", [local.subnet_tag, sum([1, count.index])])
    "Environment" = local.env
  }
}

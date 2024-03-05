############################################# TERRAFORM #############################################

# Terraform Resource é um bloco que descreve um ou mais objetos de infraestrutura ou componentes 
# em alto nível como por exemplo VPC, VNET, EC2, RDS etc.
# https://www.terraform.io/language/resources

############################################# TERRAFORM #############################################

resource "aws_vpc" "first_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    "Name" = "first-vpc"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.first_vpc.id
  cidr_block = "10.0.10.0/24"

  tags = {
    "Name" = "public-subnet"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.first_vpc.id

  tags = {
    "Name" = "igw"
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.first_vpc.id
  cidr_block = "10.0.20.0/24"

  tags = {
    "Name" = "private-subnet"
  }
}

resource "aws_eip" "eip" {
  vpc = true
}

resource "aws_nat_gateway" "ngw" {
  connectivity_type = "public"
  allocation_id     = aws_eip.eip.id
  subnet_id         = aws_subnet.public_subnet.id

  tags = {
    Name = "ngw"
  }

  depends_on = [
    aws_internet_gateway.igw,
    aws_vpc.first_vpc
  ]
}

resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.first_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    "Name" = "rt-public"
  }
}

resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.first_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.ngw.id
  }
  tags = {
    "Name" = "rt-private"
  }
}

resource "aws_route_table_association" "public_route_table_association" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "private_route_table_association" {
  subnet_id      = aws_subnet.private_subnet.id
  route_table_id = aws_route_table.private_route_table.id
}

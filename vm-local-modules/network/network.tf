/*
Developed by adejonghm
----------

February 22, 2024
*/

resource "aws_vpc" "udemy_tf" {
  cidr_block = var.cidr_vpc

  tags = {
    Name = "udemy_tf-vpc-${var.environment}"
  }
}

resource "aws_subnet" "udemy_tf_a" {
  vpc_id     = aws_vpc.udemy_tf.id
  cidr_block = var.cidr_subnet

  tags = {
    Name = "udemy_tf-subnet_A-${var.environment}"
  }
}

resource "aws_internet_gateway" "udemy_tf" {
  vpc_id = aws_vpc.udemy_tf.id

  tags = {
    Name = "udemy_tf_internet_gateway-${var.environment}"
  }
}

resource "aws_route_table" "udemy_tf" {
  vpc_id = aws_vpc.udemy_tf.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.udemy_tf.id
  }

  tags = {
    Name = "udemy_tf_route_table-${var.environment}"
  }
}

resource "aws_route_table_association" "udemy_tf" {
  subnet_id      = aws_subnet.udemy_tf_a.id
  route_table_id = aws_route_table.udemy_tf.id
}

resource "aws_security_group" "udemy-tf" {
  name        = "udemy_tf_sec_group"
  description = "Allow access through port 22"
  vpc_id      = aws_vpc.udemy_tf.id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

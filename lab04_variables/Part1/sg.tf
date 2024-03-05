############################################# TERRAFORM #############################################

# Terraform Providers são plugins utilizados para interagir e se conectar com sistemas remotos
# https://registry.terraform.io/providers/hashicorp/aws/latest

############################################# TERRAFORM #############################################
locals {
  environment = "dev"
}

// SECURITY GROUPS
resource "aws_security_group" "sg" {
  name        = "tf-acn-security-group"
  description = "tf-acn-security-group"
  vpc_id      = data.aws_vpc.vpc.id
  ingress {
      description = "Allow SSH"
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }
  
  tags = {
    "Name"        = "sg-tf-acn-workshop"
    "Environment" = "${local.environment}"
  }
}

// SECURITY GROUP RULES
resource "aws_security_group_rule" "egress_rule" {
  type              = "egress"
  to_port           = 0
  from_port         = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.sg.id
}

// INGRESS ICMP RULES
resource "aws_security_group_rule" "icmp" {
  type              = "ingress"
  description       = "Allow ICMP protocol"
  from_port         = -1
  to_port           = -1
  protocol          = "icmp"
  cidr_blocks       = [data.aws_vpc.vpc.cidr_block]
  security_group_id = aws_security_group.sg.id
}
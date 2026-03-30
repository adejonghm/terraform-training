/*
Developed by adejonghm
----------

February 22, 2024
*/


variable "cidr_vpc" {
  type        = string
  description = "Cidr for the VPC created on AWS"
}

variable "cidr_subnet" {
  type        = string
  description = "Cidr for the Subnet created on AWS"
}

variable "environment" {
  type        = string
  description = "Environment to which resources created in AWS belong"
}

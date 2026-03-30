/*
Developed by adejonghm
----------

February 22, 2024
*/


variable "region" {
  type        = string
  default     = "us-east-1"
  description = "AWS Region that I'm using"
}

variable "ami_id" {
  type        = string
  default     = "ami-0f890494e52693975"
  description = "Ubuntu image ID in US East 1"
}

variable "ec2_type" {
  type        = string
  default     = "t2.micro"
  description = "Type of EC2 Instance"
}

variable "cidr_vpc" {
  type        = string
  default     = "10.0.0.0/16"
  description = "Variable from the network module"
}

variable "cidr_subnet" {
  type        = string
  default     = "10.0.1.0/24"
  description = "Variable from the network module"
}

variable "environment" {
  type        = string
  default     = "env_local_modules"
  description = "Variable from the network module"
}

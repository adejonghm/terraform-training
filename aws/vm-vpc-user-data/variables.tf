/*
Developed by adejonghm
----------

February 20, 2024
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

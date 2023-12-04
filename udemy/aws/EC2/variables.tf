/*
Developed by adejonghm
----------

November 23, 2023
*/


variable "region" {
  type        = string
  default     = "us-east-1"
  description = "AWS Region that I'm using"
}

variable "ami_id" {
  type        = string
  default     = "ami-0b6c2d49148000cd5"
  description = "Ubuntu image ID in Sao Paulo region"
}

variable "ec2_type" {
  type        = string
  default     = "t2.micro"
  description = "Type of EC2 Instance"
}
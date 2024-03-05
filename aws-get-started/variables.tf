/*
  Made by Alejandro de Jongh

  Variables definition
*/

variable "instance_name" {
  description = "This the name of the EC2 instance"
  default     = "AppServerInstance"
  type        = string
}

variable "region" {
  description = "Region where you have your AWS account"
  default     = "us-east-1"
  type        = string
}

variable "access_key" {
  description = "The Access Key for you AWS account"
  type        = string
}

variable "secret_key" {
  description = "The Secret Key for you AWS account"
  type        = string
}
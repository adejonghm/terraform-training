/*
  Made by Alejandro de Jongh

  Variables definition
*/


variable "resource_group_name" {
  default = "myTFResourceGroup"
  type    = string
}

variable "location" {
  default = "westus2"
  type    = string
}

variable "tag_environment" {
  default = "Terraform Getting Started"
  type    = string
}

variable "tag_team" {
  default = "DevOps"
  type    = string
}
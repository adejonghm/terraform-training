/*
Developed by adejonghm
----------

November 29, 2023
*/

variable "location" {
  type        = string
  default     = "East US 2"
  description = "Azure location that I'm using"
}

variable "rg_name" {
  type        = string
  default     = "TerraformVpcRG"
  description = "Resource Group name for a Virtual Network"
}

variable "virtual_network_name" {
  type        = string
  default     = "udemy-tf-vnet"
  description = "Virtual Network's name"
}

variable "subnet_name" {
  type        = string
  default     = "udemy-tf-subnet"
  description = "Subnet's name used in the Virtual Network"
}

variable "nsg_name" {
  type        = string
  default     = "udemy-tf-nsg"
  description = "Network Security Group name of the Virtual Network."
}

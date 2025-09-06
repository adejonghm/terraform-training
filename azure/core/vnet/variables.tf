/*
Developed by adejonghm
----------

Naming Convention:
  [resource-abbreviation][platform-course][module]
  [rg][udmtf][<module-name>]

Mar 1, 2024
*/


# Variables with values set in terraform.tfvars
variable "subscription_id" {
  description = "The Azure subscription ID"
  type        = string
}
variable "location" {
  description = "Azure Region used in the Terraform training"
  type        = string
  default     = "West US 3"
}

variable "rg_name" {
  description = "Resource group used to create a Virtual Network"
  type        = string
  default     = "rgvirtualnetworks"
}

variable "vnet_name" {
  description = "Virtual Network created to be used by other Virtual Machines"
  type        = string
  default     = "vnetgeneralpurpose"
}

variable "vnet_address_space" {
  description = "Address space for the VNet created to be used by other Virtual Machines"
  type        = list(string)
  default     = ["10.88.0.0/16"]
}

variable "snet_name" {
  description = "Name of the subnet within the Virtual Network"
  type        = string
  default     = "snetgeneralpurpose001"
}

variable "snet_ip" {
  description = "IP address range for the subnet within the Virtual Network"
  type        = list(string)
  default     = ["10.88.1.0/24"]
}

variable "nsg_name" {
  description = ""
  type        = string
  default     = "nsg-core"
}

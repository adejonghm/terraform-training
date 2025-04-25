/*
Developed by adejonghm
----------

Naming Convention:
  [resource-abbreviation][platform-course][module]
  [rg][udmtf][<module-name>]

Mar 1, 2024
*/

variable "location" {
  type        = string
  default     = "Brazil South"
  description = "Azure Region used in the Terraform training"
}

variable "rg_name" {
  type        = string
  default     = "rgvnet"
  description = "Resource group used to create a Virtual Network"
}

variable "nsg_name" {
  type        = string
  default     = "nsgvnetbrazilsouth"
  description = "Network Sec. Group used to create a Virtual Network"
}

variable "vnet_name" {
  type        = string
  default     = "vnetbrazilsouth"
  description = "Virtual Network created to be used by other Virtual Machines"
}

variable "vnet_address_space" {
  type        = string
  default     = "10.20.0.0/16"
  description = "Address space for the VNet created to be used by other Virtual Machines"
}
variable "subnets" {
  type = map(string)
  default = {
    snetgeneralpurpose = "10.20.1.0/24",
    snetvmlinux        = "10.20.2.0/24",
    snetvmwindows      = "10.20.3.0/24"
  }
  description = "The subnets created to be used by other Virtual Machines"
}

# Variables with values set in terraform.tfvars
variable "subscription_id" {
  type        = string
  description = "The Azure subscription ID"
}

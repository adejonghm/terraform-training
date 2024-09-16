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

variable "rg-name" {
  type        = string
  default     = "rgudmtfvnet"
  description = "Resource group used to create a Virtual Network"
}

variable "nsg-name" {
  type        = string
  default     = "nsgudmtfvnet"
  description = "Network Sec. Group used to create a Virtual Network"
}

variable "vnet-name" {
  type        = string
  default     = "vnetudmtf"
  description = "Virtual Network created to be used by other Virtual Machines"
}

variable "vnet-address-space" {
  type        = string
  default     = "10.0.0.0/16"
  description = "Address space for the VNet created to be used by other Virtual Machines"
}

variable "subnet-name" {
  type        = string
  default     = "snetudmtf-a"
  description = "Subnet for the VNet created to be used by other Virtual Machines"
}

variable "subnet-address-prefixes" {
  type        = list(string)
  default     = ["10.0.0.0/24"]
  description = "Vnet's subnet address-prefix created to be used by other Virtual Machines"
}

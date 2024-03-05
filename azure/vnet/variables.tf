/*
Developed by adejonghm
----------

Mar 1, 2024
*/

variable "location" {
  type        = string
  default     = "East US 2"
  description = "Azure Region used in the Terraform training"
}

variable "rg-name" {
  type        = string
  default     = "RgUdVnet"
  description = "Resource group used to create a Virtual Network"
}

variable "nsg-name" {
  type        = string
  default     = "NsgUdVnet"
  description = "Network Sec. Group used to create a Virtual Network"
}

variable "vnet-name" {
  type        = string
  default     = "UdVnet"
  description = "Virtual Network created to be used by other Virtual Machines"
}

variable "vnet-address-space" {
  type        = string
  default     = "10.0.0.0/16"
  description = "Address space for the VNet created to be used by other Virtual Machines"
}

variable "subnet-name" {
  type        = string
  default     = "Subnet-A"
  description = "Subnet for the VNet created to be used by other Virtual Machines"
}

variable "subnet-address-prefixes" {
  type        = string
  default     = "10.0.0.0/24"
  description = "Vnet's subnet address-prefix created to be used by other Virtual Machines"
}

/*
Developed by adejonghm
----------

March 5, 2024
*/

variable "location" {
  type        = string
  description = "Definition of the location for the module resources"
}

variable "rg-name" {
  type        = string
  description = "Definition of the name of the module's Resource Group"
}

variable "nsg-name" {
  type        = string
  description = "Definition of the name of the module's Network Security Group"
}

variable "vnet-name" {
  type        = string
  description = "Definition of the name of the module's Virtual Network"
}

variable "vnet-address-space" {
  type        = string
  description = "Definition of the address space of the module's Virtual Network"
}

variable "subnet-name" {
  type        = string
  description = "Definition of the Subnet name of the module's Virtual Network"
}

variable "subnet-address-prefixes" {
  type        = string
  description = "Definition of the Subnet address prefix of the module's Virtual Network"
}

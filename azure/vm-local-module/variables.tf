/*
Developed by adejonghm
----------

March 5, 2024
*/

variable "location" {
  description = "Azure Region used in the Terraform training"
  default     = "East US 2"
  type        = string
}

variable "rg-name" {
  description = "Resource group used to create an all-in-one Virtual Machine"
  default     = "RgUdVm"
  type        = string
}

variable "public-ip-name" {
  description = "Public IP for the all-in-one Virtual Machine"
  default     = "PiUdVm"
  type        = string
}

variable "public-ip-allocation-method" {
  description = "The public IP allocation method used to create a Virtual Machine"
  default     = "Dynamic"
  type        = string
}

variable "net-interface-name" {
  description = "Network Interface used to create an all-in-one Virtual Machine"
  default     = "NicUdVm"
  type        = string
}

variable "private-ip-allocation-method" {
  description = "The private IP allocation method used to create a Virtual Machine"
  default     = "Dynamic"
  type        = string
}

variable "vm-name" {
  description = "Name of the All-in-One Virtual Machine"
  default     = "UdVm"
  type        = string
}

variable "vm-size" {
  description = "Type and size of the All-in-one Virtual Machine"
  default     = "Standard_B1s"
  type        = string
}

variable "vm-username" {
  description = "Username user in the All-in-one Virtual Machine"
  default     = "terraform"
  type        = string
}

variable "vm-disk-cache" {
  description = "Disk cache type used in the Virtual Machine"
  default     = "ReadWrite"
  type        = string
}

variable "vm-disk-type" {
  description = "Storage Account disk type used in the Virtual Machine"
  default     = "Standard_LRS"
  type        = string
}

variable "vm-image-sku" {
  description = "Sku image reference used to create a Virtual Machine"
  default     = "22_04-lts"
  type        = string
}

variable "vm-image-offer" {
  description = "Sku image reference used to create a Virtual Machine"
  default     = "0001-com-ubuntu-server-jammy"
  type        = string
}

variable "vm-image-publisher" {
  description = "Sku image reference used to create a Virtual Machine"
  default     = "Canonical"
  type        = string
}

variable "vm-image-version" {
  description = "Sku image reference used to create a Virtual Machine"
  type        = string
  default     = "latest"
}

variable "nsg-name" {
  description = "Network Secutity Group used in the Local Module"
  default     = "NsgVnet"
  type        = string
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

variable "domain" {
  description = "All resources used inside local-module"
  default     = "LocalModule"
  type        = string
}

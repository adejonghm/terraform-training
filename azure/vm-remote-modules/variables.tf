/*
Developed by adejonghm
----------

Naming Convention:
  [resource-abbreviation][platform-course][module]
  [rg][udmtf][<module-name>]

March 4, 2024
*/

variable "my-subscription-id" {
  type        = string
  description = "ID of the Subscription that I use"
}

variable "location" {
  description = "Azure Region used in the Terraform training"
  default     = "East US 2"
  type        = string
}

variable "rg-name" {
  description = "Resource group used to create an all-in-one Virtual Machine"
  default     = "rgudmtfvmremotemodule"
  type        = string
}

variable "net-interface-name" {
  description = "Network Interface used to create an all-in-one Virtual Machine"
  default     = "nicudmtfvmremotemodule"
  type        = string
}

variable "public-ip-name" {
  description = "Public IP for the all-in-one Virtual Machine"
  default     = "piudmtfvmremotemodule"
  type        = string
}

variable "vm-name" {
  description = "Name of the All-in-One Virtual Machine"
  default     = "vmudmtfremotemodule"
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

variable "vm-disk-type" {
  description = "Storage Account disk type used in the Virtual Machine"
  default     = "Standard_LRS"
  type        = string
}

variable "vm-disk-cache" {
  description = "Disk cache type used in the Virtual Machine"
  default     = "ReadWrite"
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

variable "vm-image-version" {
  description = "Sku image reference used to create a Virtual Machine"
  type        = string
  default     = "latest"
}

variable "vm-image-publisher" {
  description = "Sku image reference used to create a Virtual Machine"
  default     = "Canonical"
  type        = string
}

variable "private-ip-allocation-method" {
  description = "The private IP allocation method used to create a Virtual Machine"
  default     = "Dynamic"
  type        = string
}

variable "public-ip-allocation-method" {
  description = "The public IP allocation method used to create a Virtual Machine"
  default     = "Dynamic"
  type        = string
}

variable "domain" {
  description = "All resources used inside remote-module"
  default     = "remotemodule"
  type        = string
}

variable "nsg-name" {
  description = "Network Secutity Group used in the Remote Module"
  default     = "nsgudmtfvmremotemodule"
  type        = string
}

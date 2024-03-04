/*
Developed by adejonghm
----------

March 2, 2024
*/

variable "location" {
  description = "Azure Region used in the Terraform training"
  type        = string
  # default     = "East US 2"
}

variable "rg-name" {
  description = "Resource group used to create an all-in-one Virtual Machine"
  type        = string
  # default     = "RgVmRemoteModule"
}

variable "net-interface-name" {
  description = "Network Interface used to create an all-in-one Virtual Machine"
  type        = string
  # default     = "NiVmRemoteModule"
}

variable "public-ip-name" {
  description = "Public IP for the all-in-one Virtual Machine"
  type        = string
  # default     = "PublicIpVmRemoteModule"
}

variable "vm-name" {
  description = "Name of the All-in-One Virtual Machine"
  type        = string
  # default     = "VmRemoteModule"
}

variable "vm-size" {
  description = "Type and size of the All-in-one Virtual Machine"
  type        = string
  # default     = "Standard_B1s"
}

variable "vm-username" {
  description = "Username user in the All-in-one Virtual Machine"
  type        = string
  # default     = "terraform"
}

variable "vm-disk-type" {
  description = "Storage Account disk type used in the Virtual Machine"
  type        = string
  # default     = "Standard_LRS"
}

variable "vm-disk-cache" {
  description = "Disk cache type used in the Virtual Machine"
  type        = string
  # default     = "ReadWrite"
}

variable "vm-image-sku" {
  description = "Sku image reference used to create a Virtual Machine"
  # default     = "22_04-lts"
  type = string
}

variable "vm-image-offer" {
  description = "Sku image reference used to create a Virtual Machine"
  type        = string
  # default     = "0001-com-ubuntu-server-jammy"
}

variable "vm-image-version" {
  description = "Sku image reference used to create a Virtual Machine"
  type        = string
  # default     = "latest"
}

variable "vm-image-publisher" {
  description = "Sku image reference used to create a Virtual Machine"
  type        = string
  # default     = "Canonical"
}

variable "private-ip-allocation-method" {
  description = "The private IP allocation method used to create a Virtual Machine"
  type        = string
  # default     = "Dynamic"
}

variable "public-ip-allocation-method" {
  description = "The public IP allocation method used to create a Virtual Machine"
  type        = string
  # default     = "Dynamic"
}

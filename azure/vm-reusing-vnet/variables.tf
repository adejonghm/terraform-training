/*
Developed by adejonghm
----------

Naming Convention:
  [resource-abbreviation][platform-course][module]
  [rg][udmtf][<module-name>]

March 2, 2024
*/

variable "subscription_id" {
  type        = string
  description = "ID of the Subscription that I use"
}

variable "location" {
  type        = string
  default     = "Brazil South"
  description = "Azure Region used in the Terraform training"
}

variable "rg_vm_without_vnet" {
  type        = string
  default     = "rgvmlinux"
  description = "Resource group used to create an all-in-one Virtual Machine"
}

variable "nic_vm_without_vnet" {
  type        = string
  default     = "nicvmlxusingvnet"
  description = "Network Interface used to create an all-in-one Virtual Machine"
}

variable "pip_vm_without_vnet" {
  type        = string
  default     = "pipvmlxusingvnet"
  description = "Public IP for the all-in-one Virtual Machine"
}

variable "pip_allocation_method" {
  type        = string
  default     = "Static"
  description = "The public IP allocation method used to create a Virtual Machine"
}

variable "vm_without_vnet" {
  type        = string
  default     = "vmlxusingvnet"
  description = "Name of the All-in-One Virtual Machine"
}

variable "vm_size" {
  type        = string
  default     = "Standard_B1s"
  description = "Type and size of the All-in-one Virtual Machine"
}

variable "vm_username" {
  type        = string
  default     = "terraform"
  description = "Username user in the All-in-one Virtual Machine"
}

variable "vm_disk_type" {
  type        = string
  default     = "StandardSSD_LRS"
  description = "Storage Account disk type used in the Virtual Machine"
}

variable "vm_disk_cache" {
  type        = string
  default     = "ReadWrite"
  description = "Disk cache type used in the Virtual Machine"
}

variable "vm_image_sku" {
  type        = string
  default     = "22_04-lts-gen2"
  description = "Sku image reference used to create a Virtual Machine"
}

variable "vm_image_offer" {
  type        = string
  default     = "0001-com-ubuntu-server-jammy"
  description = "Sku image reference used to create a Virtual Machine"
}

variable "vm_image_version" {
  type        = string
  default     = "latest"
  description = "Sku image reference used to create a Virtual Machine"
}

variable "vm_image_publisher" {
  type        = string
  default     = "Canonical"
  description = "Sku image reference used to create a Virtual Machine"
}

variable "private_ip_allocation-method" {
  type        = string
  default     = "Dynamic"
  description = "The private IP allocation method used to create a Virtual Machine"
}

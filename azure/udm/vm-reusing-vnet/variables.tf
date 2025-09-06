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

variable "rg_name" {
  type        = string
  default     = "rgmodule02"
  description = "Resource group used to create an all-in-one Virtual Machine"
}

variable "nic_name" {
  type        = string
  default     = "nicvmlxusingvnet"
  description = "Network Interface used to create an all-in-one Virtual Machine"
}

variable "pip_name" {
  type        = string
  default     = "pipvmlxusingvnet"
  description = "Public IP for the all-in-one Virtual Machine"
}

variable "pip_allocation_method" {
  type        = string
  default     = "Static"
  description = "The public IP allocation method used to create a Virtual Machine"
}

variable "vm_name" {
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
  description = "Disk type used in the Virtual Machine"
}

variable "vm_disk_cache" {
  type        = string
  default     = "ReadWrite"
  description = "Disk cache type used in the Virtual Machine"
}

variable "image_sku" {
  type        = string
  default     = "22_04-lts-gen2"
  description = "SKU of the VM image to use for the Virtual Machine"
}

variable "image_offer" {
  type        = string
  default     = "0001-com-ubuntu-server-jammy"
  description = "Offer of the VM image to use for the Virtual Machine"
}

variable "image_version" {
  type        = string
  default     = "latest"
  description = "Version of the VM image to use for the Virtual Machine"
}

variable "image_publisher" {
  type        = string
  default     = "Canonical"
  description = "Publisher of the VM image to use for the Virtual Machine"
}

variable "private_ip_allocation_method" {
  type        = string
  default     = "Dynamic"
  description = "The private IP allocation method used to create a Virtual Machine"
}

variable "ssh_key_path" {
  description = "Path to the SSH public key file for VM authentication"
  type        = string
}

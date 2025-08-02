/*
Developed by adejonghm
----------

July 31, 2025

*/


variable "location" {
  description = "Azure region where the Windows VM will be deployed"
  type        = string
}

variable "tags" {
  description = "Tags to be applied to the Windows VM and its associated resources"
  type        = map(string)
}

variable "rg_name" {
  description = "Name of the resource group where the Windows VM will be deployed"
  type        = string
}

variable "subnet_id" {
  description = "ID of the subnet where the Windows VM's network interface will be attached"
  type        = string
}

variable "pip_allocation_method" {
  description = "Allocation method for the public IP address (Static or Dynamic)"
  type        = string
  default     = "Static"
}

variable "nic_ip_config_name" {
  description = "Name of the network interface IP configuration"
  type        = string
  default     = "internal"
}

variable "nic_private_ip_allocation" {
  description = "Allocation method for the private IP address (Static or Dynamic)"
  type        = string
  default     = "Dynamic"
}

variable "vm_name" {
  description = "Name of the Windows virtual machine"
  type        = string
}

variable "vm_size" {
  description = "Size of the Windows virtual machine (e.g., Standard_B2s, Standard_D2s_v3)"
  type        = string
  default     = "Standard_B2s"
}

variable "vm_user" {
  description = "Username for the Windows virtual machine administrator account"
  type        = string
}

variable "vm_pass" {
  description = "Password for the Windows virtual machine administrator account"
  type        = string
  sensitive   = true
}

variable "os_disk_cache" {
  description = "Caching type for the OS disk (None, ReadOnly, ReadWrite)"
  type        = string
  default     = "ReadWrite"
}

variable "os_disk_type" {
  description = "Storage account type for the OS disk (Standard_LRS, Premium_LRS, StandardSSD_LRS)"
  type        = string
  default     = "Standard_LRS"
}

variable "os_publisher" {
  description = "Publisher of the OS image (e.g., MicrosoftWindowsServer, MicrosoftVisualStudio)"
  type        = string
}

variable "os_offer" {
  description = "Offer of the OS image (e.g., WindowsServer, visualstudio2019latest)"
  type        = string
}

variable "os_sku" {
  description = "SKU of the OS image (e.g., 2019-Datacenter, 2019-Enterprise-N)"
  type        = string
}

variable "os_version" {
  description = "Version of the OS image (e.g., latest, 2019.0.20190820)"
  type        = string
}

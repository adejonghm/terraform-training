/*
Developed by adejonghm
----------

July 9, 2025
*/



variable "location" {
  description = "Azure region where the resource will be deployed"
  type        = string
}

variable "tags" {
  description = "Tags to be applied to the Linux VM and its associated resources"
  type        = map(string)
}

variable "vm_rg" {
  description = "Name of the resource group where the resource will be deployed"
  type        = string
}

variable "subnet_id" {
  description = "ID of the subnet where the Linux VM's network interface will be attached"
  type        = string
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
  description = "Name of the Linux virtual machine"
  type        = string
}

variable "vm_size" {
  description = "Size of the Linux virtual machine (e.g., Standard_B2s, Standard_D2s_v3)"
  type        = string
  default     = "Standard_B2s"
}

variable "vm_user" {
  description = "Username for the Linux virtual machine administrator account"
  type        = string
}

variable "ssh_public_key" {
  description = "SSH public key for authentication to the Linux virtual machine"
  type        = string
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
  description = "Publisher of the OS image (e.g., Canonical, RedHat, OpenLogic)"
  type        = string
}

variable "os_offer" {
  description = "Offer of the OS image (e.g., UbuntuServer, RHEL, CentOS)"
  type        = string
}

variable "os_sku" {
  description = "SKU of the OS image (e.g., 18.04-LTS, 7.8, 8_3)"
  type        = string
}

variable "os_version" {
  description = "Version of the OS image (e.g., latest, 18.04.202006180)"
  type        = string
}

variable "web_server_install" {
  description = "Script to be executed during VM provisioning, typically used for installing and configuring web server software"
  type        = string
}

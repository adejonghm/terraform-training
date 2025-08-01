/*
Developed by adejonghm
----------

July 9, 2025
*/



variable "location" {
  description = ""
  type        = string
}

variable "tags" {
  description = ""
  type        = map(string)
}

variable "rg_name" {
  description = ""
  type        = string
}

variable "subnet_id" {
  description = ""
  type        = string
}

variable "pip_allocation_method" {
  description = ""
  default     = "Static"
  type        = string
}

variable "nic_ip_config_name" {
  description = ""
  default     = "internal"
  type        = string
}

variable "nic_private_ip_allocation" {
  description = ""
  default     = "Dynamic"
  type        = string
}

variable "vm_name" {
  description = ""
  type        = string
}

variable "vm_size" {
  description = ""
  default     = "Standard_B2s"
  type        = string
}

variable "vm_user" {
  description = ""
  type        = string
}

variable "ssh_public_key" {
  description = ""
  type        = string
}

variable "os_disk_cache" {
  description = ""
  default     = "ReadWrite"
  type        = string
}

variable "os_disk_type" {
  description = ""
  default     = "Standard_LRS"
  type        = string
}

variable "os_publisher" {
  description = ""
  type        = string
}

variable "os_offer" {
  description = ""
  type        = string
}

variable "os_sku" {
  description = ""
  type        = string
}

variable "os_version" {
  description = ""
  type        = string
}

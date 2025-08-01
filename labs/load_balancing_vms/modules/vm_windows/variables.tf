/*
Developed by adejonghm
----------

July 31, 2025

*/


variable "location" {
  type        = string
  description = ""
}

variable "tags" {
  type        = map(string)
  description = ""
}

variable "rg_name" {
  type        = string
  description = ""
}

variable "subnet_id" {
  type        = string
  description = ""
}

variable "pip_allocation_method" {
  type        = string
  default     = "Static"
  description = ""
}

variable "nic_ip_config_name" {
  type        = string
  default     = "internal"
  description = ""
}

variable "nic_private_ip_allocation" {
  type        = string
  default     = "Dynamic"
  description = ""
}

variable "vm_name" {
  type        = string
  description = ""
}

variable "vm_size" {
  type        = string
  default     = "Standard_B2s"
  description = ""
}

variable "vm_user" {
  type        = string
  description = ""
}

variable "vm_pass" {
  type        = string
  description = ""
}

variable "os_disk_cache" {
  type        = string
  default     = "ReadWrite"
  description = ""
}

variable "os_disk_type" {
  type        = string
  default     = "Standard_LRS"
  description = ""
}

variable "os_publisher" {
  type        = string
  description = ""
}

variable "os_offer" {
  type        = string
  description = ""
}

variable "os_sku" {
  type        = string
  description = ""
}

variable "os_version" {
  type        = string
  description = ""
}

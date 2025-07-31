/*
Developed by adejonghm
----------

Naming Convention:
  [resource-abbreviation][platform-course][module]
  [rg][udmtf][<module-name>]

July 9, 2025
*/


variable "location" {
  description = ""
  type        = string
}

variable "rg_name" {
  description = ""
  type        = string
}

variable "pip_name" {
  description = ""
  type        = string
}

variable "ip_config_name" {
  description = ""
  type        = string
}

variable "subnet_id" {
  description = ""
  type        = string
}

variable "private_ip_allocation_mode" {
  description = "Private IP"
  type        = string
}

variable "pip_allocation_mode" {
  description = "Public IP"
  type        = string
}

variable "vm_name" {
  description = ""
  type        = string
}

variable "vm_size" {
  description = ""
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

variable "vm_os_disk_type" {
  description = ""
  type        = string
}

variable "vm_os_sku" {
  description = ""
  type        = string
}

variable "vm_os_offer" {
  description = ""
  type        = string
}

variable "tags" {
  description = ""
  type        = map(string)
}

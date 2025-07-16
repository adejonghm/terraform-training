/*
Developed by adejonghm
----------

Naming Convention:
  [resource-abbreviation][platform-course][module]
  [rg][udmtf][<module-name>]

July 9, 2025
*/


variable "location" {
  type        = string
  description = ""
}

variable "rg_name" {
  type        = string
  description = ""
}

variable "pip_name" {
  type        = string
  description = ""
}

variable "ip_config_name" {
  type        = string
  description = ""
}

variable "private_ip_allocation_mode" {
  type        = string
  description = "Private IP"
}

variable "pip_allocation_mode" {
  type        = string
  description = "Public IP"
}

variable "vmlx_name" {
  type        = string
  description = ""
}

variable "vmlx_size" {
  type        = string
  description = ""
}

variable "vmlx_user" {
  type        = string
  description = ""
}

variable "vmlx_os_disk_type" {
  type        = string
  description = ""
}

variable "vmlx_os_sku" {
  type        = string
  description = ""
}

variable "vmlx_os_offer" {
  type        = string
  description = ""
}

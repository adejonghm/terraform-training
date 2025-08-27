/*
Developed by adejonghm
----------

January 27, 2025
*/


variable "location" {
  description = "Azure region where the resource will be deployed"
  type        = string
}

variable "tags" {
  description = "Tags to be applied to the Linux VM and its associated resources"
  type        = map(string)
}

variable "rg_name" {
  description = "Name of the resource group where the resource will be deployed"
  type        = string
}

variable "pip_allocation_method" {
  description = "Allocation method for the public IP address (Static or Dynamic)"
  type        = string
  default     = "Static"
}

variable "lb_name" {
  description = ""
  type        = string
}

variable "lb_sku" {
  description = ""
  type        = string
}

variable "protocol" {
  description = ""
  type        = string
  default     = "Tcp"
}

variable "probe_port" {
  description = ""
  type        = number
  default     = 22
}

variable "fend_port" {
  description = ""
  type        = number
  default     = 80
}

variable "bend_port" {
  description = ""
  type        = number
  default     = 80
}

variable "ip_config_name" {
  description = ""
  type        = string
  default     = "ip-configuration"
}

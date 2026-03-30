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

variable "lb_rg" {
  description = "Name of the resource group where the resource will be deployed"
  type        = string
}

variable "pip_allocation_method" {
  description = "Allocation method for the public IP address (Static or Dynamic)"
  type        = string
  default     = "Static"
}

variable "lb_name" {
  description = "Name of the Azure Load Balancer resource"
  type        = string
}

variable "lb_sku" {
  description = "SKU of the Azure Load Balancer (Basic or Standard)"
  type        = string
}

variable "protocol" {
  description = "Protocol for the load balancer rule (Tcp, Udp, or All)"
  type        = string
  default     = "Tcp"
}

variable "probe_port" {
  description = "Port number for the health probe to check backend VM health"
  type        = number
}

variable "fend_port" {
  description = "Frontend port number that clients connect to on the load balancer"
  type        = number
  default     = 80
}

variable "bend_port" {
  description = "Backend port number on the virtual machines where traffic is forwarded"
  type        = number
  default     = 80
}

variable "ip_config_name" {
  description = "Name of the frontend IP configuration for the load balancer"
  type        = string
  default     = "ip-configuration"
}

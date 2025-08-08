/*
Developed by adejonghm
----------

Naming Convention:
  [resource-abbreviation][platform-course][module]
  [rg][udmtf][<module-name>]

July 9, 2025
*/

variable "subscription_id" {
  description = "ID of the Subscription that I use"
  type        = string
}

variable "location" {
  description = "Azure Region used in this Lab"
  type        = string
  default     = "South Central US"
}

variable "rg_name" {
  description = "Resource group for Load Balancing laboratory"
  type        = string
  default     = "rgloadbalancinglab"
}

variable "vm_name" {
  description = "Prefix for the names of the virtual machines in the load balancer"
  type        = string
  default     = "vmlablx"
}

variable "ssh_key_path" {
  description = "Public key for the Linux virtual machine administrator account"
  type        = string
}

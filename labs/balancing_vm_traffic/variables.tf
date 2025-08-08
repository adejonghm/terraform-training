/*
Developed by adejonghm
----------

July 9, 2025
*/

variable "subscription_id" {
  description = "ID of the Subscription that I use"
  type        = string
}

variable "rg_name" {
  description = "Resource group for Load Balancing laboratory"
  type        = string
  default     = "rgbalancingtraffic"
}

variable "vm_name" {
  description = "Prefix for the names of the virtual machines in the load balancer"
  type        = string
  default     = "vmserverlx"
}

variable "ssh_key_path" {
  description = "Public key for the Linux virtual machine administrator account"
  type        = string
}

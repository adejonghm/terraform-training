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
  default     = "rglabloadbalancing"
}

variable "win_pass" {
  description = "Password for the Windows virtual machine administrator account"
  type        = string
  sensitive   = true
}

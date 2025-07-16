/*
Developed by adejonghm
----------

Naming Convention:
  [resource-abbreviation][platform-course][module]
  [rg][udmtf][<module-name>]

July 9, 2025
*/

variable "subscription_id" {
  type        = string
  description = "ID of the Subscription that I use"
}

variable "location" {
  type        = string
  default     = "South Central US"
  description = "Azure Region used in the Terraform training"
}

variable "rg_name" {
  type        = string
  default     = "rglabloadbalancing"
  description = "Resource group for Load Balancing laboratory"
}


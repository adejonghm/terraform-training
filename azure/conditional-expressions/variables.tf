/*
Developed by adejonghm
----------

Naming Convention:
  [resource-abbreviation][platform-course][module]
  [rg][udmtf][<module-name>]

May 8, 2024
*/


variable "my-subscription-id" {
  type        = string
  description = "ID of the Subscription that I use"
}
variable "location" {
  type        = string
  default     = "East US 2"
  description = "Azure location that I'm using"
}

variable "selector" {
  type        = string
  description = "Environmento where the resources are created"
}

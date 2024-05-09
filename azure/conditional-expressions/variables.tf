/*
Developed by adejonghm
----------

May 8, 2024
*/

variable "location" {
  type        = string
  default     = "East US 2"
  description = "Azure location that I'm using"
}

variable "selector" {
  type        = string
  description = "Environmento where the resources are created"
}
